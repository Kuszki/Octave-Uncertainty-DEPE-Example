#!/bin/bash

echo 3000 32   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 3000  32  | tee case_1_sine_3000_32.txt
echo 6000 32   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 6000  32  | tee case_1_sine_6000_32.txt
echo 9000 32   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 9000  32  | tee case_1_sine_9000_32.txt
echo 12000 32  && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 12000 32  | tee case_1_sine_12000_32.txt
echo 15000 32  && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 15000 32  | tee case_1_sine_15000_32.txt
echo 18000 32  && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 18000 32  | tee case_1_sine_18000_32.txt
echo 21000 32  && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 21000 32  | tee case_1_sine_21000_32.txt

echo 3000 64   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 3000  64  | tee case_1_sine_3000_64.txt
echo 6000 64   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 6000  64  | tee case_1_sine_6000_64.txt
echo 9000 64   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 9000  64  | tee case_1_sine_9000_64.txt
echo 12000 64  && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 12000 64  | tee case_1_sine_12000_64.txt
echo 15000 64  && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 15000 64  | tee case_1_sine_15000_64.txt
echo 18000 64  && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 18000 64  | tee case_1_sine_18000_64.txt
echo 21000 64  && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 21000 64  | tee case_1_sine_21000_64.txt

echo 3000 128  && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 3000  128 | tee case_1_sine_3000_128.txt
echo 6000 128  && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 6000  128 | tee case_1_sine_6000_128.txt
echo 9000 128  && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 9000  128 | tee case_1_sine_9000_128.txt
echo 12000 128 && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 12000 128 | tee case_1_sine_12000_128.txt
echo 15000 128 && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 15000 128 | tee case_1_sine_15000_128.txt
echo 18000 128 && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 18000 128 | tee case_1_sine_18000_128.txt
echo 21000 128 && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_1_sine.m {1} 21000 128 | tee case_1_sine_21000_128.txt

