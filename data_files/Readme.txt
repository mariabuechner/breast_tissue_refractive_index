The datafile for each element is generated from "f1f2_asf_Kissel.dat" by

sed -n '166,908p' f1f2_afs_Kissel.dat > H.dat in Linux

Data format is:

#UO       E (keV)          g''           g'           f'           f1


1:PhotonEnergy[KeV]  2:g''[=-f''CL=-f2]  3:g' 4:f'  5:f1  6:f2
