function [] = getEuclidianDistanceFromAllFoldersInCurrentDir(listOfRats,binSize)
% listOfAllFolders = dir(strcat(pwd,"\**\*.xlsx"));
euclidianDistances = [];
for j=1:length(listOfRats)
    disp(listOfRats(j))
    biggestBinNumber =1;
    listOfAllFolders = dir(strcat(pwd,"\",listOfRats(j),"\*.xlsx"));

    firstTable = readtable(strcat(pwd,"\",listOfRats(j),"\",listOfAllFolders(1).name));
    firstProbabilities = firstTable.Probabilities.';
    firstProbabilities(isnan(firstProbabilities))=0;
    display(biggestBinNumber)
    disp("Reading the following:")
    disp(strcat(pwd,"\",listOfRats(j),"\","All Clusters Bin Number ", string(length(listOfAllFolders))," Of ",string(binSize)," Days lg_boost_cluster_probabilities.xlsx"))
    secondTable = readtable(strcat(pwd,"\",listOfRats(j),"\","All Clusters Bin Number ", string(length(listOfAllFolders))," Of ",string(binSize)," Days lg_boost_cluster_probabilities.xlsx"));
    secondProbabilities = secondTable.Probabilities.';
    secondProbabilities(isnan(secondProbabilities))=0;

    display(firstProbabilities)
    display(secondProbabilities)
    vector1 = firstProbabilities(1,1:3);
    vector2 = secondProbabilities(1,1:3);

    difference = vector1-vector2;
    distance = sqrt(difference * difference');
    euclidianDistances = [euclidianDistances;distance];
end
figure
histogram(euclidianDistances)
title(strcat("Travel Pixel Bin Size = ",string(binSize)," Days"))
saveas(gcf,strcat("Travel Pixel Bin Size = ",string(binSize),"Days Histogram.fig"))
close all
edTable = table(euclidianDistances,listOfRats.');
writetable(edTable,"Euclidian Distances of this subset.xlsx")
end