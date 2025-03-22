function dipole_analysis_lab3
    % DIPLOE_ANALYSIS_LAB3
    % Analyzes two single-port S11 measurements for a dipole:
    %   (1) Free-space (lab3_dipole_port1_free.s1p)
    %   (2) With a hand nearby (lab3_dipole_port1_hand.s1p)
    %
    % Requires MATLAB RF Toolbox for sparameters(), smithplot(), etc.

    clc; clear; close all;

    % ---------------------------
    % 1) Filenames
    % ---------------------------
    filename_free = 'lab3_dipole_port1_free.s1p';
    filename_hand = 'lab3_dipole_port1_hand.s1p';

    % ---------------------------
    % 2) Load S-Parameter Data
    % ---------------------------
    sparamObj_free = sparameters(filename_free);
    sparamObj_hand = sparameters(filename_hand);

    % Extract frequency in Hz
    freq_free = sparamObj_free.Frequencies;
    freq_hand = sparamObj_hand.Frequencies;

    % Convert to GHz for plotting
    freqGHz_free = freq_free / 1e9;
    freqGHz_hand = freq_hand / 1e9;

    % Single-port S11
    S11_free = squeeze(sparamObj_free.Parameters(1,1,:));
    S11_hand = squeeze(sparamObj_hand.Parameters(1,1,:));

    % Characteristic impedance
    Z0 = 50;

    % ---------------------------
    % 3) Compute Key Parameters
    % ---------------------------
    % FREE condition
    S11_free_mag   = abs(S11_free);         % |S11|
    S11_free_dB    = 20*log10(S11_free_mag);
    S11_free_phase = rad2deg(angle(S11_free));
    Z_in_free      = Z0 * (1 + S11_free) ./ (1 - S11_free);
    % Fraction of power delivered = 1 - |S11|^2
    PowerFrac_free = 1 - (S11_free_mag).^2;

    % HAND condition
    S11_hand_mag   = abs(S11_hand);
    S11_hand_dB    = 20*log10(S11_hand_mag);
    S11_hand_phase = rad2deg(angle(S11_hand));
    Z_in_hand      = Z0 * (1 + S11_hand) ./ (1 - S11_hand);
    PowerFrac_hand = 1 - (S11_hand_mag).^2;

    % ---------------------------
    % 4) Plot S11 (dB) vs Frequency
    % ---------------------------
    figure('Name','S11(dB) Comparison');
    p1 = plot(freqGHz_free, S11_free_dB, 'LineWidth',1.5); 
    hold on;
    p2 = plot(freqGHz_hand, S11_hand_dB, 'LineWidth',1.5);
    grid on;
    xlabel('Frequency (GHz)');
    ylabel('S_{11} (dB)');
    title('Dipole S11: Free vs Hand');
    legend([p1,p2], {'Free','Hand'}, 'Location','best');

    % ---------------------------
    % 5) Smith Chart Comparison
    % ---------------------------
    figure('Name','Smith Chart Comparison');
    smithplot(freq_free, S11_free, 'LineWidth',1.5);
    hold on;
    smithplot(freq_hand, S11_hand, 'LineWidth',1.5);
    legend('Free','Hand','Location','best');
    title('Dipole S11 Smith Chart: Free vs Hand');

    % ---------------------------
    % 6) Print Data at 1 GHz
    % ---------------------------
    targetFreq = 1e9;  % 1 GHz

    % Find the closest index to 1 GHz for each measurement
    [~, idx_free] = min(abs(freq_free - targetFreq));
    [~, idx_hand] = min(abs(freq_hand - targetFreq));

    fprintf('\n=== Dipole S11 at ~%.3f GHz ===\n', targetFreq/1e9);

    % --- FREE data printout
    fprintf('--- FREE CASE ---\n');
    fprintf('Frequency: %.3f GHz\n', freq_free(idx_free)/1e9);
    fprintf('S11 (dB):          %.2f dB\n', S11_free_dB(idx_free));
    fprintf('S11 (phase):       %.2f deg\n', S11_free_phase(idx_free));
    fprintf('Input Z:           %.2f + j%.2f Ohms\n', ...
            real(Z_in_free(idx_free)), imag(Z_in_free(idx_free)));
    fprintf('Power Delivered:   %.2f%%\n', ...
            100 * PowerFrac_free(idx_free));

    % --- HAND data printout
    fprintf('\n--- HAND CASE ---\n');
    fprintf('Frequency: %.3f GHz\n', freq_hand(idx_hand)/1e9);
    fprintf('S11 (dB):          %.2f dB\n', S11_hand_dB(idx_hand));
    fprintf('S11 (phase):       %.2f deg\n', S11_hand_phase(idx_hand));
    fprintf('Input Z:           %.2f + j%.2f Ohms\n', ...
            real(Z_in_hand(idx_hand)), imag(Z_in_hand(idx_hand)));
    fprintf('Power Delivered:   %.2f%%\n', ...
            100 * PowerFrac_hand(idx_hand));
    fprintf('\n');
end
