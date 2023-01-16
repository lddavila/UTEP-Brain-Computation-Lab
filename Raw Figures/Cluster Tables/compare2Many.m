function x = compare2Many(clusterToCompare,listOfClusters)
    sizeOfListOfClusters = size(listOfClusters);
    sizeOfListOfClusters = sizeOfListOfClusters(2);
    for i = 1:sizeOfListOfClusters
        overlap = createMultiDimensionalClusters(clusterToCompare,listOfClusters{i});
        disp(height(overlap))
        disp((height(overlap)/1562)*100)
        disp("_____________")
    end
end