function[baselineData] = collectAllDataInAMap(baselineFilePath)
baselineData = containers.Map('keytype','char','ValueType','any');
for i=1:length(baselineFilePath)
%     display(baselineFilePath(i))
    experimentAndFeature = split(baselineFilePath(i),"|");
%     display(experimentAndFeature);
    experiment = experimentAndFeature(1);
    feature = experimentAndFeature(2);
    filePathWithData = strcat("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\",...
        experiment,"\",...
        feature," Sigmoid Data");
%     disp(filePathWithData)
    baselineData(string(strcat(experiment,"|",feature))) = getTable(filePathWithData);


end
end