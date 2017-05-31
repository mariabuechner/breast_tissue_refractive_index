%% breast_tissue_refractive_index.m
%
% DESCRIPTION: Calculate the delta and beta for breast tissue according to the tissue composition defined in ICRU 46
%   
%
% CALL: [delta beta] = breast_tissue_refractive_index(name, E)
% E - photon energy (keV), can be a scalar or a vector
% name - the name of the breast tissue: Adipose1~3, Gland1~3, and
% Calcification
% Example: [delta beta] = breast_tissue_refractive_index('Adipose1', 25);
%          [delta beta] = breast_tissue_refractive_index('Adipose3',15:100);
%
%
% UPDATES:
%   01.09.2013 (Zhentian) : first version
%
%%
function [delta beta] = breast_tissue_refractive_index(name, E)

addpath(genpath('./data_files'));
addpath(genpath('./utils'));
format long; % for high precision calculation

% include the tissue composition
tissue_composition_ICRU46;

% Constants definition
NA = 6.022045e23;
% Classical readius of the electron
r_0 = 2.82e-15; %Unit: m

% find the material properties in the tissue database
if ~exist(name)
    error('This material is not defined in tissue_compostion_ICRU46');
end

eval(['material_properties =', name,';']);

delta = zeros(size(E));
beta  = zeros(size(E));

% The delta can also be calculated using the known electron density in
% ICRU46 definition
for i = 1:numel(E)
    e = E(i);
    lamda = E2lamda(e);
    cc = r_0*lamda.^2/2/pi*NA*material_properties(1)*1e3;
    ccf1 = 0; %temp variable
    ccf2 = 0; %temp variable
    for j = 3:numel(headers)  % always 9 elements are defined for each material
        if material_properties(j)>0 % for efficiency
            el_name = char(headers{j});
            [f1tmp f2tmp] = f1f2(el_name,e);
            ccf1 = ccf1 + material_properties(j)/atomic_mass(el_name)*f1tmp;
            ccf2 = ccf2 + material_properties(j)/atomic_mass(el_name)*f2tmp;
        end
    end
    delta(i) = cc*ccf1;
    beta(i)  = cc*ccf2;
end