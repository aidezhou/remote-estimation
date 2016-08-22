using PyPlot
using MAT

include("monte_carlo_Gauss.jl")
include("sampleThreshold_Gauss.jl")
k = [4.34460, 4.87451, 5.28411]
beta = 1.0
(L,M) = monte_carlo_Gauss(sampleThreshold_Gauss, k , 1e8, beta)
D = L./M
N = 1./M - (1 - beta)
lambda = [100, 150, 200]
C = zeros(Float64, length(lambda));
#C_opt = zeros(Float64, length(lambda));
for j in 1:length(lambda)
    C[j] = ( (L[j] + lambda[j])/M[j] ) - lambda[j]*(1-beta)
end
#    C_opt[j] = minimum(C)
#end#for j in 1:length(lambda)
#    C = D + lambda[j].*N
#    C_opt[j] = minimum(C)
#end
#plot(lambda,C_opt)
#title("Cost")
#xlabel("lambda")
#ylabel("Cost")
file = matopen("test3.mat", "w")
write(file, "C_new3", C)
close(file)
