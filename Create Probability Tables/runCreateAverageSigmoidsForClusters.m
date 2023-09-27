% tpTitles = ["A1.csv","A2.csv","A3.csv"];
% spTitles = ["D1.csv","D2.csv","D3.csv"];
% rpTitles = ["G1.csv","G2.csv","G3.csv","G4.csv"];
% % rpTitles = ["","","",""];
% rtTitles = ["J1.csv","J2.csv","J3.csv","J4.csv"];
% rcTitles = ["M1.csv","M2.csv","M3.csv","M4.csv"];
% 
% allTitles = {tpTitles,spTitles,rpTitles,rtTitles,rcTitles};
% 
% newTableLocations = ["C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Old Base Data\Travel Pixel Sigmoid Data",...
%     "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Old Base Data\Stopping Points Sigmoid Data",...
%     "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Old Base Data\Rotation Points Sigmoid Data",...
%     "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Old Base Data\Reaction Time Sigmoid Data",...
%     "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Old Base Data\Reward Choice Sigmoid Data",...
%     ];
% 
% 
% desiredTitlesList = ["Baseline Travel Pixel","Baseline Stopping Points","Baseline Rotation Points","Baseline Reaction Time","Baseline Reward Choice"];
% filePathWithClusterData = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Create Probability Tables\Baseline Clusters";
% 
% 
% 
% for j=1:length(allTitles)
%     createAverageSigmoidsForClusterGraphs(filePathWithClusterData,allTitles{j},newTableLocations(j),desiredTitlesList(j))
% end


% tpTitles = ["A1.xlsx","A2.xlsx","A3.xlsx"];
% spTitles = ["D1.xlsx","D2.xlsx","D3.xlsx"];
% % rpTitles = ["G1.xlsx","G2.xlsx","G3.xlsx","G4.xlsx"];
% % % rpTitles = ["","","",""];
% % rtTitles = ["J1.xlsx","J2.xlsx","J3.xlsx","J4.xlsx"];
% % rcTitles = ["M1.xlsx","M2.xlsx","M3.xlsx","M4.xlsx"];
% 
% allTitles = {tpTitles,spTitles,rpTitles,rtTitles,rcTitles};
% allTitles = {tpTitles,spTitles};
% 
% newTableLocations = ["C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Oxy\Travel Pixel Sigmoid Data",...
%     "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Oxy\Stopping Points Sigmoid Data",...
%     ];
% 
% 
% desiredTitlesList = ["Oxy Travel Pixel","Oxy Stopping Points"];
% filePathWithClusterData = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Create Probability Tables\oxy clusters";
% 
% 
% 
% for j=1:length(allTitles)
%     createAverageSigmoidsForClusterGraphs(filePathWithClusterData,allTitles{j},newTableLocations(j),desiredTitlesList(j),1)
% end
% 
% 
% tpTitles = ["A1.csv","A2.csv","A3.csv"];
% spTitles = ["D1.csv","D2.csv","D3.csv"];
% 
% allTitles = {tpTitles,spTitles};
% 
% newTableLocations = ["C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Old Base Data\Travel Pixel Sigmoid Data",...
%     "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Old Base Data\Stopping Points Sigmoid Data",...
%     ];
% 
% 
% desiredTitlesList = ["Baseline Travel Pixel","Baseline Stopping Points"];
% filePathWithClusterData = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Create Probability Tables\Baseline Clusters";
% 
% 
% 
% for j=1:length(allTitles)
%     createAverageSigmoidsForClusterGraphs(filePathWithClusterData,allTitles{j},newTableLocations(j),desiredTitlesList(j),1)
% end



% %% Create average sigmoids for stopping points and travel pixel 
% 
% tpTitles = ["A1.xlsx","A2.xlsx","A3.xlsx"];
% spTitles = ["D1.xlsx","D2.xlsx","D3.xlsx"];
% % rpTitles = ["G1.xlsx","G2.xlsx","G3.xlsx","G4.xlsx"];
% % % rpTitles = ["","","",""];
% % rtTitles = ["J1.xlsx","J2.xlsx","J3.xlsx","J4.xlsx"];
% % rcTitles = ["M1.xlsx","M2.xlsx","M3.xlsx","M4.xlsx"];
% 
% allTitles = {tpTitles,spTitles,rpTitles,rtTitles,rcTitles};
% allTitles = {tpTitles,spTitles};
% 
% newTableLocations = ["C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Oxy\Travel Pixel Sigmoid Data",...
%     "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Oxy\Stopping Points Sigmoid Data",...
%     ];
% 
% 
% desiredTitlesList = ["Oxy Travel Pixel","Oxy Stopping Points"];
% filePathWithClusterData = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Create Probability Tables\oxy clusters";
% 
% 
% 
% for j=1:length(allTitles)
%     createAverageSigmoidsForClusterGraphs(filePathWithClusterData,allTitles{j},newTableLocations(j),desiredTitlesList(j),0)
% end
% 
% 
% tpTitles = ["A1.csv","A2.csv","A3.csv"];
% spTitles = ["D1.csv","D2.csv","D3.csv"];
% 
% allTitles = {tpTitles,spTitles};
% 
% newTableLocations = ["C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Old Base Data\Travel Pixel Sigmoid Data",...
%     "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Old Base Data\Stopping Points Sigmoid Data",...
%     ];
% 
% 
% desiredTitlesList = ["Baseline Travel Pixel","Baseline Stopping Points"];
% filePathWithClusterData = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Create Probability Tables\Baseline Clusters";
% 
% 
% 
% for j=1:length(allTitles)
%     createAverageSigmoidsForClusterGraphs(filePathWithClusterData,allTitles{j},newTableLocations(j),desiredTitlesList(j),0)
% end

%% create average sigmoids for alcohol 


tpTitles = ["A1.xlsx","A2.xlsx","A3.xlsx"];


allTitles = {tpTitles};

newTableLocations = ["C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Boost and Etho\Travel Pixel Sigmoid Data",...
    ];


desiredTitlesList = ["Alcohol Travel Pixel"];
filePathWithClusterData = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Boost and Etho\All Clusters In Dataset";



for j=1:length(allTitles)
    createAverageSigmoidsForClusterGraphs(filePathWithClusterData,allTitles{j},newTableLocations(j),desiredTitlesList(j),1)
end


tpTitles = ["A1.csv","A2.csv","A3.csv"];


allTitles = {tpTitles};

newTableLocations = ["C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Old Base Data\Travel Pixel Sigmoid Data",...
    ];


desiredTitlesList = ["Baseline Travel Pixel"];
filePathWithClusterData = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Create Probability Tables\Baseline Clusters";



for j=1:length(allTitles)
    createAverageSigmoidsForClusterGraphs(filePathWithClusterData,allTitles{j},newTableLocations(j),desiredTitlesList(j),1)
end