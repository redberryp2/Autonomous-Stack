#include <iostream>
#include <vector>
#include <numeric>
#include <matio.h>
#include "matplotlibcpp.h"

namespace plt = matplotlibcpp;

std::vector<double> xbuf;
int n = 0;
bool firstRun = true;

double MovAvgFilter_batch(double x) {
    if (firstRun) {
        n = 10;
        xbuf = std::vector<double>(n, x);
        firstRun = false;
    } else {
        for (int i = 0; i < n - 1; ++i) {
            xbuf[i] = xbuf[i + 1];
        }
        xbuf[n - 1] = x;
    }
    double avg = std::accumulate(xbuf.begin(), xbuf.end(), 0.0) / n;
    return avg;
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

    int Nsamples = sonarData.size();
    std::vector<double> Xsaved(Nsamples), Xmsaved(Nsamples), t(Nsamples);

    for (int k = 0; k < Nsamples; ++k) {
        double xm = sonarData[k];
        double x = MovAvgFilter_batch(xm);

        Xsaved[k] = x;
        Xmsaved[k] = xm;
        t[k] = k * 0.02;  // Assuming 0.02 sec time step as in the Python code
    }

    plt::figure_size(800, 600);
    plt::named_plot("Moving average", t, Xsaved, "b-");
    plt::named_plot("Measured", t, Xmsaved, "r.");
    plt::xlabel("Time [sec]");
    plt::ylabel("Altitude [m]");
    plt::legend();
    plt::save("../picture/02_moving_average_filter.png");
    plt::show();

    return 0;
}

//g++ 02.MovAvgFilter.cpp -I/usr/include/python3.8 -lpython3.8 -lmatio -o ../bin/02