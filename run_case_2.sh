#!/bin/bash

echo 3000 64 bartlett    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 3000  64 bartlett    | tee case_2_window_3000_64_bartlett.txt
echo 6000 64 bartlett    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 6000  64 bartlett    | tee case_2_window_6000_64_bartlett.txt
echo 9000 64 bartlett    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 9000  64 bartlett    | tee case_2_window_9000_64_bartlett.txt
echo 12000 64 bartlett   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 12000 64 bartlett    | tee case_2_window_12000_64_bartlett.txt
echo 15000 64 bartlett   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 15000 64 bartlett    | tee case_2_window_15000_64_bartlett.txt
echo 18000 64 bartlett   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 18000 64 bartlett    | tee case_2_window_18000_64_bartlett.txt
echo 21000 64 bartlett   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 21000 64 bartlett    | tee case_2_window_21000_64_bartlett.txt

echo 3000 64 hann        && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 3000  64 hann        | tee case_2_window_3000_64_hann.txt
echo 6000 64 hann        && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 6000  64 hann        | tee case_2_window_6000_64_hann.txt
echo 9000 64 hann        && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 9000  64 hann        | tee case_2_window_9000_64_hann.txt
echo 12000 64 hann       && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 12000 64 hann        | tee case_2_window_12000_64_hann.txt
echo 15000 64 hann       && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 15000 64 hann        | tee case_2_window_15000_64_hann.txt
echo 18000 64 hann       && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 18000 64 hann        | tee case_2_window_18000_64_hann.txt
echo 21000 64 hann       && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 21000 64 hann        | tee case_2_window_21000_64_hann.txt

echo 3000 64 flattopwin  && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 3000  64 flattopwin  | tee case_2_window_3000_64_flattopwin.txt
echo 6000 64 flattopwin  && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 6000  64 flattopwin  | tee case_2_window_6000_64_flattopwin.txt
echo 9000 64 flattopwin  && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 9000  64 flattopwin  | tee case_2_window_9000_64_flattopwin.txt
echo 12000 64 flattopwin && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 12000 64 flattopwin  | tee case_2_window_12000_64_flattopwin.txt
echo 15000 64 flattopwin && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 15000 64 flattopwin  | tee case_2_window_15000_64_flattopwin.txt
echo 18000 64 flattopwin && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 18000 64 flattopwin  | tee case_2_window_18000_64_flattopwin.txt
echo 21000 64 flattopwin && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 21000 64 flattopwin  | tee case_2_window_21000_64_flattopwin.txt

echo 3000 64 blackman    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 3000  64 blackman    | tee case_2_window_3000_64_blackman.txt
echo 6000 64 blackman    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 6000  64 blackman    | tee case_2_window_6000_64_blackman.txt
echo 9000 64 blackman    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 9000  64 blackman    | tee case_2_window_9000_64_blackman.txt
echo 12000 64 blackman   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 12000 64 blackman    | tee case_2_window_12000_64_blackman.txt
echo 15000 64 blackman   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 15000 64 blackman    | tee case_2_window_15000_64_blackman.txt
echo 18000 64 blackman   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 18000 64 blackman    | tee case_2_window_18000_64_blackman.txt
echo 21000 64 blackman   && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 21000 64 blackman    | tee case_2_window_21000_64_blackman.txt

echo 3000 64 hamming     && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 3000  64 hamming     | tee case_2_window_3000_64_hamming.txt
echo 6000 64 hamming     && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 6000  64 hamming     | tee case_2_window_6000_64_hamming.txt
echo 9000 64 hamming     && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 9000  64 hamming     | tee case_2_window_9000_64_hamming.txt
echo 12000 64 hamming    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 12000 64 hamming     | tee case_2_window_12000_64_hamming.txt
echo 15000 64 hamming    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 15000 64 hamming     | tee case_2_window_15000_64_hamming.txt
echo 18000 64 hamming    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 18000 64 hamming     | tee case_2_window_18000_64_hamming.txt
echo 21000 64 hamming    && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 21000 64 hamming     | tee case_2_window_21000_64_hamming.txt

echo 3000 64 hann        && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 3000  64 hann        | tee case_2_window_3000_64_hann.txt
echo 6000 64 hann        && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 6000  64 hann        | tee case_2_window_6000_64_hann.txt
echo 9000 64 hann        && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 9000  64 hann        | tee case_2_window_9000_64_hann.txt
echo 12000 64 hann       && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 12000 64 hann        | tee case_2_window_12000_64_hann.txt
echo 15000 64 hann       && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 15000 64 hann        | tee case_2_window_15000_64_hann.txt
echo 18000 64 hann       && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 18000 64 hann        | tee case_2_window_18000_64_hann.txt
echo 21000 64 hann       && parallel -k --colsep='\t' --arg-file=case_1_params.txt octave case_2_window.m {1} 21000 64 hann        | tee case_2_window_21000_64_hann.txt
