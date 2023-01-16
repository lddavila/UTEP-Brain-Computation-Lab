
myDir = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Reward Choice\Sigmoid Data"; %gets directory
myFiles = dir(fullfile(myDir,'*.mat')); %gets all .mat files in struct
A = [];
B = [];
C = [];
newTable= table(A,B,C);
for k = 1:length(myFiles)
    baseFileName = myFiles(k).name;
    fullFileName = fullfile("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Reward Choice\Sigmoid Data", baseFileName);
    fprintf(1, 'Now reading %s\n', fullFileName);
    load(fullFileName)
    try
        C = {fitobject3.a,fitobject3.b,fitobject3.c};
        T = cell2table(C,'VariableNames',{'A','B','C'});
        display([fitobject3.a,fitobject3.b,fitobject3.c])
    catch ME
%         display(ME)
%         display("Makes it here")
        try
            C = {1,fitobject2.b, fitobject2.c};
            T = cell2table(C,'VariableNames',{'A','B','C'});
            display([fitobject2.a,fitobject2.b, 1])
        catch
            try
                C = {fitobject4.a,fitobject4.b,fitobject4.c};
                T = cell2table(C,'VariableNames',{'A','B', 'C'});
                display([fitobject4.a,fitobject4.b,fitobject4.c])
            catch
                display("None Of them worked for some reason")
            end
        end
    end
    newTable = [newTable;T];
end

%display(newTable)
% display(table2array(newTable))
mapcaplot(table2array(newTable))
% mapcaplot(newTable)





