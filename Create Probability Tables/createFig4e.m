tpTitles = ["A1.csv","A2.csv","A3.csv"];


allTitles = {tpTitles};

newTableLocations = ["..\Data Analysis\Old Base Data\Travel Pixel Sigmoid Data",...
    ];

desiredTitlesList = ["Baseline Travel Pixel"];
filePathWithClusterData = "Baseline Clusters";

for j=1:length(allTitles)
    createAverageSigmoidsForClusterGraphs(filePathWithClusterData,allTitles{j},newTableLocations(j),desiredTitlesList(j),0)
end