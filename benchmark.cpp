#include <random>
#include <memory>

#include <benchmark/benchmark.h>

void compute_sqrt1(const double* x, int n, double* y) noexcept;

void compute_sqrt2(const double* x, int n, double* y) noexcept;

static void generate_random_numbers(double* x, int n) {
  std::mt19937 rng{0};
  std::uniform_real_distribution<double> dist{0, 100};
  for (int i=0; i<n; ++i) {
    x[i] = dist(rng);
  }
}

static void BM_Sqrt1(benchmark::State& state) {
  const int n = state.range(0);
  std::unique_ptr<double[]> xptr{new double[n]};
  generate_random_numbers(xptr.get(), n);
  for (auto _ : state) {
    std::unique_ptr<double[]> yptr{new double[n]};
    compute_sqrt1(xptr.get(), n, yptr.get());
    benchmark::DoNotOptimize(yptr);
  }
}

BENCHMARK(BM_Sqrt1)->Arg(1000000);

static void BM_Sqrt2(benchmark::State& state) {
  const int n = state.range(0);
  std::unique_ptr<double[]> xptr{new double[n]};
  generate_random_numbers(xptr.get(), n);
  for (auto _ : state) {
    std::unique_ptr<double[]> yptr{new double[n]};
    compute_sqrt2(xptr.get(), n, yptr.get());
    benchmark::DoNotOptimize(yptr);
  }
}

BENCHMARK(BM_Sqrt2)->Arg(1000000);

BENCHMARK_MAIN();
