function [] = findRatProbabilities()
    %this funciton will collect all the feature data in table format
    %also returns a container with all the clusters found in the given file
    %only works if all clusters are stored in .xlsx files
    function [travelPixelTable,...
            stoppingPointsTable,...
            rotationPointsTable,...
            reactionTimeTable,...
            rewardChoiceTable,clusterMap] = compileFeatureTables(fileWithAllClusters)
        clusterMap = containers.Map('KeyType','char','ValueType','any');
        allClusters = ls(strcat(fileWithAllClusters,"\*.xlsx"));
        allClusters = string(allClusters);
        workingFolder = cd(fileWithAllClusters);

        travelPixelTable = [];
        stoppingPointsTable =[];
        rotationPointsTable = [];
        reactionTimeTable = [];
        rewardChoiceTable = [];

        for i=1:length(allClusters)
%             disp(class(i))
%             disp(i)
            %     disp(contains(i,"A"))
            clusterMap(strrep(allClusters(i),".xlsx","")) = readtable(allClusters(i));
            if contains(allClusters(i),"A")
%                 disp("Went into first contains")
                %To get unique travel pixel data you need only to get all A-files and put them together in one table
                if isempty(travelPixelTable)
                    travelPixelTable = readtable(allClusters(i));
%                     disp("Went into travel Pixel IF")
                else
%                     disp("Went into the else")
                    travelPixelTable = [travelPixelTable;readtable(allClusters(i))];
                end

            elseif contains(allClusters(i),"D")
                %same principle, but with Stopping Points Points
                if isempty(stoppingPointsTable)
                    stoppingPointsTable = readtable(allClusters(i));
                else
                    stoppingPointsTable = [stoppingPointsTable;readtable(allClusters(i))];
                end
            elseif contains(allClusters(i),"G")
                %same thing, but with Rotation Points
                if isempty(rotationPointsTable)
                    rotationPointsTable = readtable(allClusters(i));
                else
                    rotationPointsTable = [rotationPointsTable;readtable(allClusters(i))];
                end
            elseif contains(allClusters(i),"J")
                %Same thing but with reaction time
                if isempty(reactionTimeTable)
                    reactionTimeTable = readtable(allClusters(i));
                else
                    reactionTimeTable = [reactionTimeTable;readtable(allClusters(i))];
                end
            elseif contains(allClusters(i),"M")
                %same thing, but with reward choice
                if isempty(rewardChoiceTable)
                    rewardChoiceTable = readtable(allClusters(i));
                else
                    rewardChoiceTable = [rewardChoiceTable;readtable(allClusters(i))];
                end
            end
        end
        cd(workingFolder)
    end
    %counts how many times a rat appears in a given table
    %each table is a dataset
    function [ratCount] = howMany(givenTable,givenKeySet,givenValueSet)
        localKeySet = givenKeySet;
        localValueSet = givenValueSet;
        
        ratCount= containers.Map(localKeySet,localValueSet);

        for i=1:height(givenTable)
            label = char(givenTable{i,1});
            label = split(label);
            label=string(label(1));
%             disp(label)
            ratCount(label) = ratCount(label)+1;
        end
    end
    %find how many times each rat appears in each cluster
    function [ratCountByCluster] = findRatCountByCluster(mapOfAllClusters)
        ratCountByCluster = containers.Map('KeyType','char','ValueType','any');
        allClusterNames = string(keys(mapOfAllClusters));
        allClusterValues = values(mapOfAllClusters);
        
        for i=1:length(allClusterValues)
            for j=1:height(allClusterValues{i})
                ratName = char(allClusterValues{i}{j,1});
                ratName = split(ratName);
                ratName = string(ratName(1));
                try
                    ratCountByCluster(strcat(ratName, " ", allClusterNames{i})) = ratCountByCluster(strcat(ratName, " ",allClusterNames{i}))+1;
                catch
                    ratCountByCluster(strcat(ratName, " ", allClusterNames{i})) = 1;
                end
            end
        end
%     display([keys(ratCountByCluster).',values(ratCountByCluster).'])

    end
    function [rat_total_appearences] = putTotalRatAppearencesColumnTogether(givenRatClusterName)
        localRatClusterName = givenRatClusterName;
        rat_total_appearences = [];
        for i =1:height(localRatClusterName)
            name = strsplit(localRatClusterName{i}," ");
            cluster = name{2};
            name = name{1};
            if contains(cluster,"A") || contains(cluster,"B") || contains(cluster,"C")
                rat_total_appearences=[rat_total_appearences;travelPixelRatCount(name)];
            elseif contains(cluster,"D") || contains(cluster,"E") || contains(cluster,"F")
                rat_total_appearences=[rat_total_appearences;stoppingPointsRatCount(name)];
            elseif contains(cluster,"G") || contains(cluster,"H") || contains(cluster,"I")
                rat_total_appearences=[rat_total_appearences;rotationPointsRatCount(name)];
            elseif contains(cluster,"J") || contains(cluster,"K") || contains(cluster,"L")
                rat_total_appearences=[rat_total_appearences;reactionTimeRatCount(name)];
            elseif contains(cluster,"M") || contains(cluster,"N") || contains(cluster,"O")
                rat_total_appearences=[rat_total_appearences;rewardChoiceRatCount(name)];
            end
        end
    end
% % [travelPixelTable,...
%             stoppingPointsTable,...
%             rotationPointsTable,...
%             reactionTimeTable,...
%             rewardChoiceTable,allClustersMap] = compileFeatureTables("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\New Base Data\All Clusters In Dataset");
[travelPixelTable,...
            stoppingPointsTable,...
            rotationPointsTable,...
            reactionTimeTable,...
            rewardChoiceTable,allClustersMap] = compileFeatureTables("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Find Euclidian Distances From Baseline to Experiments\Create Probability Tables\Food Deprivation");

keySet = {'alexis','kryssia', 'harley','raissa','andrea','fiona','sully','jafar','kobe','jr',...
    'scar','jimi','sarah','raven','shakira','renata','neftali','juana',...
    'mike','aladdin','carl','simba','johnny','captain','pepper','buzz', ...
    'ken', 'woody','slinky','rex', 'trixie','barbie','bopeep','wanda', ...
    'vision','buttercup','monster'};

valueSet = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,...
    0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,...
    0,0,0,0,0};
travelPixelRatCount = howMany(travelPixelTable,keySet,valueSet);
stoppingPointsRatCount = howMany(stoppingPointsTable,keySet,valueSet);
rotationPointsRatCount=howMany(rotationPointsTable,keySet,valueSet);
reactionTimeRatCount=howMany(reactionTimeTable,keySet,valueSet);
rewardChoiceRatCount=howMany(rewardChoiceTable,keySet,valueSet);

% display([keys(travelPixelRatCount).',values(travelPixelRatCount).'])
eachRatsClusterAppearences = findRatCountByCluster(allClustersMap);

ratClusterName = keys(eachRatsClusterAppearences).';
ratClusterCount = values(eachRatsClusterAppearences).';
ratTotalAppearences = putTotalRatAppearencesColumnTogether(ratClusterName);
probabilitiesTable = table(ratClusterName,ratClusterCount,ratTotalAppearences);
display(probabilitiesTable);

writetable(probabilitiesTable,"Food Deprivation Probabilities Table.csv")


end