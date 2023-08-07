function[] = findGenderProbabilitiesOfClusters()
    function [name] = formatName(theunFormattedString)
        nameAndDate = split(theunFormattedString," ");
        name = nameAndDate(1);
    end
    function gender = addAColumnForGender(x)
        keySet = {'alexis', 'kryssia', 'harley','raissa','andrea','fiona','sully','jafar',...
            'kobe','jr','scar','jimi','sarah','raven','shakira','renata',...
            'neftali','juana','mike','aladdin','carl','simba','johnny','captain',...
            'pepper','buzz','ken','woody','slinky','rex','trixie','barbie',...
            'bopeep','wanda','vision','buttercup','monster'};

        valueSet = {'female','female','female','female','female','female','Male','Male',...
            'Male','Male',   'Male','Male',   'Female','Female','Female','Female', ...
            'Female','Female','Male','Male',  'Male','male',   'male','Male',   ...
            'Female','Male', 'Male',  'Male', 'Male',  'Male', 'Female','Female', ...
            'Female','Female','Female','Female','Female'};

        theNameToGender = containers.Map(keySet,valueSet);
        gender = string(theNameToGender(formatName(string(x))));
    end
    function [numberOfMales,numberOfFemales] = combineGenderColumnWithTable(oldTable)
        f = @addAColumnForGender;
        baseNewColumn =rowfun(f,table(oldTable.clusterLabels),'OutputVariableNames','Gender');
        newTableWithGenderColumnAdded = table(oldTable.clusterLabels, ...
                        oldTable.clusterX, ...
                        oldTable.clusterY, ...
                        baseNewColumn.Gender, ...
                        'VariableNames',{'clusterLabels','clusterX','clusterY','Gender'});
        malesTable = newTableWithGenderColumnAdded((strcmpi(newTableWithGenderColumnAdded.Gender,"male")),:);
%         display(malesTable)
        femalesTable =newTableWithGenderColumnAdded((strcmpi(newTableWithGenderColumnAdded.Gender,"female")),:);
%         display(femalesTable)
        numberOfMales = height(malesTable);
        numberOfFemales = height(femalesTable);

    end
    function [mapOfClustersToMales,mapOfClustersToFemales]=findGenderProbabilitiesOfAllClusters(clustersFilePath)
        homeDir = cd(clustersFilePath);
        listOfAllClusters = {'A1','A2','A3'...
            'D1','D2','D3',...
            'G1','G2','G3','G4',...
            'J1','J2','J3','J4',...
            'M1','M2','M3','M4'};
        defaultValues = [0,0,0,...
            0,0,0,...
            0,0,0,0,...
            0,0,0,0,...
            0,0,0,0];

        travelPixel = [readtable("A1.xlsx");readtable("A2.xlsx");readtable("A3.xlsx")];
        [travelPixelMales,travelPixelFemales] = combineGenderColumnWithTable(travelPixel);

        stoppingPoints = [readtable("D1.xlsx"); readtable("D2.xlsx");readtable("D3.xlsx")];
        [stoppingPointsMales,stoppingPointsFemales] = combineGenderColumnWithTable(stoppingPoints);

        rotationPoints = [readtable("G1.xlsx");readtable("G2.xlsx");readtable("G3.xlsx");readtable("G4.xlsx")];
        [rotationPointsMales,rotationPointsFemales] = combineGenderColumnWithTable(rotationPoints);
        
        reactionTime = [readtable("J1.xlsx"); readtable("J2.xlsx");readtable("J3.xlsx");readtable("J4.xlsx")];
        [reactionTimeMales,reactionTimeFemales] = combineGenderColumnWithTable(reactionTime);

        rewardChoice = [readtable("M1.xlsx");readtable("M2.xlsx");readtable("M3.xlsx");readtable("M4.xlsx")];
        [rewardChoiceMales,rewardChoiceFemales] = combineGenderColumnWithTable(rewardChoice);


        mapOfClustersToMales = containers.Map(listOfAllClusters,defaultValues);
        mapOfClustersToFemales = containers.Map(listOfAllClusters,defaultValues);

        for i=1:length(listOfAllClusters)
            currentCluster = string(listOfAllClusters(i));
            currentClusterTable = readtable(strcat(currentCluster,".xlsx"));
            [currentMales,currentFemales] = combineGenderColumnWithTable(currentClusterTable);
            if contains(currentCluster,"A")
                mapOfClustersToMales(currentCluster) = currentMales/travelPixelMales;
                mapOfClustersToFemales(currentCluster) = currentFemales/travelPixelFemales;
            elseif contains(currentCluster,"D")
                mapOfClustersToMales(currentCluster) = currentMales/stoppingPointsMales;
                mapOfClustersToFemales(currentCluster) = currentFemales/stoppingPointsFemales;
            elseif contains(currentCluster,"G")
                mapOfClustersToMales(currentCluster) = currentMales/rotationPointsMales;
                mapOfClustersToFemales(currentCluster) = currentFemales/rotationPointsFemales;
            elseif contains(currentCluster,"J")
                mapOfClustersToMales(currentCluster) = currentMales/reactionTimeMales;
                mapOfClustersToFemales(currentCluster) = currentFemales/reactionTimeFemales;
            elseif contains(currentCluster,"M")
                mapOfClustersToMales(currentCluster) = currentMales/rewardChoiceMales;
                mapOfClustersToFemales(currentCluster) = currentFemales/rewardChoiceFemales;
            end


        end
        cd(homeDir)

    end

[baselineMaleMap,baselineFemaleMap] = findGenderProbabilitiesOfAllClusters('C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Find Euclidian Distances From Baseline to Experiments\Create Probability Tables\Baseline');
% display([keys(baselineMaleMap).',values(baselineMaleMap).',values(baselineFemaleMap).'])
writetable(table(keys(baselineMaleMap).',values(baselineMaleMap).',values(baselineFemaleMap).','VariableNames',{'Cluster_Name','Male_Probability','Female_Probability'}),'BaselineMaleVsFemale.csv');

[foodDepMaleMap,foodDepFemaleMap] = findGenderProbabilitiesOfAllClusters("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Find Euclidian Distances From Baseline to Experiments\Create Probability Tables\Food Deprivation");
writetable(table(keys(foodDepMaleMap).',values(foodDepMaleMap).',values(foodDepFemaleMap).','VariableNames',{'Cluster_Name','Male_Probability','Female_Probability'}),'foodDepMaleVsFemale.csv');

[ghrelinMaleMap,ghrelinFemaleMap] = findGenderProbabilitiesOfAllClusters("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Find Euclidian Distances From Baseline to Experiments\Create Probability Tables\Ghrelin");
writetable(table(keys(ghrelinMaleMap).',values(ghrelinMaleMap).',values(ghrelinFemaleMap).','VariableNames',{'Cluster_Name','Male_Probability','Female_Probability'}),'ghrelinMaleVsFemale.csv');
end
