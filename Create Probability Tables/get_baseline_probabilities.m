old_baseline = ["Old Base Data|Travel Pixel","Old Base Data|Stopping Points","Old Base Data|Rotation Points","Old Base Data|Reward Choice"];
old_base_Data = collectAllDataInAMap(old_baseline);

sizeOfOldBaseData = getSizeOfAllDataSets(old_base_Data);
sizeOfOldBaseDataClusters = getSizesOfEachCluster("Baseline Clusters");
probabilities = calculatePopulationProbabilities(sizeOfOldBaseDataClusters,sizeOfOldBaseData);
cluster_names = keys(probabilities).';
probabilities = values(probabilities).';
tableOfClusterProbabilities = table(cluster_names,probabilities);
display(tableOfClusterProbabilities);
writetable(tableOfClusterProbabilities,'old_baseline_cluster_probabilities.csv');

