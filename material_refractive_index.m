%% material_refractive_index.m
%
% DESCRIPTION: calculate the refractive index for element material
%   
%
% CALL: [delta beta] = material_refractive_index(name,E)
%   - delta: refractive increament
%   - beta: 
%   - name: element name, e.g. 'Si', 'Au'
%   - E: energy range, can be scalar or vector
%
%
% UPDATES:
%   09.10.2013 (Zhentian) : first version
%
%%
function [delta beta] = material_refractive_index(name,E)

addpath(genpath('./data_files'));
addpath(genpath('./utils'));
format long; % for high precision calculation

%% TODO: put the constants definition into one place
% Constants definition
NA = 6.022045e23;
% Classical readius of the electron
r_0 = 2.82e-15; %Unit: m

delta = zeros(size(E));
beta  = zeros(size(E));

for i = 1:numel(E)
    e = E(i);
    lamda = E2lamda(e);
    mass_density = element_material_mass_density(name);
    cc = r_0*lamda.^2/2/pi*NA*mass_density*1e3;%intermedia constant
    [f1 f2] = f1f2(name,e);
    delta(i) = cc/atomic_mass(name)*f1;
    beta(i)  = cc/atomic_mass(name)*f2;
end