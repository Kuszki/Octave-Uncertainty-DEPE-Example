clear;
#clf;

pkg load statistics;
pkg load communications;
pkg load ltfat;
pkg load parallel;
pkg load signal;

addpath("libs");

args = argv();
f_mul = 0.0;
f_start = 3000;
nsam = 64;

if length(args) > 0
val = str2double(args{1});
if val > -1 && val < 1
  f_mul = val;
end
end

if length(args) > 1
val = str2double(args{2});
if val > 0 && val < 24000
  f_start = val;
end
end

if length(args) > 2
val = str2double(args{3});
if val > 0 && val < 513
  nsam = val;
end
end

# run options
iters_a = 1e5;

# sampling params
fs = 48e3;
fn = fs/nsam;

# objects freq params
fa = 320e3;

# signal settings
am_1 = 1.0; f_1 = fn*f_mul + f_start;  ph_1 = 0;

# timing evals
Ts = 1/fs;
T0 = 1/f_1;

# input signal
f_in_1 = @(x, fi) am_1*sin(2*pi*f_1*x + ph_1 + fi);
f_in = @(x) f_in_1(x, 0);

# error signals
f_err_1 = @(x, am, fi) am*f_in_1(x, fi) - f_in_1(x, 0);

# filter functions
f_fil_a_cmp = @(x) 1 / (1 + sqrt(-1) * (x/fa));
f_fil_a_amp = @(x) abs(f_fil_a_cmp(x));
f_fil_a_phi = @(x) atan(imag(f_fil_a_cmp(x))./real(f_fil_a_cmp(x)));

f_fil_a_amp_f_1 = f_fil_a_amp(f_1);
f_fil_a_phi_f_1 = f_fil_a_phi(f_1);

phi = rand(1, iters_a) * T0;
freq_vec = (0 : nsam-1)*fs/nsam;
x0 = Ts*(0 : nsam-1);

dyn_w = 0.5 * ((f_fil_a_amp_f_1*am_1*cos(ph_1 + f_fil_a_phi(f_1)) - am_1*cos(ph_1))^2 + (f_fil_a_amp_f_1*am_1*sin(ph_1 + f_fil_a_phi(f_1)) - am_1*sin(ph_1))^2);

for i = 1 : length(freq_vec)
	phis_vec(i) = f_fil_a_phi(freq_vec(i));
	dums_vec(i) = f_fil_a_amp(freq_vec(i));
end

#tic;
for i = 1 : iters_a

  # generate long input vector
  x = x0 + phi(i);
  y = f_in(x);

  # perform converter part tasks
  ya = y + f_err_1(x, f_fil_a_amp_f_1, f_fil_a_phi_f_1);

  trans = fft(ya);

  a_vars(i) = get_aproxvar(trans, dums_vec, phis_vec, 1, 0, false, false);
  s_vars(i) = get_aproxvar(trans, dums_vec, phis_vec, 1, 0, false, true);

  a_diffs(i) = 100 * (a_vars(i) - dyn_w) / dyn_w;
  s_diffs(i) = 100 * (s_vars(i) - dyn_w) / dyn_w;

end;
#toc;

diff_a = mean(a_diffs); [ua, ca, sa] = get_uncertainty(a_diffs);
diff_s = mean(s_diffs); [us, cs, ss] = get_uncertainty(s_diffs);


printf("%10.1f\t%10.5g\t%10.5g\t%10.5g\t%10.5g\t%10.5g\t%10.5g\t%10.5g\t%10.5g\n", f_mul, diff_a, ua, ca, sa, diff_s, us, cs, ss);
