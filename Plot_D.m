k = linspace(0,10,20);
[L,M] = monte_carlo(@sampleRandom, k , 1e5);
D = L./M;
N = 1./M;

figure;
plot(N,D);
title('Distortion');
xlabel('N(k)');
ylabel('D(k)');
