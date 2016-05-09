function [L,M] = monte_carlo(sample, k, nOfSamples)
    L = zeros(1, length(k));
    M = zeros(1, length(k));
   
    for i = 1:length(k)
        for n = 1:nOfSamples
            [ell,emm] = sample(k(i));
            L(i) = L(i)+ ell;
            M(i) = M(i)+emm;
        end

        L(i) = L(i)/nOfSamples;
        M(i) = M(i)/nOfSamples;  
    end
   
end





