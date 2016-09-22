using StatsBase

function nextState(state :: Float64)
   a = 1.0
   p =0.3
   items = [-1, 0, 1]
   weights = [p, (1-2*p), p]
   w = sample(items, WeightVec(weights))
   E = a * state + w
   return (E)
end

function sampleThreshold_BDP(k :: Float64, beta)
    (L,M) = (0.0, 0.0)
    E     = 0.0
    U     = 0.0
    beta_acc = 1.0
    while U == 0
        L = L + beta_acc*abs(E)
        M = M + beta_acc
        beta_acc *= beta
        E = nextState(E)
        if  abs(E) < k
            U = 0
        else U = 1
        end
    end

    return (L,M)
end
