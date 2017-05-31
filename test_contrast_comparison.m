%% This scripts show the phase contrast and absorption contrast between glandular and fat tissue over diagnostic energy range
% Zhentian Wang

%energy
E = 15:100;

%glanduar
[delta_g, beta_g] = breast_tissue_refractive_index('Gland2',E);
[delta_f, beta_f] = breast_tissue_refractive_index('Adipose2',E);

%convert to mu and phi (arbitary unit:actually m-1)
lamda = E2lamda(E);
mu_g = 4*pi*beta_g./lamda;
mu_f = 4*pi*beta_f./lamda;
phi_g = 2*pi*delta_g./lamda;
phi_f = 2*pi*delta_f./lamda;

%absorption comparison
figure;plot(E,mu_g,'b',E,mu_f,'r');
legend('glanduar','fat');
%phase shift comparison
figure;plot(E,phi_g,'b',E,phi_f,'r');
legend('glanduar','fat');
%
% figure;plot(E,log(mu_g),'b', E,log(mu_f),'r', E,log(phi_g),'g',E,log(phi_f),'y');
%see the relative contrast
figure;plot(E,(mu_g-mu_f));
figure;plot(E,(phi_g-phi_f));