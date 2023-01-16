newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\New Base Data\Stopping Points Sigmoid Data");

% RewardChoiceSigmoidClustering()
%Get ALL sigmoid data, and scale it using log and absolute value
sigmoidMax = log(abs(newTable.A));
horizShift = log(abs(newTable.B));
labels = newTable.D;
% 
% allData = table(labels,sigmoidMax,horizShift);
% 
%Take the max and shift 
maxVsShift = [sigmoidMax, horizShift];
%get the labels for all the data, labels,labels is used only so matlab
%keeps it as an array instead of doing some optimization thing
labels = [labels,labels];

createThePlot(maxVsShift,labels,3,"Max","Shift","Stopping Points","D");

% sigmoidShift = log(abs(newTable.A));
% sigmoidSteepness = log(abs(newTable.C));
% labels = newTable.D;
% shiftVsSteepness = [sigmoidShift,sigmoidSteepness];
% labels = [labels,labels];
% createThePlot(shiftVsSteepness,labels,3,"Max","Steepness", "Stopping Points","E")

% sigmoidShift = log(abs(newTable.B));
% sigmoidSteepness = log(abs(newTable.C));
% labels = newTable.D;
% shiftVsSteepness = [sigmoidShift,sigmoidSteepness];
% labels = [labels,labels];
% createThePlot(shiftVsSteepness,labels,3,"Shift","Steepness", "Stopping Points","F")