function [] = createAverageSigmoidsForClusterGraphs(filePathWithClusterData,clustersYouWantToRead,filePathOfSigmoidData,desiredTitle,toLogOrNotToLog)

home = cd(filePathWithClusterData);
tablesOfClusters = cell(1,length(clustersYouWantToRead));
averageXs = zeros(1,length(clustersYouWantToRead));
averageYs = zeros(1,length(clustersYouWantToRead));
clusterLabels = cell(1,length(clustersYouWantToRead));
workingDir = cd("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Create Probability Tables");
% format required for new table "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Food Deprivation\Reaction Time Sigmoid Data"
newTable = getTable(filePathOfSigmoidData);
cd(workingDir)
newTable.Properties.VariableNames = ["A","B","C","clusterLabels"];
tableOfClustersRejoinedWithC = cell(1,length(clustersYouWantToRead)) ;
averageMax = zeros(1,length(clustersYouWantToRead));
averageShift = zeros(1,length(clustersYouWantToRead));
averageSteepness = zeros(1,length(clustersYouWantToRead));
finalYs = cell(1,length(clustersYouWantToRead));
x = [0.005,0.02, 0.05, 0.09];
positiveStdErrors = cell(1,length(clustersYouWantToRead));
negativeStdErrors = cell(1,length(clustersYouWantToRead));
for i=1:length(clustersYouWantToRead)
    standardErrors = zeros(1,length(x));
    tablesOfClusters{i} = readtable(clustersYouWantToRead(i));
    averageXs(i) = sum(tablesOfClusters{i}.clusterX) / length(tablesOfClusters{i}.clusterX);
    averageYs(i) = sum(tablesOfClusters{i}.clusterY) / length(tablesOfClusters{i}.clusterY);
    clusterLabels{i} = tablesOfClusters{i}.clusterLabels;
    tableOfClustersRejoinedWithC{i} = join(tablesOfClusters{i},newTable);
    averageMax(i) = sum(tableOfClustersRejoinedWithC{i}.A) / length(tableOfClustersRejoinedWithC{i}.A);
    averageShift(i) = sum(tableOfClustersRejoinedWithC{i}.B) / length(tableOfClustersRejoinedWithC{i}.B);
    averageSteepness(i) = sum(tableOfClustersRejoinedWithC{i}.C) / length(tableOfClustersRejoinedWithC{i}.C);

    standardErrors(1) = std(tableOfClustersRejoinedWithC{i}.A) / sqrt(length(tableOfClustersRejoinedWithC{i}.A)); 
    standardErrors(2) = std(tableOfClustersRejoinedWithC{i}.B) / sqrt(length(tableOfClustersRejoinedWithC{i}.A));
    standardErrors(3) = std(tableOfClustersRejoinedWithC{i}.C) / sqrt(length(tableOfClustersRejoinedWithC{i}.A));

    negativeys = (averageMax(i) - standardErrors(1)) ./ (1+(averageShift(i) - standardErrors(2))*exp(-(averageSteepness(i) -standardErrors(3))*(x)));
    finalYs{i} = averageMax(i) ./ (1+(averageShift(i))*exp(-(averageSteepness(i))*(x)));
    negativeStdErrors{i} = abs(finalYs{i} - negativeys);
    
end

figure
hold on
for i=1:length(finalYs)
    if toLogOrNotToLog==0
        xlabel("concentrations")
        ylabel(desiredTitle)
        errorbar(x,finalYs{i},negativeStdErrors{i})
    elseif toLogOrNotToLog ==1
        errorbar(x,log(finalYs{i}),log(negativeStdErrors{i}))
        xlabel("Concentrations")
        ylabel(strcat("Log(",desiredTitle,")"))
    end
end
legend(clustersYouWantToRead)
% format for desiredTitle: "Food Deprivation Reaction Time Max Vs Shift Average Sigmoids"
title(desiredTitle)
hold off;
cd(home)
end