function [] = createPlots(newTable,numberOfClusters,feature,letterRepresentingFeatureGraph,workingDirectory,experimentName)
%         Get ALL sigmoid data, and scale it using log and absolute value
sigmoidMax = log(abs(newTable.A));
horizShift = log(abs(newTable.B));
labels = newTable.D;

%Take the max and shift
maxVsShift = [sigmoidMax, horizShift];
%get the labels for all the data, labels,labels is used only so matlab
%keeps it as an array instead of doing some optimization thing
labels = [labels,labels];

createThePlot(maxVsShift,labels,numberOfClusters,"Max","Shift",feature,letterRepresentingFeatureGraph,workingDirectory,experimentName);
end