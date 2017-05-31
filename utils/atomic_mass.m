%% Give the atomic mass for different elements
% Zhentian Wang 4th Sept 2013
function mass = atomic_mass(str)
% str - the string represents the element
str = char(str);
%The data table
table = ElementTable();

name = cellstr(table(:,1));
%ugly here. Didn't find a better way to locate a string in the cell.
for i = 1:numel(name)
    if str == char(name(i))
        mass = cell2mat(table(i,2));
        return;
    end
end

error('This element is not known.');
% index = find(name == str);
% if ~isempty(index)
%     mass = cell2mat(table(index,2));
% else
%     error('This element is not known.');
% end


%internal function, to add new elements,  expand this table.
function data = ElementTable()
data = {'H'     1.00794;
        'C'     12.0107;
        'N'     14.0067;
        'O'     15.9994;
        'Na'    22.990;
        'S'     32.066;
        'Cl'    35.453;
        'P'     30.974;
        'Ca'    40.078;
        'Si'    28.086;
        'Au'    196.97;
        'Ni'    58.693;
        'Al'    26.982;
        'Fe'    55.845;
        'Cu'    63.546;
        'Pb'    207.21
 };