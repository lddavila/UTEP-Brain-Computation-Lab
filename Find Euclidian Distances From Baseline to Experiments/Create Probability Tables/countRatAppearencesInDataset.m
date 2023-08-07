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