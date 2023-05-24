
oxy = ["Oxy|Travel Pixel","Oxy|Stopping Points","Oxy|Rotation Points","Oxy|Reward Choice"];
oxyData = collectAllDataInAMap(oxy);
sizeOfOxy= getSizeOfAllDataSets(oxyData);
sizeOfOxyClusters=getSizesOfEachCluster("oxy clusters");
probabilities = calculatePopulationProbabilities(sizeOfOxyClusters,sizeOfOxy);
Cluster_Names = keys(probabilities).';
Probabilities = values(probabilities).';
tableOfClusterProbabilities = table(Cluster_Names,Probabilities);
display(tableOfClusterProbabilities)
writetable(tableOfClusterProbabilities,'oxy_cluster_probabilities.csv');