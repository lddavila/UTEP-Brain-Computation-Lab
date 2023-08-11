function[mapOfProbabilities]=calculatePopulationProbabilitiesAltered(mapOfAllClusterSizes,mapOfAllDataSetSizes)
clusterSizeKeys ={'A1','A2','A3',...
    'D1','D2','D3','G1','G2','G3','G4',...
    'M1','M2','M3','M4'};
%         display(dataSetSizeKeys)
%         display(clusterSizeKeys)
mapOfProbabilities = containers.Map('KeyType','char','ValueType','any');
%         display(length(clusterSizeKeys))
for i=1:length(clusterSizeKeys)
    %             display(i)
    currentCluster = char(clusterSizeKeys(i));
    %             display(currentCluster)
    %             display(class(currentCluster))
    if contains(currentCluster,"A")
        %                 display(currentCluster)
        %                 display(clusterSizeKeys(i))
        %                 display(mapOfAllDataSetSizes('Travel Pixel'));
        mapOfProbabilities(currentCluster) = mapOfAllClusterSizes(currentCluster) / mapOfAllDataSetSizes('TP');
    elseif contains(currentCluster,"D")
        mapOfProbabilities(currentCluster) = mapOfAllClusterSizes(currentCluster) / mapOfAllDataSetSizes('SP');
    elseif contains(currentCluster,"G")
        mapOfProbabilities(currentCluster) = mapOfAllClusterSizes(currentCluster) / mapOfAllDataSetSizes('RP');
    elseif contains(currentCluster,"J")
        mapOfProbabilities(currentCluster) = mapOfAllClusterSizes(currentCluster) / mapOfAllDataSetSizes('RT');
    elseif contains(currentCluster,"M")      
        mapOfProbabilities(currentCluster) = mapOfAllClusterSizes(currentCluster) / mapOfAllDataSetSizes('RC');
    end
end


end