newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\New Base Data\Reaction Time Sigmoid Data");
% newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\New Base Data\Reward Choice Sigmoid Data");
% newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\New Base Data\Rotation Points Sigmoid Data");
% display(newTable)

% RewardChoiceSigmoidClustering()
%Get ALL sigmoid data, and scale it using log and absolute value
sigmoidMax = log(abs(newTable.A));
horizShift = log(abs(newTable.C));
s = scatter(sigmoidMax,horizShift);
dt = datatip(s,sigmoidMax,horizShift);
labels = newTable.D;
testTable = table(sigmoidMax,horizShift,labels);
% datatip(labels,sigmoidMax,horizShift)

dtRows = [dataTipTextRow("Session: ",labels)];
s.DataTipTemplate.DataTipRows(end+1) =dtRows;

