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

sources = { ...
'case_3_noise_6000_64_hamming_fm5.txt' ...
'case_3_noise_9000_64_hamming_f0.txt' ...
'case_3_noise_12000_64_hamming_fp5.txt' ...
};

descs_a = { '-0.5' '0.0' '0.5' };
descs_b = { '6' '9' '12' };

col_n = 3;

for i = 1 : length(sources)

x = load(sources{i});

f_diff = 48e3/64;
x_vec = 10*log10(0.5./x(2:(end),1));
f_vec = 9000 -0.5*f_diff;
d_vec = x(2:(end),2);
e_vec = x(2:(end),3);

subplot(length(sources)/col_n, col_n, i)
list(i) = errorbar(x_vec, d_vec, e_vec, 'x');
title(sprintf("(%s)\\rm {\\it{}f_{o}} = %s kHz, {\\it{}f_{mul}} = %s", 'a'+(i-1), descs_b{i}, descs_a{i}))
xlabel("SNR, dB")
ylabel("Error Value, %")
set_format(gca, 'Title', false);
set_format(gca, 'XY', false);
grid on
box on

end

for l = list
 set(l, 'markeredgecolor', 'r', 'markersize', 5);
end

print("case_3_noise.svg");
