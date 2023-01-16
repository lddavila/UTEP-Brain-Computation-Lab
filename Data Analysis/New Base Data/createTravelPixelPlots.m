newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\New Base Data\Travel Pixel Sigmoid Data");

% max = log(abs(newTable.A));
% shift = log(abs(newTable.B));
% labels = newTable.D;
% maxVsShift = [max,shift];
% labels = [labels,labels];
% createThePlot(maxVsShift,labels,3,"Max","Shift", "Travel Pixel","A")

% sigmoidMax = log(abs(newTable.A));
% sigmoidSteepness = log(abs(newTable.C));
% labels = newTable.D;
% maxVsSteepness = [sigmoidMax, sigmoidSteepness];
% labels = [labels,labels];
% createThePlot(maxVsSteepness,labels,3,"Max","Steepness", "Travel Pixel","B")

% sigmoidShift = log(abs(newTable.B));
% sigmoidSteepness = log(abs(newTable.C));
% labels = newTable.D;
% shiftVsSteepness = [sigmoidShift,sigmoidSteepness];
% labels = [labels,labels];
% createThePlot(shiftVsSteepness,labels,3,"Shift","Steepness", "Travel Pixel","C")

% display(height(newTable))