newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Old Base Data\Testing\Reaction Time Sigmoid Data");

%Get ALL sigmoid data, and scale it using log and absolute value
sigmoidMax = log(abs(newTable.A));
horizShift = log(abs(newTable.B));
labels = newTable.D;

%Take the max and shift 
maxVsShift = [sigmoidMax, horizShift];
%get the labels for all the data, labels,labels is used only so matlab
%keeps it as an array instead of doing some optimization thing
labels = [labels,labels];

createThePlot(maxVsShift,labels,4,"Max","Shift","Reaction Time ","J");

sigmoidMax = log(abs(newTable.A));
sigmoidSteepness = log(abs(newTable.C));
labels = newTable.D;
maxVsSteepness = [sigmoidMax, sigmoidSteepness];
labels = [labels,labels];
createThePlot(maxVsSteepness,labels,3,"Max","Steepness","Reaction Time ","K")

sigmoidShift = log(abs(newTable.B));
sigmoidSteepness = log(abs(newTable.C));
labels = newTable.D;
shiftVsSteepness = [sigmoidShift,sigmoidSteepness];
labels = [labels,labels];
createThePlot(shiftVsSteepness,labels,3,"Shift","Steepness","Reaction Time","L")


