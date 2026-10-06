/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: log2.c
 *
 * MATLAB Coder version            : 26.1
 * C/C++ source code generated on  : 2026-07-11 14:26:59
 */

/* Include Files */
#include "log2.h"
#include "rt_nonfinite.h"
#include "rt_nonfinite.h"
#include <math.h>

/* Function Definitions */
/*
 * Arguments    : double x
 * Return Type  : double
 */
double b_log2(double x)
{
  double f;
  int eint;
  if (x == 0.0) {
    f = rtMinusInf;
  } else if (x < 0.0) {
    f = rtNaN;
  } else if (!rtIsInf(x) && !rtIsNaN(x)) {
    f = frexp(x, &eint);
    if (f == 0.5) {
      f = (double)eint - 1.0;
    } else if ((eint == 1) && (f < 0.75)) {
      f = log(2.0 * f) / 0.6931471805599453;
    } else {
      f = log(f) / 0.6931471805599453 + (double)eint;
    }
  } else {
    f = x;
  }
  return f;
}

/*
 * File trailer for log2.c
 *
 * [EOF]
 */
