%% Plot f1 and f2 form factor for a certain element
% Zhentian Wang 05.09.2013
function [E f1 f2] = f1f2plot(str, E_lo, E_hi)
%%% 
% str - element name
% E_lo - the low energy limit
% E_hi - the high energy limit
format long
dat = importdata([str,'.dat']);

%if error
if isempty(dat)
    error('No data for this element. Check the element name.');
end

% plot
data_En = dat(:,1);%KeV
ind = find(data_En >= E_lo & data_En <= E_hi);
E = data_En(ind);
f1 = dat(ind,5);
f2 = dat(ind,6);
figure;
subplot(121);
plot(E, f1,'b');
legend('f1');
title(str);
subplot(122);
plot(E, f2,'r');
legend('f2');
title(str);
end