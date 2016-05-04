k = linspace(0,10,20);
[L,M] = monte_carlo(@sampleRandom, k , 1e5);
D = L./M;
N = 1./M;

lamda = linspace(0.1,200,20);
C = zeros(1, length(lamda));
C_opt = zeros(1, length(lamda));
for j=1:length(lamda)
    C = D + lamda(j).*N;
    C_opt(j) = min(C);
end

figure;
plot(lamda,C_opt);
title('C');
xlabel('lamda');
ylabel('C');