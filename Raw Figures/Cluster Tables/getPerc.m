function x = getPerc(listOfClusters)
    sizeOfListOfClusters = size(listOfClusters);
    sizeOfListOfClusters = sizeOfListOfClusters(2);
    for i = 1:sizeOfListOfClusters
        disp((height(listOfClusters{i})/1562)*100)
        disp("_____________")
    end
end