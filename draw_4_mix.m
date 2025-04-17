clear;
h = figure('visible', ifelse(isguirunning(), 'on', 'off'));

pkg load communications
pkg load ltfat
pkg load parallel
pkg load statistics
pkg load signal

addpath("../libs");

set(h, "paperunits", "centimeters")
set(h, "papersize", [18 12])
set(h, "paperposition", [0, 0, [18 12]])

set(0, "defaultaxesposition", [0.075, 0.075, 0.905, 0.915])
set(0, "defaultaxesfontsize", 9)
set(0, "defaultaxesfontsize", 9)
set(0, "defaulttextfontname", "Palatino Linotype")
set(0, "defaultaxesfontname", "Palatino Linotype")
set(0, "defaulttextcolor", "black")

x = load('case_4_mix_64_5_hamming.dat.gz').a_diffs;

subplot(2, 3, 1)
hist(x, 300, 100, "facecolor", 0.15*[1 1 1], "edgecolor", 0.15*[1 1 1])
title(sprintf("(a)\\rm  {\\it{}N} = 64,  {\\it{}K} = 5,  {\\it{}U_{\\delta}} = %0.2g%%", get_uncertainty(x)))
xlabel("Error value, %")
ylabel("Occurences, %")
xlim([-100 100])
xticklabels(strrep(xticklabels, '-', '−'));
yticklabels(strrep(yticklabels, '-', '−'));
grid on
box on

x = load('case_4_mix_128_5_hamming.dat.gz').a_diffs;

subplot(2, 3, 2)
hist(x, 300, 100, "facecolor", 0.15*[1 1 1], "edgecolor", 0.15*[1 1 1])
title(sprintf("(b)\\rm  {\\it{}N} = 128,  {\\it{}K} = 5,  {\\it{}U_{\\delta}} = %0.2g%%", get_uncertainty(x)))
xlabel("Error value, %")
ylabel("Occurences, %")
xlim([-50 50])
xticklabels(strrep(xticklabels, '-', '−'));
yticklabels(strrep(yticklabels, '-', '−'));
grid on
box on

x = load('case_4_mix_256_5_hamming.dat.gz').a_diffs;

subplot(2, 3, 3)
hist(x, 300, 100, "facecolor", 0.15*[1 1 1], "edgecolor", 0.15*[1 1 1])
title(sprintf("(c)\\rm  {\\it{}N} = 256,  {\\it{}K} = 5,  {\\it{}U_{\\delta}} = %0.2g%%", get_uncertainty(x)))
xlabel("Error value, %")
ylabel("Occurences, %")
xlim([-50 50])
xticklabels(strrep(xticklabels, '-', '−'));
yticklabels(strrep(yticklabels, '-', '−'));
grid on
box on

x = load('case_4_mix_128_9_hamming.dat.gz').a_diffs;

subplot(2, 3, 4)
hist(x, 300, 100, "facecolor", 0.15*[1 1 1], "edgecolor", 0.15*[1 1 1])
title(sprintf("(a)\\rm  {\\it{}N} = 128,  {\\it{}K} = 9,  {\\it{}U_{\\delta}} = %0.2g%%", get_uncertainty(x)))
xlabel("Error value, %")
ylabel("Occurences, %")
xlim([-100 100])
xticklabels(strrep(xticklabels, '-', '−'));
yticklabels(strrep(yticklabels, '-', '−'));
grid on
box on

x = load('case_4_mix_256_9_hamming.dat.gz').a_diffs;

subplot(2, 3, 5)
hist(x, 300, 100, "facecolor", 0.15*[1 1 1], "edgecolor", 0.15*[1 1 1])
title(sprintf("(b)\\rm  {\\it{}N} = 256,  {\\it{}K} = 9,  {\\it{}U_{\\delta}} = %0.2g%%", get_uncertainty(x)))
xlabel("Error value, %")
ylabel("Occurences, %")
xlim([-50 50])
xticklabels(strrep(xticklabels, '-', '−'));
yticklabels(strrep(yticklabels, '-', '−'));
grid on
box on

x = load('case_4_mix_512_9_hamming.dat.gz').a_diffs;

subplot(2, 3, 6)
hist(x, 300, 100, "facecolor", 0.15*[1 1 1], "edgecolor", 0.15*[1 1 1])
title(sprintf("(c)\\rm  {\\it{}N} = 512,  {\\it{}K} = 9,  {\\it{}U_{\\delta}} = %0.2g%%", get_uncertainty(x)))
xlabel("Error value, %")
ylabel("Occurences, %")
xlim([-50 50])
xticklabels(strrep(xticklabels, '-', '−'));
yticklabels(strrep(yticklabels, '-', '−'));
grid on
box on

print("case_4_mix.svg");
