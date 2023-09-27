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