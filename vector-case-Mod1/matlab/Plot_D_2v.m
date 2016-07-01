q = linspace(0.1,10,10) ;
[L,M] = monte_carlo_2v(@sampleRandom_2v, q, 1e5);
D = L./M;
N = 1./M;
[x p] = sort(D);
N_n = N(p);
D_n = D(p);
save('workspace_2v.mat');
plot(N_n,D_n);
xlabel('alpha');
ylabel('Distortion');
title('Distortion_vs_alpha');


