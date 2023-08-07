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
    function [] = performFCMAnalysis(baseDataSet,numberOfAppearencesInBase,experimentDataSet,numberOfAppearencesInExperiment,featureName)
        display(baseDataSet)
        display(experimentDataSet)
        switch featureName
            case "Travel Pixel"
                x=log(abs(str2double(baseDataSet.A)));
                y=log(abs(str2double(baseDataSet.B)));
                xVsY = [x,y];
                [centers,U] = fcm(xVsY,3);
                disp(calculate_mpc(U))

                x=log(abs(str2double(experimentDataSet.A)));
                y=log(abs(str2double(experimentDataSet.B)));
                xVsY = [x,y];
                [centers,U] = fcm(xVsY,3);
                disp(calculate_mpc(U))
            case "Stopping Points"
                x=log(abs(str2double(baseDataSet.A)));
                y=log(abs(str2double(baseDataSet.B)));
                xVsY = [x,y];
                [centers,U] = fcm(xVsY,3);
                disp(calculate_mpc(U))

                x=log(abs(str2double(experimentDataSet.A)));
                y=log(abs(str2double(experimentDataSet.B)));
                xVsY = [x,y];
                [centers,U] = fcm(xVsY,3);
                disp(calculate_mpc(U))
            case "Rotation Points"
                x=log(abs(str2double(baseDataSet.A)));
                y=log(abs(str2double(baseDataSet.B)));
                xVsY = [x,y];
                [centers,U] = fcm(xVsY,3);
                disp(calculate_mpc(U))

                x=log(abs(str2double(experimentDataSet.A)));
                y=log(abs(str2double(experimentDataSet.B)));
                xVsY = [x,y];
                [centers,U] = fcm(xVsY,4);
                disp(calculate_mpc(U))
            case "Reaction Time"
                x=log(abs(str2double(baseDataSet.A)));
                y=log(abs(str2double(baseDataSet.B)));
                xVsY = [x,y];
                [centers,U] = fcm(xVsY,3);
                disp(calculate_mpc(U))

                x=log(abs(str2double(experimentDataSet.A)));
                y=log(abs(str2double(experimentDataSet.B)));
                xVsY = [x,y];
                [centers,U] = fcm(xVsY,3);
                disp(calculate_mpc(U))
            case "Reward Choice"
                x=log(abs(str2double(baseDataSet.A)));
                y=log(abs(str2double(baseDataSet.B)));
                xVsY = [x,y];
                [centers,U] = fcm(xVsY,3);
                disp(calculate_mpc(U))

                x=log(abs(str2double(experimentDataSet.A)));
                y=log(abs(str2double(experimentDataSet.B)));
                xVsY = [x,y];
                [centers,U] = fcm(xVsY,3);
                disp(calculate_mpc(U))
        end

    end
    function [] = createProbabilityArrays(mapOfBaselineClusters,mapOfExperimentClusters,numberOfAppearencesInBase,numberOfAppearencesInExperiment,ratName)
    end
    function[] = calculateEuclidianDistance(baselineProbabilities,experimentProbabilities)
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
%this is all the experiments plus the baseline data we need
baselineDataSets = ["Old Base Data|Travel Pixel","Old Base Data|Stopping Points","Old Base Data|Rotation Points","Old Base Data|Reaction Time","Old Base Data|Reward Choice"];
foodDeprivationDataSets =["Food Deprivation|Travel Pixel","Food Deprivation|Stopping Points", "Food Deprivation|Rotation Points","Food Deprivation|Reaction Time","Food Deprivation|Reward Choice"];
% "Alcohol|Travel Pixel","Alcohol|Stopping Points","Alcohol|Rotation Points","Alcohol|Reaction Time","Alcohol|Reward Choice",... 
% "Ghrelin|Travel Pixel","Ghrelin|Stopping Points","Ghrelin|Rotation Points" ,"Ghrelin|Reaction Time" ,"Ghrelin|Reward Choice" ,...
% "Isoflurene|Travel Pixel" ,"Isoflurene|Stopping Points","Isoflurene|Rotation Points","Isoflurene|Reaction Time" ,"Isoflurene|Reward Choice",...
% "Oxycodone|Travel Pixel" ,"Oxycodone|Stopping Points","Oxycodone|Rotation Points","Oxycodone|Reaction Time", "Oxycodone|Reward Choice",...
% "Pre Feeding|Travel Pixel","Pre Feeding|Stopping Points", "Pre Feeding|Rotation Points","Pre Feeding|Reaction Time" ,"Pre Feeding|Reward Choice",...
% "Saline|Travel Pixel","Saline|Stopping Points", "Saline|Rotation Points","Saline|Reaction Time" ,"Saline|Reward Choice"];


baseData = collectAllDataInAMap(baselineDataSets);
% foodDepData = collectAllDataInAMap(foodDeprivationDataSets);


assignin('base','baseData',baseData)
% assignin('base','foodDeprivationData',foodDepData)

% cycleThroughAllTables(baseData,foodDepData);

display(keys(baseData))
display(baseData('Old Base Data|Reaction Time'))
%'Old Base Data|Reward Choice'
%'Old Base Data|Rotation Points'
%'Old Base Data|Stopping Points'
%'Old Base Data|Travel Pixel'

createPlots(baseData('Old Base Data|Travel Pixel','A',3,'Baseline','Travel Pixel','Baseline'))

end
