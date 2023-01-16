function sigmoidClustering

    function[] = createMaxVsShiftPlot(newTable1, numberOfClusters1,newTable2,numberOfClusters2,whichFeature)
        sigmoidMax1 = log(abs(newTable1.A));
        horizShift1 = log(abs(newTable1.B));
        labels1 = newTable1.D;
        maxVsShift1 = [sigmoidMax1, horizShift1];
        labels1 = [labels1,labels1];
        %         createThePlot(maxVsShift,labels1,numberOfClusters,"Max","Shift",whichFeature,colorOrGrayscale);

        sigmoidMax2 = log(abs(newTable2.A));
        horizShift2 = log(abs(newTable2.B));
        labels2 = newTable2.D;
        maxVsShift2 = [sigmoidMax2, horizShift2];
        labels2 = [labels2,labels2];


        createThePlot(maxVsShift1,labels1,numberOfClusters1,maxVsShift2,labels2,numberOfClusters2,"Max","Shift",whichFeature);

    end
    function[] = createMaxVsSteepnessPlot(newTable1,numberOfClusters1,newTable2,numberOfClusters2,whichFeature)
        sigmoidMax1 = log(abs(newTable1.A));
        sigmoidSteepness1 = log(abs(newTable1.C));
        labels1 = newTable1.D;
        maxVsSteepness1 = [sigmoidMax1, sigmoidSteepness1];
        labels1 = [labels1,labels1];

        sigmoidMax2 = log(abs(newTable2.A));
        sigmoidSteepness2 = log(abs(newTable2.C));
        labels2 = newTable2.D;
        maxVsSteepness2 = [sigmoidMax2, sigmoidSteepness2];
        labels2 = [labels2,labels2];

        createThePlot(maxVsSteepness1,labels1,numberOfClusters1,maxVsSteepness2,labels2,numberOfClusters2,"Max","Steepness",whichFeature)
    end
    function[] = createShiftVsSteepnessPlot(newTable1,numberOfClusters1,newTable2,numberOfClusters2,whichFeature)
        sigmoidShift1 = log(abs(newTable1.B));
        sigmoidSteepness1 = log(abs(newTable1.C));
        labels1 = newTable1.D;
        shiftVsSteepness1 = [sigmoidShift1,sigmoidSteepness1];
        labels1 = [labels1,labels1];

        sigmoidShift2 = log(abs(newTable2.B));
        sigmoidSteepness2 = log(abs(newTable2.C));
        labels2 = newTable2.D;
        shiftVsSteepness2 = [sigmoidShift2,sigmoidSteepness2];
        labels2 = [labels2,labels2];


        createThePlot(shiftVsSteepness1,labels1,numberOfClusters1,shiftVsSteepness2,labels2,numberOfClusters2,"Shift","Steepness",whichFeature)
    end


travelPixelSigmoidTableGhrelin = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Saline-Grahline-Alcohol-Food Deprivation Analysis\Travel Pixel Sigmoid Data");
travelPixelSigmoidTable=getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Travel Pixel\All Sigmoids");
createMaxVsShiftPlot(travelPixelSigmoidTable,3,travelPixelSigmoidTableGhrelin,3,"Travel Pixel")
figure
createMaxVsSteepnessPlot(travelPixelSigmoidTable,3,travelPixelSigmoidTableGhrelin,4,"Travel Pixel")
figure
createShiftVsSteepnessPlot(travelPixelSigmoidTable,4,travelPixelSigmoidTableGhrelin,5,"Travel Pixel")

stoppingPointsSigmoidTableGhrelin = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Saline-Grahline-Alcohol-Food Deprivation Analysis\Stopping Points Sigmoid Data");
stoppingPointsSigmoidTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Stopping Points\All Sigmoids");
createMaxVsShiftPlot(stoppingPointsSigmoidTable,3,stoppingPointsSigmoidTableGhrelin,3,"Stopping Points")
figure
createMaxVsSteepnessPlot(stoppingPointsSigmoidTable,4,stoppingPointsSigmoidTableGhrelin,4,"Stopping Points")
figure
createShiftVsSteepnessPlot(stoppingPointsSigmoidTable,3,stoppingPointsSigmoidTableGhrelin,4,"Stopping Points")

rotationPointsSigmoidTableGhrelin = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Saline-Grahline-Alcohol-Food Deprivation Analysis\Rotation Points Sigmoid Data");
rotationPointsSigmoidTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Rotation Points\All Sigmoids");
createMaxVsShiftPlot(rotationPointsSigmoidTable,4,rotationPointsSigmoidTableGhrelin,3,"Rotation Points")
figure
createMaxVsSteepnessPlot(rotationPointsSigmoidTable,4,rotationPointsSigmoidTableGhrelin,3,"Rotation Points")
figure
createShiftVsSteepnessPlot(rotationPointsSigmoidTable,3,rotationPointsSigmoidTableGhrelin,4,"Rotation Points")


reactionTimeSigmoidTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Reaction Time 1st\All Sigmoids");
reactionTimeSigmoidTableGhrelin = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Saline-Grahline-Alcohol-Food Deprivation Analysis\Reaction Time Sigmoid Data");
createMaxVsShiftPlot(reactionTimeSigmoidTable,4,reactionTimeSigmoidTableGhrelin,3,"Reaction Time")
figure
createMaxVsSteepnessPlot(reactionTimeSigmoidTable,3,reactionTimeSigmoidTableGhrelin,3,"Reaction Time")
figure
createShiftVsSteepnessPlot(reactionTimeSigmoidTable,4,reactionTimeSigmoidTableGhrelin,3,"Reaction Time")


rewardChoiceSigmoidTableGhrelin =getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Saline-Grahline-Alcohol-Food Deprivation Analysis\Reward Choice Sigmoid Data");
rewardChoiceSigmoidTable = getTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Reward Choice\All Sigmoids");

createMaxVsShiftPlot(rewardChoiceSigmoidTable,4,rewardChoiceSigmoidTableGhrelin,4,"Reward Choice")
figure
createMaxVsSteepnessPlot(rewardChoiceSigmoidTable,3,rewardChoiceSigmoidTableGhrelin,3,"Reward Choice")
figure
createShiftVsSteepnessPlot(rewardChoiceSigmoidTable,3,rewardChoiceSigmoidTableGhrelin,2,"Reward Choice")

end