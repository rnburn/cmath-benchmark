# cmath-benchmark

Benchmark for `std::sqrt`.

### Builld
```
./ci/run_docker.sh
make
```

### Test
```
./a.out
```
outputs:
```
sqrt1
1	1
2	1.41421
3	1.73205
4	2
-1	-nan
errno = 33
sqrt2
1	1
2	1.41421
3	1.73205
4	2
-1	-nan
errno = 0
```

### Benchmark
```
./benchmark
```
outputs:
```
Running ./benchmark
Run on (6 X 2600 MHz CPU s)
CPU Caches:
  L1 Data 32 KiB (x6)
  L1 Instruction 32 KiB (x6)
  L2 Unified 256 KiB (x6)
  L3 Unified 9216 KiB (x6)
Load Average: 0.17, 0.07, 0.05
-----------------------------------------------------------
Benchmark                 Time             CPU   Iterations
-----------------------------------------------------------
BM_Sqrt1/1000000    4984457 ns      4946631 ns          115
BM_Sqrt2/1000000    1195070 ns      1192078 ns          553
```
