using PyPlot
include("monte_carlo_packetdrop1.jl")
include("sampleThreshold_packetdrop1.jl")
k = logspace(-5,1,100)
ε = 0.8
(L,M) = monte_carlo(sampleThreshold, k, ε, 1e5)
D = L./M
N = 1./M

lambda = linspace(0.01,200,100);
C = zeros(Float64, length(lambda));
C_opt = zeros(Float64, length(lambda));

for j in 1:length(lambda)
    C = D + lambda[j].*N
    C_opt[j] = minimum(C)
end
plot(lambda,C_opt)
title("Cost (epsilon = 0.8)")
xlabel("lambda")
ylabel("Cost")
