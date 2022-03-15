datasource = "test";
conn = database(datasource,"postgres","Narutouzumaki_12");
tablename = "dec28rattable";

 sqlquery = strcat("CREATE TABLE dec28rattable(name VARCHAR, gender VARCHAR, birthdate VARCHAR, cagenumber VARCHAR, health VARCHAR, genotype VARCHAR, cagemates VARCHAR);"); 
 execute(conn,sqlquery)

data = table("alexis","Female","Alexis birthdate","14290","Alexis Health","Alexis Genotype","Sarah", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("kryssia","Female","Kryssias birthdate","14291","Kryssias Health","Kryssias Genotype","Raven", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("harley","Female","Harleys birthdate","14292","Harleys Health","Harleys Genotype","Shakira", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("raissa","Female","Raissas birthdate","14293","Raissas Health","Raissas Genotype","Renata", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("andrea","Female","Andreas birthdate","14294","Andreas Health","Andreas Genotype","Neftali", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("fiona","Female","Fionas birthdate","14295","Fionas Health","Fionas Genotype","Juana", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("sully","Male","Sullys birthdate","14296","Sullys Health","Sullys Genotype","Mike", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("jafar","Male","Jafars birthdate","14297","Jafars Health","Jafars Genotype","Aladdin", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("kobe","Male","Kobes birthdate","14298","Kobes Health","Kobes Genotype","-", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("jr","Male","Jrs birthdate","14299","Jrs Health","Jrs Genotype","Carl", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("scar","Male","Scars birthdate","14300","Scars Health","Scars Genotype","Simba", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("jimi","Male","Jimis birthdate","14301","Jimis Health","Jimis Genotype","Johnny", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("sarah","Female","Sarahs birthdate","14290","Sarahs Health","Sarahs Genotype","Alexis", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("raven","Female","Ravens birthdate","14291","Ravens Health","Ravens Genotype","Kryssia", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("shakira","Female","Shakiras birthdate","14292","Shakiras Health","Shakiras Genotype","Harley",'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("renata","Female","Renatas birthdate","14293","Renatas Health","Renatas Genotype","Raissa", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("neftali","Female","Neftalis birthdate","14294","Neftalis Health","Neftalis Genotype","Andrea", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("juana","Female","Juanas birthdate","14295","Juanas Health","Juanas Genotype","Fiona", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("mike","Male","Mikes birthdate","14296","Mikes Health","Mikes Genotype","Sully", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("aladdin","Male","Aladdins birthdate","14297","Aladdins Health","Aladdins Genotype","Kobe", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("carl","Male","Carls birthdate","14299","Carls Health","Carls Genotype","Jr", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("simba","male","simbas birthdate","14300","simbas Health","simbas Genotype","Scar", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("johnny","male","Johnnys birthdate","14301","johnnys Health","johnnys Genotype","jimi", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

data = table("None","none","none","none","none","none","none", 'VariableNames',["name", "gender", "birthdate", "cagenumber", "health", "genotype", "cagemates" ]);
sqlwrite(conn,tablename,data)

close(conn) 