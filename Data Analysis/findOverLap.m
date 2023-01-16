cluster1RewardChoice = readtable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Reward Choice\Max Vs Shift Cluster 1.xlsx");
cluster1TravelPixel = readtable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Travel Pixel\Max Vs Shift Cluster 1.xlsx");

cluster2RewardChoice = readtable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Reward Choice\Max Vs Shift Cluster 2.xlsx");
cluster2TravelPixel = readtable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Travel Pixel\Max Vs Shift Cluster 2.xlsx");



cluster1RewardChoiceLabels = cluster1RewardChoice.clusterLabels;
cluster1TravelPixelLabels = cluster1TravelPixel.clusterLabels;


display(cluster1RewardChoiceLabels)
display(cluster1TravelPixelLabels)
overlapCount = 0;
for i=1:height(cluster1TravelPixelLabels)
    searchingValue = cluster1TravelPixelLabels{i,1};
    for j=1:height(cluster1RewardChoiceLabels)
        if strcmp(string(searchingValue),string(cluster1RewardChoiceLabels{j,1}))
            overlapCount = overlapCount+1;
        end
    end
end

cluster1TPInCluster1RC = (overlapCount/height(cluster1TravelPixelLabels)) *100;
disp(strcat(string(cluster1TPInCluster1RC)," Percent of travel pixel cluster 1 exists within reward choice cluster 1"))