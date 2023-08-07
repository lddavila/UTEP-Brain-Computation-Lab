conn = database("live_database","postgres","1234");
query = "SELECT * FROM live_table WHERE id = 100;";
result = fetch(conn,query);