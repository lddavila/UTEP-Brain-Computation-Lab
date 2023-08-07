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