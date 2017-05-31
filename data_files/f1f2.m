%% Return f1 and f2 form factor for a certain element
% Zhentian Wang 05.09.2013
% 
function [f1 f2] = f1f2(str, E)
%%% 
% str - element name
% E   - energy in (keV)
format long
dat = importdata([str,'.dat']);

%if error
if isempty(dat)
    error('No data for this element. Check the element name.');
end

% interpolation
% exp interpolation cannot be performed on the whole data, reasonable to do
% it with the range [10keV 200keV];
% TODO: The absorption edge of certain material should be considered.
data_En = dat(:,1);%KeV
data_f1 = dat(:,5);
data_f2 = dat(:,6);
%linear interpolation 
% f1 = interp1(data_En,data_f1,(E),'spline');
% f2 = interp1(data_En,data_f2,(E),'spline');

% exp interpolation
index = find(data_En >= 10 & data_En <= 200);
data_En = data_En(index);
data_f1 = data_f1(index);
data_f2 = data_f2(index);
f1 = exp(interp1(log(data_En),log(data_f1),log(E),'spline'));
f2 = exp(interp1(log(data_En),log(data_f2),log(E),'spline'));
end