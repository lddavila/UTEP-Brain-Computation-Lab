function[baselineData] = collectAllDataInAMap(baselineFilePath)
baselineData = containers.Map('keytype','char','ValueType','any');
for i=1:length(baselineFilePath)
    experimentAndFeature = split(baselineFilePath(i),"|");
    experiment = experimentAndFeature(1);
    feature = experimentAndFeature(2);
    filePathWithData = strcat("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\",...
        experiment,"\",...
        feature," Sigmoid Data");
    display(filePathWithData)
    %             disp(filePathWithData)
    theKey = string(strcat(experiment,"|",feature));
    baselineData(theKey) = getTable(filePathWithData);


end
end