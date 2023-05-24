function[newTable] = getTable(myDir)
myFiles = dir(fullfile(myDir,'*.mat')); %gets all .mat files in struct
A = [];
B = [];
C = [];
D = [];
newTable= table(A,B,C,D);
for k = 1:length(myFiles)
    baseFileName = myFiles(k).name;
    fullFileName = fullfile(myDir, baseFileName);
    %     fprintf(1, 'Now reading %s\n', fullFileName);
%     disp(fullFileName)
    load(fullFileName)
    try
        C = {fitobject5.a,fitobject5.b,fitobject5.c,baseFileName};
        T = cell2table(C,'VariableNames',{'A','B','C', 'D'});
%         display([fitobject5.a,fitobject5.b,fitobject5.c,baseFileName])
    catch
        %         display(ME)
        %         display("Makes it here")
        try
            C = {1,fitobject5.b, fitobject5.c,baseFileName};
            T = cell2table(C,'VariableNames',{'A','B','C','D'});
%             display([fitobject5.a,fitobject5.b, 1, baseFileName])
        catch
            try
                C = {fitobject5.a,fitobject5.b,fitobject5.c, baseFileName};
                T = cell2table(C,'VariableNames',{'A','B', 'C', 'D'});
%                 display([fitobject5.a,fitobject5.b,fitobject5.c, baseFileName])
            catch
                disp("None Of them worked for some reason")
            end
        end
    end
    newTable = [newTable;T];
end
end