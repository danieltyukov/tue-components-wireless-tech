%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MATLAB Code for Analyzing a Quarter-Wave Stub
% (with an .s2p file exported from the NanoVNA)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- 1) Load S-parameter Data ---
% (Requires RF Toolbox in MATLAB)
filename = 'quarter_wave_stub.s2p';
sparamObj = sparameters(filename);

% Retrieve the frequency axis (in Hz):
freq = sparamObj.Frequencies;  % vector of frequencies
% Convert frequency to GHz for easier plotting/interpretation:
freqGHz = freq/1e9;

% S-parameters are in a 2x2xN matrix: sparamObj.Parameters(port_i, port_j, frequency_index).
% For a stub you mainly need S11, but we can also analyze S21 if measured.
S11 = squeeze(sparamObj.Parameters(1,1,:));  % S11 vs. frequency
S21 = squeeze(sparamObj.Parameters(2,1,:));  % S21 vs. frequency (if relevant)

% Characteristic system impedance (often 50 ohms)
Z0 = 50;

% --- 2) Compute Magnitude, Phase, and Impedance ---
% Reflection coefficient magnitude in dB:
S11_dB    = 20*log10(abs(S11));
% Reflection coefficient phase in degrees:
S11_phase = rad2deg(angle(S11));

% Transmission coefficient magnitude (if needed for quarter-wave stub analysis):
S21_dB    = 20*log10(abs(S21));
S21_phase = rad2deg(angle(S21));

% Input impedance seen at the port, derived from S11:
%   Z_in = Z0 * (1 + S11) / (1 - S11)
Z_in = Z0 * (1 + S11) ./ (1 - S11);

% --- 3) Plot S11 in dB over Frequency ---
figure('Name','S11 (dB) vs Frequency');
plot(freqGHz, S11_dB, 'LineWidth',1.5);
grid on; xlabel('Frequency (GHz)'); ylabel('S11 (dB)');
title('Quarter-Wave Stub: Reflection Coefficient (dB)');

% --- 4) Plot Phase of S11 ---
figure('Name','S11 Phase vs Frequency');
plot(freqGHz, S11_phase, 'LineWidth',1.5);
grid on; xlabel('Frequency (GHz)'); ylabel('Phase (degrees)');
title('Quarter-Wave Stub: S11 Phase');

% --- 5) Plot Input Impedance (Real and Imag) ---
figure('Name','Input Impedance vs Frequency');
plot(freqGHz, real(Z_in), 'LineWidth',1.5); hold on;
plot(freqGHz, imag(Z_in), 'LineWidth',1.5);
grid on; xlabel('Frequency (GHz)'); 
ylabel('Z_{in} (\Omega)');
title('Quarter-Wave Stub: Input Impedance');
legend('Real(Z_{in})','Imag(Z_{in})','Location','best');

% --- 6) Plot S21 (if desired) ---
figure('Name','S21 (dB) vs Frequency');
plot(freqGHz, S21_dB, 'LineWidth',1.5);
grid on; xlabel('Frequency (GHz)'); ylabel('S21 (dB)');
title('Quarter-Wave Stub: Transmission (dB)');

% --- 7) Print data at 1 GHz or any specific frequency of interest ---
targetFreq = 1e9;  % 1 GHz
[~, idx] = min(abs(freq - targetFreq));  % find closest frequency index

fprintf('\n=== Quarter-Wave Stub Data at %.3f GHz ===\n', freq(idx)/1e9);
fprintf('S11 Magnitude (linear) : %.4f\n', abs(S11(idx)));
fprintf('S11 Magnitude (dB)     : %.2f dB\n', 20*log10(abs(S11(idx))));
fprintf('S11 Phase (degrees)    : %.2f deg\n', rad2deg(angle(S11(idx))));
fprintf('Input Impedance (Z_in) : %.2f + j%.2f Ohms\n',...
         real(Z_in(idx)), imag(Z_in(idx)));
fprintf('S21 Magnitude (dB)     : %.2f dB\n', S21_dB(idx));
fprintf('S21 Phase (degrees)    : %.2f deg\n\n', S21_phase(idx));

% If you want a Smith Chart, you can also do:
figure('Name','Smith Chart of S11');
smith(sparamObj,1,1);  % Plot the S11 reflection data on a Smith chart
title('Quarter-Wave Stub: Smith Chart (S11)');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
