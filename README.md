# Octave-Uncertainty-DEPE-Example
Example of the application of the method for estimating the variance value of dynamic error signals based on the spectrum of the input quantity of the digital part of the measurement chain.

## Case 1: `case_1_sine.m`
The case where a sinusoidally varying signal is processed. The proposed method without a measurement window is used. The influence of the spectral leakage phenomenon on the effectiveness of the method is investigated.

## Case 2: `case_2_window.m`
A case where a sinusoidally varying signal is processed. The proposed method is used together with the measurement window function. The influence of the spectral leakage phenomenon on the effectiveness of the method is investigated.

## Case 3: `case_3_noise.m`
The case where a sinusoidally varying signal is processed, disturbed by a white noise signal. The proposed method is used together with the application of the measurement window function and the modulus correction of the DFT algorithm coefficients. The influence of the spectral leakage phenomenon and the presence of a noise signal on the effectiveness of the method is investigated.

## Case 4: `case_4_all.m`
The case where a sinusoidally varying signal is processed, with a given number of harmonics and random parameters, disturbed by a white noise signal. The proposed method is used together with the application of the measurement window function and the correction of the modulus of the DFT algorithm coefficients. The influence of the spectral leakage phenomenon and the presence of a noise signal on the effectiveness of the method for complex measurement conditions is investigated.

## Running experiments
Experiments can be performed by running the above-mentioned scripts along with parameters (description in the comment at the beginning of the script). It is also possible to run subsequent experiments comprehensively for the given conditions:
``` bash
./run_all.sh   # run all cases for prepared parameters and save resoults into files
```
Resoults will be use further to plot graphs and prepare table content.

## Preparing otuput
Plots and tables can be printed using `draw_*.m` scripts and `gen_tabs.sh` script.

## Requirements

- Recent version of GNU Octave or MATLAB[^1].
- Statistics package for GNU Octave.
- BASH and GNU Parallel packet.

[^1]: MATLAB usage requires minor changes in libraries due to some incompatibility.

## Credits

All files in `libs` are part of [Octave-FWT-Utils](https://github.com/Kuszki/Octave-FWT-Utils) project licensed under GPL-3.0 license.

## License

This project is licensed under GPL-3.0 license.
