function oxySigmoidClustering

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

currentFolder = pwd;
display(currentFolder)

travelPixelSigmoidTableOxy = getTable(strcat(currentFolder,"\Travel Pixel Sigmoid Data"));
travelPixelSigmoidTable=getTable("..\Old Base Data\Travel Pixel Sigmoid Data");
createMaxVsShiftPlot(travelPixelSigmoidTable,3,travelPixelSigmoidTableOxy,3,"Travel Pixel")

figure
stoppingPointsSigmoidTableOxy = getTable(strcat(currentFolder,"\Stopping Points Sigmoid Data"));
stoppingPointsSigmoidTable = getTable("..\Old Base Data\Stopping Points Sigmoid Data");
createMaxVsShiftPlot(stoppingPointsSigmoidTable,3,stoppingPointsSigmoidTableOxy,3,"Stopping Points")

end