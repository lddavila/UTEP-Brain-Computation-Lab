%use this file to find radar plots which are most similar and most different based off of euclidian distance

directoryOfAlcoholRadarPlots = "..\Data Analysis\All Alcohol Probability Tables";
directoryOfBaseDataRadarPlots = "..\Data Analysis\Old Base Data\All Probability Tables 28d";
%modify the above directories to point towards the folder All Probability Tables On Your Local Machine. 
allRadarPlotsInAlc1 = ls(strcat(directoryOfAlcoholRadarPlots,"\*.xlsx"));
allRadarPlotsInBase = ls(strcat(directoryOfBaseDataRadarPlots,"\*.xlsx"));

listOfRadarPlots = allRadarPlotsInBase;
currentFile = directoryOfBaseDataRadarPlots;


biggestEucDistance = 0;
smallestEucDistance = 100000000000;
biggestDistanceFileNames = '';
smallestDistanceFileNAmes = '';
finalFirstProbabilities = [];
finalFirstSmallestProbabilities = [];
finalSecondProbabilities = [];
finalSecondSmallestProbabilities = [];
finalName = '';
finalSmallestName = '';
lastBinYouWantToLookAt = 3;
for i=1:4:size(listOfRadarPlots,1)

    %disp(allRadarPlotsInAlc1(i,:))
    name = split(listOfRadarPlots(i,:)," ");
    name = name{1};
    %disp(name)
%     disp(strcat(listOfRadarPlots,"\",name,"*"))
    allFilesOfCurrentRat = ls(strcat(currentFile,"\",name,"*.xlsx"));
%     disp(allFilesOfCurrentRat)
    if strcmpi(name,"raven") || strcmpi(name,"buttercup") || strcmpi(name,"ken") || strcmpi(name,"woody") || strcmpi(name,"raissa") || strcmpi(name,"pepper") ||strcmpi(name,"buzz")  || strcmpi(name,"slinky") || strcmpi(name,"trixie") || strcmpi(name,"wanda") ...
            || strcmpi(name,"captain") || strcmpi(name,"vision") || strcmpi(name,"harley") || strcmpi(name,"rex") || strcmpi(name,"barbie") ...
            ||strcmpi(name,"bopeep") ||strcmpi(name,"monster")
      
        continue
    end
    firstProbabilities = readtable(strcat(currentFile,"\",allFilesOfCurrentRat(1,:))).Probabilities.';
    firstProbabilities(isnan(firstProbabilities)) = 0;
    lastProbabilities = readtable(strcat(currentFile,"\",allFilesOfCurrentRat(lastBinYouWantToLookAt,:))).Probabilities.';
    lastProbabilities(isnan(lastProbabilities)) = 0;

    %disp(firstProbabilities)
    %disp(lastProbabilities)
    distanceBetween = sqrt(sum((firstProbabilities - lastProbabilities) .^ 2));
    if distanceBetween > biggestEucDistance
        biggestEucDistance = distanceBetween;
        biggestDistanceFileNames = string(allFilesOfCurrentRat(1,:));
        finalFirstProbabilities = firstProbabilities;
        finalSecondProbabilities = lastProbabilities;
        finalName = name;
    end

    if distanceBetween < smallestEucDistance
        smallestEucDistance = distanceBetween;
        smallestDistanceFileNAmes = string(allFilesOfCurrentRat(1,:));
        finalFirstSmallestProbabilities = firstProbabilities;
        finalSecondSmallestProbabilities = lastProbabilities;
        finalSmallestName = name;
    end
    


end

% disp(biggestEucDistance)
% disp(biggestDistanceFileNames)
% disp(finalFirstProbabilities)
% disp(finalSecondProbabilities)
% disp(finalName)

allZeroes = [0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0.];
allOnes = [1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1.];
figure
spider_plot([finalFirstProbabilities;finalSecondProbabilities],...
'AxesLabels',{"Travel Pixel Cluster 1","Travel Pixel Cluster 2","Travel Pixel Cluster 3",...
"Stopping Points Cluster 1","Stopping Points Cluster 2","Stopping Points Cluster 3", ...
"Rotation Points Cluster 1","Rotation Points Cluster 2","Rotation Points Cluster 3","Rotation Points Cluster 4",...
"Reward Choice Cluster 1","Reward Choice Cluster 2","Reward Choice Cluster 3","Reward Choice Cluster 4"},...
'AxesLimits',[allZeroes;allOnes],'AxesRadial','off');
legend({strcat("First ",finalName),strcat("Second ",finalName)}, 'Location', 'southoutside');
title("Biggest Euclidian Difference ")






figure
spider_plot([finalFirstSmallestProbabilities;finalSecondSmallestProbabilities],...
'AxesLabels',{"Travel Pixel Cluster 1","Travel Pixel Cluster 2","Travel Pixel Cluster 3",...
"Stopping Points Cluster 1","Stopping Points Cluster 2","Stopping Points Cluster 3", ...
"Rotation Points Cluster 1","Rotation Points Cluster 2","Rotation Points Cluster 3","Rotation Points Cluster 4",...
"Reward Choice Cluster 1","Reward Choice Cluster 2","Reward Choice Cluster 3","Reward Choice Cluster 4"},...
'AxesLimits',[allZeroes;allOnes],'AxesRadial','off');
legend({strcat("First ",finalSmallestName),strcat("Second ",finalSmallestName)}, 'Location', 'southoutside');
title("Smallest Euclidian Difference ")
