#include <iostream>
#include <fstream>
#include <vector>
#include <eigen3/Eigen/Dense>
#include "matplotlibcpp.h"

namespace plt = matplotlibcpp;
class KalmanFilter {
private:
    double x;   // 추정된 상태
    double P;   // 추정된 상태의 공분산
    double Q;   // 프로세스 노이즈의 분산
    double R;   // 측정 노이즈의 분산

public:
    KalmanFilter(double initial_x, double initial_P, double process_noise, double measurement_noise) {
        x = initial_x;
        P = initial_P;
        Q = process_noise;
        R = measurement_noise;
    }

    // 예측 단계
    void predict() {
        x = x;
        P = P + Q;
    }

    // 업데이트 단계
    void update(double measurement) {
        double K = P / (P + R); // 칼만 이득 계산
        x = x + K * (measurement - x); // 상태 업데이트
        P = (1 - K) * P; // 공분산 업데이트
    }

    // 현재 추정된 상태 반환
    double getState() {
        return x;
    }

    // 현재 추정된 상태의 공분산 반환
    double getCovariance() {
        return P;
    }
};
int main() {
    // 파일에서 GPS 및 IMU 데이터 읽기
    std::ifstream gps_file("gps_data.txt");
    std::ifstream imu_file("imu_data.txt");

    std::vector<double> gps_data_time;
    std::vector<double> gps_data;
    std::vector<double> imu_data_time;
    std::vector<double> imu_data;

    double time, gps_value, imu_value;
    while (gps_file >> time >> gps_value && imu_file >> time >> imu_value) {
        gps_data_time.push_back(time);
        gps_data.push_back(gps_value);
        imu_data_time.push_back(time);
        imu_data.push_back(imu_value);
    }

    // 칼만 필터 객체 생성
    double initial_x = 0; // 초기 상태 추정값
    double initial_P = 1; // 초기 상태 공분산
    double process_noise = 0.1; // 프로세스 노이즈의 분산
    double measurement_noise = 0.1; // 측정 노이즈의 분산
    KalmanFilter kf(initial_x, initial_P, process_noise, measurement_noise);

    // 칼만 필터를 사용하여 GPS 및 IMU 데이터 퓨전
    std::vector<double> fused_data;
    for (size_t i = 0; i < gps_data.size(); ++i) {
        kf.predict();
        kf.update(gps_data[i]); // GPS 데이터로 업데이트
        kf.update(imu_data[i]); // IMU 데이터로 업데이트

        // 현재 추정된 상태를 저장
        fused_data.push_back(kf.getState());
    }

    // 결과 플로팅
    plt::plot(gps_data_time, gps_data, "r-", imu_data_time, imu_data, "b-", gps_data_time, fused_data, "g-");
    // plt::plot(gps_data_time, gps_dat);
    plt::xlabel("Time");
    plt::ylabel("Value");
    // plt::legend({"GPS", "IMU", "Fused"});
    plt::show();

    return 0;
}
