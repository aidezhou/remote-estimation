
function monte_carlo_BDP_packetdrop2(sample_BDP, parameters, nOfSamples, beta, ϵ)
    L = zeros(Float64, length(parameters))
    M = zeros(Float64, length(parameters))

    for i in 1:length(parameters)
        for n = 1:nOfSamples
            (ell :: Float64, emm :: Float64) = sample_BDP(parameters[i], beta, ϵ)
            L[i] +=  ell
            M[i] +=  emm
        end

        L[i] /=  nOfSamples
        M[i] /=  nOfSamples
    end

    return (L, M)
end
