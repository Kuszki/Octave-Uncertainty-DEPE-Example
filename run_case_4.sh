#!/bin/bash

echo mixed hamming  && parallel -k --colsep='\t' --arg-file=case_4_params.txt octave case_4_mix.m {1} {2} hamming
echo mixed bartlett && parallel -k --colsep='\t' --arg-file=case_4_params.txt octave case_4_mix.m {1} {2} bartlett
