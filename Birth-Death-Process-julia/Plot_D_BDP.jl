using PyPlot
using MAT

include("monte_carlo_BDP.jl")
include("sampleThreshold_BDP.jl")
k = linspace(0,10,11)
beta = 1.0
(L,M) = monte_carlo_BDP(sampleThreshold_BDP, k , 1e6, beta)
D = L./M
N = 1./M - (1 - beta)
plot(N,D)
title("BDP")
xlabel("\$ N \$")
ylabel("\$ D \$")
file = matopen("BDP_simulation_beta1.0.mat", "w")
write(file, "D_1", D)
write(file, "N_1", N)
write(file, "L_1", L)
write(file, "M_1", M)
close(file)
