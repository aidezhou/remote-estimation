function [L,M] = monte_carlo_2v(sample, q, nOfSamples)
    L = zeros(1, length(q)^4);
    M = zeros(1, length(q)^4);
    x=1;
    for i = 1:length(q)
        for j = 1:length(q)
            for m = 1:length(q)
                for l = 1:length(q)
                    for n = 1:nOfSamples
                    [ell,emm] = sample([q(i) q(j);q(m) q(l)]);
                     L(x) = L(x)+ ell;
                     M(x) = M(x)+emm;
                    end
                    L(x) = L(x)/nOfSamples;
                    M(x) = M(x)/nOfSamples;
                    x = x+1;
                end
            end
        end
    end
end





