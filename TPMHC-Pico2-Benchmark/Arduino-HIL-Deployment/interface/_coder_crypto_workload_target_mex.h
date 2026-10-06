/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_crypto_workload_target_mex.h
 *
 * MATLAB Coder version            : 26.1
 * C/C++ source code generated on  : 2026-07-11 14:26:59
 */

#ifndef _CODER_CRYPTO_WORKLOAD_TARGET_MEX_H
#define _CODER_CRYPTO_WORKLOAD_TARGET_MEX_H

/* Include Files */
#include "emlrt.h"
#include "mex.h"
#include "tmwtypes.h"

#ifdef __cplusplus
extern "C" {
#endif

/* Function Declarations */
MEXFUNCTION_LINKAGE void mexFunction(int32_T nlhs, mxArray *plhs[],
                                     int32_T nrhs, const mxArray *prhs[]);

emlrtCTX mexFunctionCreateRootTLS(void);

void unsafe_crypto_workload_target_mexFunction(int32_T nlhs, mxArray *plhs[3],
                                               int32_T nrhs,
                                               const mxArray *prhs[1]);

#ifdef __cplusplus
}
#endif

#endif
/*
 * File trailer for _coder_crypto_workload_target_mex.h
 *
 * [EOF]
 */
