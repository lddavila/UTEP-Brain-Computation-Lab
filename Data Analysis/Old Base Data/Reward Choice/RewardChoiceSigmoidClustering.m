
myDir = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Reward Choice\All Sigmoids"; %gets directory
myFiles = dir(fullfile(myDir,'*.mat')); %gets all .mat files in struct
A = [];
B = [];
C = [];
D = []; 
newTable= table(A,B,C,D);
for k = 1:length(myFiles)
    baseFileName = myFiles(k).name;
    fullFileName = fullfile("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Reward Choice\All Sigmoids", baseFileName);
%     fprintf(1, 'Now reading %s\n', fullFileName);
    load(fullFileName)
    try
        C = {fitobject3.a,fitobject3.b,fitobject3.c,baseFileName};
        T = cell2table(C,'VariableNames',{'A','B','C', 'D'});
        display([fitobject3.a,fitobject3.b,fitobject3.c,baseFileName])
    catch ME
        try
            C = {1,fitobject2.b, fitobject2.c,baseFileName};
            T = cell2table(C,'VariableNames',{'A','B','C','D'});
            display([fitobject2.a,fitobject2.b, 1, baseFileName])
        catch
            try
                C = {fitobject4.a,fitobject4.b,fitobject4.c, baseFileName};
                T = cell2table(C,'VariableNames',{'A','B', 'C', 'D'});
                display([fitobject4.a,fitobject4.b,fitobject4.c, baseFileName])
            catch
                disp("None Of them worked for some reason")
            end
        end
    end
    newTable = [newTable;T];
end

%display(newTable)
% display(table2array(newTable))
% mapcaplot(table2array(newTable))
% mapcaplot(newTable)
