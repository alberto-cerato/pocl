/* OpenCL built-in library: asinh.cl()

   Copyright (c) 2015 Michal Babej / Tampere University of Technology

   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the "Software"), to deal
   in the Software without restriction, including without limitation the rights
   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in
   all copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
   THE SOFTWARE.
*/



#include "hsail_templates.h"

#define ASINH(FTYPE)                                                      \
  FTYPE _CL_OVERLOADABLE asinh(FTYPE x)                                   \
  {                                                                       \
    FTYPE r = fabs(x);                                                    \
    r = log(r + sqrt(r*r + (FTYPE)1.0));                                  \
    r = copysign(r, x);                                                   \
    return r;                                                             \
  }

ASINH(float)

ASINH(double)

IMPLEMENT_VECWITHSCALARS(asinh, V_V, float, int)

IMPLEMENT_VECWITHSCALARS(asinh, V_V, double, long)
