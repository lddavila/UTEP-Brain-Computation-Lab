datasource = 'live_database'; %ENTER YOUR DATASOURCE NAME HERE, default should be "live_database"
username = 'postgres'; %ENTER YOUR USERNAME HERE, default should be "postgres"
password = '1234'; %ENTER YOUR PASSWORD HERE, default should be "1234"
conn = database(datasource,username,password); %creates the database connection

query = "SELECT x1,x2,x3,x4,y1,y2,y3,y4 FROM psychomaticalfunctions;";
results = fetch(conn,query);
display(results)
% display(head(results,10))

results = table2array(results);

%coeff = pca(results);
%disp(coeff)


mapcaplot(results)

% get_new_pcs(results1(1,:))

