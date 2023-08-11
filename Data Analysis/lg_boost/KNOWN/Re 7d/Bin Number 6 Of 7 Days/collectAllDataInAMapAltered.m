%this function has been altered to work with partitionDataByWeeks.m
%the file path is changed to agree with the file path structur created by savePartitionedDatabaseIntoKnownClusters.m
function[baselineData] = collectAllDataInAMapAltered(baselineFilePath)
baselineData = containers.Map('keytype','char','ValueType','any');
for i=1:length(baselineFilePath)
%     display(baselineFilePath(i))
    experimentAndFeature = split(baselineFilePath(i),"|");
%     display(experimentAndFeature);
    experiment = experimentAndFeature(1);
    feature = experimentAndFeature(2);
    filePathWithData = strcat(pwd,"\",feature);
%     disp(filePathWithData)
    baselineData(string(strcat(experiment,"|",feature))) = getTable(filePathWithData);


end
end