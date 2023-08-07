rpDir = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Raw Figures\Cluster Tables\Rotation Points";
%rotation points max vs shift cluster #
G1 = readtable(strcat(rpDir,"\Rotation Points Max Vs Shift Cluster 1.xlsx"));
G2 = readtable(strcat(rpDir,"\Rotation Points Max Vs Shift Cluster 2.xlsx"));
G3 = readtable(strcat(rpDir,"\Rotation Points Max Vs Shift Cluster 3.xlsx"));
G4 = readtable(strcat(rpDir,"\Rotation Points Max Vs Shift Cluster 4.xlsx"));


%rotation points max vs steepness cluster #
H1 = readtable(strcat(rpDir,"\Rotation Points Max Vs Steepness Cluster 1.xlsx"));
H2 = readtable(strcat(rpDir,"\Rotation Points Max Vs Steepness Cluster 2.xlsx"));
H3 = readtable(strcat(rpDir,"\Rotation Points Max Vs Steepness Cluster 3.xlsx"));
H4 = readtable(strcat(rpDir,"\Rotation Points Max Vs Steepness Cluster 4.xlsx"));



%rotation points shift cs steepness cluster#
I1 = readtable(strcat(rpDir,"\Rotation Points Shift Vs Steepness Cluster 1.xlsx"));
I2 = readtable(strcat(rpDir,"\Rotation Points Shift Vs Steepness Cluster 2.xlsx"));
I3 = readtable(strcat(rpDir,"\Rotation Points Shift Vs Steepness Cluster 3.xlsx"));
% I4 = readtable("C:\Users\ldd77\OneDrive\Desktop\Raw Figures\Cluster Tables\Rotation Points\Rotation Points Shift Vs Steepness Cluster 4.xlsx");