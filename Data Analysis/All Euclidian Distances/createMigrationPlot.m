%% Boost and Ethonal Travel Pixel
boostAndEthonal = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Boost and Etho\All Clusters In Dataset";
baseline = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Old Base Data\Baseline Clusters";

allBaselineTravelPixel = [readtable(strcat(baseline,"\A1.xlsx"));readtable(strcat(baseline,"\A2.xlsx"));readtable(strcat(baseline,"\A3.xlsx"))];
allBaselineTravelPixelX = allBaselineTravelPixel.clusterX;
allBaselineTravelPixelY = allBaselineTravelPixel.clusterY;

allBoostAndEthonal = [readtable(strcat(boostAndEthonal,"\A1.xlsx"));readtable(strcat(boostAndEthonal,"\A2.xlsx"));readtable(strcat(boostAndEthonal,"\A3.xlsx"))];
allBoostAndEthonalX = allBoostAndEthonal.clusterX;
allBoostAndEthonalY = allBoostAndEthonal.clusterY;

figure
scatter(allBoostAndEthonalX,allBoostAndEthonalY,'blue');
hold on
scatter(allBaselineTravelPixelX,allBaselineTravelPixelY,'red')
xVsY = [allBaselineTravelPixelX,allBaselineTravelPixelY];
numberOfClusters = 3;
x = 1;
[centers,U] = fcm(xVsY,numberOfClusters);
maxU = max(U);

for i = 1:numberOfClusters
    indexes = find(U(i,:)==maxU);
    plot(centers(i,1),centers(i,2),'xg','MarkerSize',15,'LineWidth',3)
end

disp(calculate_mpc(U))
xVsY = [allBoostAndEthonalX,allBoostAndEthonalY];
numberOfClusters = 3;
x = 1;
[centers,U] = fcm(xVsY,numberOfClusters);
maxU = max(U);
plotColors = ['or','og','ob','oc','om','oy',"#EDB120", "#7E2F8E","#D95319","#A2142F" ];
plotCounter = 1;
for i = 1:numberOfClusters
    indexes = find(U(i,:)==maxU);
    plot(centers(i,1),centers(i,2),'xk','MarkerSize',15,'LineWidth',3)
end

disp(calculate_mpc(U))
legend("Boost and Ethonal","Baseline","","","","","","")
title("Travel Pixel Boost And Ethonal | Baseline ")

%% Boost and Etho Stopping Points
boostAndEthonal = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Boost and Etho\All Clusters In Dataset";
baseline = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Old Base Data\Baseline Clusters";

allBaselineTravelPixel = [readtable(strcat(baseline,"\D1.xlsx"));readtable(strcat(baseline,"\D2.xlsx"));readtable(strcat(baseline,"\D3.xlsx"))];
allBaselineTravelPixelX = allBaselineTravelPixel.clusterX;
allBaselineTravelPixelY = allBaselineTravelPixel.clusterY;

allBoostAndEthonal = [readtable(strcat(boostAndEthonal,"\D1.xlsx"));readtable(strcat(boostAndEthonal,"\D2.xlsx"));readtable(strcat(boostAndEthonal,"\D3.xlsx"))];
allBoostAndEthonalX = allBoostAndEthonal.clusterX;
allBoostAndEthonalY = allBoostAndEthonal.clusterY;

figure
scatter(allBoostAndEthonalX,allBoostAndEthonalY,'blue');
hold on
scatter(allBaselineTravelPixelX,allBaselineTravelPixelY,'red')
xVsY = [allBaselineTravelPixelX,allBaselineTravelPixelY];
numberOfClusters = 3;
x = 1;
[centers,U] = fcm(xVsY,numberOfClusters);
maxU = max(U);

for i = 1:numberOfClusters
    indexes = find(U(i,:)==maxU);
    plot(centers(i,1),centers(i,2),'xg','MarkerSize',15,'LineWidth',3)
end

disp(calculate_mpc(U))
xVsY = [allBoostAndEthonalX,allBoostAndEthonalY];
numberOfClusters = 3;
x = 1;
[centers,U] = fcm(xVsY,numberOfClusters);
maxU = max(U);
plotColors = ['or','og','ob','oc','om','oy',"#EDB120", "#7E2F8E","#D95319","#A2142F" ];
plotCounter = 1;
for i = 1:numberOfClusters
    indexes = find(U(i,:)==maxU);
    plot(centers(i,1),centers(i,2),'xk','MarkerSize',15,'LineWidth',3)
end

disp(calculate_mpc(U))
legend("Boost and Ethonal","Baseline","","","","","","")
title("Stopping Points Boost And Ethonal | Baseline ")
%% Oxy Travel Pixel

boostAndEthonal = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Oxy\All Clusters In Dataset";
baseline = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Old Base Data\Baseline Clusters";

allBaselineTravelPixel = [readtable(strcat(baseline,"\A1.xlsx"));readtable(strcat(baseline,"\A2.xlsx"));readtable(strcat(baseline,"\A3.xlsx"))];
allBaselineTravelPixelX = allBaselineTravelPixel.clusterX;
allBaselineTravelPixelY = allBaselineTravelPixel.clusterY;

allBoostAndEthonal = [readtable(strcat(boostAndEthonal,"\A1.xlsx"));readtable(strcat(boostAndEthonal,"\A2.xlsx"));readtable(strcat(boostAndEthonal,"\A3.xlsx"))];
allBoostAndEthonalX = allBoostAndEthonal.clusterX;
allBoostAndEthonalY = allBoostAndEthonal.clusterY;

figure
scatter(allBoostAndEthonalX,allBoostAndEthonalY,'blue');
hold on
scatter(allBaselineTravelPixelX,allBaselineTravelPixelY,'red')
xVsY = [allBaselineTravelPixelX,allBaselineTravelPixelY];
numberOfClusters = 3;
x = 1;
[centers,U] = fcm(xVsY,numberOfClusters);
maxU = max(U);

for i = 1:numberOfClusters
    indexes = find(U(i,:)==maxU);
    plot(centers(i,1),centers(i,2),'xg','MarkerSize',15,'LineWidth',3)
end

disp(calculate_mpc(U))
xVsY = [allBoostAndEthonalX,allBoostAndEthonalY];
numberOfClusters = 3;
x = 1;
[centers,U] = fcm(xVsY,numberOfClusters);
maxU = max(U);
plotColors = ['or','og','ob','oc','om','oy',"#EDB120", "#7E2F8E","#D95319","#A2142F" ];
plotCounter = 1;
for i = 1:numberOfClusters
    indexes = find(U(i,:)==maxU);
    plot(centers(i,1),centers(i,2),'xk','MarkerSize',15,'LineWidth',3)
end
disp(calculate_mpc(U))
legend("Oxy","Baseline","","","","","","")
title("Travel Pixel Oxy | Baseline ")

%% Boost and Etho Stopping Points
boostAndEthonal = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Oxy\All Clusters In Dataset";
baseline = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Old Base Data\Baseline Clusters";

allBaselineTravelPixel = [readtable(strcat(baseline,"\D1.xlsx"));readtable(strcat(baseline,"\D2.xlsx"));readtable(strcat(baseline,"\D3.xlsx"))];
allBaselineTravelPixelX = allBaselineTravelPixel.clusterX;
allBaselineTravelPixelY = allBaselineTravelPixel.clusterY;

allBoostAndEthonal = [readtable(strcat(boostAndEthonal,"\D1.xlsx"));readtable(strcat(boostAndEthonal,"\D2.xlsx"));readtable(strcat(boostAndEthonal,"\D3.xlsx"))];
allBoostAndEthonalX = allBoostAndEthonal.clusterX;
allBoostAndEthonalY = allBoostAndEthonal.clusterY;

figure
scatter(allBoostAndEthonalX,allBoostAndEthonalY,'blue');
hold on
scatter(allBaselineTravelPixelX,allBaselineTravelPixelY,'red')
xVsY = [allBaselineTravelPixelX,allBaselineTravelPixelY];
numberOfClusters = 3;
x = 1;
[centers,U] = fcm(xVsY,numberOfClusters);
maxU = max(U);

for i = 1:numberOfClusters
    indexes = find(U(i,:)==maxU);
    plot(centers(i,1),centers(i,2),'xg','MarkerSize',15,'LineWidth',3)
end

disp(calculate_mpc(U))
xVsY = [allBoostAndEthonalX,allBoostAndEthonalY];
numberOfClusters = 3;
x = 1;
[centers,U] = fcm(xVsY,numberOfClusters);
maxU = max(U);
plotColors = ['or','og','ob','oc','om','oy',"#EDB120", "#7E2F8E","#D95319","#A2142F" ];
plotCounter = 1;
for i = 1:numberOfClusters
    indexes = find(U(i,:)==maxU);
    plot(centers(i,1),centers(i,2),'xk','MarkerSize',15,'LineWidth',3)
end

disp(calculate_mpc(U))
legend("Oxy","Baseline","","","","","","")
title("Stopping Points Oxy | Baseline ")