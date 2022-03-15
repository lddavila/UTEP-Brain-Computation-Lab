datasource = 'live_database'; %ENTER YOUR DATASOURCE NAME HERE, default should be "live_database"
username = ''; %ENTER YOUR USERNAME HERE, default should be "postgres"
password = ''; %ENTER YOUR PASSWORD HERE, default should be "1234"
conn = database(datasource,username,password); %creates the database connection
%the line below makes a query written in PostgreSQL that will create the
%live_table
sqlquery = strcat("CREATE TABLE live_table(subjectID VARCHAR, gender VARCHAR, birthdate VARCHAR, genotype VARCHAR, cagenumber VARCHAR, health VARCHAR, cagemates VARCHAR, experimenter VARCHAR, tasktypedone VARCHAR, notes VARCHAR, intensityofcost1 VARCHAR, intensityofcost2 VARCHAR, intensityofcost3 VARCHAR, intensityofcost4 VARCHAR, costprobability1 VARCHAR, costprobability2 VARCHAR, costprobability3 VARCHAR, costprobability4 VARCHAR, rewardconcentration1 VARCHAR, rewardconcentration2 VARCHAR, rewardconcentration3 VARCHAR, rewardconcentration4 VARCHAR, rewardvolume1 VARCHAR, rewardvolume2 VARCHAR, rewardvolume3 VARCHAR, rewardvolume4 VARCHAR, rewardprobability1 VARCHAR, rewardprobability2 VARCHAR, rewardprobability3 VARCHAR, rewardprobability4 VARCHAR, mazenumber VARCHAR, approachavoidtimestamp VARCHAR, approachavoid VARCHAR, playstarttrialtone VARCHAR, presentcost VARCHAR, lightlevel VARCHAR, referencetime VARCHAR, videostartime VARCHAR, feeder VARCHAR, stoptrack VARCHAR, trialname VARCHAR, detectionsettings VARCHAR, trialcontrolsettings VARCHAR, referenceduration VARCHAR, animalid VARCHAR, mazeofferdelivery VARCHAR, mazenoofferdelivery VARCHAR, starttime VARCHAR, recordingafter VARCHAR, recordingduration VARCHAR, trialduration VARCHAR, mazecostoff VARCHAR, coordinatetimes VARCHAR [], xcoordinates VARCHAR [], ycoordinates VARCHAR [], presentcostend VARCHAR, costpresenetationfinish VARCHAR, stopincopixrecording VARCHAR, decisionmakingtime VARCHAR,startincopixrecording VARCHAR, date VARCHAR, activezonetimestamp VARCHAR,activezonevalue VARCHAR,presentcosttimestamp VARCHAR,costacknowledgementtimestamp VARCHAR,deliveryacknowledgementtimestamp VARCHAR);");
%runs the query and creates the live_table on the database
execute(conn,sqlquery)

%reads the live_table and prints its contents
%will be empty on first run
rows = sqlread(conn,"live_table");
 disp(rows)