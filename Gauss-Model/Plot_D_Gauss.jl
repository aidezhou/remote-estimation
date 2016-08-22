using PyPlot
using MAT

include("monte_carlo_Gauss.jl")
include("sampleThreshold_Gauss.jl")
file = matopen("workspace_Gauss.mat")
k = read(file, "k_opt")
beta = 1.0
(L,M) = monte_carlo_Gauss(sampleThreshold_Gauss, k , 1e5, beta)
D = L./M
N = 1./M - (1 - beta)
plot(N,D)
title("Gauss")
xlabel("\$ N \$")
ylabel("\$ D \$")
#file1 = matopen("Gauss_simulation.mat", "w")
#write(file1, "D_Gauss", D)
#write(file1, "N_Gauss", N)
#write(file1, "L_Gauss", L)
#write(file1, "M_Gauss", M)
#close(file)
