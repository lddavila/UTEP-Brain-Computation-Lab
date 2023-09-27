function [] = getEuclidianDistanceFromAllFoldersInCurrentDir(listOfRats,binSize)
% listOfAllFolders = dir(strcat(pwd,"\**\*.xlsx"));
euclidianDistances = [];
for j=1:length(listOfRats)
    disp(listOfRats(j))
    allProbabilities = [];
    biggestBinNumber =1;
    listOfAllFolders = dir(strcat(pwd,"\",listOfRats(j),"\*.xlsx"));
    display(length(listOfAllFolders))
    for i=1:length(listOfAllFolders)
        currentBin= strcat(pwd,"\",listOfRats(j),"\",listOfAllFolders(i).name);
        currentBin = split(currentBin," ");
%         display(currentBin)
        currentBin = str2double(currentBin(9));
        if currentBin>biggestBinNumber
            biggestBinNumber=currentBin;
        end
    end
    firstTable = readtable(strcat(pwd,"\",listOfRats(j),"\",listOfAllFolders(1).name));
    firstProbabilities = firstTable.Probabilities.';
    firstProbabilities(isnan(firstProbabilities))=0;
    display(biggestBinNumber)
    secondTable = readtable(strcat(pwd,"\",listOfRats(j),"\","All Clusters Bin Number ", string(biggestBinNumber)," Of ",string(binSize)," Days lg_boost_cluster_probabilities.xlsx"));
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
end