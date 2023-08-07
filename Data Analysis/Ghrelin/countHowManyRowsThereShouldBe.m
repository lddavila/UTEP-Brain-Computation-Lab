numberOfExpectedRows = 0;
for i=1:height(Map)
%     disp(Map{i,2}{1})
%     disp(count((Map{i,2}{1}),',','IgnoreCase',true))
    numberOfExpectedRows = numberOfExpectedRows + count(Map{i,2}{1},',');
end
display(strcat("There should be this many rows in our table:",string(numberOfExpectedRows)) )
conn = database("live_database","postgres","1234");
query = "SELECT subjectid, date, feeder, approachavoid,rewardconcentration1,rewardconcentration2,rewardconcentration3,rewardconcentration4 FROM live_table WHERE date = '01/12/2022';";
result = fetch(conn,query);