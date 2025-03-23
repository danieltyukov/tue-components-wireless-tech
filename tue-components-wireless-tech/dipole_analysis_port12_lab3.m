%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             2-Port Dipole Antenna Measurements
%                 Plotting and Analysis Script
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; close all;

%% 1) Load the Two-Port S-Parameter File
% Update the filename to your actual .s2p file from CST or measurements
filename = 'lab3_port1_port2_dipoles.s2p';
disp(['Loading S-parameter file: ', filename]);

% Requires RF Toolbox in MATLAB
sData = sparameters(filename);

% Extract frequency array (Hz)
freq_Hz = sData.Frequencies;

% Extract the complex S-parameters
S11 = squeeze(sData.Parameters(1,1,:));
S21 = squeeze(sData.Parameters(2,1,:));
S12 = squeeze(sData.Parameters(1,2,:));
S22 = squeeze(sData.Parameters(2,2,:));

% Convert to dB
S11_dB = 20*log10(abs(S11));
S21_dB = 20*log10(abs(S21));
S12_dB = 20*log10(abs(S12));
S22_dB = 20*log10(abs(S22));

disp('Successfully extracted S11, S21, S12, and S22.');

%% 2) Basic Analysis / Print Key Data
% Find frequency points in GHz
freq_GHz = freq_Hz / 1e9;

% Locate minima for S11 and S22, maxima for S21 (etc.)
[~, idxS11min] = min(S11_dB);
[~, idxS22min] = min(S22_dB);
[~, idxS21max] = max(S21_dB);

f_resonance_S11 = freq_GHz(idxS11min);
f_resonance_S22 = freq_GHz(idxS22min);
f_maxCoupling_S21 = freq_GHz(idxS21max);

fprintf('\n=== Key Frequencies & Coupling ===\n');
fprintf('S11 min  at  %.3f GHz, S11(dB) = %.2f dB\n', ...
    f_resonance_S11, S11_dB(idxS11min));
fprintf('S22 min  at  %.3f GHz, S22(dB) = %.2f dB\n', ...
    f_resonance_S22, S22_dB(idxS22min));
fprintf('S21 max  at  %.3f GHz, S21(dB) = %.2f dB\n', ...
    f_maxCoupling_S21, S21_dB(idxS21max));

% You can also note if S21 and S12 differ (they should be the same in a 
% reciprocal, lossless scenario, but practical measurement setups might differ).
disp(' ');

%% 3) Plot S11
figure('Name','S11 vs Frequency');
plot(freq_GHz, S11_dB, 'LineWidth',1.5);
grid on;
xlabel('Frequency (GHz)');
ylabel('S_{11} (dB)');
title('Port 1 Reflection Coefficient (S_{11})');

%% 4) Plot S21
figure('Name','S21 vs Frequency');
plot(freq_GHz, S21_dB, 'LineWidth',1.5);
grid on;
xlabel('Frequency (GHz)');
ylabel('S_{21} (dB)');
title('Transmission from Port 1 to Port 2 (S_{21})');

%% 5) Plot S12
figure('Name','S12 vs Frequency');
plot(freq_GHz, S12_dB, 'LineWidth',1.5);
grid on;
xlabel('Frequency (GHz)');
ylabel('S_{12} (dB)');
title('Transmission from Port 2 to Port 1 (S_{12})');

%% 6) Plot S22
figure('Name','S22 vs Frequency');
plot(freq_GHz, S22_dB, 'LineWidth',1.5);
grid on;
xlabel('Frequency (GHz)');
ylabel('S_{22} (dB)');
title('Port 2 Reflection Coefficient (S_{22})');

%% 7) Friis Equation to Estimate Antenna Gain
%
% In a two-antenna setup at distance R, the Friis equation in dB form is:
%   S21_dB ~ 10*log10(G1 * G2) + 20*log10(lambda / (4*pi*R))   (neglecting other losses)
%
% If you assume the two antennas are identical (G1 = G2 = G), then:
%   S21_dB ~ 2*G_dBi + 20*log10(lambda / (4*pi*R))
%     => G_dBi = (S21_dB - 20*log10(lambda/(4*pi*R))) / 2
%
% We'll just pick the S21(dB) at the frequency of interest. Then solve for G.
% Adjust R for your measurement distance (meters).
% If you have multiple distances, repeat for each.

% User parameters (edit these as needed)
freq_target = 1e9;   % 1 GHz (or pick f_resonance_S11 or f_maxCoupling_S21)
R = 0.5;            % Example distance in meters
c0 = 3e8;           % Speed of light in vacuum [m/s]

% Compute the free-space wavelength at freq_target
lambda_m = c0 / freq_target;

% Find the index in your S21 array closest to freq_target
[~, idxFreq] = min(abs(freq_Hz - freq_target));
S21_dB_atFreq = S21_dB(idxFreq);

% Solve Friis for G (assuming G1 = G2 = G)
FS_term_dB = 20*log10(lambda_m/(4*pi*R));  % free-space path loss (dB)
G_est_dBi = (S21_dB_atFreq - FS_term_dB)/2;

fprintf('\n=== Friis Equation Estimate ===\n');
fprintf('At freq = %.3f GHz\n', freq_Hz(idxFreq)/1e9);
fprintf('Measured S21(dB) = %.2f dB\n', S21_dB_atFreq);
fprintf('Free-space path loss term = %.2f dB (R=%.2f m)\n', FS_term_dB, R);
fprintf('Estimated single-antenna gain (assuming identical antennas): %.2f dBi\n', G_est_dBi);

disp('Compare this to your full-wave simulation or datasheet to see differences.');
disp('Reasons for discrepancy: near-field coupling if R is small, cable losses, mismatch,');
disp('real environment multipath, or differences from ideal assumptions.');

%% 8) Brief Text Guidance for the Questions
disp(' ');
disp('=== INTERPRETATION (Short Answers) ===');
disp('1) S21 indicates how much power is transmitted from Port 1 to Port 2.');
disp('   - If the dipoles are aligned for maximum coupling, S21(dB) will be higher.');
disp('   - If they are cross-polarized or misaligned, S21(dB) will be lower.');
disp('2) Polarization alignment: For linear dipoles, aligning E-field planes maximizes transmission.');
disp('3) Antenna distance & alignment also affect S21; worst-case is broadside null or cross-pol misalignment.');
disp('4) The Friis equation lets you estimate gain from S21 at a known distance, but real-world effects');
disp('   (cable loss, mismatch, near-field, measurement errors) can cause deviations from simulated gain.');
disp('Done.');
