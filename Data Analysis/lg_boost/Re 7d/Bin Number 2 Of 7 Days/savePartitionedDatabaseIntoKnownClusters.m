%We already know which cluster each datapoint will fall into
%this is because we already did fcm clustering on the entire data set
%This enables us to resave all the datapoints into their known clusters
%the difference being that the new cluster tables will only contain n days of data
%n is dependent on how many days we wish to be in each cluster
%another helpful coincidence is that because we already know the x & y of the clusters, we need only the labels to make our calculation
function[dirOfAllClusterTables] = savePartitionedDatabaseIntoKnownClusters(nameOfFolder,byGenderPopulationOrIndividual,listOfRats,dirOfClusters)
%byGenderPopulationOrIndividual - string which indicates whether to partitition data by gender population or individiual
%       "gender" -split by gender
%       "individual" - split by individual
%       "population" - split by population
    function[dirWhereEverythingShouldBeSaved] = saveDataIntoClusters(fileWithData,dictOfClusters,fileWhereYouWantAllClustersSaved)
        if ~exist(fileWhereYouWantAllClustersSaved,'dir')
            mkdir(fileWhereYouWantAllClustersSaved)
        end
        homeDir = cd(fileWhereYouWantAllClustersSaved);
        dirWhereEverythingShouldBeSaved = cd(homeDir);
        cd(fileWithData)
        listOfFiles = dir(strcat(pwd,"\*.mat"));
        for currentFile=1:length(listOfFiles)
            nameOfCurrentFile = listOfFiles(currentFile).name;
            for cluster =keys(dictOfClusters)
                CCName = cluster{1};
                currentListOfLabels = dictOfClusters(CCName);
                for label=1:length(currentListOfLabels)
                    currentLabel = string(currentListOfLabels(label));
                    if fileWithData=="RC" && contains(CCName,"M")
                        if strcmpi(currentLabel,nameOfCurrentFile)
                            %                             disp("It worked once ")
                            dirWithData = cd(dirWhereEverythingShouldBeSaved);
                            clusterLabels = currentLabel;
                            singularTable = table(clusterLabels);
                            writetable(singularTable,CCName,'WriteMode','append')
                            cd(dirWithData)
                        end
                    elseif fileWithData=="RP" && contains(CCName,"G")
                        if strcmpi(currentLabel,nameOfCurrentFile)
                            %                             disp("It worked once ")
                            dirWithData = cd(dirWhereEverythingShouldBeSaved);
                            clusterLabels = currentLabel;
                            singularTable = table(clusterLabels);
                            writetable(singularTable,CCName,'WriteMode','append')
                            cd(dirWithData)
                        end
                    elseif fileWithData=="SP" && contains(CCName,"D")
                        if strcmpi(currentLabel,nameOfCurrentFile)
                            %                             disp("It worked once ")
                            dirWithData = cd(dirWhereEverythingShouldBeSaved);
                            clusterLabels = currentLabel;
                            singularTable = table(clusterLabels);
                            writetable(singularTable,CCName,'WriteMode','append')
                            cd(dirWithData)
                        end
                    elseif fileWithData=="TP" && contains(CCName,"A")
                        if strcmpi(currentLabel,nameOfCurrentFile)
                            %                             disp("It worked once ")
                            dirWithData = cd(dirWhereEverythingShouldBeSaved);
                            clusterLabels = currentLabel;
                            singularTable = table(clusterLabels);
                            writetable(singularTable,CCName,'WriteMode','append')
                            cd(dirWithData)
                        end
                    end

                end
            end
        end
        cd(homeDir)
    end
    function[] = saveDataIntoClustersByIndividuals(fileWithData,dictOfClusters,fileWhereYouWantAllClustersSaved,listOfRats,dirOfAllClusterTables)
        homeDir = cd(dirOfAllClusterTables);
        for currentRat=1:length(listOfRats)
            if ~exist(listOfRats(currentRat),"dir")
                mkdir(listOfRats(currentRat))
                cd(listOfRats(currentRat))
            end
            clusterTablesOfCurrentPartition = dir(strcat(dirOfAllClusterTables,"\*xlsx"));
            for currentClusterTable=1:length(clusterTablesOfCurrentPartition)
                currentTable = readtable(strcat(dirOfAllClusterTables,"\",clusterTablesOfCurrentPartition(currentClusterTable).name));
%                 display(currentTable)
%                 display(listOfRats(currentRat))
                currentRatTable = currentTable(contains(currentTable.clusterLabels,listOfRats(currentRat)),:);
%                 display(currentRatTable)
                writetable(currentRatTable,strcat(listOfRats(currentRat)," ",clusterTablesOfCurrentPartition(currentClusterTable).name));
            end
            cd("..");
        end
        cd(homeDir)
    end
%first we must specify the path which contains the KNOWN locations of the data

allFiles = dir(strcat(dirOfClusters,"\*.xlsx"));
    dictOfAllClusterLabels = containers.Map('KeyType','char','ValueType','any');
    for i=1:length(allFiles)
        currentClusterName = allFiles(i).name;
        currentCluster = readtable(strcat(dirOfClusters,"\",currentClusterName));
        dictOfAllClusterLabels(currentClusterName) = currentCluster.clusterLabels;
%         display(currentCluster)
    end
    dirOfClusterTables = saveDataIntoClusters("RC",dictOfAllClusterLabels,strcat("All Clusters ",nameOfFolder));
    saveDataIntoClusters("TP",dictOfAllClusterLabels,strcat("All Clusters ",nameOfFolder));
    saveDataIntoClusters("SP",dictOfAllClusterLabels,strcat("All Clusters ",nameOfFolder));
    saveDataIntoClusters("RP",dictOfAllClusterLabels,strcat("All Clusters ",nameOfFolder));
    dirOfAllClusterTables = strcat("All Clusters ",nameOfFolder);


%     elseif strcmpi("gender",byGenderPopulationOrIndividual)
    if strcmpi("individual",byGenderPopulationOrIndividual)
        saveDataIntoClustersByIndividuals("RC",dictOfAllClusterLabels,strcat("All Clusters ",nameOfFolder),listOfRats,dirOfClusterTables)
    end
end