
function monte_carlo(sample, parameters, nOfSamples)
    L = zeros(Float64, length(parameters))
    M = zeros(Float64, length(parameters))

    for i in 1:length(parameters)
        for n = 1:nOfSamples
            (ell :: Float64, emm :: Float64) = sample(parameters[i])
            L[i] +=  ell
            M[i] +=  emm
        end

        L[i] /=  nOfSamples
        M[i] /=  nOfSamples
    end

    return (L, M)
end
