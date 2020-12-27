CFLAGS=-std=c++11 -O3 -march=native 

CXX=g++

all: a.out benchmark sqrt1.s sqrt2.s

a.out: main.cpp sqrt1.o sqrt2.o
	$(CXX) $(CFLAGS) main.cpp sqrt1.o sqrt2.o

benchmark: benchmark.cpp sqrt1.o sqrt2.o
	$(CXX) $(CFLAGS) -o benchmark benchmark.cpp sqrt1.o sqrt2.o -lbenchmark -pthread

sqrt1.o: sqrt1.cpp
	$(CXX) -c $(CFLAGS) sqrt1.cpp

sqrt1.s: sqrt1.cpp
	$(CXX) -c -S $(CFLAGS) sqrt1.cpp

sqrt2.o: sqrt2.cpp
	$(CXX) -c $(CFLAGS) -fno-math-errno sqrt2.cpp

sqrt2.s: sqrt2.cpp
	$(CXX) -c -S $(CFLAGS) -fno-math-errno sqrt2.cpp

clean:
	rm benchmark a.out sqrt1.o sqrt2.o sqrt1.s sqrt2.s
