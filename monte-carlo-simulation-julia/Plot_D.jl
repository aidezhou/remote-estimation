using PyPlot
include("monte_carlo.jl")
include("sampleThreshold.jl")
k = logspace(-5,2,200)
(L,M) = monte_carlo(sampleThreshold, k , 1e5)
D = L./M
N = 1./M
plot(N,D)
