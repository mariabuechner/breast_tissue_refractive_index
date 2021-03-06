%% Test, calculate the delta for Adipose Adult #1

r_0 = 2.82e-15; % m
ro_e1 = 3180e26 % m-3 adipose
ro_e2 = 3300e26 % m-3 mammary

E = 15:100; % KeV
delta1 = zeros(size(E));
delta2 = zeros(size(E));

for i = 1:numel(E)
    lamda = E2lamda(E(i));
    delta1(i) = r_0*lamda.^2/2/pi*ro_e1;
    delta2(i) = r_0*lamda.^2/2/pi*ro_e2;
end

figure;
plot(E,delta1);
hold on;
plot(E,delta2,'r');
legend('Adipose','gland');


%% compare adipose and gland attenuation coefficents according to the tabluated data in ICRU Report 46
E1 = [10 15 20 30 40 50 60 80 100 150];
A = [3.56e-1 1.17e-1 6.02e-2 3.16e-2 2.43e-2 2.14e-2 1.98e-2 1.80e-2 1.69e-2 1.50e-2];
G = [3.63e-1 1.19e-1 6.10e-2 3.18e-2 2.44e-2 2.14e-2 1.98e-2 1.80e-2 1.68e-2 1.49e-2];
A = A*0.97;
G = G*0.99;
% 
% figure;
% plot(E1,A);
% hold on;
% plot(E1,G,'r');
% legend('Adipose','gland');

figure;
plot(E, (delta2-delta1)./delta1);
hold on;
plot(E1, (G-A)./A,'r');

%% Conclusion
% For delta, the relative contrast doesn't change with energy; however, the
% 