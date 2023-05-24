A1 = readtable("J1.xlsx");
A2 = readtable("J2.xlsx");
A3 = readtable("J3.xlsx");
A4 =readtable("J4.xlsx");


A1AverageX = sum(A1.clusterX)/length(A1.clusterX);
A1AverageY = sum(A1.clusterY)/length(A1.clusterY);

A2averageX = sum(A2.clusterX)/length(A2.clusterX);
A2averageY = sum(A2.clusterY)/length(A2.clusterY);

A3averageX = sum(A3.clusterX)/length(A3.clusterX);
A3averageY = sum(A3.clusterY)/length(A3.clusterY);

A4averageX = sum(A4.clusterX)/length(A4.clusterX);
A4averageY = sum(A4.clusterY)/length(A4.clusterY);



A1Labels = A1.clusterLabels;
A2Labels = A2.clusterLabels;
A3Labels = A2.clusterLabels;
A4Labels = A4.clusterLabels;

% newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Food Deprivation\Travel Pixel Sigmoid Data");
newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Old Base Data\Reaction Time Sigmoid Data");

newTable.Properties.VariableNames = ["A","B","C","clusterLabels"];
% display(newTable)

A1WithC = join(A1,newTable);
A2WithC = join(A2,newTable);
A3WithC = join(A3,newTable);
A4WithC = join(A4,newTable);

% display(A2WithC)
A1AverageMax=sum(A1WithC.A)/length(A1WithC.A);
A1AverageShift=sum(A1WithC.B)/length(A1WithC.B);
A1AverageSteepness=sum(A1WithC.C)/length(A1WithC.C);
disp("A1");
display([A1AverageMax,A1AverageShift,A1AverageSteepness])

A2AverageMax = sum(A2WithC.A)/length(A2WithC.A);
A2AverageShift = sum(A2WithC.B)/length(A2WithC.B);
A2AverageSteepness = sum(A2WithC.C)/length(A2WithC.C);
disp("A2");
display([A2AverageMax,A2AverageShift,A2AverageSteepness])

A3AverageMax = sum(A3WithC.A)/length(A3WithC.A);
A3AverageShift = sum(A3WithC.B)/length(A3WithC.B);
A3AverageSteepness = sum(A3WithC.C)/length(A3WithC.C);
disp("A3")
display([A3AverageMax,A3AverageShift,A3AverageSteepness])

A4AverageMax = sum(A4WithC.A)/length(A4WithC.A);
A4AverageShift = sum(A4WithC.B)/length(A4WithC.B);
A4AverageSteepness = sum(A4WithC.C)/length(A4WithC.C);
disp("A4")
display([A4AverageMax,A4AverageShift,A4AverageSteepness])

x = [0.005,0.02, 0.05, 0.09];

y1 = (A1AverageMax) ./ (1+(A1AverageShift)*exp(-(A1AverageSteepness)*(x)));
y2 = (A2AverageMax) ./ (1+(A2AverageShift)*exp(-(A2AverageSteepness)*(x)));
y3 = (A3AverageMax) ./ (1+(A3AverageShift)*exp(-(A3AverageSteepness)*(x)));
y4 = (A4AverageMax) ./ (1+(A4AverageShift)*exp(-(A4AverageSteepness)*(x)));


% CL1 = (24.683) ./ (1+(-2.1277)*exp(-(136.4132)*(x)));
% CL2 = (0.0078) ./ (1+(-0.9999)*exp(-(0.0009)*(x)));

% serrMax=std(A2AverageMax)/sqrt(length(A2AverageMax));
% serrShift=std(A2AverageShift)/sqrt(length(A2AverageShift));
% serrSteepness = std(A2AverageSteepness)/sqrt(length(averageSteepness));




figure
AOne = plot(x,y1);
hold on
ATwo =plot(x,y2);
AThree =plot(x,y3);
AFour = plot(x,y4);
legend([AOne,ATwo,AThree,AFour],["J1: 191 Females, 157 Males","J2: 27 Females, 49 Males","J3: 53 Females,59 Males","J4: 166 Females, 133 Males"])
title("Baseline Reaction Time Max Vs Shift Average Sigmoids")