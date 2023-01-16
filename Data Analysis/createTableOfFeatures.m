function createTableOfFeatures
    function[files] = createListOfFiles(baseFilePath,sigmoidFilePath,rescuedSigmoidFilePath)
    
        myFiles = dir(fullfile(strcat(baseFilePath,sigmoidFilePath),'*.mat'));
        files = [];
        for k = 1:length(myFiles)
            baseFileName = myFiles(k).name;
            files = [files,convertCharsToStrings(baseFileName)];
        end
        myFiles = dir(fullfile(strcat(baseFilePath,rescuedSigmoidFilePath),'*.mat'));
        for k = 1:length(myFiles)
            baseFileName=myFiles(k).name;
            files = [files,convertCharsToStrings(baseFileName)];
        end
        files = files.';
    end
    function[universalFiles] = filesThatAppearInAll(RT, RC, RP, SP, TP)
        %&& contains(RC(i,1),RP) && contains(RC(i,1),SP)
        universalFiles = [];
        for i=1:length(RC)
            if contains(RC(i,1),RT)  && contains(strrep(RC(i,1)," ", ""),strrep(TP," ",""))
                universalFiles = [universalFiles,RC(i,1)];
            end
        end
        universalFiles = universalFiles.'; 
    end

reactionTimeFP= 'C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Reaction Time 1st\';
reactionTimeSigmoidsFP = 'Reaction Time 1st Sigmoids Data';
reactionTimeRescuedSigmoidsFP = 'Reaction Time 1st Rescued Sigmoid Data'; 
reactionTimeFiles = createListOfFiles(reactionTimeFP,reactionTimeSigmoidsFP,reactionTimeRescuedSigmoidsFP);

rewardChoiceFP= 'C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Reward Choice\';
rewardchoiceSigmoidFP = 'Sigmoid Data';
rewardChoiceRescuedSigmoidFP = 'Rescued Sigmoid Data';
rewardChoiceFiles = createListOfFiles(rewardChoiceFP,rewardchoiceSigmoidFP,rewardChoiceRescuedSigmoidFP);

rotationPointsFP= 'C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Rotation Points\';
rotationPointsSigmoidFP = 'Rotation Pts Sigmoid Data';
rotationPointsRescuedSigmoidFP = 'Rotation Pts Rescued Sigmoid Data';
rotationPointsFiles = createListOfFiles(rotationPointsFP,rotationPointsSigmoidFP,rotationPointsRescuedSigmoidFP);

stoppingPointsFP= 'C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Stopping Points\';
stoppingPointsSigmoidFP = 'Stopping Points Sigmoids Data';
stoppingPointsRescuedSigmoidFP = 'Stopping Points Rescued Sigmoid Data';
stoppingPointsFiles = createListOfFiles(stoppingPointsFP,stoppingPointsSigmoidFP,stoppingPointsRescuedSigmoidFP);

travelPixelFP = 'C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\Travel Pixel\';
travelPixelSigmoidFP = 'Travel Pixel Sigmoid Data';
travelPixelRescuedSigmoidFP = 'Travel Pixel Saved Sigmoid Data';
travelPixelFiles = createListOfFiles(travelPixelFP,travelPixelSigmoidFP,travelPixelRescuedSigmoidFP);

disp(size(reactionTimeFiles))
disp(size(rewardChoiceFiles))
disp(size(rotationPointsFiles))
disp(size(stoppingPointsFiles))
disp(size(travelPixelFiles))

display(class(reactionTimeFiles))
display(class(rewardChoiceFiles))
display(class(rotationPointsFiles))
display(class(stoppingPointsFiles))
display(class(travelPixelFiles))

allFiles = filesThatAppearInAll(reactionTimeFiles,rewardChoiceFiles, rotationPointsFiles,stoppingPointsFiles,travelPixelFiles);
display(allFiles)
end