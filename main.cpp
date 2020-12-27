#include <iostream>
#include <cerrno>

void compute_sqrt1(const double* x, int n, double* y) noexcept;

void compute_sqrt2(const double* x, int n, double* y) noexcept;

int main() {
  const  int n = 5;
  double x[n] = {1, 2, 3, 4, -1};
  double y[n];

  // sqrt1
  errno = 0;
  compute_sqrt1(x, n, y);
  std::cout << "sqrt1\n";
  for (int i=0; i<n; ++i) {
    std::cout << x[i] << "\t" << y[i] << "\n";
  }
  std::cout << "errno = " << errno << std::endl;

  // sqrt2
  errno = 0;
  compute_sqrt2(x, n, y);
  std::cout << "sqrt2\n";
  for (int i=0; i<n; ++i) {
    std::cout << x[i] << "\t" << y[i] << "\n";
  }
  std::cout << "errno = " << errno << std::endl;
  return 0;
}
