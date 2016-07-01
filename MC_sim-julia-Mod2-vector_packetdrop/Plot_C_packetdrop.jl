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

lambda = linspace(0.01,200,50)
C = zeros(Float64, length(lambda))
C_opt = zeros(Float64, length(lambda))

for j in 1:length(lambda)
    C = D_1[p] + lambda[j].*N_1[p]
    C_opt[j] = minimum(C)
end
plot(lambda,C_opt)
title("Cost*")
xlabel("lambda")
ylabel("Cost")
