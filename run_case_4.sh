#!/bin/bash

echo mixed hamming  && parallel -k --jobs 12 --colsep='\t' --arg-file=case_4_params.txt octave case_4_mix.m {1} {2} hamming
echo mixed bartlett && parallel -k --jobs 12 --colsep='\t' --arg-file=case_4_params.txt octave case_4_mix.m {1} {2} bartlett
