#!/bin/bash

./run_case_1.sh | tee case_1_sine_all.txt
./run_case_2.sh | tee case_2_window_all.txt
./run_case_3.sh | tee case_3_noise_all.txt
./run_case_4.sh | tee case_4_mix_all.txt

./gen_tabs.sh

parallel octave {} ::: draw_*.m
