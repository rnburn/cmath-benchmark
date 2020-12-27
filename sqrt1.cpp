#include <cmath>

void compute_sqrt1(const double* x, int n, double* y) noexcept {
  for (int  i=0; i<n; ++i) {
    y[i] = std::sqrt(x[i]);
  }
}
