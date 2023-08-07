reactionTimeDir = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Raw Figures\Cluster Tables\Reaction Time 1st";
%Reaction Time Max Vs Shift Cluster #
J1 = readtable(strcat(reactionTimeDir,"\Reaction Time  Max Vs Shift Cluster 1.xlsx"));
J2 = readtable(strcat(reactionTimeDir,"/Reaction Time  Max Vs Shift Cluster 2.xlsx"));
J3 = readtable(strcat(reactionTimeDir,"/Reaction Time  Max Vs Shift Cluster 3.xlsx"));
J4 = readtable(strcat(reactionTimeDir,"/Reaction Time  Max Vs Shift Cluster 4.xlsx"));
% J5 = readtable("C:\Users\ldd77\OneDrive\Desktop\Raw Figures\Cluster Tables\Reaction Time 1st\Reaction Time  Max Vs Shift Cluster 5.xlsx");
% J6 = readtable("C:\Users\ldd77\OneDrive\Desktop\Raw Figures\Cluster Tables\Reaction Time 1st\Reaction Time  Max Vs Shift Cluster 6.xlsx");

%Reaction Time Max Vs Steepness Cluster #
K1 = readtable(strcat(reactionTimeDir,"/Reaction Time  Max Vs Steepness Cluster 1.xlsx"));
K2 = readtable(strcat(reactionTimeDir,"/Reaction Time  Max Vs Steepness Cluster 2.xlsx"));
K3 = readtable(strcat(reactionTimeDir,"/Reaction Time  Max Vs Steepness Cluster 3.xlsx"));
% K4 = readtable("C:\Users\ldd77\OneDrive\Desktop\Raw Figures\Cluster Tables\Reaction Time 1st\Reaction Time  Max Vs Steepness Cluster 4.xlsx");
% K5 = readtable("C:\Users\ldd77\OneDrive\Desktop\Raw Figures\Cluster Tables\Reaction Time 1st\Reaction Time  Max Vs Steepness Cluster 5.xlsx");

%Reaction Time Shift Vs Steepness Cluster #
L1 = readtable(strcat(reactionTimeDir,"/Reaction Time  Shift Vs Steepness Cluster 1.xlsx"));
L2 = readtable(strcat(reactionTimeDir,"/Reaction Time  Shift Vs Steepness Cluster 2.xlsx"));
L3 = readtable(strcat(reactionTimeDir,"/Reaction Time  Shift Vs Steepness Cluster 3.xlsx"));
L4 = readtable(strcat(reactionTimeDir,"/Reaction Time  Shift Vs Steepness Cluster 4.xlsx"));
% L5 = readtable("C:\Users\ldd77\OneDrive\Desktop\Raw Figures\Cluster Tables\Reaction Time 1st\Reaction Time  Shift Vs Steepness Cluster 5.xlsx");