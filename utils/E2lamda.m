%% Calculate the corresponding wavelength in meter for a given energy in KeV
% Zhentian Wang 04.09.2013
% E could be a scalar or a vector
% lamda - m (unit)
function lamda = E2lamda(E)
lamda = 1.24./E*1e-9;