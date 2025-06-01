#!/bin/bash

echo 6000 64 hamming -0.5     && parallel -k --colsep='\t' --arg-file=case_3_params.txt octave case_3_noise.m -0.5 6000 64 {1} hamming     | tee case_3_noise_6000_64_hamming_fm5.txt
echo 6000 64 hamming 0.0      && parallel -k --colsep='\t' --arg-file=case_3_params.txt octave case_3_noise.m  0.0 6000 64 {1} hamming     | tee case_3_noise_6000_64_hamming_f0.txt
echo 6000 64 hamming +0.5     && parallel -k --colsep='\t' --arg-file=case_3_params.txt octave case_3_noise.m  0.5 6000 64 {1} hamming     | tee case_3_noise_6000_64_hamming_fp5.txt

echo 9000 64 hamming -0.5     && parallel -k --colsep='\t' --arg-file=case_3_params.txt octave case_3_noise.m -0.5 9000 64 {1} hamming     | tee case_3_noise_9000_64_hamming_fm5.txt
echo 9000 64 hamming 0.0      && parallel -k --colsep='\t' --arg-file=case_3_params.txt octave case_3_noise.m  0.0 9000 64 {1} hamming     | tee case_3_noise_9000_64_hamming_f0.txt
echo 9000 64 hamming +0.5     && parallel -k --colsep='\t' --arg-file=case_3_params.txt octave case_3_noise.m  0.5 9000 64 {1} hamming     | tee case_3_noise_9000_64_hamming_fp5.txt

echo 12000 64 hamming -0.5    && parallel -k --colsep='\t' --arg-file=case_3_params.txt octave case_3_noise.m -0.5 12000 64 {1} hamming    | tee case_3_noise_12000_64_hamming_fm5.txt
echo 12000 64 hamming 0.0     && parallel -k --colsep='\t' --arg-file=case_3_params.txt octave case_3_noise.m  0.0 12000 64 {1} hamming    | tee case_3_noise_12000_64_hamming_f0.txt
echo 12000 64 hamming +0.5    && parallel -k --colsep='\t' --arg-file=case_3_params.txt octave case_3_noise.m  0.5 12000 64 {1} hamming    | tee case_3_noise_12000_64_hamming_fp5.txt

echo 6000 64 bartlett -0.5    && parallel -k --colsep='\t' --arg-file=case_3_params.txt octave case_3_noise.m -0.5 6000 64 {1} bartlett    | tee case_3_noise_6000_64_bartlett_fm5.txt
echo 6000 64 bartlett 0.0     && parallel -k --colsep='\t' --arg-file=case_3_params.txt octave case_3_noise.m  0.0 6000 64 {1} bartlett    | tee case_3_noise_6000_64_bartlett_f0.txt
echo 6000 64 bartlett +0.5    && parallel -k --colsep='\t' --arg-file=case_3_params.txt octave case_3_noise.m  0.5 6000 64 {1} bartlett    | tee case_3_noise_6000_64_bartlett_fp5.txt

echo 9000 64 bartlett -0.5    && parallel -k --colsep='\t' --arg-file=case_3_params.txt octave case_3_noise.m -0.5 9000 64 {1} bartlett    | tee case_3_noise_9000_64_bartlett_fm5.txt
echo 9000 64 bartlett 0.0     && parallel -k --colsep='\t' --arg-file=case_3_params.txt octave case_3_noise.m  0.0 9000 64 {1} bartlett    | tee case_3_noise_9000_64_bartlett_f0.txt
echo 9000 64 bartlett +0.5    && parallel -k --colsep='\t' --arg-file=case_3_params.txt octave case_3_noise.m  0.5 9000 64 {1} bartlett    | tee case_3_noise_9000_64_bartlett_fp5.txt

echo 12000 64 bartlett -0.5   && parallel -k --colsep='\t' --arg-file=case_3_params.txt octave case_3_noise.m -0.5 12000 64 {1} bartlett   | tee case_3_noise_12000_64_bartlett_fm5.txt
echo 12000 64 bartlett 0.0    && parallel -k --colsep='\t' --arg-file=case_3_params.txt octave case_3_noise.m  0.0 12000 64 {1} bartlett   | tee case_3_noise_12000_64_bartlett_f0.txt
echo 12000 64 bartlett +0.5   && parallel -k --colsep='\t' --arg-file=case_3_params.txt octave case_3_noise.m  0.5 12000 64 {1} bartlett   | tee case_3_noise_12000_64_bartlett_fp5.txt

echo 3000 64 bartlett 0.00    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 3000  64 0.00 bartlett   | tee case_3_noise_3000_64_bartlett_000.txt
echo 9000 64 bartlett 0.00    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 9000  64 0.00 bartlett   | tee case_3_noise_9000_64_bartlett_000.txt
echo 15000 64 bartlett 0.00   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 15000 64 0.00 bartlett   | tee case_3_noise_15000_64_bartlett_000.txt

echo 3000 64 bartlett 0.01    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 3000  64 0.01 bartlett   | tee case_3_noise_3000_64_bartlett_001.txt
echo 9000 64 bartlett 0.01    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 9000  64 0.01 bartlett   | tee case_3_noise_9000_64_bartlett_001.txt
echo 15000 64 bartlett 0.01   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 15000 64 0.01 bartlett   | tee case_3_noise_15000_64_bartlett_001.txt

echo 3000 64 bartlett 0.02    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 3000  64 0.02 bartlett   | tee case_3_noise_3000_64_bartlett_002.txt
echo 9000 64 bartlett 0.02    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 9000  64 0.02 bartlett   | tee case_3_noise_9000_64_bartlett_002.txt
echo 15000 64 bartlett 0.02   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 15000 64 0.02 bartlett   | tee case_3_noise_15000_64_bartlett_002.txt

echo 3000 64 bartlett 0.03    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 3000  64 0.03 bartlett   | tee case_3_noise_3000_64_bartlett_003.txt
echo 9000 64 bartlett 0.03    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 9000  64 0.03 bartlett   | tee case_3_noise_9000_64_bartlett_003.txt
echo 15000 64 bartlett 0.03   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 15000 64 0.03 bartlett   | tee case_3_noise_15000_64_bartlett_003.txt

echo 3000 64 bartlett 0.04    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 3000  64 0.04 bartlett   | tee case_3_noise_3000_64_bartlett_004.txt
echo 9000 64 bartlett 0.04    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 9000  64 0.04 bartlett   | tee case_3_noise_9000_64_bartlett_004.txt
echo 15000 64 bartlett 0.04   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 15000 64 0.04 bartlett   | tee case_3_noise_15000_64_bartlett_004.txt

echo 3000 64 bartlett 0.05    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 3000  64 0.05 bartlett   | tee case_3_noise_3000_64_bartlett_005.txt
echo 9000 64 bartlett 0.05    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 9000  64 0.05 bartlett   | tee case_3_noise_9000_64_bartlett_005.txt
echo 15000 64 bartlett 0.05   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 15000 64 0.05 bartlett   | tee case_3_noise_15000_64_bartlett_005.txt

echo 3000 64 bartlett 0.06    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 3000  64 0.06 bartlett   | tee case_3_noise_3000_64_bartlett_006.txt
echo 9000 64 bartlett 0.06    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 9000  64 0.06 bartlett   | tee case_3_noise_9000_64_bartlett_006.txt
echo 15000 64 bartlett 0.06   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 15000 64 0.06 bartlett   | tee case_3_noise_15000_64_bartlett_006.txt

echo 3000 64 bartlett 0.07    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 3000  64 0.07 bartlett   | tee case_3_noise_3000_64_bartlett_007.txt
echo 9000 64 bartlett 0.07    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 9000  64 0.07 bartlett   | tee case_3_noise_9000_64_bartlett_007.txt
echo 15000 64 bartlett 0.07   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 15000 64 0.07 bartlett   | tee case_3_noise_15000_64_bartlett_007.txt

echo 3000 64 bartlett 0.08    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 3000  64 0.08 bartlett   | tee case_3_noise_3000_64_bartlett_008.txt
echo 9000 64 bartlett 0.08    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 9000  64 0.08 bartlett   | tee case_3_noise_9000_64_bartlett_008.txt
echo 15000 64 bartlett 0.08   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 15000 64 0.08 bartlett   | tee case_3_noise_15000_64_bartlett_008.txt

echo 3000 64 bartlett 0.09    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 3000  64 0.09 bartlett   | tee case_3_noise_3000_64_bartlett_009.txt
echo 9000 64 bartlett 0.09    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 9000  64 0.09 bartlett   | tee case_3_noise_9000_64_bartlett_009.txt
echo 15000 64 bartlett 0.09   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 15000 64 0.09 bartlett   | tee case_3_noise_15000_64_bartlett_009.txt

echo 3000 64 bartlett 0.10    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 3000  64 0.10 bartlett   | tee case_3_noise_3000_64_bartlett_010.txt
echo 9000 64 bartlett 0.10    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 9000  64 0.10 bartlett   | tee case_3_noise_9000_64_bartlett_010.txt
echo 15000 64 bartlett 0.10   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_3_noise.m {1} 15000 64 0.10 bartlett   | tee case_3_noise_15000_64_bartlett_010.txt
