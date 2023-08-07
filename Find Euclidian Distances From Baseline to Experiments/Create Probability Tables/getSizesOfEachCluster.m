function[clusterSize] = getSizesOfEachCluster(directoryOfClusters)
ogCluster = cd(directoryOfClusters);
keySet = {'A1','A2','A3',...
    'D1','D2','D3','G1','G2','G3','G4',...
    'J1','J2','J3','J4','M1','M2','M3','M4'};
valueSet = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
%         display(length(keySet))
%         display(length(valueSet))
clusterSize = containers.Map(keySet,valueSet);
for i=1:length(keySet)
    tempTable = readtable(strcat(string(keySet(i)),".xlsx"));
    weirdIndex = keySet(i);
    weirdIndex = weirdIndex(1);
    weirdIndex = string(weirdIndex);
    %             display(weirdIndex)
    %             display(class(weirdIndex))
    clusterSize(weirdIndex) = height(tempTable);
end
cd(ogCluster)
end