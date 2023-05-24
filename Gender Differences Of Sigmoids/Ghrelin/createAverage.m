A1 = readtable("A1.xlsx");
A2 = readtable('A2.xlsx');
A3 = readtable('A3.xlsx');


A1AverageX = sum(A1.clusterX)/length(A1.clusterX);
A1AverageY = sum(A1.clusterY)/length(A1.clusterY);

A2averageX = sum(A2.clusterX)/length(A2.clusterX);
A2averageY = sum(A2.clusterY)/length(A2.clusterY);

A3averageX = sum(A3.clusterX)/length(A3.clusterX);
A3averageY = sum(A3.clusterY)/length(A3.clusterY);


% somethingx = [(1:length(x)).' x, mean(x,2)];
% somethingy = [(1:length(y)).' y, mean(y,2)];
% display(somethingx)
% display(averageX)
% display(averageY)
% x = rand(10,2);
% y = rand(10,2);
% display([(1:10).' x mean(x,2)])
% display([A2averageX,A2averageY])
% display([A3averageX,A3averageY])
% figure;
% dg_plotShadeCL(axes, somethingx)
% 
% 
% hold on
% dg_plotShadeCL(gca, somethingy, 'Color', [1 0 0])
% 

A1Labels = A1.clusterLabels;
A2Labels = A2.clusterLabels;
A3Labels = A2.clusterLabels;

newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Ghrelin\Travel Pixel Sigmoid Data");

newTable.Properties.VariableNames = ["A","B","C","clusterLabels"];
display(newTable)

A1WithC = join(A1,newTable);
A2WithC = join(A2,newTable);
A3WithC = join(A3,newTable);

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

x = [0.005,0.02, 0.05, 0.09];
% x = [0:.001:0.09];
y1 = (24.683) ./ (1+(-2.1277)*exp(-(136.4132)*(x)));
y2 = (0.0078) ./ (1+(-0.9999)*exp(-(0.0009)*(x)));

y1 = (A1AverageMax) ./ (1+(A1AverageShift)*exp(-(A1AverageSteepness)*(x)));
y2 = (A2AverageMax) ./ (1+(A2AverageShift)*exp(-(A2AverageSteepness)*(x)));
y3 = (A3AverageMax) ./ (1+(A3AverageShift)*exp(-(A3AverageSteepness)*(x)));


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
legend([AOne,ATwo,AThree],["A1: 2 Females, 1 Male","A2: 11 Females, 21 Males","A3: 34 Females, 12 Males"])
title("Ghrelin Travel Pixel Max Vs Shift Average Sigmoids")