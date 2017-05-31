%% ICRU 46 Tissue definition, regarding breast tissue
%   Note: these definition are mainly meant for absorption, for phase
%   contrast, not sure about the accuracy
%   Zhentian Wang 05.09.2013
%   density - unit kg/m3
%   electron density - unit /m3 * 1e26 
format long;
headers      =   {'mass_density','electron_density',    'H',    'C',    'N',    'O',    'Na',   'S',    'Cl',   'P',    'Ca'    };
Adipose1        =   [970            3240                0.112   0.517   0.013   0.355   0.001   0.001   0.001   0       0       ];
Adipose2        =   [950            3180                0.114   0.598   0.007   0.278   0.001   0.001   0.001   0       0       ];
Adipose3        =   [930            3120                0.116   0.681   0.002   0.198   0.001   0.001   0.001   0       0       ];
Gland1          =   [990            3300                0.109   0.506   0.023   0.358   0.001   0.001   0.001   0.001   0       ];
Gland2          =   [1020           3390                0.106   0.332   0.030   0.527   0.001   0.002   0.001   0.001   0       ];
Gland3          =   [1060           3510                0.102   0.158   0.037   0.698   0.001   0.002   0.001   0.001   0       ];
Calcification   =   [3060           9180                0.003   0.016   0.005   0.407   0       0       0       0.187   0.382   ];
Breast50_50     =   [960            3220                0.115   0.387   0       0.498   0       0       0       0       0       ];
Breast33_67     =   [940            3150                0.116   0.519   0       0.365   0       0       0       0       0       ];