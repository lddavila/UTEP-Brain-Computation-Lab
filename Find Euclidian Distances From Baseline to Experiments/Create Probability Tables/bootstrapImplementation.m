function [] = bootstrapImplementation()
    function[baselineData] = collectAllDataInAMap(baselineFilePath)
        baselineData = containers.Map('keytype','char','ValueType','any');
        for i=1:length(baselineFilePath)
            experimentAndFeature = split(baselineFilePath(i),"|");
            experiment = experimentAndFeature(1);
            feature = experimentAndFeature(2);
            filePathWithData = strcat("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\",...
                    experiment,"\",...
                    feature," Sigmoid Data");
%             disp(filePathWithData)
            baselineData(string(strcat(experiment,"|",feature))) = getTable(filePathWithData);


        end
    end
    function newValue = getRidOfDateAndFileFormat(x)
%         disp(x)
        tempValue = split(x);
        newValue = string(tempValue(1));
    end

    function[] = cycleThroughAllTables(mapOfBaseData,mapOfExperimentData)
        allDataKeys = string(keys(mapOfBaseData).');
%         display(allDataKeys)
        allExperimentDataKeys = string(keys(mapOfExperimentData).');
        allRats = {'alexis','kryssia', 'harley','raissa','andrea','fiona','sully','jafar','kobe','jr',...
    'scar','jimi','sarah','raven','shakira','renata','neftali','juana',...
    'mike','aladdin','carl','simba','johnny','captain','pepper','buzz', ...
    'ken', 'woody','slinky','rex', 'trixie','barbie','bopeep','wanda', ...
    'vision','buttercup','monster'};
        f = @getRidOfDateAndFileFormat;
        for j=1:1%length(allRats)
            for i=1:1%height(allDataKeys)
                for k=1:1%1000
                    %                 disp(mapOfBaseData(allDataKeys(i)))
                    baseTempTable = mapOfBaseData(allDataKeys(i));
                    %                 display(baseTempTable)
                    baseNewColumn =rowfun(f,table(baseTempTable.D),'OutputVariableNames','Name');
                    baseNewTable = table(baseTempTable.A, ...
                        baseTempTable.B, ...
                        baseTempTable.D, ...
                        baseNewColumn.Name, ...
                        'VariableNames',{'A','B','D','Name'});

                    %                 disp(string(allRats(j)))
                    baseCurrentRatTable = baseNewTable(strcmp(baseNewTable.Name,string(allRats(j))),:);
                    %                 display(baseCurrentRatTable)
                    baseTableWithoutCurrentRat = baseNewTable((strcmp(baseNewTable.Name,string(allRats(j)))==false),:);
                    numElements = round(0.30 * height(baseCurrentRatTable));
                    %                 disp(numElements)
                    randomIndexes = randperm(height(baseCurrentRatTable),numElements);
                    %                 display(randomIndexes)

                    baseRandomCurrentRatSelection = table(baseCurrentRatTable{randomIndexes,:}(:,1),...
                        baseCurrentRatTable{randomIndexes,:}(:,2),...
                        baseCurrentRatTable{randomIndexes,:}(:,3), ...
                        baseCurrentRatTable{randomIndexes,:}(:,4), ...
                        'VariableNames',{'A','B','D','Name'});


                    %                 display(baseRandomCurrentRatSelection)
                    %                 display(baseTableWithoutCurrentRat)
                    baseTableWithRatReintroduced = [baseTableWithoutCurrentRat;baseRandomCurrentRatSelection];
                    %                 display(baseRandomCurrentRatSelection)

                    experimentTempTable = mapOfExperimentData(allExperimentDataKeys(i));
                    %                 display(experimentTempTable)
                    experimentNewColumn =rowfun(f,table(experimentTempTable.D),'OutputVariableNames','Name');
                    %                 display(experimentNewColumn)
                    experimentNewTable = table(experimentTempTable.A, ...
                        experimentTempTable.B, ...
                        experimentTempTable.D, ...
                        experimentNewColumn.Name, ...
                        'VariableNames',{'A','B','D','Name'});

                    experimentCurrentRatTable = experimentNewTable(strcmp(experimentNewTable.Name,string(allRats(j))),:);
                    %                 display(experimentCurrentRatTable)
                    experimentTableWithoutCurrentRat = experimentNewTable((strcmp(experimentNewTable.Name,string(allRats(j)))==false),:);
                    numElements = round(0.50 * height(experimentCurrentRatTable));
                    %                 disp(numElements)
                    randomIndexes = randperm(height(experimentCurrentRatTable),numElements);
                    %                 display(randomIndexes)
                    experimentRandomCurrentRatSelection = table(experimentCurrentRatTable{randomIndexes,:}(:,1), ...
                        experimentCurrentRatTable{randomIndexes,:}(:,2), ...
                        experimentCurrentRatTable{randomIndexes,:}(:,3), ...
                        experimentCurrentRatTable{randomIndexes,:}(:,4),...
                    'VariableNames',{'A','B','D','Name'});
                %                 display(experimentRandomCurrentRatSelection)
                experimentTableWithRatReintroduced = [experimentTableWithoutCurrentRat;experimentRandomCurrentRatSelection];
                %                 display(baseTableWithRatReintroduced)
                %                 display(experimentTableWithRatReintroduced);
                currentAnalysis = strsplit(allDataKeys(i),'|');
                currentAnalysis = currentAnalysis(2);
                %                 display(currentAnalysis)

                performFCMAnalysis(baseTableWithRatReintroduced,...
                    height(baseRandomCurrentRatSelection),...
                    experimentTableWithRatReintroduced,...
                    height(experimentRandomCurrentRatSelection), ...
                    currentAnalysis);
                end



            end

        end

            end
    function [] = createPlots(newTable,numberOfClusters,feature,letterRepresentingFeatureGraph,workingDirectory,experimentName)
        %         Get ALL sigmoid data, and scale it using log and absolute value
        sigmoidMax = log(abs(newTable.A));
        horizShift = log(abs(newTable.B));
        labels = newTable.D;
        
        %Take the max and shift
        maxVsShift = [sigmoidMax, horizShift];
        %get the labels for all the data, labels,labels is used only so matlab
        %keeps it as an array instead of doing some optimization thing
        labels = [labels,labels];

        createThePlot(maxVsShift,labels,numberOfClusters,"Max","Shift",feature,letterRepresentingFeatureGraph,workingDirectory,experimentName);
    end
    function [newDirectory] = storeClustersInNewDirectory(nameOfNewDirectory)
        mkdir(nameOfNewDirectory)
        ogDirectory = cd(nameOfNewDirectory);
        newDirectory = cd(ogDirectory);

    end
    function[mapOfProbabilities]=calculatePopulationProbabilities(mapOfAllClusterSizes,mapOfAllDataSetSizes)
        clusterSizeKeys ={'A1','A2','A3',...
            'D1','D2','D3','G1','G2','G3','G4',...
            'J1','J2','J3','J4','M1','M2','M3','M4'};
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
                mapOfProbabilities(currentCluster) = mapOfAllClusterSizes(currentCluster) / mapOfAllDataSetSizes('Travel Pixel');
            elseif contains(currentCluster,"D")
                mapOfProbabilities(currentCluster) = mapOfAllClusterSizes(currentCluster) / mapOfAllDataSetSizes('Stopping Points');
            elseif contains(currentCluster,"G")
                mapOfProbabilities(currentCluster) = mapOfAllClusterSizes(currentCluster) / mapOfAllDataSetSizes('Rotation Points');
            elseif contains(currentCluster,"J")
                mapOfProbabilities(currentCluster) = mapOfAllClusterSizes(currentCluster) / mapOfAllDataSetSizes('Reaction Time');
            elseif contains(currentCluster,"M")
                mapOfProbabilities(currentCluster) = mapOfAllClusterSizes(currentCluster) / mapOfAllDataSetSizes('Reward Choice');
            end
        end

        
    end
    function[dataSetToSize] = getSizeOfAllDataSets(mapOfData)
        dataSetToSize = containers.Map('keytype','char','ValueType','any');
        allKeys = keys(mapOfData);
        allKeys = string(allKeys);
        for i=1:length(keys(mapOfData))
%             display(allKeys(i))
            currentKey = allKeys(i);
            currentKey = strsplit(currentKey,"|");
            currentKey = currentKey(2);
            dataSetToSize(currentKey) = height(mapOfData(allKeys(i)));
        end
    end
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
    function [mapOfRatAppearences] = countRatAppearencesInDataset(givenDataSet)
        keySet = {'alexis','kryssia', 'harley','raissa','andrea','fiona','sully','jafar','kobe','jr',...
            'scar','jimi','sarah','raven','shakira','renata','neftali','juana','mike','aladdin',...
            'carl','simba','johnny','captain','pepper','buzz', 'ken', 'woody','slinky','rex', ...
            'trixie','barbie','bopeep','wanda', 'vision','buttercup','monster'};

        valueSet = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,...
            0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,...
            0,0,0,0,0};
        keysOfGivenDataSet = keys(givenDataSet);

        mapOfRatAppearences = containers.Map("KeyType",'char','ValueType','any');
        f = @getRidOfDateAndFileFormat;
        for i=1:length(keysOfGivenDataSet)
            for j=1:length(keySet)
%                 display(strcat(keysOfGivenDataSet(i),"|",keySet(j)))
%                 disp(string(keysOfGivenDataSet(i)))
                tempTable = givenDataSet(string(keysOfGivenDataSet(i)));
%                 display(tempTable)
                newColumn =rowfun(f,table(tempTable.D),'OutputVariableNames','Name');
                tempTable.Name = newColumn.Name;
%                 display(tempTable)
                tableWithOnlyCurrentRat = tempTable(strcmp(tempTable.Name,string(keySet(j))),:);
%                 disp(strcat("Current Rat:",keySet(j)))
%                 display(tableWithOnlyCurrentRat);
                experimentAndFeautre =strsplit(string(keysOfGivenDataSet(i)),"|");
                feature = experimentAndFeautre(2);
                mapOfRatAppearences(strcat(feature,"|",keySet(j))) = height(tableWithOnlyCurrentRat);
            end
        end

    end
    function [mapOfRatAppearencesByCluster] = countRatAppearencesInCluster(directoryOfClusters)
        clusterSizeKeys ={'A1','A2','A3',...
            'D1','D2','D3','G1','G2','G3','G4',...
            'J1','J2','J3','J4','M1','M2','M3','M4'};
        ratSet = {'alexis','kryssia', 'harley','raissa','andrea','fiona','sully','jafar','kobe','jr',...
            'scar','jimi','sarah','raven','shakira','renata','neftali','juana','mike','aladdin',...
            'carl','simba','johnny','captain','pepper','buzz', 'ken', 'woody','slinky','rex', ...
            'trixie','barbie','bopeep','wanda', 'vision','buttercup','monster'};
        mapOfRatAppearencesByCluster = containers.Map("KeyType",'char','ValueType','any');

        f = @getRidOfDateAndFileFormat;
        ogDirectory = cd(directoryOfClusters);
        for i=1:length(clusterSizeKeys)            
            tempTable = readtable(strcat(clusterSizeKeys(i),".xlsx"));
%             display(tempTable)
            for j=1:length(ratSet)
                
                newColumn =rowfun(f,table(tempTable.clusterLabels),'OutputVariableNames','Name');
                tempTable.Name = newColumn.Name;
                
                tableWithOnlyCurrentRat = tempTable(strcmp(tempTable.Name,string(ratSet(j))),:);
                ratAndCluster = strcat(string(ratSet(j)),"|",string(clusterSizeKeys(i)));
%                 disp(tableWithOnlyCurrentRat)
                mapOfRatAppearencesByCluster(ratAndCluster) = height(tableWithOnlyCurrentRat);
            end

        end
        cd(ogDirectory)
    end
% this is all the experiments plus the baseline data we need
baselineDataSets = ["Old Base Data|Travel Pixel","Old Base Data|Stopping Points","Old Base Data|Rotation Points","Old Base Data|Reaction Time","Old Base Data|Reward Choice"];
baseData = collectAllDataInAMap(baselineDataSets);
% % assignin('base','baseData',baseData)
baselineDirectory = storeClustersInNewDirectory("Baseline");
% createPlots(baseData('Old Base Data|Travel Pixel'),3,'Travel Pixel','A',baselineDirectory,'Baseline')
% createPlots(baseData('Old Base Data|Stopping Points'),3,'Stopping Points','D',baselineDirectory,'Baseline');
% createPlots(baseData('Old Base Data|Rotation Points'),4,'Rotation Points','G',baselineDirectory,'Baseline');
% createPlots(baseData('Old Base Data|Reaction Time'),4,'Reaction Time','J',baselineDirectory,'Baseline');
% createPlots(baseData('Old Base Data|Reward Choice'),4,'Reward Choice','M',baselineDirectory,'Baseline');
sizesOfBaseData = getSizeOfAllDataSets(baseData);
sizesOfEachClusterInBaseData = getSizesOfEachCluster("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Find Euclidian Distances From Baseline to Experiments\Create Probability Tables\Baseline");
probabilitiesOfEachClusterInBaseData = calculatePopulationProbabilities(sizesOfEachClusterInBaseData,sizesOfBaseData);
assignin('base','probabilitiesOfEachClusterInBaseData',probabilitiesOfEachClusterInBaseData)

foodDeprivationDataSets =["Food Deprivation|Travel Pixel","Food Deprivation|Stopping Points", "Food Deprivation|Rotation Points","Food Deprivation|Reaction Time","Food Deprivation|Reward Choice"];
foodDepData = collectAllDataInAMap(foodDeprivationDataSets);
foodDeprDirectory = storeClustersInNewDirectory('Food Deprivation');
% createPlots(foodDepData('Food Deprivation|Travel Pixel'),3,'Travel Pixel','A',foodDeprDirectory,'Food Deprivation')
% createPlots(foodDepData('Food Deprivation|Stopping Points'),3,'Stopping Points','D',foodDeprDirectory,'Food Deprivation');
% createPlots(foodDepData('Food Deprivation|Rotation Points'),3,'Rotation Points','G',foodDeprDirectory,'Food Deprivation');
% createPlots(foodDepData('Food Deprivation|Reaction Time'),3,'Reaction Time','J',foodDeprDirectory,'Food Deprivation');
% createPlots(foodDepData('Food Deprivation|Reward Choice'),3,'Reward Choice','M',foodDeprDirectory,'Food Deprivation');
sizesOfFoodDepData = getSizeOfAllDataSets(foodDepData);
sizesOfEachClusterInFoodDepData = getSizesOfEachCluster("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Find Euclidian Distances From Baseline to Experiments\Create Probability Tables\Food Deprivation");
probabilitiesOfEachClusterInFoodDepData = calculatePopulationProbabilities(sizesOfEachClusterInFoodDepData,sizesOfFoodDepData);
assignin('base','probabilitiesOfEachClusterInFoodDepData',probabilitiesOfEachClusterInFoodDepData)

ghrelinDataSets =["Ghrelin|Travel Pixel","Ghrelin|Stopping Points","Ghrelin|Rotation Points" ,"Ghrelin|Reaction Time" ,"Ghrelin|Reward Choice"];
ghrelinData = collectAllDataInAMap(ghrelinDataSets);
ghrelinDirectory = storeClustersInNewDirectory('Ghrelin');
assignin('base','ghrelinData',ghrelinData)
% createPlots(ghrelinData("Ghrelin|Travel Pixel"),3,'Travel Pixel','A',ghrelinDirectory,'Ghrelin')
% createPlots(ghrelinData('Ghrelin|Stopping Points'),3,'Stopping Points','D',ghrelinDirectory,'Ghrelin');
% createPlots(ghrelinData('Ghrelin|Rotation Points'),4,'Rotation Points','G',ghrelinDirectory,'Ghrelin');
% createPlots(ghrelinData('Ghrelin|Reaction Time'),3,'Reaction Time','J',ghrelinDirectory,'Ghrelin');
% createPlots(ghrelinData('Ghrelin|Reward Choice'),3,'Reward Choice','M',ghrelinDirectory,'Ghrelin');

sizesOfGhrelinData = getSizeOfAllDataSets(ghrelinData);
sizesOfEachClusterInGhrelinData =getSizesOfEachCluster("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Find Euclidian Distances From Baseline to Experiments\Create Probability Tables\Ghrelin");
probabilitiesOfEachClusterInGhrelinData = calculatePopulationProbabilities(sizesOfEachClusterInGhrelinData,sizesOfGhrelinData);
assignin('base','probabilitiesOfEachClusterInGhrelinData',probabilitiesOfEachClusterInGhrelinData)






foodDepData = collectAllDataInAMap(foodDeprivationDataSets);
assignin('base','foodDeprivationData',foodDepData)
cycleThroughAllTables(baseData,foodDepData);

eachRatsAppearnecesInFoodDepData = countRatAppearencesInDataset(foodDepData);
assignin('base','eachRatsAppearnecesInFoodDepData',eachRatsAppearnecesInFoodDepData)
eachRatsAppearencesInFoodDepClusters = countRatAppearencesInCluster(foodDeprDirectory);
assignin('base','eachRatsAppearencesInFoodDepClusters',eachRatsAppearencesInFoodDepClusters)

eachRatsAppearnecesInGhrelinData = countRatAppearencesInDataset(ghrelinData);
assignin('base','eachRatsAppearnecesInGhrelinData',eachRatsAppearnecesInGhrelinData)
eachRatsAppearencesInGhrelinDataClusters = countRatAppearencesInCluster(ghrelinDirectory);
assignin('base','eachRatsAppearencesInGhrelinDataClusters',eachRatsAppearencesInGhrelinDataClusters)

eachRatsAppearencesInBaselineData = countRatAppearencesInDataset(baseData);
assignin('base',"eachRatsAppearencesInBaselineData",eachRatsAppearencesInBaselineData)
eachRatsAppearencesInBaselineDataClusters = countRatAppearencesInCluster(baselineDirectory);
assignin('base','eachRatsAppearencesInBaselineDataClusters',eachRatsAppearencesInBaselineDataClusters)


end
