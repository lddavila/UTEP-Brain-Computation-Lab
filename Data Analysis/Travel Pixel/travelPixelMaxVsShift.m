max = log(abs(newTable.A));
shift = log(abs(newTable.B));
labels = newTable.D;
maxVsShift = [max,shift];
labels = [labels,labels];
createThePlot(maxVsShift,labels,3,"Max","Shift", "Travel Pixel")
