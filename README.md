# amIPositive
COVID Test result interpreter using bayesian inference

## tl:dr

Take at least two tests to be sure you don't have COVID, do not rely on the result from just one.

## Introduction

I illustrate a Bayesian approach for interpreting COVID Test results. The function returns the percentage probability that one has COVID given a set of results from covid tests. The function takes the following arguments:

1.) Base -- the prior probability of having COVID. I recommend the use of the positivity percentage (expressed as probability between 0 and 1) of all tests conducted as reported in your country/state/city.

2.) fp -- the false positive characteristics of the administered test expressed as probability between 0 and 1

3.) fn -- the false negative characteristics of the administered test expressed as probability between 0 and 1

4.) num_test -- number of tests taken for which results are known

5.) test_result -- vector of boolean with 1 indicating positive result and zero indicating negative result for all tests taken for which results are known

The function returns a line plot indicating the change in  probabilty of having covid when each test result is considered. The final point indicates the cumulative posterior probability of having COVID given the test results and test characteritsics
