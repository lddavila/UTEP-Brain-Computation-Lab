ghrelinDataSets =["Ghrelin|Travel Pixel","Ghrelin|Stopping Points","Ghrelin|Rotation Points" ,"Ghrelin|Reaction Time" ,"Ghrelin|Reward Choice"];
ghrelinData = collectAllDataInAMap(ghrelinDataSets);
ghrelinDirectory = storeClustersInNewDirectory('Ghrelin');
% assignin('base','ghrelinData',ghrelinData)
% % createPlots(ghrelinData("Ghrelin|Travel Pixel"),3,'Travel Pixel','A',ghrelinDirectory,'Ghrelin')
% % createPlots(ghrelinData('Ghrelin|Stopping Points'),3,'Stopping Points','D',ghrelinDirectory,'Ghrelin');
% % createPlots(ghrelinData('Ghrelin|Rotation Points'),4,'Rotation Points','G',ghrelinDirectory,'Ghrelin');
% % createPlots(ghrelinData('Ghrelin|Reaction Time'),3,'Reaction Time','J',ghrelinDirectory,'Ghrelin');
% % createPlots(ghrelinData('Ghrelin|Reward Choice'),3,'Reward Choice','M',ghrelinDirectory,'Ghrelin');
% 
% sizesOfGhrelinData = getSizeOfAllDataSets(ghrelinData);
% sizesOfEachClusterInGhrelinData =getSizesOfEachCluster("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Find Euclidian Distances From Baseline to Experiments\Create Probability Tables\Ghrelin");
% probabilitiesOfEachClusterInGhrelinData = calculatePopulationProbabilities(sizesOfEachClusterInGhrelinData,sizesOfGhrelinData);
% assignin('base','probabilitiesOfEachClusterInGhrelinData',probabilitiesOfEachClusterInGhrelinData)

eachRatsAppearnecesInGhrelinData = countRatAppearencesInDataset(ghrelinData);
assignin('base','eachRatsAppearnecesInGhrelinData',eachRatsAppearnecesInGhrelinData)
eachRatsAppearencesInGhrelinDataClusters = countRatAppearencesInCluster(ghrelinDirectory);
assignin('base','eachRatsAppearencesInGhrelinDataClusters',eachRatsAppearencesInGhrelinDataClusters)