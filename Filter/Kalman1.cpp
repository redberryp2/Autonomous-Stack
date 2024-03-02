#include <iostream>

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
    // 초기값 설정
    double initial_x = 0;
    double initial_P = 1;
    double process_noise = 0.1;
    double measurement_noise = 0.1;

    // 칼만 필터 객체 생성
    KalmanFilter kf(initial_x, initial_P, process_noise, measurement_noise);

    // 측정치
    double measurements[] = {1, 2, 3, 4, 5};

    // 예측 및 업데이트 수행
    for (double measurement : measurements) {
        kf.predict();
        kf.update(measurement);

        std::cout << "Estimated state: " << kf.getState() << ", Estimated covariance: " << kf.getCovariance() << std::endl;
    }

    return 0;
}