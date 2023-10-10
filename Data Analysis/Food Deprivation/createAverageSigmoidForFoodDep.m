tpTitles = ["Travel Pixel Max Vs Shift Cluster 1.xlsx","Travel Pixel Max Vs Shift Cluster 2.xlsx","Travel Pixel Max Vs Shift Cluster 3.xlsx"];
spTitles = ["Stopping Points Max Vs Shift Cluster 1.xlsx","Stopping Points Max Vs Shift Cluster 2.xlsx","Stopping Points Max Vs Shift Cluster 3.xlsx"];

allTitles = {tpTitles,spTitles};

newTableLocations = ["C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Food Deprivation\Travel Pixel Sigmoid Data",...
    "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Food Deprivation\Stopping Points Sigmoid Data",...
    ];

desiredTitlesList = ["Food Deprivation Travel Pixel","Food Deprivation Stopping Points"];
filePathWithClusterData = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Food Deprivation";



for j=1:length(allTitles)
    createAverageSigmoidsForClusterGraphs(filePathWithClusterData,allTitles{j},newTableLocations(j),desiredTitlesList(j),1)
end