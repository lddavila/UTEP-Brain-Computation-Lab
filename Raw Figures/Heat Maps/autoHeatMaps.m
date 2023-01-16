function [] =autoHeatMaps(travelPixelFilePath, ...
    stoppingPointsFilePath, ...
    rotationPointsFilePath, ...
    reactionTimeFilePath, ...
    rewardChoiceSigmoidFilePath, ...
    saveFilePath)
    function[] = makeRewardChoiceHeatMaps(feature)
        sigmoidTable = getTable(rewardChoiceSigmoidFilePath);
        display(sigmoidTable)
        sigmoidTableNew = removevars(sigmoidTable,{'D'});
        sigmoidArray = table2array(sigmoidTableNew);
        display(sigmoidArray)
        figure
        densityScatterChart(log(abs(sigmoidArray(:,1))),log(abs(sigmoidArray(:,2))));
        xlabel("Max")
        ylabel("Shift")
        title(strcat(feature," Max Vs Shift"))
        savefig(strcat(saveFilePath,"\",feature," Max Vs Shift"))
        close

        figure
        densityScatterChart(log(abs(sigmoidArray(:,1))),log(abs(sigmoidArray(:,3))));
        title(strcat(feature," Max Vs Steepness"))
        xlabel("Max")
        ylabel("Steepness")
        savefig(strcat(saveFilePath,"\",feature," Max Vs Steepness"))
        close

        figure
        densityScatterChart(log(abs(sigmoidArray(:,2))),log(abs(sigmoidArray(:,3))));
        title(strcat(feature," Shift Vs Steepness"))
        xlabel("Shift")
        ylabel("Steepness")
        savefig(strcat(saveFilePath,"\",feature," Shift Vs Steepness"))
        close
    end

    function[] = makeTravelPixelHeatMaps(feature)
        sigmoidTable = getTable(travelPixelFilePath);
        sigmoidTableNew = removevars(sigmoidTable,{'D'});
        sigmoidArray = table2array(sigmoidTableNew);

        figure
        densityScatterChart(log(abs(sigmoidArray(:,1))),log(abs(sigmoidArray(:,2))));
        xlabel("Max")
        ylabel("Shift")
        title(strcat(feature," Max Vs Shift"))
        savefig(strcat(saveFilePath,"\",feature," Max Vs Shift"))
        close

        figure
        densityScatterChart(log(abs(sigmoidArray(:,1))),log(abs(sigmoidArray(:,3))));
        title(strcat(feature," Max Vs Steepness"))
        xlabel("Max")
        ylabel("Steepness")
        savefig(strcat(saveFilePath,"\",feature," Max Vs Steepness"))
        close

        figure
        densityScatterChart(log(abs(sigmoidArray(:,2))),log(abs(sigmoidArray(:,3))));
        title(strcat(feature," Shift Vs Steepness"))
        xlabel("Shift")
        ylabel("Steepness")
        savefig(strcat(saveFilePath,"\",feature," Shift Vs Steepness"))
        close
    end

    function[] = makeStoppingPointsHeatMaps(feature)
        sigmoidTable = getTable(stoppingPointsFilePath);
        sigmoidTableNew = removevars(sigmoidTable,{'D'});
        sigmoidArray = table2array(sigmoidTableNew);

        figure
        densityScatterChart(log(abs(sigmoidArray(:,1))),log(abs(sigmoidArray(:,2))));
        xlabel("Max")
        ylabel("Shift")
        title(strcat(feature," Max Vs Shift"))
        savefig(strcat(saveFilePath,"\",feature," Max Vs Shift"))
        close

        figure
        densityScatterChart(log(abs(sigmoidArray(:,1))),log(abs(sigmoidArray(:,3))));
        title(strcat(feature," Max Vs Steepness"))
        xlabel("Max")
        ylabel("Steepness")
        savefig(strcat(saveFilePath,"\",feature," Max Vs Steepness"))
        close

        figure
        densityScatterChart(log(abs(sigmoidArray(:,2))),log(abs(sigmoidArray(:,3))));
        title(strcat(feature," Shift Vs Steepness"))
        xlabel("Shift")
        ylabel("Steepness")
        savefig(strcat(saveFilePath,"\",feature," Shift Vs Steepness"))
        close
    end
    function[] = makeRotationPointsHeatMaps(feature)
        sigmoidTable = getTable(rotationPointsFilePath);
        sigmoidTableNew = removevars(sigmoidTable,{'D'});
        sigmoidArray = table2array(sigmoidTableNew);

        figure
        densityScatterChart(log(abs(sigmoidArray(:,1))),log(abs(sigmoidArray(:,2))));
        xlabel("Max")
        ylabel("Shift")
        title(strcat(feature," Max Vs Shift"))
        savefig(strcat(saveFilePath,"\",feature," Max Vs Shift"))
        close

        figure
        densityScatterChart(log(abs(sigmoidArray(:,1))),log(abs(sigmoidArray(:,3))));
        title(strcat(feature," Max Vs Steepness"))
        xlabel("Max")
        ylabel("Steepness")
        savefig(strcat(saveFilePath,"\",feature," Max Vs Steepness"))
        close

        figure
        densityScatterChart(log(abs(sigmoidArray(:,2))),log(abs(sigmoidArray(:,3))));
        title(strcat(feature," Shift Vs Steepness"))
        xlabel("Shift")
        ylabel("Steepness")
        savefig(strcat(saveFilePath,"\",feature," Shift Vs Steepness"))
        close
    end
    function[] = makeReactionTimeHeatMaps(feature)
        sigmoidTable = getTable(reactionTimeFilePath);
        sigmoidTableNew = removevars(sigmoidTable,{'D'});
        sigmoidArray = table2array(sigmoidTableNew);

        figure
        densityScatterChart(log(abs(sigmoidArray(:,1))),log(abs(sigmoidArray(:,2))));
        xlabel("Max")
        ylabel("Shift")
        title(strcat(feature," Max Vs Shift"))
        savefig(strcat(saveFilePath,"\",feature," Max Vs Shift"))
        close

        figure
        densityScatterChart(log(abs(sigmoidArray(:,1))),log(abs(sigmoidArray(:,3))));
        title(strcat(feature," Max Vs Steepness"))
        xlabel("Max")
        ylabel("Steepness")
        savefig(strcat(saveFilePath,"\",feature," Max Vs Steepness"))
        close

        figure
        densityScatterChart(log(abs(sigmoidArray(:,2))),log(abs(sigmoidArray(:,3))));
        title(strcat(feature," Shift Vs Steepness"))
        xlabel("Shift")
        ylabel("Steepness")
        savefig(strcat(saveFilePath,"\",feature," Shift Vs Steepness"))
        close
    end

makeRewardChoiceHeatMaps("Reward Choice")
makeTravelPixelHeatMaps("Travel Pixel")
makeStoppingPointsHeatMaps("Stopping Points")
makeRotationPointsHeatMaps("Rotation Points")
makeReactionTimeHeatMaps("Reaction Time")
end