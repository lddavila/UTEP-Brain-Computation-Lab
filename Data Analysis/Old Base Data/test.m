a ="C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Old Base Data\Baseline Clusters";
% allfiles = dir(strcat(a,"\*.csv"));
% for i=1:length(allfiles)
%     display(allfiles(i).name)
%     currentName = allfiles(i).name;
%     currentName = split(currentName,".");
%     currentName = string(currentName(1));
%     currentTable = readtable(strcat(a,"\",allfiles(i).name));
%     writetable(currentTable,strcat(a,"\",currentName,".xlsx"))
% end
m1 = readtable(strcat(a,"\M1.xlsx"));
m2 = readtable(strcat(a,"\M2.xlsx"));
m3 = readtable(strcat(a,"\M3.xlsx"));
m4 = readtable(strcat(a,"\M4.xlsx"));

a1 = readtable(strcat(a,"\A1.xlsx"));
a2 = readtable(strcat(a,"\A2.xlsx"));
a3 = readtable(strcat(a,"\A3.xlsx"));

d1 = readtable(strcat(a,"\D1.xlsx"));
d2 = readtable(strcat(a,"\D2.xlsx"));
d3 = readtable(strcat(a,"\D3.xlsx"));


g1 = readtable(strcat(a,"\G1.xlsx"));
g2 = readtable(strcat(a,"\G2.xlsx"));
g3 = readtable(strcat(a,"\G3.xlsx"));
g4 = readtable(strcat(a,"\G4.xlsx"));

allTogether = [a1;a2;a3;d1;d2;d3;g1;g2;g3;g4;m1;m2;m3;m4];
aT = [a1;a2;a3;d1;d2;d3;g1;g2;g3;g4;m1;m2;m3;m4];
display(allTogether)
allTogether = allTogether.clusterLabels;
names = [];
for i=1:height(allTogether)
    name = split(string(allTogether(i))," ");
    name = string(name(1));
    names = [names,string(name)];
end
uniqueNames = unique(names);
display(uniqueNames)
