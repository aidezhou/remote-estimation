using PyPlot
using MAT

include("monte_carlo_BDP_packetdrop2.jl")
include("sampleThreshold_BDP_packetdrop2.jl")
k = linspace(1,30,30)
beta = 0.99
ϵ = 0.3
(L,M) = monte_carlo_BDP_packetdrop2(sampleThreshold_BDP_packetdrop2, k , 1e5, beta, ϵ)
D = L./M
N = 1./M - (1 - beta)
plot(N,D)
#title("BDP (\$\\epsilon = 0.1; \\beta = 1.0\$)")
xlabel("\$ \\alpha \$")
ylabel("Distortion")
file1 = matopen("BDP3_30.mat", "w")
write(file1, "D_BDP3_30", D)
write(file1, "N_BDP3_30", N)
close(file)
