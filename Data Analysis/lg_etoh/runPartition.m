% try
%     deleteTests
% catch
% end

listOfRats = ["aladdin";"fiona";"jafar";"jimi";"juana";"kryssia";"neftali";"raven";"scar";"simba"];
dirOfClusters = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\lg_etoh\All Clusters In Dataset";

% partitionDataByWeeks("All Radar Plots","All Probability Tables",7,"individual","dontcare",listOfRats,dirOfClusters)
% partitionDataByWeeks("All Radar Plots","All Probability Tables",14,"individual","dontcare",listOfRats,dirOfClusters)
% partitionDataByWeeks("All Radar Plots","All Probability Tables",21,"individual","dontcare",listOfRats,dirOfClusters)
partitionDataByWeeks("All Radar Plots","All Probability Tables",28,"individual","dontcare",listOfRats,dirOfClusters)