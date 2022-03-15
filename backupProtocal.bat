cd C:\Program Files\PostgreSQL\14\bin
set PGPASSWORD=ENTER PASSWORD HERE
pg_dump -U postgres -F t live_database > "ENTER DIRECTORY YOU WANT TO BACKUP TO HERE\backupFile1.tar
pg_dump -U postgres -F t live_database > "ENTER DIRECTORY YOU WANT TO BACKUP TO HERE\backupFile2.tar
pg_dump -U postgres -F t live_database > "ENTER DIRECTORY YOU WANT TO BACKUP TO HERE\backupFile3.tar
pg_dump -U postgres -F t live_database > "ENTER DIRECTORY YOU WANT TO BACKUP TO HERE\backupFile4.tar
pg_dump -U postgres -F t live_database > "ENTER DIRECTORY YOU WANT TO BACKUP TO HERE\backupFile5.tar