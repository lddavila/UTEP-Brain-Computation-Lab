conn = database("live_database","postgres","1234");
query = "SELECT health FROM live_table WHERE health LIKE '%Ghrelin%' OR health LIKE '%ghrelin%';";
% query = "SELECT health FROM live_table WHERE health LIKE '%Incubation%' OR health LIKE '%incubation%';";
disp(query)
result = fetch(conn,query);
display(result)