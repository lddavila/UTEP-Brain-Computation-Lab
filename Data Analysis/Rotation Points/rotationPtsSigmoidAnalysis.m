function rotationPtsSigmoidAnalysis
    function[] = createSigmoidFigures(results)
        for i = 1:height(results)
            x = results{i,[3,4,5,6]};
            y = results{i,[7,8,9,10]};


            disp("Went into the else")
            %                 display(y.')
            figure
            [fitobject1, gof1]= fit(x.',y.','a*x+b');
            figure1 = plot(fitobject1,x.',y.');
            ylabel("Choice")
            xlabel("Reward")
            title(strcat("Line: ",string(results{i,1})," ", strrep(string(results{i,2}),"/","-")))
            fighandle1 = gcf;


            figure
            [fitobject2, gof2] = fit(x.', y.', '1 / (1 + (b*exp(-c * x)))');
            figure2 = plot(fitobject2, x.', y.');
            ylabel("Choice")
            xlabel("Reward")
            title(strcat("2 Param Sigmoid: ",string(results{i,1}), " ", strrep(string(results{i,2}),"/", "-")))
            fighandle2 = gcf;

            figure
            [fitobject3, gof3] = fit(x.',y.','(a/(1+b*exp(-c*(x))))');
            %           display(fitobject)
            figure3 = plot(fitobject3,x.',y.');
            ylabel("Choice")
            xlabel("Reward")
            title(strcat("3 Param. Sigmoid: ", string(results{i,1})," ", strrep(string(results{i,2}),"/","-")))
            fighandle3 = gcf;

            figure
            [fitobject4, gof4] = fit(x.', y.', '(a/(1+(b*(exp(-c*(x-d))))))');
            figure4 = plot(fitobject4, x.', y.');
            ylabel("Choice")
            xlabel("Reward")
            title(strcat("4 Param Sigmoid: ",string(results{i,1}), " ", strrep(string(results{i,2}),"/", "-")))
            fighandle4 = gcf;


            figure
            [fitobject5, gof5] = fit(x.',y.','a*(x-b)^(2)+c');
            figure5 =plot(fitobject5,x.',y.');
            ylabel("Choice")
            xlabel("Reward")
            title(strcat("Parabola: ", string(results{i,1})," ", strrep(string(results{i,2}),"/","-")))
            fighandle5 = gcf;





            %             display(gof1.rsquare)
            %             display(gof2.rsquare)
            %             display(gof3.rsquare)
            dynamicName = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\";


            if gof3.rsquare >= .4
                saveas(fighandle3,strcat(dynamicName,"Rotation Pts 3 Parameter Sigmoid\",string(results{i,1})," ", strrep(string(results{i,2}),"/","-"),".fig"))
                save(strcat(dynamicName,'Rotation Pts Sigmoid Data\',string(results{i,1})," ", strrep(string(results{i,2}),"/","-"),'.mat'),'fitobject3')
            elseif gof4.rsquare >= .4
                saveas(fighandle4,strcat(dynamicName,"Rotation Pts 4 Parameter Sigmoid\",string(results{i,1})," ", strrep(string(results{i,2}),"/","-"),".fig"))
                save(strcat(dynamicName,'Rotation Pts Sigmoid Data\',string(results{i,1})," ", strrep(string(results{i,2}),"/","-"),'.mat'),'fitobject4')
            elseif gof2.rsquare >= .4
                saveas(fighandle2,strcat(dynamicName,"Rotation Pts 2 Parameter Sigmoid\",string(results{i,1})," ", strrep(string(results{i,2}),"/","-"),".fig"))
                save(strcat(dynamicName,'Rotation Pts Sigmoid Data\',string(results{i,1})," ", strrep(string(results{i,2}),"/","-"),'.mat'),'fitobject2')
            elseif gof1.rsquare > gof5.rsquare
                saveas(fighandle1,strcat(dynamicName,"Rotation Pts Line\",string(results{i,1})," ", strrep(string(results{i,2}),"/","-"),".fig"))
                save(strcat(dynamicName,'Rotation Pts Line Data\',string(results{i,1})," ", strrep(string(results{i,2}),"/","-"),'.mat'),'fitobject1')
            elseif gof5.rsquare > gof1.rsquare
                saveas(fighandle5,strcat(dynamicName,"Rotation Pts Parabola\",string(results{i,1})," ", strrep(string(results{i,2}),"/","-"),".fig"))
                save(strcat(dynamicName,'Rotation Pts Parabola Data\',string(results{i,1})," ", strrep(string(results{i,2}),"/","-"),'.mat'),'fitobject5')
            end


            close all





        end
    end

datasource = 'live_database'; %ENTER YOUR DATASOURCE NAME HERE, default should be "live_database"
username = 'postgres'; %ENTER YOUR USERNAME HERE, default should be "postgres"
password = '1234'; %ENTER YOUR PASSWORD HERE, default should be "1234"
conn = database(datasource,username,password); %creates the database connection

query = "SELECT subjectid,date,x1,x2,x3,x4,y1,y2,y3,y4 FROM rotationptspsychomaticalfunctions;";

results = fetch(conn,query);
%display(results)

createSigmoidFigures(results)
end