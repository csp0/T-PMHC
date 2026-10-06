/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: crypto_workload_target.c
 *
 * MATLAB Coder version            : 26.1
 * C/C++ source code generated on  : 2026-07-11 14:26:59
 */

/* Include Files */
#include "crypto_workload_target.h"
#include "log2.h"
#include "rt_nonfinite.h"
#include "rt_nonfinite.h"
#include <math.h>

/* Function Declarations */
static double rt_powd_snf(double u0, double u1);

/* Function Definitions */
/*
 * Arguments    : double u0
 *                double u1
 * Return Type  : double
 */
static double rt_powd_snf(double u0, double u1)
{
  double y;
  if (rtIsNaN(u0) || rtIsNaN(u1)) {
    y = rtNaN;
  } else {
    double d;
    y = fabs(u0);
    d = fabs(u1);
    if (rtIsInf(u1)) {
      if (y == 1.0) {
        y = 1.0;
      } else if (y > 1.0) {
        if (u1 > 0.0) {
          y = rtInf;
        } else {
          y = 0.0;
        }
      } else if (u1 > 0.0) {
        y = 0.0;
      } else {
        y = rtInf;
      }
    } else if (d == 0.0) {
      y = 1.0;
    } else if (d == 1.0) {
      if (u1 > 0.0) {
        y = u0;
      } else {
        y = 1.0 / u0;
      }
    } else if (u1 == 2.0) {
      y = u0 * u0;
    } else if ((u1 == 0.5) && (u0 >= 0.0)) {
      y = sqrt(u0);
    } else if ((u0 < 0.0) && (u1 > floor(u1))) {
      y = rtNaN;
    } else {
      y = pow(u0, u1);
    }
  }
  return y;
}

/*
 * [ARM Cortex-M 타겟용] 특정 공개키 개수 N에 대한 T-PMHC 연산 시간 측정 알맹이
 * 함수 ※ 주의: 이 함수 내부에는 for 루프(8~64 전체 테스트)나 plot 명령어가
 * 없어야 합니다.
 *
 * Arguments    : double N
 *                double *t_mt
 *                double *t_poly
 *                double *t_hash
 * Return Type  : void
 */
void crypto_workload_target(double N, double *t_mt, double *t_poly,
                            double *t_hash)
{
  /*  1. Merkle Tree (MT) 연산 시간 (단위: ms) - 기존 수학적 검증 모델 */
  /*  (실제 연산 루틴이 있다면 여기에 위치, 현재는 논문 모델링 식 적용) */
  *t_mt = 0.003 * N * b_log2(N);
  /*  2. T-PMHC 다항식 곱셈(GF(2^8)) 연산 시간 (단위: ms) */
  *t_poly = 0.001 * rt_powd_snf(N, 1.2);
  /*  3. T-PMHC SHA-256 해시 연산 시간 (단위: ms) */
  *t_hash = 0.0005 * N;
}

/*
 * File trailer for crypto_workload_target.c
 *
 * [EOF]
 */
