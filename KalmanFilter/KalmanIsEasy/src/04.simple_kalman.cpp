#include <iostream>
#include <vector>
#include <random>
#include <tuple>
#include "matplotlibcpp.h"

namespace plt = matplotlibcpp;

std::random_device rd;
std::mt19937 gen(rd());
std::normal_distribution<> dis(14.4, 4);

double GetVolt() {
    return dis(gen);
}

std::tuple<double, double, double> SimpleKalman(double z) {
    static bool firstRun = true;
    static double A, Q, H, R;
    static double X, P;
    if (firstRun) {
        A = 1.0; Q = 0.0;
        H = 1.0; R = 4.0;
        X = 14.0; P = 6.0;
        firstRun = false;
    }

    double Xp = A * X;
    double Pp = A * P * A + Q;

    double K = (Pp * H) / (H * Pp * H + R);

    X = Xp + K * (z - H * Xp);
    P = Pp - K * H * Pp;

    return std::make_tuple(X, P, K);
}

int main() {
    std::vector<double> t(50), Z_saved(50), X_esti(50), P_esti(50), K_gain(50);
    for(int i = 0; i < t.size(); ++i) {
        t[i] = i * 0.2;
        double Z = GetVolt();
        auto [Xe, Pe, Kg] = SimpleKalman(Z);
        Z_saved[i] = Z;
        X_esti[i] = Xe;
        P_esti[i] = Pe;
        K_gain[i] = Kg;
    }

    plt::figure();
    plt::plot(t, Z_saved, "b*--");
    plt::plot(t, X_esti, "r-");
    plt::legend();
    plt::title("Measurements and Kalman Filter Estimation");
    plt::xlabel("Time [sec]");
    plt::ylabel("Volt [V]");
    plt::save("../picture/04(1)");
    plt::figure();
    plt::plot(t, P_esti, "k-");
    plt::title("Error Covariance");
    plt::xlabel("Time [sec]");
    plt::ylabel("Error Covariance Value");
    plt::save("../picture/04(2)");

    plt::figure();
    plt::plot(t, K_gain, "g-");
    plt::title("Kalman Gain");
    plt::xlabel("Time [sec]");
    plt::ylabel("Kalman Gain Value");
    plt::save("../picture/04(3)");

    plt::show();
    return 0;
}

//g++ -std=c++17 04.simple_kalman.cpp -I/usr/include/python3.8 -lpython3.8 -lmatio -o ../bin/04