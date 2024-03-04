#include <iostream>
#include <vector>
#include <matio.h>
#include "matplotlibcpp.h"

namespace plt = matplotlibcpp;

double prevX1 = 0, prevX2 = 0;
bool firstRun1 = true, firstRun2 = true;

double LPF(double x, double alpha, double& prevX, bool& firstRun) {
    if (firstRun) {
        prevX = x;
        firstRun = false;
    }
    double xlpf = alpha * prevX + (1 - alpha) * x;
    prevX = xlpf;
    return xlpf;
}

std::vector<double> LoadSonarData(const char* filename) {
    std::vector<double> sonarData;
    mat_t *matfp = Mat_Open(filename, MAT_ACC_RDONLY);
    if (!matfp) {
        std::cerr << "Error opening MAT file" << std::endl;
        return sonarData;
    }

    matvar_t *matvar = Mat_VarRead(matfp, "sonarAlt");
    if (!matvar) {
        std::cerr << "Error reading 'sonarAlt' variable from file" << std::endl;
    } else {
        if (matvar->class_type == MAT_C_DOUBLE && matvar->data != nullptr) {
            double *data = static_cast<double*>(matvar->data);
            for (int i = 0; i < matvar->dims[1]; ++i) {
                sonarData.push_back(data[i]);
            }
        }
        Mat_VarFree(matvar);
    }
    Mat_Close(matfp);
    return sonarData;
}

int main() {
    const char* filename = "../mat/SonarAlt.mat";
    std::vector<double> sonarData = LoadSonarData(filename);

    int Nsamples = 500;
    std::vector<double> Xsaved1(Nsamples), Xsaved2(Nsamples), Xmsaved(Nsamples), t(Nsamples);

    for (int k = 0; k < Nsamples; ++k) {
        double xm = sonarData[k];
        double x1 = LPF(xm, 0.4, prevX1, firstRun1);
        double x2 = LPF(xm, 0.9, prevX2, firstRun2);

        Xsaved1[k] = x1;
        Xsaved2[k] = x2;
        Xmsaved[k] = xm;
        t[k] = k * 0.02;  // Assuming 0.02 sec time step as in the Python code
    }

    plt::figure_size(800, 600);
    plt::named_plot("LPF(alpha = 0.4)", t, Xsaved1, "b-");
    plt::named_plot("LPF(alpha = 0.9)", t, Xsaved2, "g-");
    plt::named_plot("Measured", t, Xmsaved, "r.");
    plt::xlabel("Time [sec]");
    plt::ylabel("Altitude [m]");
    plt::legend();
    plt::save("../picture/03_low_pass_filter.png");
    plt::show();

    return 0;
}



//g++ 02.MovAvgFilter.cpp -I/usr/include/python3.8 -lpython3.8 -lmatio -o ../bin/02