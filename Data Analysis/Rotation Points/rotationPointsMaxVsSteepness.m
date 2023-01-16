sigmoidShift = log(abs(newTable.A));
sigmoidSteepness = log(abs(newTable.C));
labels = newTable.D;
shiftVsSteepness = [sigmoidShift,sigmoidSteepness];
labels = [labels,labels];
createThePlot(shiftVsSteepness,labels,4,"Max","Steepness", "Rotation Points")