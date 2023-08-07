function [] = createClustersForAllData()
    function[] = createNewTable(filePathOfDesiredData,featureAndGraphLetter,numberOfClusters,workingDirectory,featureName,experimentName)
        newTable = getTable(filePathOfDesiredData);
        %Get ALL sigmoid data, and scale it using log and absolute value
        sigmoidMax = log(abs(newTable.A));
        horizShift = log(abs(newTable.B));
        labels = newTable.D;
        maxVsShift = [sigmoidMax, horizShift];
        labels = [labels,labels];
        createThePlot(maxVsShift,labels,numberOfClusters,"Max","Shift",featureName,featureAndGraphLetter,workingDirectory,experimentName);

    end
    function [newDirectory] = storeClustersInNewDirectory(nameOfNewDirectory)
        mkdir(nameOfNewDirectory)
        ogDirectory = cd(nameOfNewDirectory);
        newDirectory = cd(ogDirectory);

    end
foodDeprivationDirectory = storeClustersInNewDirectory("Food Deprivation");
salineDirectory=storeClustersInNewDirectory("Saline");
ghrelinDirectory=storeClustersInNewDirectory("Ghrelin");
oxycodoneDirectory=storeClustersInNewDirectory("Oxycodone");
alchoholDirectory=storeClustersInNewDirectory("Alchohol");
isoflureneDirectory=storeClustersInNewDirectory("Isoflurene");

%Food Deprivation
% createNewTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Food Deprivation Analysis\Travel Pixel Sigmoid Data","A",3,foodDeprivationDirectory,"Travel Pixel","Food Deprivation") %Travel Pixel
% createNewTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Food Deprivation Analysis\Stopping Points Sigmoid Data","D",3,foodDeprivationDirectory,"Stopping Points", "Food Deprivation") %stopping Points
% createNewTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Food Deprivation Analysis\Rotation Points Sigmoid Data","G",3,foodDeprivationDirectory, "Rotation Points","Food Deprivation") %Rotation Points
% createNewTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Food Deprivation Analysis\Reaction Time Sigmoid Data","J",3,foodDeprivationDirectory,"Reaction Time","Food Deprivation") %Reaction Time
createNewTable("C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\Food Deprivation Analysis\Reward Choice Sigmoid Data","M",3,foodDeprivationDirectory,"Reward Choice","Food Deprivation") %Reward Choice

end