%% element_material_mass_density.m 
%
% DESCRIPTION: get element material mass density, only for solid. The
% numbers are from Wikipedia (trust it or not)
%   
%
% CALL: density = element_material_mass_density(name)
%   - density: mass density, unit: kg/m^3
%   - name: element name, e.g. 'Si', 'Au'
%
%
% UPDATES:
%   09.10.2013 (Zhentian) : first version
%
%%
function density = element_material_mass_density(name)

density_table = { ...
                  'Si' 2329;
                  'Au' 19300;
                  'Cu' 8960;
                  'Pb' 11340; %Lead
                  'Fe' 7874;
                  'Al' 2700;
                  'Ni' 8908
};
%look up for the material
index = find(not(cellfun('isempty', strfind(density_table(:,1),name))));
if isempty(index)
    error(['Cannot find the mass density for this material:',name]);
end

density = cell2mat(density_table(index,2));