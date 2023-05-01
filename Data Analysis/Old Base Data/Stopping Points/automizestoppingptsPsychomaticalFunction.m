function automizestoppingptsPsychomaticalFunction
    function [T] = createMap()
        query = "SELECT referencetime, subjectid, mazenumber FROM live_table;";
        local = fetch(conn,query);

        %take the number of rows in the table
        h = height(local);
        i = 1;
        T = table();
        %creates a table of only the names and dates of the rats trials
        namesAndDates = [local.referencetime,local.subjectid,local.mazenumber];
        %display(namesAndDates)

        %creates matlab containers that have the date as the key and
        %the names as the values
        M = containers.Map('Keytype', 'char', 'ValueType', 'any');

        while i <= h
            %get the original date out of the row
            ogdate = string(namesAndDates(i,1));
            %extract only the first part of the date
            newdate = split(ogdate, " ");
            newdate = string(newdate(1));

            %try to add a new value to the container at key value
            %new date
            try
                %if current name is NOT already in the value then the
                %new name is added to the value
                if contains(namesAndDates(i,2), "none")
                    i = i +1;
                    continue
                end
                if contains(M(newdate),namesAndDates(i,2)) == 0
                    M(newdate) = strcat(M(newdate), string(namesAndDates(i,2)),",");
                end
            catch
                %if we can't add new value to the key that must mean
                %the key doesn't appear yet, so we add the key and the
                %new value to the container
                M(newdate) = strcat(string(namesAndDates(i,2)),",");
            end
            i = i+1;
        end





        %                        disp(keys(M))
        %disp((values(M)).')
        %turn the values set into a vertical array for table formatting
        T.Names = (values(M)).';
        %turn the key set into a vertical array for table formatting
        T.Dates = (keys(M)).';

        sortingRow = [];


        %sort the table so dates appear in ascending order
        i = 1;
        while i <= height(T)
            %split the dates into their independent month/day/year
            dateSplit = split(T{i,2},'/');
            %convert the month/day/year into minutes and add
            dateValue = str2double(dateSplit(1))*43800 +str2double(dateSplit(2))*1440 +str2double(dateSplit(3))*525600;
            %store value into an array
            sortingRow(i) = dateValue;
            i = i +1;
        end
        %             disp(sortingRow)


        sortingTable = table();
        sortingTable.Names = (values(M)).';
        sortingTable.Dates = T.Dates;
        sortingTable.sortingColumn = (sortingRow).';
        %             display(sortingTable)
        %sort the sorting table
        [tblB,~] = sortrows(sortingTable,'sortingColumn');
        %             disp(tblB)

        %store the newly sorted values into the display table
        T.Dates = tblB.Dates;
        T.Names = tblB.Names;

        %rearrage table to put dates first
        T = movevars(T,'Names','After','Dates');


        % %display table to user
        % fig = uifigure;
        % uit = uitable(fig,'ColumnWidth', 'fit', 'Data',T, 'Position', [1,1,510,400]);

        %display(T)
    end
    function [xcoordinates,ycoordinates] = createPsychomaticalFunction(searchResults)
        local = searchResults;
        local2 = [str2double(local.stoppingpts)];
        if sum(isnan(local2)) > 0
            %display(local)
%             display(isnan(table2array(local)))
%             disp("NAN DETECTED")
            return
        end
        numberOfTotalRows = height(local);
        i = 1;
        %keeps track of how many times the rat approaches the
        %designated feeders
        feeder1Totals = 0.00;
        feeder2Totals = 0.00;
        feeder3Totals = 0.00;
        feeder4Totals = 0.00;

        %keeps track of how many times each feeder appears in tests
        feeder1Appearences = 0;
        feeder2Appearences = 0;
        feeder3Appearences = 0;
        feeder4Appearences = 0;

        while i <= numberOfTotalRows
            result3 = fetch(conn,strcat("SELECT feeder,rewardconcentration1,rewardconcentration2,rewardconcentration3,rewardconcentration4 FROM live_table WHERE id = ",string(local{i,1}),";"));
            %disp(i)
            feederValue = string(result3{1,1});
            %display(result3)
            %display(local)
            %if the feeder value appears and it approaches then the
            %feeder1/2/3/4 approaches variable is incremented

            switch feederValue
                %FIX THIS RIGHT HERE ADD THE TRAVEL PIXEL OR OTEHER
                %FEATURE VALUES
                case '1'
                    feeder1Totals = feeder1Totals + str2double(string(local{i,25}));
                case '2'
                    feeder2Totals = feeder2Totals +str2double(string(local{i,25}));
                case '3'
                    feeder3Totals = feeder3Totals+str2double(string(local{i,25}));
                case '4'
                    feeder4Totals = feeder4Totals+str2double(string(local{i,25}));
            end

            %if the feederValue appears the feeder1/2/3/4 Appearences
            %variables are incremented
            switch feederValue
                case '1'
                    feeder1Appearences = feeder1Appearences + 1;
                case '2'
                    feeder2Appearences = feeder2Appearences + 1;
                case '3'
                    feeder3Appearences = feeder3Appearences + 1;
                case '4'
                    feeder4Appearences = feeder4Appearences + 1;
            end
            i = i+1;
        end

        %         approaches = [feeder1Approaches,feeder2Approaches,feeder3Approaches,feeder4Approaches];
        %         %display(approaches)
        %         appearences = [feeder1Appearences, feeder2Appearences,feeder3Appearences,feeder4Appearences];
        %         %display(appearences)

        if feeder1Appearences == 0
            ME = MException("MATLAB:notEnoughInputs","Feeder 1 had no appearences");
            throw(ME)
        end
        if feeder2Appearences == 0
            ME = MException("MATLAB:notEnoughInputs","Feeder 2 had no appearences");
            throw(ME)
        end
        if feeder3Appearences == 0
            ME = MException("MATLAB:notEnoughInputs","Feeder 3 had no appearences");
            throw(ME)
        end
        if feeder4Appearences == 0
            ME = MException("MATLAB:notEnoughInputs","Feeder 4 had no appearences");
            throw(ME)
        end

%         disp("Feeder 1-4 Totals")
%         disp(feeder1Totals)
%         disp(feeder2Totals)
%         disp(feeder3Totals)
%         disp(feeder4Totals)
% 
%         disp("Feeder 1:4 Appearences")
%         disp(feeder1Appearences)
%         disp(feeder2Appearences)
%         disp(feeder3Appearences)
%         disp(feeder4Appearences)

        %feeder[1,2,3,4]ApproachPercentage = number of times rat approached / number of times the feeder appeared
        feeder1Average = feeder1Totals / feeder1Appearences;
        feeder2Average = feeder2Totals / feeder2Appearences;
        feeder3Average =feeder3Totals / feeder3Appearences;
        feeder4Average =feeder4Totals / feeder4Appearences;

        

        %feeder[1,2,3,4]Percentage is the percent concentration stored in the table included in any
        feeder1Percentage = str2double(regexprep(string(result3{1,2}),'%','')) / 100;
        feeder2Percentage = str2double(regexprep(string(result3{1,3}),'%',''))/100;
        feeder3Percentage = str2double(regexprep(string(result3{1,4}),'%',''))/100;
        feeder4Percentage = str2double(regexprep(string(result3{1,5}),'%',''))/100;

        ycoordinates = [feeder1Average, feeder2Average, feeder3Average, feeder4Average ];
        xcoordinates = [feeder1Percentage, feeder2Percentage, feeder3Percentage, feeder4Percentage];


%         display(xcoordinates)
%         display(ycoordinates)
    end
datasource = 'live_database'; %ENTER YOUR DATASOURCE NAME HERE, default should be "live_database"
username = 'postgres'; %ENTER YOUR USERNAME HERE, default should be "postgres"
password = '1234'; %ENTER YOUR PASSWORD HERE, default should be "1234"
conn = database(datasource,username,password); %creates the database connection

%A map where the key is the date and the value is the list of all rats that
%ran trials on htat date
T = createMap;
counter = 1;
while counter <= size(T,1)
    try
        animalsOnThatDate = (split(string(T{counter,2}),","));
        animalsOnThatDate = animalsOnThatDate.';
        secondaryCounter = 1;
        while secondaryCounter <= width(animalsOnThatDate)
            try
                if strcmp(string(animalsOnThatDate{secondaryCounter}), "")
                    secondaryCounter = secondaryCounter+1;
                    continue
                end
                theDate = strrep(string(T{counter,1}),'/',"-");
                theDate = char(theDate);
                %display(theDate)
                theYear = theDate(7:10);
                theMonthAndDay = theDate(1:5);
                theformattedDate = strcat(theYear,"-",theMonthAndDay);
                %display(theformattedDate)
                query = strcat("SELECT * FROM featuretable WHERE referencetime LIKE '",theformattedDate,"%'"," AND subjectid = '", animalsOnThatDate{secondaryCounter},"';");

                disp(query);

                searchResults = fetch(conn,query);
%                 display(searchResults)
                searchResults2 = rmmissing(searchResults, 'DataVariables',"stoppingpts");
                %display(searchResults)
                if height(searchResults) == 0
%                     display(searchResults)
%                     disp("The following query resulted in NaNs")
%                     disp(query)
                    counter = counter+1;
                    continue
                end
                %creates the psychomatical function
                [xcoordinates,ycoordinates] = createPsychomaticalFunction(searchResults2);
                %         display(class(xcoordinates))
                %         display(class(ycoordinates))
                data = table(string(animalsOnThatDate{secondaryCounter}),string(T{counter,1}),...
                    xcoordinates(1),xcoordinates(2),xcoordinates(3),xcoordinates(4),...
                    ycoordinates(1),ycoordinates(2),ycoordinates(3),ycoordinates(4),...
                    'VariableNames', ["subjectid","date","x1","x2","x3","x4","y1","y2","y3","y4"]);
                %uploads the psychomatical function to the "psychomaticalFunctions"
                %table in the database
                sqlwrite(conn,"stoppingptsPsychomaticalFunctions",data)
%                 disp("the following query was written to the travelpixeltable")
%                 disp(query)
                secondaryCounter = secondaryCounter +1;
            catch
                disp("Error occured for the following query")
                disp(query)
                counter = counter+1;
                secondaryCounter = secondaryCounter+1;
            end
        end
        % disp(animalsOnThatDate)



        counter = counter+1;
    catch
        disp("Error occured for the following query")
        disp(query)
        counter = counter+1;
    end



end



end