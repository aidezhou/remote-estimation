function monte_carlo(sample, k, ε, nOfSamples)
    L = zeros(Float64, length(k))
    M = zeros(Float64, length(k))

    for i in 1:length(k)
        for n = 1:nOfSamples
            (ell :: Float64, emm :: Float64) = sample(k[i],ε)
            L[i] +=  ell
            M[i] +=  emm
        end

        L[i] /=  nOfSamples
        M[i] /=  nOfSamples
    end

    return (L, M)
end
