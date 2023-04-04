% newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Alcohol\lg_etoh\Travel Pixel Sigmoid Data");
% newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Alcohol\lg_etoh\Stopping Points Sigmoid Data");
%newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Alcohol\lg_etoh\Rotation Points Sigmoid Data");
% newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Alcohol\lg_etoh\Reward Choice Sigmoid Data");

% newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\lg_boost\Travel Pixel Sigmoid Data");
% newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\lg_boost\Stopping Points Sigmoid Data");
% newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\lg_boost\Rotation Points Sigmoid Data");
% newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\lg_boost\Reward Choice Sigmoid Data");


newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Oxy\Travel Pixel Sigmoid Data");
% newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Oxy\Stopping Points Sigmoid Data");
% newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Oxy\Rotation Points Sigmoid Data");
% newTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Oxy\Reward Choice Sigmoid Data");
figure
% RewardChoiceSigmoidClustering()
%Get ALL sigmoid data, and scale it using log and absolute value
sigmoidMax = log(abs(newTable.A));
horizShift = log(abs(newTable.B));
s = scatter(sigmoidMax,horizShift);
dt = datatip(s,sigmoidMax,horizShift);
labels = newTable.D;
testTable = table(sigmoidMax,horizShift,labels);
% datatip(labels,sigmoidMax,horizShift)

dtRows = [dataTipTextRow("Session: ",labels)];
s.DataTipTemplate.DataTipRows(end+1) =dtRows;

