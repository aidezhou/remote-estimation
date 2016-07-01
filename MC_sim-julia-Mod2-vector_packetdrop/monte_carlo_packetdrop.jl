function monte_carlo(sample, k, ε, nOfSamples)
    L = zeros(length(k), length(ε))
    M = zeros(length(k), length(ε))

    for i in 1:length(k)
      for j in 1:length(ε)
        for n = 1:nOfSamples
            (ell :: Float64, emm :: Float64) = sample(k[i],ε[j])
            L[i,j] +=  ell
            M[i,j] +=  emm
        end

        L[i,j] /=  nOfSamples
        M[i,j] /=  nOfSamples
      end
    end

    return (L, M)
end
