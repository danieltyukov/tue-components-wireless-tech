%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   Dipole Antenna at ~1 GHz in CST
%                   Extended script with Directivity Calculation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear; clc; close all;

%% --- 1. THEORETICAL DIPOLE DIMENSIONS ---
c0 = 3e8;                % Speed of light [m/s]
f_design = 1e9;          % Design frequency [Hz]
lambda = c0 / f_design;  % Free-space wavelength [m]
dipoleLength_ideal = lambda/2;  % Ideal half-wave dipole length [m]

disp('=== THEORETICAL ANTENNA DATA ===');
fprintf('Design frequency      : %.3f GHz\n', f_design/1e9);
fprintf('Free-space wavelength: %.3f mm\n', lambda*1e3);
fprintf('Ideal dipole length  : %.3f mm (half-wave)\n', dipoleLength_ideal*1e3);
disp(' ');

%% --- 2. LOAD THE S-PARAMETER (Touchstone) FILE FROM CST ---
filename = 'Dipole_antenna_student (1 GHz)_2024_lab3_114mm.s1p';
disp('=== LOADING S-PARAMETERS ===');
disp(['Using file: ', filename]);

% Requires RF Toolbox:
sData = sparameters(filename);  

% Extract frequency array (Hz) and S11
freq_Hz = sData.Frequencies;
S11 = squeeze(sData.Parameters(1,1,:));
S11_dB = 20*log10(abs(S11));

% Find index of minimum S11 in dB (resonant frequency)
[S11_min_dB, idxMin] = min(S11_dB);
f_resonant = freq_Hz(idxMin);

% Print relevant S-parameter info
disp(' ');
disp('=== S-PARAMETER ANALYSIS ===');
fprintf('Number of freq. points   : %d\n', length(freq_Hz));
fprintf('Found resonance near     : %.3f GHz\n', f_resonant/1e9);
fprintf('S11(dB) at resonance     : %.2f dB\n', S11_min_dB);
fprintf('Offset from design (MHz) : %.2f MHz\n', (f_resonant - f_design)/1e6);
disp(' ');

%% --- 3. PLOT RETURN LOSS (S11) ---
figure('Name','Return Loss');
plot(freq_Hz/1e9, S11_dB, 'LineWidth',1.5);
grid on; xlabel('Frequency (GHz)'); ylabel('|S_{11}| (dB)');
title('Dipole Antenna Return Loss');
xlim([min(freq_Hz/1e9), max(freq_Hz/1e9)]);

%% --- 4. SMITH CHART ---
figure('Name','Smith Chart');
smithplot(sData);
title('Smith Chart of S_{11}');

%% --- 5. FAR-FIELD RADIATION PATTERN & DIRECTIVITY ---
% If you exported far-field data from CST, e.g. "Angle (deg), Directivity (dBi)" 
% or "Angle (deg), Gain (dBi)". 
% Adjust filenames and columns as necessary.

% Example for a single-plane cut:
% Suppose your CSV has columns: 
%    1) Angle in degrees
%    2) Directivity (or Gain) in dBi
%
% If you have 3D data, you'd do a separate approach or read a 3D export.

% Uncomment or modify the next lines to load your far-field data.

% farFieldFile = 'Dipole_FF_EPlane.csv';  % <-- Your actual CST export file
% FFData = readmatrix(farFieldFile); 
% angle_deg = FFData(:,1);
% directivity_dBi  = FFData(:,2);
% 
% % Find the maximum directivity in this cut:
% maxDirectivity_dBi = max(directivity_dBi);
% 
% figure('Name','Far-Field Pattern (E-Plane)');
% polarplot(deg2rad(angle_deg), directivity_dBi, 'LineWidth',1.5);
% title('Dipole Far-Field (E-plane) Directivity [dBi]');
% 
% fprintf('\n=== FAR-FIELD / RADIATION PATTERN ===\n');
% fprintf('Max directivity (from E-plane cut) = %.2f dBi\n', maxDirectivity_dBi);
% fprintf('Typical dipole directivity in free space ~ 2.15 dBi.\n');
% disp('Check actual 3D data or both E-plane/H-plane for a more accurate estimate.');
% disp(' ');

disp('=== FAR-FIELD / RADIATION PATTERN (General Info) ===');
disp('1) The classic dipole pattern is doughnut-shaped with max gain broadside.');
disp('2) Typical directivity ~ 2.15 dBi for an ideal half-wave dipole in free space.');
disp('3) Pattern is approximately symmetric in the principal cuts.');
disp('4) Polarization for a simple dipole is linear.');
disp(' ');

%% --- 6. MESHING INFORMATION (CST) ---
disp('=== MESHING CONSIDERATIONS IN CST ===');
disp('In CST, you can use Adaptive Mesh Refinement or manual settings.');
disp('1) Observe S-parameter convergence vs. iteration to ensure enough cells per wavelength.');
disp('2) The fewest cells typically occur in large low-field regions;');
disp('   the densest mesh is near high-field regions such as feed gaps or edges.');
disp('3) Always check final mesh distribution plots in CST to ensure accuracy.');
disp(' ');
disp('Done.');
