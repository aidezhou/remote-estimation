using PyPlot
include("monte_carlo_packetdrop.jl")
include("sampleThreshold_packetdrop.jl")
k = logspace(-5,1,50)
ε = linspace(0.1,1,50)
(L,M) = monte_carlo(sampleThreshold, k, ε, 1e5)
D = L./M
N = 1./M
D_1 = D[:]
N_1 = N[:]
p = sortperm(D_1)
plot(N_1[p],D_1[p])
xlabel("alpha")
ylabel("Distortion")
title("Distortion vs alpha")
