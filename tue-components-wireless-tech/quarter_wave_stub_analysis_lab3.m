%==================================================================
% Script:    process_s1p_data.m
% Purpose:   Import S-parameter data from CST (.s1p file),
%            plot S11 vs. frequency in dB, and show a Smith chart.
% Author:    [Your Name], Lab 3
%==================================================================

clear; clc; close all;

% === 1. LOAD THE TOUCHSTONE FILE ===
filename = 'Dipole_antenna_student (1 GHz)_2024.s1p'; % <-- Change if needed
sData = sparameters(filename);  % Requires RF Toolbox

% === 2. EXTRACT FREQUENCIES AND S11 ===
freq_Hz = sData.Frequencies;    % Frequencies in Hz
S11     = squeeze(sData.Parameters(1,1,:));  % S11 as a function of frequency

% === 3. CONVERT |S11| TO DECIBELS FOR RETURN LOSS PLOT ===
S11_dB = 20*log10(abs(S11));

% === 4. PLOT RETURN LOSS ===
figure('Name','Return Loss');
plot(freq_Hz/1e9, S11_dB, 'LineWidth',1.5);
grid on; xlabel('Frequency (GHz)'); ylabel('|S_{11}| (dB)');
title('Dipole Antenna Return Loss (from .s1p)');

% OPTIONAL: Find the resonant frequency (where S11 is minimal)
[S11_min_dB, idxMin] = min(S11_dB);
f_resonant = freq_Hz(idxMin)/1e9;
disp(['Resonant Frequency = ', num2str(f_resonant, '%.3f'), ' GHz,  S11 = ', ...
      num2str(S11_min_dB, '%.2f'), ' dB']);

% === 5. SMITH CHART PLOT ===
figure('Name','Smith Chart');
smithplot(sData);
title('Smith Chart of S11');
