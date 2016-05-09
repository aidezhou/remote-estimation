type AR
    a :: Float64
    σ :: Float64
end

const model = AR(1, 1)

function nextState(model::AR, state :: Float64)
    model.a * state + model.σ * randn()
end

function sampleThreshold(k :: Float64)
    (L,M) = (0.0, 0.0)
    E     = 0.0
    if  abs(E) <= k
        U = 0
    else U = 1
    end

    while U == 0
        L = L + E*E
        M = M + 1

        E = nextState(model, E)
        if  abs(E) <= k
            U = 0
        else U = 1
        end
    end

    return (L,M)
end
