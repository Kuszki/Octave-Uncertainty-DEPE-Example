clear;
#clf;

pkg load statistics;
pkg load communications;
pkg load ltfat;
pkg load parallel;
pkg load signal;

addpath("libs");

args = argv();
nsam = 128;
nsin = 7;

if length(args) > 0
val = str2double(args{1});
if val > 0 && val < 513
  nsam = val;
end
end

if length(args) > 1
val = round(str2double(args{2}));
if val > 0 && val < 10
  nsin = val;
end
end

if length(args) > 2
wnd = args{3};
else
wnd = 'hamming';
end

# run options
iters_a = 1e5;

# sampling params
fs = 48e3;
fn = fs/nsam;

# objects freq params
fa = 320e3;

# adc settings
aq = 0.023438;

# timing evals
Ts = 1/fs;

# input signal
f_in = @(x, f, am, fi) am*sin(pi*2*f*x + fi);

# adc function
f_adc = @(x) aq * floor(x/aq + 0.5);

# filter functions
f_fil_a_cmp = @(x) 1 / (1 + i * (x/fa));
f_fil_a_amp = @(x) abs(f_fil_a_cmp(x));
f_fil_a_phi = @(x) atan(imag(f_fil_a_cmp(x))./real(f_fil_a_cmp(x)));

dc_vec = 2 * rand(1, iters_a) - 1;
am_vec = rand(nsin, iters_a) * 0.75 + 0.25;
ph_vec = 2*pi * rand(nsin, iters_a);
fq_vec = 3000 + rand(nsin, iters_a) * (fs/2 - 6000);
no_vec = (0.1-0.001) * rand(1, iters_a) + 0.001;

freq_vec = (0 : nsam-1)*fs/nsam;
x0 = Ts*(0 : nsam-1);

wnd_vec = transpose(feval(wnd, nsam));
wnd_vec = wnd_vec / sqrt(mean(wnd_vec.^2));

for i = 1 : length(freq_vec)
	phis_vec(i) = f_fil_a_phi(freq_vec(i));
	dums_vec(i) = f_fil_a_amp(freq_vec(i));
end

#tic;
for i = 1 : iters_a

  ya = zeros(1, nsam);
  yi = zeros(1, nsam);
  dyn_w = 0.0;

  # generate input vector and calc var
  for j = 1 : nsin

	fi_now = f_fil_a_phi(fq_vec(j, i)); fi_ide = ph_vec(j, i);
	am_now = f_fil_a_amp(fq_vec(j, i)); am_ide = am_vec(j, i);

	ya = ya + f_in(x0, fq_vec(j, i), am_now*am_ide, fi_now+fi_ide);
	yi = yi + f_in(x0, fq_vec(j, i), am_ide, fi_ide);

  end

  dyn_w = var(ya - yi);

  # perform adc part tasks
  ya = f_adc(ya + dc_vec(i) + gen_randu(nsam, no_vec(i), 'w'));

  trans = fft(wnd_vec .* ya);

  a_vars(i) = get_aproxvar(trans, dums_vec, phis_vec, 1, 0, true, false);
  a_diffs(i) = 100 * (a_vars(i) - dyn_w) / dyn_w;

end;
#toc;

diff_a = mean(a_diffs); [ua, ca, sa] = get_uncertainty(a_diffs);

printf("%d\t%d\t%10.5g\t%10.5g\t%10.5g\t%10.5g\n", nsam, nsin, diff_a, ua, ca, sa);
save("-z", sprintf("case_4_mix_%d_%d_%s.dat.gz", nsam, nsin, wnd), "a_diffs");
