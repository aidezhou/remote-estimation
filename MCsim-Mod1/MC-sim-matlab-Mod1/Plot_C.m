
k = linspace(0,10,20);
[L,M] = monte_carlo(@sampleRandom, k , 1e5);
D = L./M;
N = 1./M;

lambda = linspace(0.1,200,20);
C = zeros(1, length(lambda));
C_opt = zeros(1, length(lambda));
for j = 1:length(lambda)
    C = D + lambda(j).*N;
    C_opt(j) = min(C);
end

save lambda lambda
save C_opt C_opt
save('D:\\Documents\\GitHub\\remote-estimation\\monte-carlo\\lambda.mat','lambda')
save('D:\\Documents\\GitHub\\remote-estimation\\monte-carlo\\C_opt.mat','C_opt')

figure;
plot(lambda,C_opt);
title('Cost');
xlabel('lambda');
ylabel('C');