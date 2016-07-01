function [L,M] = sampleRandom_2v(Q)
    L = 0;
    M = 0;
    E = [0;0];
    U = 0;
    if abs(E'*Q*E) < 1
        U = 0;
    else U = 1;
    end
    while U == 0 
        L = L + E'*E;
        M = M + 1;
        E = nextState(E);
        if abs(E'*Q*E) < 1
             U = 0;
        else U = 1;
        end
    end
end

function E = nextState(E)
   A = [1 0;0 1]; 
   E= A * E + randn(2,1);
end