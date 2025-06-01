#!/bin/bash

echo sym_tab_1 && ./merge.sh case_1_params.txt 1 \
	case_1_sine_6000_32.txt 2 3 \
	case_1_sine_6000_64.txt 2 3 \
	case_1_sine_6000_128.txt 2 3 \
	case_1_sine_12000_32.txt 2 3 \
	case_1_sine_12000_64.txt 2 3 \
	case_1_sine_12000_128.txt 2 3 \
	tab_res_sym_1.tex

echo sym_tab_2 && ./merge.sh case_1_params.txt 1 \
	case_2_window_6000_64_hamming.txt 2 3 \
	case_2_window_6000_64_bartlett.txt 2 3 \
	case_2_window_6000_64_flattopwin.txt 2 3 \
	case_2_window_12000_64_hamming.txt 2 3 \
	case_2_window_12000_64_bartlett.txt 2 3 \
	case_2_window_12000_64_flattopwin.txt 2 3 \
	tab_res_sym_2.tex

echo sym_tab_3 && ./merge.sh case_3_params.txt 2 \
	case_3_noise_9000_64_hamming_fm5.txt 2 3 6 7 \
	case_3_noise_9000_64_hamming_f0.txt 2 3 6 7 \
	case_3_noise_9000_64_hamming_fp5.txt 2 3 6 7 \
	tab_res_sym_3.tex

echo meas_1_mono && octave meas_1_mono.m | awk -f measf.sh | tee tab_res_meas_1.tex
echo meas_2_polly && octave meas_2_polly.m | awk -f measf.sh | tee tab_res_meas_2.tex
