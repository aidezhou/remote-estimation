function [L,M] = sampleRandom(k)
    L = 0;
    M = 0;
    E = 0;
    U = 0;
    if abs(E) < k
        U = 0;
    else U = 1;
    end
    while U == 0 
        L = L + E*E;
        M = M + 1;
        E = nextState(E);
        if abs(E) < k
             U = 0;
        else U = 1;
        end
    end
end

function E = nextState(E)
   a = 1; o=1;
   E= a * E + o* randn();
end