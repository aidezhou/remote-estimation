
function nextState(state :: Float64)
   a = 1.0
   E = a * state + randn()
   return (E)
end

function sampleThreshold_Gauss(k :: Float64, beta)
    (L,M) = (0.0, 0.0)
    E     = 0.0
    U     = 0.0
    beta_acc = 1
    while U == 0
      L = L + beta_acc*(E*E)[1]
      M = M + beta_acc*1
      beta_acc *= beta
      E = nextState(E)
        if  abs(E) < k
             U = 0
        else U = 1
        end
    end

    return (L,M)
end
