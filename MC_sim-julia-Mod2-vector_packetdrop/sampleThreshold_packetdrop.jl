using Distributions

type AR
    a :: Float64
    σ :: Float64
end

const model = AR(1, 1)

function nextState(model::AR, state :: Float64)
    model.a * state + model.σ * randn()
end

function sampleThreshold(k :: Float64, ε :: Float64)
    (L,M) = (0.0, 0.0)
    E     = 0.0
    K     = 0.0
    bernoulli = Bernoulli(ε)

    while K == 0
        L = L + E*E
        M = M + 1
        E = nextState(model, E)
        if  abs(E) > k
            H = rand(bernoulli)
            if H == 1
               K = 1
            else K = 0
            end
        else K = 0
        end
    end

    return (L,M)
end
