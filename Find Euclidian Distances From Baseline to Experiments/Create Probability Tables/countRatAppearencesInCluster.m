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