%this is an altered version og get_LG_boost_probabilities.m
%it has been modified to work with paritionDataByWeeks.m
%it uses the collectAllDataInAMapAltered.m which has also been altered
function [] = getLG_Boost_Altered(nameOfFolderWithClusters,radarPlotFolder,probTablesFolder,byGenderPopulationOrIndividual,ratList)
    function[] = byPopulation(nameOfFolderWithClusters,radarPlotFolder,probTablesFolder)
        lg_boost = ["lg_boost|TP","lg_boost|SP","lg_boost|RP","lg_boost|RC"];
        lg_boost_Data = collectAllDataInAMapAltered(lg_boost);
        sizeOfLGBoost= getSizeOfAllDataSets(lg_boost_Data);
        sizeOfLGBoostClusters=getSizesOfEachClusterAltered(nameOfFolderWithClusters,byGenderPopulationOrIndividual,"");
        probabilities = calculatePopulationProbabilitiesAltered(sizeOfLGBoostClusters,sizeOfLGBoost);
        Cluster_Names = keys(probabilities).';
        Probabilities = values(probabilities).';
        tableOfClusterProbabilities = table(Cluster_Names,Probabilities);
        writetable(tableOfClusterProbabilities,strcat(nameOfFolderWithClusters,' lg_boost_cluster_probabilities.xlsx'));
        writetable(tableOfClusterProbabilities,strcat(probTablesFolder,"\",nameOfFolderWithClusters,' lg_boost_cluster_probabilities.xlsx'));
        listOfAllProbabilities = tableOfClusterProbabilities.Probabilities;
        allProbabilities = [];
        for i=1:length(listOfAllProbabilities)
            allProbabilities = [allProbabilities,listOfAllProbabilities{i}];
        end
        allZeroes = [0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0.];
        allOnes = [1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1.];
        old_baseline_probabilities = [0.12935883,0.410573678,0.460067492,0.122377622,0.697552448,0.18006993,0.709352518,0.143884892,0.01294964,0.13381295,0.035555556,0.434666667,0.145777778,0.384];

        figure
        spider_plot([old_baseline_probabilities;...
            allProbabilities],...
            'AxesLabels',{"Travel Pixel Cluster 1","Travel Pixel Cluster 2","Travel Pixel Cluster 3",...
            "Stopping Points Cluster 1","Stopping Points Cluster 2","Stopping Points Cluster 3", ...
            "Rotation Points Cluster 1","Rotation Points Cluster 2","Rotation Points Cluster 3","Rotation Points Cluster 4",...
            "Reward Choice Cluster 1","Reward Choice Cluster 2","Reward Choice Cluster 3","Reward Choice Cluster 4"},...
            'AxesLimits',[allZeroes;allOnes],'AxesRadial','off');
        title(nameOfFolderWithClusters)
        legend('Baseline','Lg Boost','Location', 'southoutside')
        saveas(gcf,strcat(radarPlotFolder,"\",nameOfFolderWithClusters,'.fig'))
        close all
    end
    function[] = byIndividual(nameOfFolderWithClusters,radarPlotFolder,probTablesFolder,listOfRats)
        for currentRat=1:length(listOfRats)
            sizeOfLGBoostClusters=getSizesOfEachClusterAltered(strcat(nameOfFolderWithClusters,"\",listOfRats(currentRat)),byGenderPopulationOrIndividual,listOfRats(currentRat));
            keySet = {'A1','A2','A3',...
                'D1','D2','D3','G1','G2','G3','G4',...
                'M1','M2','M3','M4'};
            valueSet = [0,0,0,0,0,0,0,0,0,0,0,0,0,0];
            probabilities = containers.Map(keySet,valueSet);
            sizeOfTP = sizeOfLGBoostClusters('A1') + sizeOfLGBoostClusters('A2') + sizeOfLGBoostClusters('A3');
            sizeOfSP = sizeOfLGBoostClusters('D1') + sizeOfLGBoostClusters('D2') + sizeOfLGBoostClusters('D3');
            sizeOfRP = sizeOfLGBoostClusters('G1') + sizeOfLGBoostClusters('G2') + sizeOfLGBoostClusters('G3') +sizeOfLGBoostClusters('G4');
            sizeOfRC = sizeOfLGBoostClusters('M1') + sizeOfLGBoostClusters('M2') + sizeOfLGBoostClusters('M3') +sizeOfLGBoostClusters('M4');
            for currentKey=1:length(keySet)
                currentCluster = string(keySet(currentKey));
                if contains(currentCluster,"A")
                    probabilities(currentCluster) = sizeOfLGBoostClusters(currentCluster) / sizeOfTP;
                elseif contains(currentCluster,"D")
                    probabilities(currentCluster) = sizeOfLGBoostClusters(currentCluster) / sizeOfSP;
                elseif contains(currentCluster,"G")
                    probabilities(currentCluster) = sizeOfLGBoostClusters(currentCluster) / sizeOfRP;
                elseif contains(currentCluster,"M")
                    probabilities(currentCluster) = sizeOfLGBoostClusters(currentCluster) / sizeOfRC;
                end

            end
            Cluster_Names = keys(probabilities).';
            Probabilities = values(probabilities).';
            tableOfClusterProbabilities = table(Cluster_Names,Probabilities);
            writetable(tableOfClusterProbabilities,strcat(nameOfFolderWithClusters,"\",listOfRats(currentRat),' lg_boost_cluster_probabilities.xlsx'));
            if ~exist(strcat(probTablesFolder,"\",listOfRats(currentRat)),"dir")
                mkdir(strcat(probTablesFolder,"\",listOfRats(currentRat)))                
            end
            writetable(tableOfClusterProbabilities,strcat(probTablesFolder,"\",listOfRats(currentRat),"\",nameOfFolderWithClusters,' lg_boost_cluster_probabilities.xlsx'));
            listOfAllProbabilities = tableOfClusterProbabilities.Probabilities;
            allProbabilities = [];
            for i=1:length(listOfAllProbabilities)
                allProbabilities = [allProbabilities,listOfAllProbabilities{i}];
            end
            allProbabilities(isnan(allProbabilities))=0;
            allZeroes = [0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0., 0.];
            allOnes = [1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1., 1.];
            old_baseline_probabilities = [0.12935883,0.410573678,0.460067492,0.122377622,0.697552448,0.18006993,0.709352518,0.143884892,0.01294964,0.13381295,0.035555556,0.434666667,0.145777778,0.384];

        figure
        spider_plot([old_baseline_probabilities;...
            allProbabilities],...
            'AxesLabels',{"Travel Pixel Cluster 1","Travel Pixel Cluster 2","Travel Pixel Cluster 3",...
            "Stopping Points Cluster 1","Stopping Points Cluster 2","Stopping Points Cluster 3", ...
            "Rotation Points Cluster 1","Rotation Points Cluster 2","Rotation Points Cluster 3","Rotation Points Cluster 4",...
            "Reward Choice Cluster 1","Reward Choice Cluster 2","Reward Choice Cluster 3","Reward Choice Cluster 4"},...
            'AxesLimits',[allZeroes;allOnes],'AxesRadial','off');
        title(strcat(listOfRats(currentRat)," ",nameOfFolderWithClusters))
        legend('Baseline','Lg Boost','Location', 'southoutside')
        saveas(gcf,strcat(radarPlotFolder,"\",listOfRats(currentRat)," ",nameOfFolderWithClusters,'.fig'))
        close all
        end
    end
if strcmpi(byGenderPopulationOrIndividual,"Population")
    byPopulation(nameOfFolderWithClusters,radarPlotFolder,probTablesFolder)
elseif strcmpi(byGenderPopulationOrIndividual,"Individual")
%     display(ratList)
    byIndividual(nameOfFolderWithClusters,radarPlotFolder,probTablesFolder,ratList)
elseif strcmpi(byGenderPopulationOrIndividual,"Gender")
end
end