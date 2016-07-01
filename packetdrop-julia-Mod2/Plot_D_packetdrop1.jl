using PyPlot
include("monte_carlo_packetdrop1.jl")
include("sampleThreshold_packetdrop1.jl")
k = logspace(-5,1,100)
ε = 0.2
(L,M) = monte_carlo(sampleThreshold, k, ε, 1e5)
D = L./M
N = 1./M
plot(N,D)
xlabel("alpha")
ylabel("Distortion")
title("Distortion vs alpha (epsilon = 0.2)")
