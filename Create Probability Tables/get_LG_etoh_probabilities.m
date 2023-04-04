lg_etoh = ["lg_etoh|Travel Pixel","lg_etoh|Stopping Points","lg_etoh|Rotation Points","lg_etoh|Reward Choice"];
lg_etohData = collectAllDataInAMap(lg_etoh);
sizeOfLGEtoh= getSizeOfAllDataSets(lg_etohData);
sizeOfLGEtohClusters=getSizesOfEachCluster("Ig_etoh_clusters");
probabilities = calculatePopulationProbabilities(sizeOfLGEtohClusters,sizeOfLGEtoh);
Cluster_Names = keys(probabilities).';
Probabilities = values(probabilities).';
tableOfClusterProbabilities = table(Cluster_Names,Probabilities);
display(tableOfClusterProbabilities)
writetable(tableOfClusterProbabilities,'lg_etoh_cluster_probabilities.csv');
