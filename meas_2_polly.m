clear;
h = figure('visible', ifelse(isguirunning(), 'on', 'off'));

pkg load communications
pkg load ltfat
pkg load parallel
pkg load statistics
pkg load signal

addpath("libs");

set(h, "paperunits", "centimeters")
set(h, "papersize", [18 6])
set(h, "paperposition", [0, 0, [18 6]])

set(0, "defaultaxesposition", [0.075, 0.075, 0.905, 0.915])
set(0, "defaultaxesfontsize", 9.5)
set(0, "defaultaxesfontsize", 9.5)
set(0, "defaulttextfontname", "Palatino Linotype")
set(0, "defaultaxesfontname", "Palatino Linotype")
set(0, "defaulttextcolor", "black")

saw = @(x) (2/pi)*asin(sin(x));

ADC = @(x) 4093.097 * x/1000 + 0.4519081;
VIN = @(x) 1000*(x - 0.4519081) / 4093.097;
PHI = @(w) -6.26e-13*w^2 - 5.73e-7*w;

dat = load("freq.dat");

wrd = 0.12732;
amp = 479.218;
shf = 507.269;

fs = 48e3;
nsam = 128;
det = 144 / 12e6;

src_path = "saw";

freq_vec = (0 : nsam-1)*fs/nsam;
wnd_vec = feval('hamming', nsam);
wnd_vec = wnd_vec / sqrt(mean(wnd_vec.^2));

for i = 1 : length(freq_vec)
 phis_vec(i) = PHI(2*pi*freq_vec(i));
end

j = 0;
for i = 1 : length(dat)

 if exist(sprintf("%s/%d.txt", src_path, dat(i,1)), "file") != 2; continue;
 elseif dat(i,1) < 1000; continue;
 end;

 j = j + 1;
 f = f_k(j) = dat(i,1);
 o = dat(i,2);

 fun = @(x) amp*saw(o*x) + shf;

 pts = load(sprintf("%s/%d.txt", src_path, f));
 pts = VIN(pts);

 t = (0 : (length(pts)-1)) / 48000.0;
 org = fun(transpose(t) + det);
 diff = pts - org;

 var_m = var(diff) - wrd;

 for k = 1 : length(pts) - nsam - 1

 var_e(k) = get_aproxvar(fft(wnd_vec .* pts(k:k+nsam-1)), 1, phis_vec, 1, 0, true, true);
 diffs(j, k) = 100 * (var_e(k) - var_m) / var_m;

 end

 mn_diff = mean(diffs(j,:));
 u_diff = get_uncertainty(diffs(j,:));

 printf("%d\t%0.2f\t%0.2f\t%0.2f\t%0.2f\n", f/1000, var_m, mean(var_e), mn_diff, u_diff);

end

[up, um] = get_uncertainty(diffs(:), 95, false);
%printf("range: \\interval{%0.2f}{%0.2f}\n", um, up);

i = 0;
for k = [ 1 2 3 ]

diff_vect = diffs(k,:);

[up, um] = get_uncertainty(diff_vect, 95, false);

subplot(1, 3, ++i)
hist(diff_vect, 100, 100, "facecolor", 0.15*[1 1 1], "edgecolor", 0.15*[1 1 1])
title(sprintf("(%s)\\rm {\\it{}f_{s,o}} = %d kHz, {\\it{}U_{\\delta}} = [%0.2g; %0.2g]%%", 'a'+(i-1), f_k(k)/1000, um, up))
xlabel("Error value, %")
ylabel("Occurences, %")
set_format(gca, 'Title', false);
set_format(gca, 'XY', false);
grid on
box on

end

print("meas_2_polly.svg");
