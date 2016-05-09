k = linspace(0,100,200);
[L,M] = monte_carlo(@sampleRandom, k , 1e5);
D = L./M;
N = 1./M;

save D D
save alpha N
save('D:\\Documents\\GitHub\\remote-estimation\\monte-carlo\\D.mat','D')
save('D:\\Documents\\GitHub\\remote-estimation\\monte-carlo\\alpha.mat','N')
figure;
plot(N,D);
title('Distortion');
xlabel('alpha');
ylabel('D');
