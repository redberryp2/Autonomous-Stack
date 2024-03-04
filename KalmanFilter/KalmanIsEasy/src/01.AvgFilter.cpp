#include <iostream>
#include <vector>
#include <random>
#include <chrono>
#include <cmath>
#include "matplotlibcpp.h"

namespace plt = matplotlibcpp;

double prevAvg = 0;
int k = 1;

double AvgFilter(double x) {
    double alpha = static_cast<double>(k - 1) / k;
    double avg = alpha * prevAvg + (1 - alpha) * x;
    prevAvg = avg;
    k++;
    return avg;
}

double GetVolt() {
    static std::default_random_engine generator(std::chrono::system_clock::now().time_since_epoch().count());
    std::normal_distribution<double> distribution(14.4, 4.0);
    return distribution(generator);
}

int main() {
    std::vector<double> t;
    for (double i = 0; i < 10; i += 0.2) {
        t.push_back(i);
    }
    int Nsamples = t.size();

    std::vector<double> Avgsaved(Nsamples), Xmsaved(Nsamples);

    for (int i = 0; i < Nsamples; ++i) {
        double xm = GetVolt();
        double avg = AvgFilter(xm);

        Avgsaved[i] = avg;
        Xmsaved[i] = xm;
    }

    // 그래프 그리기
    plt::figure_size(800, 600); // 그래프 창 크기 설정
    plt::named_plot("Measured", t, Xmsaved, "b*--");
    plt::named_plot("Average", t, Avgsaved, "ro-");
    plt::xlabel("Time [sec]");
    plt::ylabel("Volt [V]");
    plt::legend();
    plt::save("../picture/01_average_filter.png"); // 그래프 저장
    plt::show(); // 그래프 보여주기

    return 0;
}

//g++ 01.AvgFilter.cpp -I/usr/include/python3.8 -lpython3.8 -lmatio -o ../bin/01