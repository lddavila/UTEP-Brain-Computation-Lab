locationOfFoodDepData = 'C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Create Probability Tables\Food Deprivation';

a1 = readtable(strcat(locationOfFoodDepData,"\M1.xlsx"));
a1.clusterLabels = string(a1.clusterLabels);
a2 = readtable(strcat(locationOfFoodDepData,"\M2.xlsx"));
a2.clusterLabels = string(a2.clusterLabels);
a3 = readtable(strcat(locationOfFoodDepData,"\M3.xlsx"));
a3.clusterLabels = string(a3.clusterLabels);
a4 = readtable(strcat(locationOfFoodDepData,"\M4.xlsx"));
a4.clusterLabels = string(a4.clusterLabels);

alla = [a1;a2;a3;a4];
% disp(alla)

alla.clusterLabels = string(alla.clusterLabels);
% disp(alla)



numberOfTimesAladdinAppearsInA = sum(contains(alla.clusterLabels,"aladdin"));
numberOfTimesAladdinAppearsInA1 = sum(contains(a1.clusterLabels,"aladdin"));
numberOfTimesAladdinAppearsInA2 = sum(contains(a2.clusterLabels,"aladdin"));
numberOfTimesAladdinAppearsInA3 = sum(contains(a3.clusterLabels,"aladdin"));
numberOfTimesAladdinAppearsInA4 = sum(contains(a4.clusterLabels,"aladdin"));

% disp([numberOfTimesAladdinAppearsInA1 / numberOfTimesAladdinAppearsInA,numberOfTimesAladdinAppearsInA2 / numberOfTimesAladdinAppearsInA,numberOfTimesAladdinAppearsInA3 / numberOfTimesAladdinAppearsInA])
disp([numberOfTimesAladdinAppearsInA1 / numberOfTimesAladdinAppearsInA,numberOfTimesAladdinAppearsInA2 / numberOfTimesAladdinAppearsInA,numberOfTimesAladdinAppearsInA3 / numberOfTimesAladdinAppearsInA,numberOfTimesAladdinAppearsInA4 / numberOfTimesAladdinAppearsInA])
