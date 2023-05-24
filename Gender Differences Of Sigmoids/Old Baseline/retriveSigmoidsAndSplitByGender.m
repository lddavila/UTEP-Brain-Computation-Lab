function retriveSigmoidsAndSplitByGender
    function[] = retrieveTheDesiredSigmoids(clusterName,nameOfFeature,desiredMDirectory,desiredFDirectory)
        mkdir(desiredMDirectory)
        ogDir = cd(desiredMDirectory);
        mDir = cd(ogDir);

        mkdir(desiredFDirectory)
        cd(desiredFDirectory)
        fDir = cd(ogDir);
        givenClusterTable = readtable(strcat(clusterName,'.xlsx'));
        namesOfFiles = givenClusterTable.clusterLabels;
%         display(namesOfFiles)
        [mList,fList] = splitByGender(namesOfFiles);
%         display(mList)
%         display(fList)
        cd(nameOfFeature);


        for i=1:length(mList)
            %             display(mList(i))
            try
                copyfile(strrep(mList(i),".mat",".fig"),mDir)
            catch
            end
        end

        for i=1:length(fList)
            try
            copyfile(strrep(fList(i),".mat",".fig"),fDir)
            catch
            end
        end
        cd(ogDir)
    end
    function newValue = getRidOfDateAndFileFormat(x)
        %         disp(x)
        tempValue = split(x);
        newValue = string(tempValue(1));
    end
    function[maleFileNames,femaleFileNames] = splitByGender(fileNames)
        keySet = {'alexis','kryssia', 'harley','raissa','andrea','fiona','sully','jafar','kobe','jr',...
            'scar','jimi','sarah','raven','shakira','renata','neftali','juana',...
            'mike','aladdin','carl','simba','johnny','captain','pepper','buzz', ...
            'ken', 'woody','slinky','rex', 'trixie','barbie','bopeep','wanda', ...
            'vision','buttercup','monster'};

        valueSet = {'f', 'f','f','f','f','f','m','m','m','m','m','m','f','f','f','f',...
            'f','f','m','m','m','m','m','m','f','m','m','m','m','m','f','f',...
            'f','f','f','f','f'};
        %count = 0;
        ratGenders = containers.Map(keySet,valueSet);
        maleFileNames = [];
        femaleFileNames = [];
        for i=1:length(fileNames)
            currentGender = getRidOfDateAndFileFormat(string(fileNames(i)));
            if strcmpi(ratGenders(currentGender),'f')
                femaleFileNames = [femaleFileNames;string(fileNames(i))];
            elseif strcmpi(ratGenders(currentGender),'m')
                maleFileNames = [maleFileNames;string(fileNames(i))];
            end
        end
    end
clusterName = ["A2","A3","D1","J1","J2","J4","G2"];
featureName = ["Travel Pixel","Travel Pixel","Stopping Points","Reaction Time","Reaction Time","Reaction Time", "Rotation Points"];

for j=1:length(clusterName)
%     display(featureName(j))
%     display(clusterName(j))
    retrieveTheDesiredSigmoids(clusterName(j),strcat("Sigmoids ",featureName(j)),strcat(clusterName(j)," Male Sigmodis"),strcat(clusterName(j)," Female Sigmoids"))
end

end