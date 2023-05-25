%this is all the experiments plus the baseline data we need
baselineDataSets = ["Old Base Data|Travel Pixel","Old Base Data|Stopping Points","Old Base Data|Rotation Points","Old Base Data|Reaction Time","Old Base Data|Reward Choice"];
baseData = collectAllDataInAMap(baselineDataSets);
% assignin('base','baseData',baseData)
% baselineDirectory = storeClustersInNewDirectory("Baseline");
% createPlots(baseData('Old Base Data|Travel Pixel'),3,'Travel Pixel','A',baselineDirectory,'Baseline')
% createPlots(baseData('Old Base Data|Stopping Points'),3,'Stopping Points','D',baselineDirectory,'Baseline');
% createPlots(baseData('Old Base Data|Rotation Points'),4,'Rotation Points','G',baselineDirectory,'Baseline');
% createPlots(baseData('Old Base Data|Reaction Time'),4,'Reaction Time','J',baselineDirectory,'Baseline');
% createPlots(baseData('Old Base Data|Reward Choice'),4,'Reward Choice','M',baselineDirectory,'Baseline');


sizesOfBaseData = getSizeOfAllDataSets(baseData);


sizesOfEachClusterInBaseData = getSizesOfEachCluster("C:\Users\ldd77\OneDrive\Desktop\" + ...
    "UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\" + ...
    "Find Euclidian Distances From Baseline to Experiments" + ...
    "\Create Probability Tables\Baseline");


probabilitiesOfEachClusterInBaseData = calculatePopulationProbabilities(sizesOfEachClusterInBaseData,sizesOfBaseData);
assignin('base','probabilitiesOfEachClusterInBaseData',probabilitiesOfEachClusterInBaseData)

eachRatsAppearencesInBaselineData = countRatAppearencesInDataset(baseData);
assignin('base',"eachRatsAppearencesInBaselineData",eachRatsAppearencesInBaselineData)
eachRatsAppearencesInBaselineDataClusters = countRatAppearencesInCluster(baselineDirectory);
assignin('base','eachRatsAppearencesInBaselineDataClusters',eachRatsAppearencesInBaselineDataClusters)