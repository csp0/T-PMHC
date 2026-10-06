% =========================================================================
% PQ-GNSS-TESLA: Expected TTFAF Simulation under Degraded C/N0
% =========================================================================
% Description:
%   Evaluates the Frame Error Rate (FER) with Soft-Combining processing gain 
%   and calculates the Expected TTFAF.
%   * Focuses exclusively on the 0 ~ 30 dB-Hz Poor (Urban Canyon) region.
%   * Includes baseline text annotations and region shading.
% =========================================================================
clc; clear; close all;
fprintf('=== T-PMHC vs MT: Expected TTFAF Simulator ===\n\n');

% ================================================================
% [Part 1] Configuration & Payload Definition
% ================================================================
fprintf('[Part 1] Initializing System Parameters...\n');
num_trials = 3000;          
% Sweep from 0 to 30 dB-Hz (Sparse below 10, dense around 10~15 waterfall)
CN0_range  = [0:1:9, 10:0.25:15, 16:2:30];     
Rs         = 100;           % CNAV-2 Symbol Rate (sps)
epoch_dur  = 90;            % 1 Chimera Epoch = 90 seconds

% Load CNAV-2 LDPC Parity Check Matrices
load("L1CLDPCParityCheckMatrices.mat", "A1","B1","C1","E1","T1");
H2 = [logical(sparse(A1(:,1),A1(:,2),1,599,600)), logical(sparse(B1(:,1),B1(:,2),1,599,1)), logical(sparse(T1(:,1),T1(:,2),1,599,599)); ...
      logical(sparse(C1(:,1),C1(:,2),1,1,600)), true, logical(sparse(E1(:,1),E1(:,2),1,1,599))];
ldpc_enc = ldpcEncoderConfig(H2);
ldpc_dec = ldpcDecoderConfig(H2);

% ================================================================
% [Part 2] Baseband FER Simulation Loop (With Soft-Combining)
% ================================================================
fprintf('[Part 2] Simulating Subframe s2 FER over C/N0 Sweep...\n');
FER_M5 = zeros(length(CN0_range), 1); % Legacy (No Overriding)
FER_M4 = zeros(length(CN0_range), 1); % Overriding (MT and T-PMHC)

for i = 1:length(CN0_range)
    CN0 = CN0_range(i);
    EsN0_dB = CN0 - 10*log10(Rs);
    
    % Apply Soft-combining Processing Gain
    EsN0_linear_M5 = (10^(EsN0_dB/10)) * 5; % M=5 (Legacy)
    EsN0_linear_M4 = (10^(EsN0_dB/10)) * 4; % M=4 (Overriding)
    
    noise_var_M5 = 1 / (2 * EsN0_linear_M5);
    noise_var_M4 = 1 / (2 * EsN0_linear_M4);
    
    err_M5 = 0;
    err_M4 = 0;
    
    for trial = 1:num_trials
        msg_bits = randi([0 1], 600, 1); 
        encoded_bits = ldpcEncode(msg_bits, ldpc_enc);
        tx_symbols = 1 - 2 * double(encoded_bits);
        
        % 1. M=5 Environment (Legacy)
        rx_M5 = tx_symbols + sqrt(noise_var_M5) * randn(size(tx_symbols));
        llr_M5 = 2 * rx_M5 / noise_var_M5;
        dec_M5 = ldpcDecode(llr_M5, ldpc_dec, 30);
        if any(msg_bits ~= double(dec_M5)), err_M5 = err_M5 + 1; end
        
        % 2. M=4 Environment (Overriding)
        rx_M4 = tx_symbols + sqrt(noise_var_M4) * randn(size(tx_symbols));
        llr_M4 = 2 * rx_M4 / noise_var_M4;
        dec_M4 = ldpcDecode(llr_M4, ldpc_dec, 30);
        if any(msg_bits ~= double(dec_M4)), err_M4 = err_M4 + 1; end
    end
    
    FER_M5(i) = err_M5 / num_trials;
    FER_M4(i) = err_M4 / num_trials;
    fprintf('  > C/N0: %5.2f dB-Hz | FER (M=5): %.4f | FER (M=4): %.4f\n', CN0, FER_M5(i), FER_M4(i));
end

% ================================================================
% [Part 3] Probabilistic Expected TTFAF Calculation
% ================================================================
fprintf('\n[Part 3] Calculating Expected TTFAF mathematically...\n');
Ps_M5 = 1 - FER_M5;
Ps_M4 = 1 - FER_M4;

% 1. Legacy MT (No Overriding): M=5, Requires 50 Epochs (4,500s)
epochs_legacy = 50; 
Expected_TTFAF_Legacy = (epochs_legacy * epoch_dur) .* (1 ./ (Ps_M5.^epochs_legacy));

% 2. MT with Overriding: M=4, Requires 4 Epochs (360s)
Expected_TTFAF_MT = (4 * epoch_dur) .* (1 ./ (Ps_M4.^4));

% 3. Proposed T-PMHC with Overriding: M=4, Requires 2 Epochs (180s)
Expected_TTFAF_TPMHC = epoch_dur .* ((1 + Ps_M4) ./ (Ps_M4.^2));

% Handle P_s == 0 (Infinity) for clean plotting
Expected_TTFAF_Legacy(Ps_M5 == 0) = inf;
Expected_TTFAF_MT(Ps_M4 == 0)     = inf;
Expected_TTFAF_TPMHC(Ps_M4 == 0)  = inf;

% ================================================================
% [Part 4] Plotting the TTFAF Comparison Graph with Region Shading
% ================================================================
fprintf('[Part 4] Generating Expected TTFAF Graph...\n');
figure('Name', 'Expected TTFAF Comparison', 'Color', 'w', 'Position', [150, 150, 900, 550]);

y_min = 100; 
y_max = 1000000; 

% 1. Draw Background Region Patch FIRST (10 to 30 dB-Hz, Poor Region)
patch([10 30 30 10], [y_min y_min y_max y_max], [1 0.95 0.95], 'EdgeColor', 'none'); hold on; 

% 2. Plot Data Curves and assign HANDLES (p1, p2, p3) for the legend
p1 = semilogy(CN0_range, Expected_TTFAF_Legacy, '-k^', 'LineWidth', 2.5, 'MarkerSize', 5, 'MarkerFaceColor', 'k');
p2 = semilogy(CN0_range, Expected_TTFAF_MT, '-bs', 'LineWidth', 2.5, 'MarkerSize', 5, 'MarkerFaceColor', 'b');
p3 = semilogy(CN0_range, Expected_TTFAF_TPMHC, '-ro', 'LineWidth', 2.5, 'MarkerSize', 5, 'MarkerFaceColor', 'r');

% 3. Add 3 Ideal Baselines (Dashed lines)
yline(epochs_legacy * epoch_dur, '--k', 'LineWidth', 1.5);
yline(360, '--b', 'LineWidth', 1.5);
yline(180, '--r', 'LineWidth', 1.5);

% 4. Configure Axis Scales, Grid, and Labels

grid on;
set(gca, 'YScale', 'log', 'FontSize', 12, 'FontWeight', 'bold', 'Layer', 'top'); 
set(gca, 'YGrid', 'off', 'YMinorGrid', 'off'); 

xlim([10 30]);       
ylim([y_min y_max]); 
xlabel('Carrier-to-Noise Density Ratio, C/N_0 (dB-Hz)', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('Expected TTFAF (seconds)', 'FontSize', 14, 'FontWeight', 'bold');

% 5. Add Legend using the specific handles [p1, p2, p3] to ignore the patch color
legend([p1, p2, p3], 'Legacy MT without Overriding (50 Epochs)', 'MT with Overriding (4 Epochs)', 'Proposed T-PMHC (2 Epochs)', 'Location', 'NorthEast', 'FontSize', 11, 'FontWeight', 'normal');

% 6. Manual Text Placement

text(20, y_max, 'Poor (Urban Canyon)', 'Color', [0.7 0 0], 'FontSize', 15, 'FontWeight', 'bold', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'top');
text(29.5, (epochs_legacy * epoch_dur) * 1.15, 'Legacy MT Baseline (4500s)', 'Color', 'k', 'FontSize', 12, 'FontWeight', 'normal', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');
text(29.5, 360 * 1.15, 'MT with Overriding Baseline (360s)', 'Color', 'b', 'FontSize', 12, 'FontWeight', 'normal', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');
text(29.5, 180 * 1.15, 'T-PMHC Baseline (180s)', 'Color', 'r', 'FontSize', 12, 'FontWeight', 'normal', 'HorizontalAlignment', 'right', 'VerticalAlignment', 'bottom');

hold off;
fprintf('\n=== Simulation Complete ===\n');