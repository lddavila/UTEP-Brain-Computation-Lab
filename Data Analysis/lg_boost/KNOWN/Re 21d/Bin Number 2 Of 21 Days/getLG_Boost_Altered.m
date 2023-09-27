%this is an altered version og get_LG_boost_probabilities.m
%it has been modified to work with paritionDataByWeeks.m
%it uses the collectAllDataInAMapAltered.m which has also been altered
function [] = getLG_Boost_Altered(nameOfFolderWithClusters,radarPlotFolder,probTablesFolder)
lg_boost = ["lg_boost|TP","lg_boost|SP","lg_boost|RP","lg_boost|RC"];
lg_boost_Data = collectAllDataInAMapAltered(lg_boost);
% disp("Output of collectAllDataInAMapAltered")
% display([keys(lg_boost_Data).',values(lg_boost_Data).'])

sizeOfLGBoost= getSizeOfAllDataSets(lg_boost_Data);
% disp("Output of getSizeOfAllDataSets")
% display([keys(sizeOfLGBoost).',values(sizeOfLGBoost).'])
sizeOfLGBoostClusters=getSizesOfEachCluster(nameOfFolderWithClusters);
% disp("Output of getSizesOfEachCluster")
% display(keys(sizeOfLGBoostClusters).',values(sizeOfLGBoostClusters).')
probabilities = calculatePopulationProbabilitiesAltered(sizeOfLGBoostClusters,sizeOfLGBoost);
% disp("Output of calculatePopulationProbabilitiesAltered")
% display(keys(probabilities).',values(probabilities).')
Cluster_Names = keys(probabilities).';
Probabilities = values(probabilities).';
tableOfClusterProbabilities = table(Cluster_Names,Probabilities);
% display(tableOfClusterProbabilities)
writetable(tableOfClusterProbabilities,strcat(nameOfFolderWithClusters,' lg_boost_cluster_probabilities.xlsx'));
writetable(tableOfClusterProbabilities,strcat(probTablesFolder,"\",nameOfFolderWithClusters,' lg_boost_cluster_probabilities.xlsx'));
% display(tableOfClusterProbabilities.Probabilities)
listOfAllProbabilities = tableOfClusterProbabilities.Probabilities;
allProbabilities = [];
for i=1:length(listOfAllProbabilities)
%     display(listOfAllProbabilities{i})
    allProbabilities = [allProbabilities,listOfAllProbabilities{i}];
end
allZeroes = [0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0.];
allOnes = [1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1.];
old_baseline_probabilities = [0.12935883,0.410573678,0.460067492,0.122377622,0.697552448,0.18006993,0.709352518,0.143884892,0.01294964,0.13381295,0.035555556,0.434666667,0.145777778,0.384];

figure
spider_plot([old_baseline_probabilities;...
    allProbabilities],...
'AxesLabels',{"Travel Pixel Cluster 1","Travel Pixel Cluster 2","Travel Pixel Cluster 3",...
"Stopping Points Cluster 1","Stopping Points Cluster 2","Stopping Points Cluster 3", ...
"Rotation Points Cluster 1","Rotation Points Cluster 2","Rotation Points Cluster 3","Rotation Points Cluster 4",...
"Reward Choice Cluster 1","Reward Choice Cluster 2","Reward Choice Cluster 3","Reward Choice Cluster 4"},...
'AxesLimits',[allZeroes;allOnes],'AxesRadial','off');
title(nameOfFolderWithClusters)
legend('Baseline','Lg Boost','Location', 'southoutside')
saveas(gcf,strcat(radarPlotFolder,"\",nameOfFolderWithClusters,'.fig'))
close all
end