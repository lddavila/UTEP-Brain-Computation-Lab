%locationOfFoodDepData = 'C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Create Probability Tables\Food Deprivation';
% locationOfFoodDepData = 'C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Create Probability Tables\Baseline Clusters';

function [allEuclidianDistances] = findEuclidianDistancesOfAllRatsFromEachOtherForFoodDep(locationOfFoodDepData,fileType,excludeOrDont,onlyDoSingleVariable,singleVariable) 

if onlyDoSingleVariable
    allClustersInFoodDepData = ls(strcat(locationOfFoodDepData,'\',singleVariable,'*',fileType));
%     disp(allClustersInFoodDepData)
else
    allClustersInFoodDepData = ls(strcat(locationOfFoodDepData,'\*',fileType));
end


listOfallFiles = cell(1,height(allClustersInFoodDepData));
mapOfDataSetSizes = containers.Map('KeyType','char','ValueType','any');
mapOfAllUniqueRatsInEachDataSet = containers.Map('KeyType','char','ValueType','any');
mapOfEachRatsTotalAppearencesInDataSet = containers.Map('KeyType','char','ValueType','any');
mapOfEachRatsAppearenceInCluster = containers.Map('KeyType','char','ValueType','any');

allRatsList = [];
allClustersList = strrep(string(allClustersInFoodDepData),fileType,"");
defaultProbabilities = zeros(1,length(allClustersList));

for i=1:height(allClustersInFoodDepData)
    listOfallFiles{i} = readtable(strcat(locationOfFoodDepData,"\",string(allClustersInFoodDepData(i,:))));
    currentDataSet = char(strrep(string(allClustersInFoodDepData(i,:)),fileType,""));
%     disp(currentDataSet)
    currentCluster = currentDataSet(1:2);
%     disp(currentCluster)
    currentDataSet = currentDataSet(1);
%     disp(currentDataSet)
    listOfAllRatsInCurrentCluster = split(string(listOfallFiles{i}.clusterLabels)," ");
%     disp(listOfAllRatsInCurrentCluster)
    listOfAllRatsInCurrentCluster = listOfAllRatsInCurrentCluster(:,1);
    allRatsList = [allRatsList;listOfAllRatsInCurrentCluster];
    for j=1:height(listOfAllRatsInCurrentCluster)
        currentRat = listOfAllRatsInCurrentCluster(j);
        if ~isKey(mapOfEachRatsTotalAppearencesInDataSet,strcat(currentDataSet," ",currentRat))
            mapOfEachRatsTotalAppearencesInDataSet(strcat(currentDataSet," ",currentRat)) = 1;
        else
            mapOfEachRatsTotalAppearencesInDataSet(strcat(currentDataSet," ",currentRat)) = mapOfEachRatsTotalAppearencesInDataSet(strcat(currentDataSet," ",currentRat)) +1;
        end

        if ~isKey(mapOfEachRatsAppearenceInCluster,strcat(currentCluster," ",currentRat))
            mapOfEachRatsAppearenceInCluster(strcat(currentCluster," ",currentRat)) = 1;
        else
            mapOfEachRatsAppearenceInCluster(strcat(currentCluster," ",currentRat)) = mapOfEachRatsAppearenceInCluster(strcat(currentCluster," ",currentRat)) +1;
        end
    end
    listOfAllRatsInCurrentCluster = unique(listOfAllRatsInCurrentCluster);
   % disp(listOfAllRatsInCurrentCluster);
    listOfAllRatsInCurrentCluster = unique(listOfAllRatsInCurrentCluster);
%     disp(listOfAllRatsInCurrentCluster);

    if ~isKey(mapOfDataSetSizes,currentDataSet)
        mapOfDataSetSizes(currentDataSet) = height(listOfallFiles{i});
        mapOfAllUniqueRatsInEachDataSet(currentDataSet) = listOfAllRatsInCurrentCluster;
    else
        mapOfDataSetSizes(currentDataSet) = mapOfDataSetSizes(currentDataSet) + height(listOfallFiles{i});
        mapOfAllUniqueRatsInEachDataSet(currentDataSet) = [mapOfAllUniqueRatsInEachDataSet(currentDataSet);listOfAllRatsInCurrentCluster];
        mapOfAllUniqueRatsInEachDataSet(currentDataSet) = unique(mapOfAllUniqueRatsInEachDataSet(currentDataSet));
    end


end

%% Calculate Probabilities For Each Rat
allRatsList = unique(allRatsList);

tableOfEachRatsAppearencePerCluster = table(string(keys(mapOfEachRatsAppearenceInCluster).'),cell2mat(values((mapOfEachRatsAppearenceInCluster)).'),'VariableNames',{'cluster_and_name','number_of_appearences'});
%disp(tableOfRatEachRatsAppearencePerCluster)

tableOfClustersToDefaultProbabilities = table(allClustersList,defaultProbabilities.','VariableNames',{'cluster','default_probabilities'});
% disp(tableOfClustersToDefaultProbabilities)

ratsToTheirProbabilityVectors = containers.Map('KeyType','char','ValueType','any');
for i=1:height(allRatsList)
    currentRat = allRatsList(i);
    tableOfASingleRat = tableOfEachRatsAppearencePerCluster(contains(tableOfEachRatsAppearencePerCluster.cluster_and_name,currentRat),:);
    %disp(tableOfASingleRat)
    cluster= split(tableOfASingleRat.cluster_and_name," ");
    cluster = cluster(:,1);
    if height(tableOfASingleRat)==1
        cluster = cluster(1);
        disp(cluster)
        tableOfASingleRat.cluster = cluster;
    else
        tableOfASingleRat.cluster = cluster;
    end
    
%     disp(tableOfASingleRat)
    organizedTable = outerjoin(tableOfClustersToDefaultProbabilities,tableOfASingleRat,"Keys","cluster");
    %disp(organizedTable)
    currentRatAppearences = organizedTable.number_of_appearences;
    currentRatAppearences(isnan(currentRatAppearences)) =0;
    tableOfCurrentRatAppearencesInEachCluster = table(organizedTable.cluster_tableOfClustersToDefaultProbabilities,currentRatAppearences,'VariableNames',{'Cluster','Number_Of_Appearences'});
    %disp(tableOfCurrentRatAppearencesInEachCluster)
    vectorOfProbabilities = zeros(1,height(tableOfCurrentRatAppearencesInEachCluster));
    for j=1:height(tableOfCurrentRatAppearencesInEachCluster)
        currentDataSet = char(tableOfCurrentRatAppearencesInEachCluster{j,1});
        currentDataSet = currentDataSet(1);
        %disp(currentDataSet)
        currentNumberOfAppearences = tableOfCurrentRatAppearencesInEachCluster{j,2};
        if currentNumberOfAppearences ~=0
            vectorOfProbabilities(j) = currentNumberOfAppearences / mapOfEachRatsTotalAppearencesInDataSet(strcat(currentDataSet," ",currentRat));
        end
    end
    if excludeOrDont
        oldRatList = ['aladdin', 'alexis', 'andrea', 'carl', 'fiona', 'harley', 'jafar', 'jimi', 'johnny', 'jr', 'juana', 'kobe', 'kryssia', 'mike','neftali', 'raissa', 'raven', 'renata', 'sarah', 'scar', 'shakira', 'simba', 'sully'];
        if ~contains(oldRatList,currentRat)
            continue
        else
%            disp("current Rat is an old rat")
           ratsToTheirProbabilityVectors(currentRat) = vectorOfProbabilities;
        end
    else
        ratsToTheirProbabilityVectors(currentRat) = vectorOfProbabilities;
    end
    

end

%% get distribution of euclidian distances of all rats to each other 

tableOfRatsToProbVec = table(string(keys(ratsToTheirProbabilityVectors).'),values(ratsToTheirProbabilityVectors).','VariableNames',{'rat','probabilities'});
% disp(tableOfRatsToProbVec)
justProbabilities = cell2mat(tableOfRatsToProbVec.probabilities);
% disp(justProbabilities)
allEuclidianDistances = [];
for i=1:height(justProbabilities)
    for j=1:height(justProbabilities)
        vec1 = justProbabilities(i,:);
        vec2 = justProbabilities(j,:);
        eucDistance = vec1 - vec2;
        result = sqrt(eucDistance * eucDistance');
        allEuclidianDistances = [allEuclidianDistances,result];
    end
end


histogram(allEuclidianDistances,'normalization','probability','BinEdges',0:0.05:3)
hold on
end