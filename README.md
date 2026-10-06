# T-PMHC: Time-bound Polynomial-masked Hash Chain for GNSS Authentication

This repository contains the simulation models and Hardware-in-the-Loop (HIL) benchmarking codes 
for the performance evaluation of the proposed **T-PMHC (Time-bound Polynomial-masked Hash Chain)** 
architecture, compared against the conventional Merkle Tree (MT) approach for GNSS authentication (e.g., GPS Chimera).

The evaluation encompasses both communication efficiency (Expected TTFAF under degraded channels) 
and receiver-side resource constraints (computational overhead on a 32-bit embedded processor).

## 📂 Repository Structure

The repository consists of MATLAB-based baseband simulations and auto-generated C/C++ codes 
for hardware benchmarking:

* **`TPMHC-Pico2-Benchmark/`**: Contains the core algorithmic workloads (Polynomial evaluation
  via Horner's method and hashing) and the Arduino deployment files for HIL testing on the
  Raspberry Pi Pico 2 (ARM Cortex-M33).
* **`Figure_8.m` & `Figure_9.m`**: MATLAB scripts to reproduce the Frame Error Rate (FER) waterfall
  curve and the Expected Time-To-First-Authenticated-Fix (TTFAF) comparisons under "Poor (Urban Canyon)"
  to "Excellent" signal environments.
* **`L1CLDPCParityCheckMatrices.mat`**: CNAV-2 LDPC Parity Check Matrices required for the baseband FER simulations.
* **`TPMHC_Main.m` & `TPMHC_Main_Output.pdf`**: The main execution script and its compiled output report
  demonstrating the system-level protocol operations.
* **`gpsNAVDataEncode.m` / `gpsNavigationConfig.m` / `hexToBits.mlx`**: Utility scripts and configurations
  for GPS navigation data formatting and encoding.

## 🚀 Prerequisites

To reproduce the results, the following environments are required:
* **Software**: MATLAB (with Communications Toolbox and MATLAB Coder) & Arduino IDE.
* **Hardware**: Raspberry Pi Pico 2 (or any equivalent ARM Cortex-M Series microcontroller) for HIL benchmarking.

## 🛠️ How to Run

### 1. Baseband & TTFAF Simulation (MATLAB)
1. Open MATLAB and navigate to this repository's root directory.
2. Run `Figure_8.m` to simulate the LDPC soft-combining performance and obtain the FER results.
3. Run `Figure_9.m` to generate the probabilistic Expected TTFAF graph across varying $C/N_0$ conditions.

### 2. Computational Overhead Benchmarking (SIL / HIL)
* **Software-in-the-Loop (SIL)**: Navigate to the `TPMHC-Pico2-Benchmark/1_MATLAB_SIL_Simulation` directory and execute the master `.mlx` script to generate C codes and run the profiling report natively on the host PC.
* **Hardware-in-the-Loop (HIL)**: Open the `.ino` file located in `TPMHC-Pico2-Benchmark/2_Arduino_HIL_Deployment` using the Arduino IDE. Select the *Raspberry Pi Pico 2* board, compile, and upload to measure the exact CPU clock cycles and memory footprint.
