using StatsBase
using Distributions

function nextState(state :: Float64)
   a = 1.0
   p = 0.3
   items = [-1, 0, 1]
   weights = [p, (1-2*p), p]
   w = sample(items, WeightVec(weights))
   E = a * state + w
   return (E)
end


function sampleThreshold_BDP_packetdrop2(k, beta, ϵ :: Float64)
  (L,M) = (0.0, 0.0)
  E     = 0.0
  K     = 0.0
 bernoulli = Bernoulli(1-ϵ)
  t     = 0.0
  while K == 0
      if  abs(E) >= k
          H = rand(bernoulli)
          if H == 0
             K = 0
             L = L + (beta.^t)*abs(E)
             M = M + (beta.^t)*1
          else K = 1
          end
      else
          L = L + (beta.^t)*abs(E)
          M = M + (beta.^t)*1
      end
      t = t + 1
      E = nextState(E)
  end

  return (L,M)
end
