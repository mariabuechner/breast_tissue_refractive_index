%% This scripts is to calculate the attenuation coefficients and refractive indexs for different breast tissues defined by ICRU 46 (Photon, Electron, Proton and Neutron Interaction Data for Body Tissues)
%   Zhentian Wang 4th Sept 2013
addpath(genpath('./data_files'));
format long;
%% Constants definition
% Avogadro's number
NA = 6.022045e23;
% Classical readius of the electron
r_0 = 2.82e-15; %Unit: m

% Atomic weight for different element

%% delta = (r_0 * lamda.^2) / (2*pi) * ro_e (1)
% r_0 -> scattering amplitude per electron or classical radius of the
% electron; r_0 = 2.82e-15 m
% lamda -> the wave length
% ro_e  -> electron density

%% ICRU Report 46
%%% The material electron density has been given, therefore the delta can
%%% be caculated directly based on equation (1).

% Tissue composition
% Adipose tissue , Adult #1

%
elements        = {'H','C','N','O','Na','S','Cl'};
% mass_percentage = [11.2 51.7 1.3 35.5 0.1 0.1 0.1]; % adipose adult #1
mass_percentage = [11.4 59.8 0.7 27.8 0.1 0.1 0.1]/100;

for k = 1:numel(elements)
    atomic_mass(elements(k))
end

% H:11.2 C:51.7 N:1.3 O:35.5 Na:0.1 S:0.1 Cl:0.1
density_m = 0.950; %g/cm3  -> 1e6 g/m3

E = 15:5:100;
delta = zeros(size(E));
beta  = zeros(size(E));
f1 = zeros(size(E));
f2 = zeros(size(E));
for i = 1:numel(E)
    e = E(i);
    lamda = E2lamda(e);
    cc = r_0*lamda.^2/2/pi*NA*density_m*1e6;
    ccf1 = 0;
    ccf2 = 0;
    f11 = 0;
    f22 = 0;
    for j = 1:numel(elements)
        el = char(elements{j});
        [f1tmp f2tmp] = f1f2(el,e);
        ccf1 = ccf1 + mass_percentage(j)/atomic_mass(el)*f1tmp;
        ccf2 = ccf2 + mass_percentage(j)/atomic_mass(el)*f2tmp;
        f11 = f11 + f1tmp;
        f22 = f22 + f2tmp;
    end
    delta(i) = cc*ccf1;
    beta(i)  = cc*ccf2;
    f1(i) = f11;
    f2(i) = f22;
end
figure;
subplot(121);
plot(E,delta);
legend('delta');
subplot(122);
plot(E,beta,'r');
legend('beta');

