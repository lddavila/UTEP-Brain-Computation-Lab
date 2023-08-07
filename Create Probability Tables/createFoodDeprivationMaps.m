foodDeprivationDataSets =["Food Deprivation|Travel Pixel","Food Deprivation|Stopping Points", "Food Deprivation|Rotation Points","Food Deprivation|Reaction Time","Food Deprivation|Reward Choice"];
foodDepData = collectAllDataInAMap(foodDeprivationDataSets);
% foodDeprDirectory = storeClustersInNewDirectory('Food Deprivation');
% % createPlots(foodDepData('Food Deprivation|Travel Pixel'),3,'Travel Pixel','A',foodDeprDirectory,'Food Deprivation')
% % createPlots(foodDepData('Food Deprivation|Stopping Points'),3,'Stopping Points','D',foodDeprDirectory,'Food Deprivation');
% % createPlots(foodDepData('Food Deprivation|Rotation Points'),3,'Rotation Points','G',foodDeprDirectory,'Food Deprivation');
% % createPlots(foodDepData('Food Deprivation|Reaction Time'),3,'Reaction Time','J',foodDeprDirectory,'Food Deprivation');
% % createPlots(foodDepData('Food Deprivation|Reward Choice'),3,'Reward Choice','M',foodDeprDirectory,'Food Deprivation');
sizesOfFoodDepData = getSizeOfAllDataSets(foodDepData);


sizesOfEachClusterInFoodDepData = getSizesOfEachCluster("Food Deprivation");

probabilities = calculatePopulationProbabilities(sizesOfEachClusterInFoodDepData,sizesOfFoodDepData);



Cluster_Names = keys(probabilities).';
Probabilities = values(probabilities).';
tableOfClusterProbabilities = table(Cluster_Names,Probabilities);

writetable(tableOfClusterProbabilities,'Food_Deprivation_cluster_probabilities.csv');