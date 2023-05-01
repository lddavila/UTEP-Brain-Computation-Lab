sigmoidMax = log(abs(newTable.A));
sigmoidSteepness = log(abs(newTable.C));
labels = newTable.D;
maxVsSteepness = [sigmoidMax, sigmoidSteepness];
labels = [labels,labels];
createThePlot(maxVsSteepness,labels,3,"Max","Steepness","Reward Choice")
