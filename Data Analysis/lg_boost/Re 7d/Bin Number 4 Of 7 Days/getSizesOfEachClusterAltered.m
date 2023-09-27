function[clusterSize] = getSizesOfEachClusterAltered(directoryOfClusters,byGenderPopulationOrIndividual,rat)
    function[clusterSize] = byPopulation(directoryOfClusters)
        ogCluster = cd(directoryOfClusters);
        keySet = {'A1','A2','A3',...
            'D1','D2','D3','G1','G2','G3','G4',...
            'M1','M2','M3','M4'};
        valueSet = [0,0,0,0,0,0,0,0,0,0,0,0,0,0];
        %         display(length(keySet))
        %         display(length(valueSet))
        clusterSize = containers.Map(keySet,valueSet);
        allClusterTables = dir(pwd);
        for i=1:length(keySet)
            keyExistsInData = 0;
            for j=1:length(allClusterTables)
                if strcmpi(strcat(string(keySet(i)),".xlsx"),allClusterTables(j).name)
                    keyExistsInData = 1;
                end
            end
            if keyExistsInData
                tempTable = readtable(strcat(string(keySet(i)),".xlsx"));
                weirdIndex = keySet(i);
                weirdIndex = weirdIndex(1);
                weirdIndex = string(weirdIndex);
                %             display(weirdIndex)
                %             display(class(weirdIndex))
                clusterSize(weirdIndex) = height(tempTable);
            end
        end
        cd(ogCluster)
    end
    function[clusterSize] = byIndividual(directoryOfClusters,rat)
        ogCluster = cd(directoryOfClusters);
        keySet = {'A1','A2','A3',...
            'D1','D2','D3','G1','G2','G3','G4',...
            'M1','M2','M3','M4'};
        valueSet = [0,0,0,0,0,0,0,0,0,0,0,0,0,0];
        clusterSize = containers.Map(keySet,valueSet);
        allClusterTables = dir(pwd);
        for i=1:length(keySet)
            keyExistsInData = 0;
            for j=1:length(allClusterTables)
                if strcmpi(strcat(rat, " ",string(keySet(i)),".xlsx"),allClusterTables(j).name)
                    keyExistsInData = 1;
                end
            end
            if keyExistsInData
                tempTable = readtable(strcat(rat," ",string(keySet(i)),".xlsx"));
                weirdIndex = keySet(i);
                weirdIndex = weirdIndex(1);
                weirdIndex = string(weirdIndex);
                %             display(weirdIndex)
                %             display(class(weirdIndex))
                clusterSize(weirdIndex) = height(tempTable);
            end
        end
        cd(ogCluster)
    end
if strcmpi(byGenderPopulationOrIndividual,"population")
    clusterSize = byPopulation(directoryOfClusters);
elseif strcmpi(byGenderPopulationOrIndividual,"individual")
    clusterSize = byIndividual(directoryOfClusters,rat);
end
end