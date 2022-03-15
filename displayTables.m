datasource = 'live_database'; %ENTER YOUR DATASOURCE NAME HERE, default should be "live_database"
username = ''; %ENTER YOUR USERNAME HERE, default should be "postgres"
password = ''; %ENTER YOUR PASSWORD HERE, default should be "1234"
conn = database(datasource,username,password); %creates the database connection
tablename = "";     %ENTER THE NAME OF THE TABLE YOU WANT TO SEE HERE
                    %examples: "live_table" "dummy_table" "rat_table"
rows = sqlread(conn,tablename);
display(rows)
