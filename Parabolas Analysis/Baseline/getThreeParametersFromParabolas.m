function getThreeParametersFromParabolas
    function [name,date] = formatDate(unformattedString)
        nameAndDate = split(unformattedString," ");
        name = nameAndDate(1);
        date = strrep(nameAndDate(2),".mat","");
        date = strrep(date,"-","/");
    end
    function[] =plotTheValues(pathOfData,featureName,logOrNot)
        newTable = getTable(strcat(pwd,"\",pathOfData));
        vertShift = newTable.C;
        horizShift = newTable.B;
        slope = newTable.A;
        if logOrNot
            vertShift = log(vertShift);
            horizShift = log(horizShift);
            slope = log(slope);
         
        end
        display(vertShift)
        display(horizShift)
        display(slope)
        figure
        scatter(vertShift,horizShift)
        xlabel("Vertical Shift")
        ylabel("Horizontal Shift")
        title(strcat(featureName," Vertical Shift Vs Horizontal Shift"))

        figure
        scatter(vertShift,slope)
        xlabel("Vertical Shift")
        ylabel("Slope")
        title(strcat(featureName," Vertical Shift Vs Slope"))

        figure
        scatter(horizShift,slope)
        xlabel("Horizontal Shift")
        ylabel("Slope")
        title(strcat(featureName," Horizontal Shift Vs Slope"))
    end





% plotTheValues("Reaction Time Parabolas Data","Reaction Time",1)
% plotTheValues("Reward Choice Parabola Data","Reward Choice",1)
% plotTheValues("Rotation Points Parabola Data","Rotation Points",1)
% plotTheValues("Stopping Points Parabolas Data","Stopping Points",1)
% plotTheValues("Travel Pixel Parabola Data","Travel Pixel",1)

end