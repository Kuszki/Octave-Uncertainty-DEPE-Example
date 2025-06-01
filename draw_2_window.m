clear;
h = figure('visible', ifelse(isguirunning(), 'on', 'off'));

pkg load communications
pkg load ltfat
pkg load parallel
pkg load statistics
pkg load signal

addpath("libs");

set(h, "paperunits", "centimeters")
set(h, "papersize", [18 12])
set(h, "paperposition", [0, 0, [18 12]])

set(0, "defaultaxesposition", [0.075, 0.075, 0.905, 0.915])
set(0, "defaultaxesfontsize", 9.5)
set(0, "defaultaxesfontsize", 9.5)
set(0, "defaulttextfontname", "Palatino Linotype")
set(0, "defaultaxesfontname", "Palatino Linotype")
set(0, "defaulttextcolor", "black")

x = load('case_2_window_3000_64_hamming.txt');

f_diff = 48e3/64;
f_vec = 3000 + x(:,1) * f_diff;
d_vec = x(:,2);
e_vec = x(:,3);

subplot(2, 2, 1)
list(1) = errorbar(f_vec, d_vec, e_vec, 'x');
xlim([min(f_vec)-0.1*f_diff max(f_vec)+0.1*f_diff])
title("(a)\\rm Hamming, {\\it{}f_{o}} = 3 kHz, {\\it{}N} = 64")
xlabel("Signal frequency, Hz")
ylabel("Error Value, %")
set_format(gca, 'Title', false);
set_format(gca, 'XY', false);
grid on
box on

x = load('case_2_window_6000_64_hamming.txt');

f_diff = 48e3/64;
f_vec = 6000 + x(:,1) * f_diff;
d_vec = x(:,2);
e_vec = x(:,3);

subplot(2, 2, 2)
list(2) = errorbar(f_vec, d_vec, e_vec, 'x');
xlim([min(f_vec)-0.1*f_diff max(f_vec)+0.1*f_diff])
title("(b)\\rm Hamming, {\\it{}f_{o}} = 6 kHz, {\\it{}N} = 64")
xlabel("Signal frequency, Hz")
ylabel("Error Value, %")
set_format(gca, 'Title', false);
set_format(gca, 'XY', false);
grid on
box on

x = load('case_2_window_3000_64_bartlett.txt');

f_diff = 48e3/64;
f_vec = 3000 + x(:,1) * f_diff;
d_vec = x(:,2);
e_vec = x(:,3);

subplot(2, 2, 3)
list(3) = errorbar(f_vec, d_vec, e_vec, 'x');
xlim([min(f_vec)-0.1*f_diff max(f_vec)+0.1*f_diff])
title("(c)\\rm Bartlett, {\\it{}f_{o}} = 3 kHz, {\\it{}N} = 64")
xlabel("Signal frequency, Hz")
ylabel("Error Value, %")
set_format(gca, 'Title', false);
set_format(gca, 'XY', false);
grid on
box on

x = load('case_2_window_3000_64_blackman.txt');

f_diff = 48e3/64;
f_vec = 3000 + x(:,1) * f_diff;
d_vec = x(:,2);
e_vec = x(:,3);

subplot(2, 2, 4)
list(4) = errorbar(f_vec, d_vec, e_vec, 'x');
xlim([min(f_vec)-0.1*f_diff max(f_vec)+0.1*f_diff])
title("(d)\\rm Blackman, {\\it{}f_{o}} = 3 kHz, {\\it{}N} = 64")
xlabel("Signal frequency, Hz")
ylabel("Error Value, %")
set_format(gca, 'Title', false);
set_format(gca, 'XY', false);
grid on
box on

for l = list
 set(l, 'markeredgecolor', 'r', 'markersize', 5);
end

print("case_2_window.svg");
