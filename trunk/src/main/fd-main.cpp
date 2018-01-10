/*
MIT License

Copyright (c) 2018 ME_Kun_Han

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

#include <vector>
#include "fd-common.hpp"
#include "opencv2/core.hpp"

static void help() {
    std::cout
    << "\n------------------------------------------------------------------\n"
    << " This program shows the serial out capabilities of cv::Mat\n"
    << "That is, cv::Mat M(...); cout << M;  Now works.\n"
    << "Output can be formated to OpenCV, matlab, python, numpy, csv and \n"
    << "C styles Usage:\n"
    << "./cvout_sample\n"
    << "------------------------------------------------------------------\n\n"
    << std::endl;
}

int main(int argc, char** argv) {
    int ret = 0;

    std::cout << "face detect version: " << FD_COMMON::VERSION() << std::endl;
    std::cout << "author: " << FD_COMMON::AUTHOR << std::endl;
    std::cout << "email: " << FD_COMMON::EMAIL << std::endl;

    cv::CommandLineParser parser(argc, argv, "{help h||}");
    if (parser.has("help"))
    {
        help();
        return 0;
    }

    cv::Mat I = cv::Mat::eye(4, 4, CV_64F);
    I.at<double>(1,1) = CV_PI;
    std::cout << "I = \n" << I << ";" << std::endl << std::endl;

    cv::Mat r = cv::Mat(10, 3, CV_8UC3);
    randu(r, cv::Scalar::all(0), cv::Scalar::all(255));

    std::cout << "r (default) = \n" << r << ";" << std::endl << std::endl;
    std::cout << "r (matlab) = \n" << format(r, cv::Formatter::FMT_MATLAB) << ";" << std::endl << std::endl;
    std::cout << "r (python) = \n" << format(r, cv::Formatter::FMT_PYTHON) << ";" << std::endl << std::endl;
    std::cout << "r (numpy) = \n" << format(r, cv::Formatter::FMT_NUMPY) << ";" << std::endl << std::endl;
    std::cout << "r (csv) = \n" << format(r, cv::Formatter::FMT_CSV) << ";" << std::endl << std::endl;
    std::cout << "r (c) = \n" << format(r, cv::Formatter::FMT_C) << ";" << std::endl << std::endl;

    cv::Point2f p(5, 1);
    std::cout << "p = " << p << ";" << std::endl;

    cv::Point3f p3f(2, 6, 7);
    std::cout << "p3f = " << p3f << ";" << std::endl;

    std::vector<float> v;
    v.push_back(1);
    v.push_back(2);
    v.push_back(3);
    std::cout << "shortvec = " << cv::Mat(v) << std::endl;

    std::vector<cv::Point2f> points(20);
    for (size_t i = 0; i < points.size(); ++i)
        points[i] = cv::Point2f((float)(i * 5), (float)(i % 7));

    std::cout << "points = " << points << ";" << std::endl;

    return ret;
}
