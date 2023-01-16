function returnCluster = createMultiDimensionalClusters(cluster1,cluster2)
clusterLabels = "";
clusterX = "";
clusterY = "";
returnCluster= table(clusterLabels,clusterX,clusterY);
similarityCount = 0;
for cluster1Index =1: height(cluster1)
    for cluster2Index =1:height(cluster2)
        if strcmp(string(cluster1.clusterLabels{cluster1Index}), string(cluster2.clusterLabels{cluster2Index}))
            %             disp(cluster1(cluster1Index,:))
            returnCluster = [returnCluster;cluster1(cluster1Index,:)];
            similarityCount = similarityCount +1;
        end
    end
    % end
    returnCluster(returnCluster.clusterLabels == '',:) = [];
end
end