#include <iostream>
#include <vector>
#include <random>
#include "matplotlibcpp.h"
#include <eigen3/Eigen/Dense>

namespace plt = matplotlibcpp;

std::default_random_engine generator;
std::normal_distribution<double> distribution(0.0,10.0);

Eigen::Vector2d GetPos(double& Posp, double& Velp) {
    double dt = 0.1;
    double w = distribution(generator);
    double v = distribution(generator);

    double z = Posp + Velp * dt + v; // Position measurement

    Posp = z - v;
    Velp = 80 + w;

    return Eigen::Vector2d(z, Posp);
}

Eigen::Vector2d DvKalman(Eigen::Vector2d& X, Eigen::Matrix2d& P, const double z) {
    static bool firstRun = true;
    static Eigen::Matrix2d A, Q;
    static Eigen::RowVector2d H;
    static Eigen::RowVector1d R;

    if (firstRun) {
        double dt = 0.1;
        A << 1, dt, 0, 1;
        H << 1, 0;
        Q << 1, 0, 0, 3;
        R << 10;

        X << 0, 20;
        P = 5 * Eigen::Matrix2d::Identity();
        firstRun = false;
    }

    Eigen::Vector2d Xp = A * X; // State Variable Prediction
    Eigen::Matrix2d Pp = A * P * A.transpose() + Q; // Error Covariance Prediction

    Eigen::Matrix2d K = Pp * H.transpose() * (H * Pp * H.transpose() + R).inverse(); // Kalman Gain

    X = Xp + K * (z - H * Xp); // Update State Variable Estimation
    P = Pp - K * H * Pp; // Update Error Covariance Estimation

    return X;
}

int main() {
    double Posp = 0, Velp = 80;
    Eigen::Vector2d X;
    Eigen::Matrix2d P;

    std::vector<double> t(100), vel(100);
    for (int i = 0; i < 100; ++i) {
        t[i] = i * 0.1;
        Eigen::Vector2d posVel = GetPos(Posp, Velp);
        double z = posVel[0];
        Eigen::Vector2d result = DvKalman(X, P, z);
        vel[i] = result[1];
    }

    plt::plot(t, vel);
    plt::show();

    return 0;
}
