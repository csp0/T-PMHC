/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: main.c
 *
 * MATLAB Coder version            : 26.1
 * C/C++ source code generated on  : 2026-07-11 14:26:59
 */

/*************************************************************************/
/* This automatically generated example C main file shows how to call    */
/* entry-point functions that MATLAB Coder generated. You must customize */
/* this file for your application. Do not modify this file directly.     */
/* Instead, make a copy of this file, modify it, and integrate it into   */
/* your development environment.                                         */
/*                                                                       */
/* This file initializes entry-point function arguments to a default     */
/* size and value before calling the entry-point functions. It does      */
/* not store or use any values returned from the entry-point functions.  */
/* If necessary, it does pre-allocate memory for returned values.        */
/* You can use this file as a starting point for a main function that    */
/* you can deploy in your application.                                   */
/*                                                                       */
/* After you copy the file, and before you deploy it, you must make the  */
/* following changes:                                                    */
/* * For variable-size function arguments, change the example sizes to   */
/* the sizes that your application requires.                             */
/* * Change the example values of function arguments to the values that  */
/* your application requires.                                            */
/* * If the entry-point functions return values, store these values or   */
/* otherwise use them as required by your application.                   */
/*                                                                       */
/*************************************************************************/

/* Include Files */
#include "main.h"
#include "crypto_workload_target.h"
#include "crypto_workload_target_initialize.h"
#include "crypto_workload_target_terminate.h"
#include "rt_nonfinite.h"

/* Function Declarations */
static double argInit_real_T(void);

/* Function Definitions */
/*
 * Arguments    : void
 * Return Type  : double
 */
static double argInit_real_T(void)
{
  return 0.0;
}

/*
 * Arguments    : int argc
 *                char **argv
 * Return Type  : int
 */
int main(int argc, char **argv)
{
  (void)argc;
  (void)argv;
  /* Initialize the application.
You do not need to do this more than one time. */
  crypto_workload_target_initialize();
  /* Invoke the entry-point functions.
You can call entry-point functions multiple times. */
  main_crypto_workload_target();
  /* Terminate the application.
You do not need to do this more than one time. */
  crypto_workload_target_terminate();
  return 0;
}

/*
 * Arguments    : void
 * Return Type  : void
 */
void main_crypto_workload_target(void)
{
  double t_hash;
  double t_mt;
  double t_poly;
  /* Initialize function 'crypto_workload_target' input arguments. */
  /* Call the entry-point 'crypto_workload_target'. */
  crypto_workload_target(argInit_real_T(), &t_mt, &t_poly, &t_hash);
}

/*
 * File trailer for main.c
 *
 * [EOF]
 */
