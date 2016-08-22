
function nextState(state :: Float64)
   a = 1.0
   E = a * state + randn()
   return (E)
end

function sampleThreshold_Gauss(k :: Float64, beta)
    (L,M) = (0.0, 0.0)
    E     = 0.0
    U     = 0.0
    while U == 0
        L = beta * L + (E*E)[1]
        M = beta * M + 1
        E = nextState(E)
        if  (E*E)[1] < k
            U = 0
        else U = 1
        end
    end

    return (L,M)
end
