function [] = createRadarPlotsFromAllFilesInCurrentFolder()
allExcelFiles = dir(strcat(pwd,"\*.xlsx"));

allZeroes = [0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0.];
allOnes = [1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1.];


allProbabilities = [];
allNames = {};
for i =1:length(allExcelFiles)
    tableOfClusterProbabilities = readtable(allExcelFiles(i).name);
    listOfAllProbabilities = tableOfClusterProbabilities.Probabilities;
    allProbabilities = [allProbabilities;listOfAllProbabilities.'];
%     display(allExcelFiles(i).name)
    formattedName = erase(allExcelFiles(i).name,"All Clusters");
    formattedName = erase(formattedName,".xlsx");
    formattedName = strrep(formattedName,"lg_boost_cluster_probabilities","lg boost cluster probabilities");
    allNames{end+1} = formattedName;
end
% display(allProbabilities)
figure
spider_plot(allProbabilities,...
'AxesLabels',{"Travel Pixel Cluster 1","Travel Pixel Cluster 2","Travel Pixel Cluster 3",...
"Stopping Points Cluster 1","Stopping Points Cluster 2","Stopping Points Cluster 3", ...
"Rotation Points Cluster 1","Rotation Points Cluster 2","Rotation Points Cluster 3","Rotation Points Cluster 4",...
"Reward Choice Cluster 1","Reward Choice Cluster 2","Reward Choice Cluster 3","Reward Choice Cluster 4"},...
'AxesLimits',[allZeroes;allOnes],'AxesRadial','off');
title("All")
% display(allNames)
legend(allNames,'Location', 'southoutside')
saveas(gcf,'All_Radar_Plots_Together.fig')
close all
end