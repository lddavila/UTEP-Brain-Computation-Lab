function [] = partitionDataByWeeks(radarPlotFolder,prbTbFold,binSize,paritionByGenderPopulationOrIndividual,genderDirectory,ratList,OGClusterDir)
    function [uniqueDatesToAnimalsOnThoseDates] = getDictionary(feature)
        allFiles = dir(feature);
        uniqueDatesToAnimalsOnThoseDates = containers.Map('KeyType','char','ValueType','any');
        for i=1:length(allFiles)
            currentFile = allFiles(i).name;
            if contains(currentFile,"Data")
                continue
            end
%             disp(currentFile)
            allSigmoidFiles = dir(currentFile);
            for j=3:length(allSigmoidFiles)
                currentSigmoidFile = allSigmoidFiles(j).name;
                currentSigmoidFile = split(currentSigmoidFile);
                date = string(currentSigmoidFile(2));
                date = split(date,".");
                date = string(date(1));
                animalOnThatDate = string(currentSigmoidFile(1));
                if isKey(uniqueDatesToAnimalsOnThoseDates,date)
                    uniqueDatesToAnimalsOnThoseDates(date) = strcat(uniqueDatesToAnimalsOnThoseDates(date),",",animalOnThatDate);
                else
                    uniqueDatesToAnimalsOnThoseDates(date) = animalOnThatDate;
                end
            end
        end
        
    end
    function [homeDir,fileWithRC,fileWithTP,fileWithRP,fileWithSP,fileWhereEverythingWillBeSaved] = getAllFilePaths(fileWhereRCIs,fileWhereTPIs,fileWhereRPIs,fileWhereSPIs,fileWhereEverythingShouldBeReorganized)
        homeDir = cd(fileWhereRCIs);
        fileWithRC = cd(homeDir);
        cd(fileWhereTPIs)
        fileWithTP = cd(homeDir);
        cd(fileWhereRPIs)
        fileWithRP=cd(homeDir);
        cd(fileWhereSPIs)
        fileWithSP=cd(homeDir);
        mkdir(fileWhereEverythingShouldBeReorganized);
        cd(fileWhereEverythingShouldBeReorganized);
        fileWhereEverythingWillBeSaved = cd(homeDir);
    end
    function [workingDir] = copyAllRequiredFiles(homeDir,probTabFold)
        copyfile(strcat(homeDir,"\","savePartitionedDatabaseIntoKnownClusters.m"))
        workingDir = cd("..\..\..\..\Create Probability Tables");
        copyfile("getLG_Boost_Altered.m",workingDir)
        copyfile("collectAllDataInAMapAltered.m",workingDir)
        copyfile("getSizeOfAllDataSets.m",workingDir)
        copyfile("getSizesOfEachClusterAltered.m",workingDir)
        copyfile("calculatePopulationProbabilitiesAltered.m",workingDir)
        copyfile("spider_plot.m",workingDir)
        copyfile("getTable.m",workingDir)
        copyfile("spider_plot.m",probTabFold)
        copyfile("createRadarPlotsFromAllFilesInCurrentFolder.m",probTabFold)
        copyfile("getEuclidianDistanceFromAllFoldersInCurrentDir.m",probTabFold)
    end
    function [] = reorganizeData (fileWhereRCIs,fileWhereTPIs,fileWhereRPIs,fileWhereSPIs,...
            fileWhereEverythingShouldBeReorganized,NumberOfDaysYouWantEverythingBinnedBy,...
            rcDict,tpDict,rpDict,spDict,rpFolder,probTabFold,byGenderPopulationOrIndividual,gd,ratList,OGClustersDir)

        [homeDir,fileWithRC,fileWithTP,fileWithRP,fileWithSP,fileWhereEverythingWillBeSaved] = getAllFilePaths(fileWhereRCIs,fileWhereTPIs,fileWhereRPIs,fileWhereSPIs,fileWhereEverythingShouldBeReorganized);
        
        theKeys = keys(rcDict);
        theValues = values(rcDict);
        cd(fileWhereEverythingWillBeSaved)
        for currentBin=1:floor(length(theKeys)/NumberOfDaysYouWantEverythingBinnedBy)+1
            fileWhereBinedFilesWillBeStored =strcat("Bin Number ", string(currentBin), " Of ",string(NumberOfDaysYouWantEverythingBinnedBy)," Days");
            mkdir(fileWhereBinedFilesWillBeStored)
            cd(fileWhereBinedFilesWillBeStored)
            workingDir = copyAllRequiredFiles(homeDir,probTabFold);
            cd(workingDir)
            
            for currentDay=1+(NumberOfDaysYouWantEverythingBinnedBy*(currentBin-1)):NumberOfDaysYouWantEverythingBinnedBy*currentBin
                if currentDay > length(theKeys)
                    continue
                end
                allRatsOnThatDay = split(theValues{currentDay},",");
                copyTheFiles("RC",fileWithRC,allRatsOnThatDay,theKeys{currentDay});
                
                if isKey(tpDict,theKeys{currentDay})
                    allRatsOnThatDay = split(tpDict(theKeys{currentDay}),",");
                    copyTheFiles("TP",fileWithTP,allRatsOnThatDay,theKeys{currentDay})
                end
                if isKey(rpDict,theKeys{currentDay})
                    allRatsOnThatDay = split(rpDict(theKeys{currentDay}),",");
                    copyTheFiles("RP",fileWithRP,allRatsOnThatDay,theKeys{currentDay})                    
                end
                if isKey(spDict,theKeys{currentDay})
                    allRatsOnThatDay = split(spDict(theKeys{currentDay}),",");
                    copyTheFiles("SP",fileWithSP,allRatsOnThatDay,theKeys{currentDay})
                end
                
            end
            
            dirOfClusterTables = savePartitionedDatabaseIntoKnownClusters(fileWhereBinedFilesWillBeStored,byGenderPopulationOrIndividual,ratList,OGClustersDir);
            getLG_Boost_Altered(dirOfClusterTables,rpFolder,probTabFold,byGenderPopulationOrIndividual,ratList);
%             createRadarPlotsFromAllFilesInCurrentFolder(NumberOfDaysYouWantEverythingBinnedBy)
            cd(fileWhereEverythingWillBeSaved)
        end
        whereIStarted = cd(probTabFold);
        getEuclidianDistanceFromAllFoldersInCurrentDir(ratList,binSize)
        cd(whereIStarted)
        cd(homeDir)
    end
    function[] = copyTheFiles(dirYouWantToMake,sourceDir,listOfRatsOnThatDay,currentDay)
        if ~exist(dirYouWantToMake,'dir')
            mkdir(dirYouWantToMake)
        end
        cd(dirYouWantToMake)
        for currentRat=1:length(listOfRatsOnThatDay)
            copyfile(strcat(sourceDir,"\",listOfRatsOnThatDay{currentRat}," ",currentDay,".mat"))
        end
        cd("..")
    end
    
    disp("Currently Here:")
    disp(pwd)
    rc = "*Reward Choice*Sigmoid*";
    rcDict = getDictionary(rc);
%     disp(size(keys(rcDict)))
    tp = "*Travel Pixel*Sigmoid*";
    tpDict = getDictionary(tp);
%     disp([keys(tpDict).',values(tpDict).']);
    rp = "*Rotation Points*Sigmoid*";
    rpDict = getDictionary(rp);
%     disp(size(keys(rpDict)));
    sp = "*Stopping Points*Sigmoid*";
    spDict = getDictionary(sp);
%     disp(size(keys(spDict)));
    disp("After All the dictrionaries are gotten:")
    disp(pwd)
    mkdir(strcat(radarPlotFolder," ",string(binSize),"d"))
    cd(strcat(radarPlotFolder," ",string(binSize),"d"))
    rpFold = cd("..");
    mkdir(strcat(prbTbFold," ",string(binSize),"d"))
    cd(strcat(prbTbFold," ",string(binSize),"d"))
    pbFold = cd("..");
    if strcmpi(paritionByGenderPopulationOrIndividual,"gender")
        mkdir(genderDirectory)
        cd(genderDirectory)
        gd = cd("..");
    else
        gd= "none";
    end
    
    reorganizeData("Reward Choice Sigmoid Data",...
        "Travel Pixel Sigmoid Data",...
        "Rotation Points Sigmoid Data",...
        "Stopping Points Sigmoid Data",...
        strcat("Re ",string(binSize),"d"),binSize,rcDict,tpDict,rpDict,spDict,rpFold,pbFold,paritionByGenderPopulationOrIndividual,gd,ratList,OGClusterDir)

end

    