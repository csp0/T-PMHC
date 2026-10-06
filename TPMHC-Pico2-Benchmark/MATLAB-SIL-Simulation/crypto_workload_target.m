function [t_mt, t_poly, t_hash] = crypto_workload_target(N)
%#codegen
% =========================================================================
% Target Workload Function for MATLAB Coder
% Benchmarking Computational Overhead: Conventional MT vs. Proposed T-PMHC
% Target: 32-bit Embedded Processor (ARM Cortex-M33 / Raspberry Pi Pico 2)
% =========================================================================

% Pre-allocate output variables as 32-bit unsigned integers to prevent 
% type elimination during C/C++ compiler optimization (-O3).
t_mt   = uint32(0);
t_poly = uint32(0);
t_hash = uint32(0);

% -------------------------------------------------------------------------
% 1. Conventional MT (Merkle Tree) Workload
% -------------------------------------------------------------------------
% The MT architecture requires hashing operations for N Intermediate Tree Nodes (ITNs).
% This loop simulates the computational workload of the 64-round compression 
% function typical of a 256-bit cryptographic hash algorithm (e.g., SHA-256).
state_mt = uint32(12345);
for i = 1:N
    for j = 1:64 
        % Benchmark hashing workload via 32-bit bitwise operations (XOR, Shift) and additions.
        state_mt = bitxor(bitshift(state_mt, 1), uint32(i)) + uint32(j);
    end
end
t_mt = state_mt;

% -------------------------------------------------------------------------
% 2. Proposed T-PMHC Polynomial Workload
% -------------------------------------------------------------------------
% The T-PMHC evaluates an N-degree polynomial using Horner's Method.
% To simulate the workload of large integer multiplication/addition over a 
% 256-bit Galois Field (GF), it processes 8 consecutive 32-bit words (8 * 32 = 256 bits).
state_poly = uint32(54321);
for i = 1:N
    for k = 1:8
        % Benchmark Multiply-Accumulate (MAC) workload for large integer arithmetic.
        state_poly = (state_poly * uint32(31)) + uint32(i*k);
    end
end
t_poly = state_poly;

% -------------------------------------------------------------------------
% 3. Proposed T-PMHC Hash Workload
% -------------------------------------------------------------------------
% Regardless of the polynomial degree (N), the T-PMHC requires only a fixed 
% number of hash operations (e.g., 2 times) for mask recovery and TESLA key verification.
state_hash = uint32(99999);
for i = 1:2
    for j = 1:64
        % Simulates the fixed 64-round hash compression function.
        state_hash = bitxor(bitshift(state_hash, 1), uint32(i)) + uint32(j);
    end
end
t_hash = state_hash;

end


%[appendix]{"version":"1.0"}
%---
