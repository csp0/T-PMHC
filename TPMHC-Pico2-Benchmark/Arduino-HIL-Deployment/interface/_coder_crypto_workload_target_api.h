/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_crypto_workload_target_api.h
 *
 * MATLAB Coder version            : 26.1
 * C/C++ source code generated on  : 2026-07-11 14:26:59
 */

#ifndef _CODER_CRYPTO_WORKLOAD_TARGET_API_H
#define _CODER_CRYPTO_WORKLOAD_TARGET_API_H

/* Include Files */
#include "emlrt.h"
#include "mex.h"
#include "tmwtypes.h"
#include <string.h>

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
void crypto_workload_target(real_T N, real_T *t_mt, real_T *t_poly,
                            real_T *t_hash);

void crypto_workload_target_api(const mxArray *const prhs[1], int32_T nlhs,
                                const mxArray *plhs[3]);

void crypto_workload_target_atexit(void);

void crypto_workload_target_initialize(void);

void crypto_workload_target_terminate(void);

void crypto_workload_target_xil_shutdown(void);

void crypto_workload_target_xil_terminate(void);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for _coder_crypto_workload_target_api.h
 *
 * [EOF]
 */
