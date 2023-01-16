function createOneRepresentativeSigmoidForEachCluster
    function clusterMap = readClusterTables(clusterFilePath)
        clusterMap = containers.Map('KeyType','int32','ValueType','any');
        allClustersInFolder = ls(strcat(clusterFilePath,"/*.xlsx"));
        allClustersInFolder = string(allClustersInFolder);
        disp(height(allClustersInFolder))
        for i=1:height(allClustersInFolder)
            disp(allClustersInFolder(i))
            tempTable = readtable(strcat(clusterFilePath,"\",allClustersInFolder(i)));
            clusterMap(i) = tempTable;
        end
    end
    function [name,date] = getNameAndDate(temporaryTable,locationInTable)
        nameAndDate = string(temporaryTable{locationInTable,1});
        nameAndDate = strsplit(nameAndDate);
        name = nameAndDate{1};
        date = formatTheDate(nameAndDate{2});
    end
    function originalDataFromTable = getOGDataFromDatabase(clusterMap,tableToPullFrom)
        originalDataFromTable = containers.Map('KeyType','int32','ValueType','any');
        conn = database("live_database","postgres","1234");
        for i = keys(clusterMap)
            for j=1:height(clusterMap(i{1}))
               tempTable = clusterMap(i{1});
               [name,date] = getNameAndDate(tempTable,j);
               query = strcat("SELECT * FROM ",tableToPullFrom, " WHERE subjectid = '", name,"' AND date = '",date,"';");
               result = fetch(conn,query);
               try
                   originalDataFromTable(i{1}) = [originalDataFromTable(i{1});result];
               catch
                   originalDataFromTable(i{1}) = result;
               end
            end
%             disp(originalDataFromTable(i{1}))
%             disp(height(originalDataFromTable(i{1})))
        end
    end
    function formattedDate=formatTheDate(unformattedDate)
        formattedDate = strrep(unformattedDate,"-","/");
        formattedDate = strrep(formattedDate,".mat","");

    end
    function [] = createSingleSigmoid(mapOfOGData)
        for i = keys(mapOfOGData)
            x = mapOfOGData(i{1});
            x = [x.x1;x.x2;x.x3;x.x4];
            y = mapOfOGData(i{1});
            y = [y.y1;y.y2;y.y3;y.y4];
%             disp([x,y])
%             disp("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
                        figure 
            [fitobject2, gof2] = fit(x, y, '1 / (1 + (b*exp(-c * x)))');
            figure2 = plot(fitobject2, x, y);
            ylabel("Choice")
            xlabel("Reward")
            title(strcat("2 Param Sigmoid: Cluster ",string(i{1})))
            fighandle2 = gcf;
            
            figure
            [fitobject3, gof3] = fit(x,y,'(a/(1+b*exp(-c*(x))))');
%           display(fitobject)
            figure3 = plot(fitobject3,x,y);
            ylabel("Choice")
            xlabel("Reward")
            title(strcat("3 Param Sigmoid: Cluster ",string(i{1})))
            fighandle3 = gcf;

            figure 
            [fitobject4, gof4] = fit(x, y, '(a/(1+(b*(exp(-c*(x-d))))))');
            figure4 = plot(fitobject4, x, y);
            ylabel("Choice")
            xlabel("Reward")
            title(strcat("4 Param Sigmoid: Cluster ",string(i{1})))
            fighandle4 = gcf;

        end
    end
allClustersInReactionTimeFile = readClusterTables("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\New Base Data\Reaction Time Clusters");
assignin('base','allClustersFile',allClustersInReactionTimeFile)
originalData = getOGDataFromDatabase(allClustersInReactionTimeFile,"newbaselinereactiontimepsychometricfunctions");
assignin('base','OGData',originalData)
createSingleSigmoid(originalData)

end