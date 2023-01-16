newTable = getTable('C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\New Base Data\Reward Choice Sigmoid Data');
sigmoidMax = log(abs(newTable.A));
horizShift = log(abs(newTable.B));
labels = newTable.D;

maxVsShift = [sigmoidMax,horizShift];
labels = [labels,labels];

createThePlot(maxVsShift,labels,3,"Max","Shift","Reward Choice","M");

% sigmoidMax = log(abs(newTable.A));
% sigmoidSteepness = log(abs(newTable.C));
% labels = newTable.D;
% maxVsSteepness = [sigmoidMax, sigmoidSteepness];
% labels = [labels,labels];
% createThePlot(maxVsSteepness,labels,4,"Max","Steepness","Reward Choice","N")

% sigmoidShift = log(abs(newTable.B));
% sigmoidSteepness = log(abs(newTable.C));
% labels = newTable.D;
% shiftVsSteepness = [sigmoidShift,sigmoidSteepness];
% labels = [labels,labels];
% createThePlot(shiftVsSteepness,labels,2,"Shift","Steepness","Reward Choice","O")
