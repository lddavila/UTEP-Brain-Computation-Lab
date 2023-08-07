lg_boost = ["lg_boost|Travel Pixel","lg_boost|Stopping Points","lg_boost|Rotation Points","lg_boost|Reward Choice"];
lg_boostData = collectAllDataInAMap(lg_boost);


sizeOfLGBoost= getSizeOfAllDataSets(lg_boost_Data);


sizeOfLGBoostClusters=getSizesOfEachCluster("lg_boost clusters");


probabilities = calculatePopulationProbabilities(sizeOfLGBoostClusters,sizeOfLGBoost);
Cluster_Names = keys(probabilities).';
Probabilities = values(probabilities).';
tableOfClusterProbabilities = table(Cluster_Names,Probabilities);
display(tableOfClusterProbabilities)
writetable(tableOfClusterProbabilities,'lg_boost_cluster_probabilities.csv');

