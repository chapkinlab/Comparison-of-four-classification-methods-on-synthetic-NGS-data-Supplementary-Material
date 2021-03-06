# Comparison of four classification methods on high-dimensional small-sample-size synthetic NGS data. Supplementary Material


This repository contains the synthetic data, scripts, and figures for classifier error evaluation for the following publication:

Comparison of four classification methods on high-dimensional small-sample-size synthetic NGS data. Felitsiya Shakola, Valeriya Simeonova, Ivan Ivanov. Studies in Computational Intelligence - Springer (submitted)

The parameters for generation of synthetic data sets are presented in the following table:

Table 1: Parameter combinations used to generate synthetic RNA_seq data. σ is the variance of the feature probability distribution function, ρ is the correlation among features in the same block, Dgm is the number of global markers, Dhm is the number of heterogeneous markers. The test number corresponds to the number of figure.

Test number: | σ<sub>0</sub> | σ<sub>1</sub> | ρ | D<sub>gm</sub> | D<sub>hm</sub>
--- | --- | --- | --- | --- | ---
1 | 0.4 | 0.4 | 0.1 | 5 | 50
2 | 0.7 | 0.7 | 0.1 | 5 | 50
3 | 0.3 | 0.5 | 0.1 | 5 | 50
4 | 0.5 | 0.8 | 0.1 | 5 | 50
5 | 0.4 | 0.4 | 0.1 | 25 | 40
6 | 0.7 | 0.7 | 0.1 | 25 | 40
7 | 0.3 | 0.5 | 0.1 | 25 | 40
8 | 0.5 | 0.8 | 0.1 | 25 | 40
9 | 0.4 | 0.4 | 0.1 | 45 | 30
10 | 0.7 | 0.7 | 0.1 | 45 | 30
11 | 0.3 | 0.5 | 0.1 | 45 | 30
12 | 0.5 | 0.8 | 0.1 | 45 | 30
13 | 0.4 | 0.4 | 0.4 | 5 | 50
14 | 0.7 | 0.7 | 0.4 | 5 | 50
15 | 0.3 | 0.5 | 0.4 | 5 | 50
16 | 0.5 | 0.8 | 0.4 | 5 | 50
17 | 0.4 | 0.4 | 0.4 | 25 | 40
18 | 0.7 | 0.7 | 0.4 | 25 | 40
19 | 0.3 | 0.5 | 0.4 | 25 | 40
20 | 0.5 | 0.8 | 0.4 | 25 | 40
21 | 0.4 | 0.4 | 0.4 | 45 | 30
22 | 0.7 | 0.7 | 0.4 | 45 | 30
23 | 0.3 | 0.5 | 0.4 | 45 | 30
24 | 0.5 | 0.8 | 0.4 | 45 | 30
25 | 0.4 | 0.4 | 0.8 | 5 | 50
26 | 0.7 | 0.7 | 0.8 | 5 | 50
27 | 0.3 | 0.5 | 0.8 | 5 | 50
28 | 0.5 | 0.8 | 0.8 | 5 | 50
29 | 0.4 | 0.4 | 0.8 | 25 | 40
30 | 0.7 | 0.7 | 0.8 | 25 | 40
31 | 0.3 | 0.5 | 0.8 | 25 | 40
32 | 0.5 | 0.8 | 0.8 | 25 | 40
33 | 0.4 | 0.4 | 0.8 | 45 | 30
34 | 0.7 | 0.7 | 0.8 | 45 | 30
35 | 0.3 | 0.5 | 0.8 | 45 | 30
36 | 0.5 | 0.8 | 0.8 | 45 | 30


Questions can be emailed to Felitsiya Shakola, PhD at: felitsiya.shakola@gate-ai.eu