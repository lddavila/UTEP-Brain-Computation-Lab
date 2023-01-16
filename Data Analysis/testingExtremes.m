% myDir = "C:\\Users\\ldd77\\OneDrive\\Desktop\\UTEP-Brain-Computation-Lab\\Data Analysis\\Sigmoid Data"; %gets directory
% myFiles = dir(fullfile(myDir,'*.mat')); %gets all .mat files in struct
% A = [];
% B = [];
% C = [];
% newTable= table(A,B,C);
% for k = 1:length(myFiles)
%     baseFileName = myFiles(k).name;
%     fullFileName = fullfile("C:\\Users\\ldd77\\OneDrive\\Desktop\\UTEP-Brain-Computation-Lab\\Data Analysis\\Sigmoid Data", baseFileName);
%     fprintf(1, strcat(string(k),' Now reading %s\n'), baseFileName);
% end

datasource = 'live_database'; %ENTER YOUR DATASOURCE NAME HERE, default should be "live_database"
username = 'postgres'; %ENTER YOUR USERNAME HERE, default should be "postgres"
password = '1234'; %ENTER YOUR PASSWORD HERE, default should be "1234"
conn = database(datasource,username,password); %creates the database connection

query = "SELECT * FROM psychomaticalfunctions WHERE subjectid = 'wanda' AND date = '06/03/2022';";

results = fetch(conn,query);
display(results)
x = results{1,[3,4,5,6]};
y = results{1,[7,8,9,10]};
figure
[fitobject2, gof2] = fit(x.', y.', '1 / (1 + (b*exp(-c * x)))');
figure2 = plot(fitobject2, x.', y.');
ylabel("Choice")
xlabel("Reward")
title(strcat("2 Param Sigmoid: ",string(results{1,1}), " ", strrep(string(results{1,2}),"/", "-")))
fighandle2 = gcf;

figure
[fitobject3, gof3] = fit(x.',y.','(a/(1+b*exp(-c*(x))))');
%           display(fitobject)
figure3 = plot(fitobject3,x.',y.');
ylabel("Choice")
xlabel("Reward")
title(strcat("3 Param. Sigmoid: ", string(results{1,1})," ", strrep(string(results{1,2}),"/","-")))
fighandle3 = gcf;

figure
[fitobject4, gof4] = fit(x.', y.', '(a/(1+(b*(exp(-c*(x-d))))))');
figure4 = plot(fitobject4, x.', y.');
ylabel("Choice")
xlabel("Reward")
title(strcat("4 Param Sigmoid: ",string(results{1,1}), " ", strrep(string(results{1,2}),"/", "-")))
fighandle4 = gcf;