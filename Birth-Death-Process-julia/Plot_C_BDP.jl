using PyPlot
include("monte_carlo.jl")
include("sampleThreshold.jl")
k = logspace(-5,2,200)
(L,M) = monte_carlo(sampleThreshold, k , 1e5)
D = L./M
N = 1./M

lambda = linspace(0.01,200,200);
C = zeros(Float64, length(lambda));
C_opt = zeros(Float64, length(lambda));

for j in 1:length(lambda)
    C = D + lambda[j].*N
    C_opt[j] = minimum(C)
end
plot(lambda,C_opt)
title("Cost")
xlabel("lambda")
ylabel("Cost")
