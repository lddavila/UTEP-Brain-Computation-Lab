# UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App
This repository contains a detailed instruction set and code to create a remote PostgreSQL database, and connect to it using the included MATLAB app. Please email lddavila@miners.utep.edu with any questions. 
![Shape1](RackMultipart20220315-4-1guvkrt_html_c06232020b168450.gif) ![Shape3](RackMultipart20220315-4-1guvkrt_html_7676f8ef29666595.gif) ![Shape2](RackMultipart20220315-4-1guvkrt_html_8108e8d567170c87.gif)

Luis David Davila

The University of texas at el paso | Brain Computation lab

## Setting up a remote

## PostgreSQL database

And The Serendipity App

# Contents

[Remote Database Folder (What&#39;s included?) 8](#_Toc98248176)

[1.)App Deployment Folder (What&#39;s included?) 8](#_Toc98248177)

[a.AdvanceSearchWindow (.mlapp file) 8](#_Toc98248178)

[b.HardCodeTable (.xlsx file) 8](#_Toc98248179)

[c.InfoWeWant (.xlsx file) 8](#_Toc98248180)

[d.Main (.mlapp file) 8](#_Toc98248181)

[e.postgresql-42.3.1 (.jar file) 8](#_Toc98248182)

[f.Start (.mlapp file) 8](#_Toc98248183)

[IMPORTANT!!!! 8](#_Toc98248184)

[2.)backupProtocal (.bat file) 8](#_Toc98248185)

[3.)createDummyTable (.m file) 9](#_Toc98248186)

[4.)createLiveTable (.m file) 9](#_Toc98248187)

[5.)createRatTable (.m file) 9](#_Toc98248188)

[6.)displayTables (.m file) 9](#_Toc98248189)

[Introduction 9](#_Toc98248190)

[Things to Download Before Beginning 9](#_Toc98248191)

[Configuring the Firewall 11](#_Toc98248192)

[Configuring PostgreSQL for Remote Access 1](#_Toc98248193)

[Creating A Server and Database 6](#_Toc98248194)

[What&#39;s the recommended password 7](#_Toc98248195)

[recommended server name 10](#_Toc98248196)

[Recommended Database Name 15](#_Toc98248197)

[Creating a Database Connection 17](#_Toc98248198)

[What should I put in my fields? 20](#_Toc98248199)

[Name 20](#_Toc98248200)

[Vendor 20](#_Toc98248201)

[Driver Location 20](#_Toc98248202)

[Database 20](#_Toc98248203)

[Server 20](#_Toc98248204)

[Port Number 21](#_Toc98248205)

[Creating the Live Table In your database (createLiveTable.m) 21](#_Toc98248206)

[Creating Rat Table (createRatDatabase.m) 1](#_Toc98248207)

[Creating a Dummy Table (createDummyTable.m) 1](#_Toc98248208)

[Look at Tables(displayTables.m) 1](#_Toc98248209)

[Establishing Backups (backupProtocal.bat) 2](#_Toc98248210)

[Pro tip 2](#_Toc98248211)

[The Serendipity App 9](#_Toc98248212)

[Start.mlapp 9](#_Toc98248213)

[Callbacks 9](#_Toc98248214)

[SetDriverPathButtonPushed 9](#_Toc98248215)

[SetIPAddressButtonPushed 9](#_Toc98248216)

[LoginButtonPushed 10](#_Toc98248217)

[Properties 10](#_Toc98248218)

[app.IPAddressSet 10](#_Toc98248219)

[app.driverPathSet 10](#_Toc98248220)

[app.driverPath 10](#_Toc98248221)

[Main.mlapp 10](#_Toc98248222)

[CallBacks 10](#_Toc98248223)

[startupFcn 10](#_Toc98248224)

[SearchButtonPushed 10](#_Toc98248225)

[SelectNodulusFileButtonPushed 11](#_Toc98248226)

[SelectRatDropDownValueChanged 11](#_Toc98248227)

[SelectRatDropDown\_2ValueChanged 11](#_Toc98248228)

[SelectRatDropDown\_3ValueChanged 11](#_Toc98248229)

[SelectRatDropDown\_4ValueChanged 11](#_Toc98248230)

[AddDataToDatabaseButtonPushed 12](#_Toc98248231)

[SetTodaysDateButtonPushed 12](#_Toc98248232)

[Port1DropDownValueChanged 12](#_Toc98248233)

[Port2DropDownValueChanged 12](#_Toc98248234)

[Port3DropDownValueChanged 12](#_Toc98248235)

[Port4DropDownValueChanged 13](#_Toc98248236)

[SeeUploadHistoryButtonPushed 13](#_Toc98248237)

[Functions 13](#_Toc98248238)

[results(app) 13](#_Toc98248239)

[organize(app) 13](#_Toc98248240)

[organize2(app) 14](#_Toc98248241)

[orgranize3(app) 14](#_Toc98248242)

[organize4(app) 14](#_Toc98248243)

[checkNamesInAppMatchNamesInFile(app) 14](#_Toc98248244)

[createDatabaseConnection(app) 14](#_Toc98248245)

[Properties 14](#_Toc98248246)

[app.rat1 14](#_Toc98248247)

[app.rat2 14](#_Toc98248248)

[app.rat3 15](#_Toc98248249)

[app.rat4 15](#_Toc98248250)

[app.actual\_table 15](#_Toc98248251)

[app.rattable 15](#_Toc98248252)

[app.password 15](#_Toc98248253)

[app.datasource 15](#_Toc98248254)

[app.username 16](#_Toc98248255)

[app.IPaddress 16](#_Toc98248256)

[app.jarFilePath 16](#_Toc98248257)

[app.files 16](#_Toc98248258)

[app.workingDirectory 16](#_Toc98248259)

[app.info 16](#_Toc98248260)

[app.universalCounter 16](#_Toc98248261)

[app.variableList 16](#_Toc98248262)

[app.universalCurrentNodulusFile 17](#_Toc98248263)

[app.universalVariablesWeWant 17](#_Toc98248264)

[app.rat\_1\_timestamps 17](#_Toc98248265)

[app.rat\_1\_x\_coordinates 17](#_Toc98248266)

[app.rat\_1\_y\_coordinates 17](#_Toc98248267)

[app.rat\_2\_timestamps 17](#_Toc98248268)

[app.rat\_2\_x\_coordinates 17](#_Toc98248269)

[app.rat\_2\_y\_coordinates 17](#_Toc98248270)

[app.rat\_3\_timestamps 17](#_Toc98248271)

[app.rat\_3\_x\_coordinates 18](#_Toc98248272)

[app.rat\_3\_y\_coordinates 18](#_Toc98248273)

[app.rat\_4\_timestamps 18](#_Toc98248274)

[app.rat\_4\_x\_coordinates 18](#_Toc98248275)

[app.rat\_4\_y\_coordinates 18](#_Toc98248276)

[app.driverPath 18](#_Toc98248277)

[app.IPAddress 18](#_Toc98248278)

[app.replaceALLDuplicates 18](#_Toc98248279)

[app.namesFoundUniversal 18](#_Toc98248280)

[app.universalContainer 19](#_Toc98248281)

[AdvanceSearchWindow.mlapp 19](#_Toc98248282)

[Callbacks 19](#_Toc98248283)

[startupFcn 19](#_Toc98248284)

[SearchButtonPushed 19](#_Toc98248285)

[UITableCellSelection 19](#_Toc98248286)

[DeleteSelectedRowButtonPushed 19](#_Toc98248287)

[ExportRowToFileButtonPushed 19](#_Toc98248288)

[UIFigureCloseRequest 19](#_Toc98248289)

[ExportSearchResultToFileButtonPushed 20](#_Toc98248290)

[ImportAndGraphResultsButtonPushed 20](#_Toc98248291)

[AddMoreResultsToFileButtonPushed 20](#_Toc98248292)

[GraphTheseSearchResultsButtonPushed 20](#_Toc98248293)

[Properties 20](#_Toc98248294)

[app.queryResult 20](#_Toc98248295)

[app.index 20](#_Toc98248296)

[app.exportRow 20](#_Toc98248297)

[app.firstOrNot 20](#_Toc98248298)

[app.databaseConnection 21](#_Toc98248299)

[app.username 21](#_Toc98248300)

[app.password 21](#_Toc98248301)

[app.actualTable 21](#_Toc98248302)

[app.queryParts 21](#_Toc98248303)

[app.exportFile 21](#_Toc98248304)

# Remote Database Folder (What&#39;s included?)

1.
## App Deployment Folder (What&#39;s included?)

  1.
### AdvanceSearchWindow (.mlapp file)

This app will conduct basic searches in the live\_table.

  1.
### HardCodeTable (.xlsx file)

This excel file is a representation app.info which is explained later in detail later in this paper.

  1.
### InfoWeWant (.xlsx file)

This excel file is a list of variables we want the Serendipity app to keep track of.

  1.
### Main (.mlapp file)

This app is the main page of the Serendipity app

  1.
### postgresql-42.3.1 (.jar file)

This file is the jar file that the &quot;Start.mlapp&quot; and database connection both need to execute.

  1.
### Start (.mlapp file)

# IMPORTANT!!!!

This app is the start page for Serendipity. It is HIGHLY RECCOMMENDED that you leave this file in the App Deployment folder and simply create a shortcut to this file on your desktop. This can be accomplished by right clicking on &quot;Start.mlapp&quot; and clicking the &quot;Create shortcut&quot; option.

1.
### backupProtocal (.bat file)

This program will automatically create backup files in the designated directory. You must specify the directory by editing the file.

1.
### createDummyTable (.m file)
2.
### createLiveTable (.m file)
3.
### createRatTable (.m file)
4.
### displayTables (.m file)

# Introduction

The purpose of this paper is to give a detailed explanation of how to set up a remote PostgreSQL database that the Serendipity App can read from and write to. It will also provide a high-level explanation of how the Serendipity app works, but for a detailed explanation the source code should be referenced. Together with the Serendipity App and a supporting remote database the Big-Data analysis can easily be performed on neatly sorted data.

A Windows computer should be used for this process for best results, but it could be recreated on other computers with some research on the user&#39;s part.

# Things to Download Before Beginning

The following programs should be downloaded before beginning as they will all be used in the process of creating and setting up the remote database.

1. MATLAB
  1. [https://www.mathworks.com/help/install/ug/install-products-with-internet-connection.html](https://www.mathworks.com/help/install/ug/install-products-with-internet-connection.html)

1. MATLAB App Designer
  1. [https://www.mathworks.com/products/matlab/app-designer.html](https://www.mathworks.com/products/matlab/app-designer.html)
2. MATLAB database toolbox
  1. [https://www.mathworks.com/products/database.html](https://www.mathworks.com/products/database.html)
3. PostgreSQL
  1. [https://www.postgresql.org/download/](https://www.postgresql.org/download/)
4. PostgreSQL JDBC Driver file
  1. [https://jdbc.postgresql.org/download.html](https://jdbc.postgresql.org/download.html)

Provided that everything was properly downloaded we can now begin configuring the computer to allow for remote access.

# Configuring the Firewall

It is important to configure the firewall because without doing this your server will not allow for remote connections, and thus no data will be able to be uploaded making it impossible for the project to continue.

1. Open up the windows control panel, you can find this program by clicking on the windows start logo and searching &quot;Control Panel&quot;

![Picture 33](RackMultipart20220315-4-1guvkrt_html_747fb8a3238fee26.gif)

 ![Picture 34](RackMultipart20220315-4-1guvkrt_html_7ea18d0b4623e5e7.gif)

1. Select the &quot;System and Security&quot; option and arrive at the following screen
2. Select the &quot;Windows Defender Firewall&quot; Option and arrive at the following screen

![Picture 35](RackMultipart20220315-4-1guvkrt_html_edb0a7aafdec4d3c.gif)

1. Click on Advanced Settings and arrive at the following screen.

![Picture 36](RackMultipart20220315-4-1guvkrt_html_94f282c4226de64b.gif)

1. Click on &quot;Inbound Rules&quot; and arrive at the following screen. The listed rules might be different in your particular case, but this is no reason for case.

![Picture 37](RackMultipart20220315-4-1guvkrt_html_6e6eaad887a8e8ad.gif)

1. Click on the &quot;New Rule…&quot; option found under the Actions tab on the right side, and arrive at the following screen

![Picture 38](RackMultipart20220315-4-1guvkrt_html_4878cf44d0407a64.gif)

1. Select the &quot;Port&quot; bubble and click &quot;Next&quot;, arriving at the following screen.

![Picture 39](RackMultipart20220315-4-1guvkrt_html_a271bc956a2e2d6f.gif)

1. Click the &quot;Specific local ports:&quot; bubble and enter &quot;5432&quot; in the text box, which is the default port that PostgreSQL uses. This might change in the future as PostgreSQL releases new updates, PostgreSQL documentation should be referenced for this.

![Picture 40](RackMultipart20220315-4-1guvkrt_html_5fffd04fbf69302e.gif)

1. Click on next and arrive at the following page

![Picture 41](RackMultipart20220315-4-1guvkrt_html_eb117366e8187e8a.gif)

1. Click on the &quot;Allow the connection&quot; bubble and click next, arriving at the following screen.

![Picture 42](RackMultipart20220315-4-1guvkrt_html_87f749a7519f779c.gif)

1. Click &quot;Next&quot; without modifying anything, and arrive at the following page

![Picture 43](RackMultipart20220315-4-1guvkrt_html_e1b13f293b366935.gif)

1. Fill &quot;PostgreSQL Database Rule&quot; in the &quot;Name&quot; field and enter &quot;Rule that allows outside connections to the PostgreSQL database&quot; in the &quot;Description (optional):&quot; field.

![Picture 44](RackMultipart20220315-4-1guvkrt_html_e3959958241a0505.gif)

1. Click &quot;Finish&quot; and you&#39;ll arrive at the following screen.

![](RackMultipart20220315-4-1guvkrt_html_91866e74a7f69576.png)

1. Your rule will now be listed under Inbound Rules and can be deleted, rewritten, or recreated using the previous steps.

# Configuring PostgreSQL for Remote Access

It is import to configure PostgreSQL for Remote Access because by default it does not allow remote access. Without this configuration nothing will be able to be uploaded to the database, and the project cannot continue.

1. Do not begin this portion before downloading PostgreSQL to your computer, if you have not yet done that please refer to page 2
2. The following steps allow for the server you are creating to be accessed remotely, as by default PostgreSQL doesn&#39;t allow remote connections
3. Click on the windows start tab and search for &quot;sql shell&quot; which should have been downloaded to your computer when PostgreSQL was installed.
4. DO NOT left click on the &quot;sql shell&quot; application, instead right click on it and select the &quot;open file location&quot; option

![Picture 11](RackMultipart20220315-4-1guvkrt_html_33d5191615465b90.gif)

1. You&#39;ll arrive at a screen that looks like the following

![Picture 46](RackMultipart20220315-4-1guvkrt_html_aecb51282fe7d8be.gif)

1. Once again right click on SQL shell and arrive at the next screen

![Picture 47](RackMultipart20220315-4-1guvkrt_html_adeca01c71aa23d0.gif)

![Picture 48](RackMultipart20220315-4-1guvkrt_html_245182d318c5f321.gif)

1. Click on &quot;13&quot; and arrive at a screen that should look like the following but may not match exactly. The important part is being able to find the &quot;data&quot; folder. Click on it and look for the pg\_hba.conf file.

![Picture 49](RackMultipart20220315-4-1guvkrt_html_adf8bf7049142673.gif)

1. Open up the file and scroll all the way to the bottom, copy and past the following lines of code.

host all all 0.0.0.0/0 md5

host all all ::/0 md5

1. It should look like the following

![Picture 50](RackMultipart20220315-4-1guvkrt_html_ac772087864ae2e0.gif)

# Creating A Server and Database

Creating the Server and Database allows for the data our project is creating to be stored, thus allowing us to access it whenever necessary.

1. The easiest way to do this is through the &quot;pgAdmin&quot; GUI already installed when you installed PostgreSQL
2. Simply search in the windows start for &quot;pgAdmin&quot; and you should see the following

![Picture 51](RackMultipart20220315-4-1guvkrt_html_5538bbd34b166edb.gif)

## What&#39;s the recommended password

1. Open up the app, you will be prompted to set a master password, make it something simple, recommended &quot;1234&quot;
2. With everything set up you should see a screen like the following

![Picture 52](RackMultipart20220315-4-1guvkrt_html_94979a6e75c294cb.gif)

1. You will not have as many servers as you see in the photo, you will likely start off with just 1 named &quot;PostgreSQL 13&quot;

1. Right click on the &quot;servers&quot; label, go to create-\&gt; server

![Picture 53](RackMultipart20220315-4-1guvkrt_html_31251eb6a50d9a1d.gif)

1. You&#39;ll arrive at the following screen

![Picture 54](RackMultipart20220315-4-1guvkrt_html_4904f1c4eef63e50.gif)

## recommended server name

1. Fill &quot;lab\_server&quot; into the &quot;Name&quot; field

![Picture 55](RackMultipart20220315-4-1guvkrt_html_141078e033ff27a7.gif)

1. Click on the &quot;Connection&quot; tab and arrive at the following screen

![Picture 56](RackMultipart20220315-4-1guvkrt_html_3bfa7680979a9ddd.gif)

1. Fill &quot;localhost&quot; in the &quot;Host name/address&quot; field
2. Fill &quot;5432&quot; in the &quot;Port&quot; field
3. Fil &quot;postgres&quot; in the &quot;Maintenance database&quot; field
4. Fill &quot;postgres&quot; in the &quot;Username&quot; field
5. Fill the previously created master password into the &quot;Password&quot; field
6. Click on Save

![Picture 57](RackMultipart20220315-4-1guvkrt_html_4dc09fb785923fb8.gif)

1. You&#39;ll now see a new server in your servers group named &quot;lab\_server&quot;

![Picture 58](RackMultipart20220315-4-1guvkrt_html_542b2685c5d57de.gif)

1. With this done expand the &quot;lab\_server&quot; tab and right click on &quot;Databases&quot;
2. Go to &quot;Create&quot; -\&gt; &quot;Database&quot;

![Picture 59](RackMultipart20220315-4-1guvkrt_html_4aef603851bb75f9.gif)

## Recommended Database Name

1. Arrive at the following screen and fill in &quot;Live\_Database&quot; into the &quot;Database&quot; field and click save

![Picture 60](RackMultipart20220315-4-1guvkrt_html_ee6b03eabc83bdc.gif)

1. If everything was done correctly then by expanding the &quot;database&quot; menu you should see your newly created database

![Picture 61](RackMultipart20220315-4-1guvkrt_html_1cd91f31848611a0.gif)

1. With all this done your database is now set up

# Creating a Database Connection

Creating the database connection enables the Serendipity app, and other basic connection algorithms to be run. This allows us to actually access the data we have created, enabling the project to move forward.

1. To create a database you must have the MATLAB database toolbox installed, otherwise it is impossible
2. If you do not have it installed, please download it at the following link

[https://www.mathworks.com/products/database.html](https://www.mathworks.com/products/database.html)

1. With the database tool box installed you can now proceed with making a database connection
2. Begin by opening MATLAB
3. Navigate to the &quot;Apps&quot; tab in the taskbar
4. Select the &quot;Database Explorer&quot;
  1. You may need to select the down arrow if the &quot;Database Explorer&quot; app isn&#39;t immediately seen among the other apps
  2. The &quot;Database Explorer&quot; icon can be seen below

![Shape4](RackMultipart20220315-4-1guvkrt_html_51645a225f8ef52.gif)

1. With the database explorer app now open go to the &quot;Connections&quot; grouping and select the &quot;Connect&quot; drown down arrow which will open a new menu

![Picture 63](RackMultipart20220315-4-1guvkrt_html_f37c262c32d554f6.gif)

1. Navigate down to &quot;New Data Source&quot; and Select the &quot;New JDBC Data Source&quot; option which will automatically open a creation wizard

![Picture 64](RackMultipart20220315-4-1guvkrt_html_6af19d8d9bd36422.gif)

## What should I put in my fields?

### Name

If you used the recommended database name found in &quot;Recommended Database Name&quot; then you should enter &quot;live\_database&quot; into this field. If another name was entered when creating the database that same name must be used here.

#### Common mistake

If the name of the database and the name of the database connection do not match, none of the code will work

### Vendor

Select PostgreSQL as the vendor.

### Driver Location

In the &quot;Things to Download Before Beginning&quot; section of this paper, you were instructed to download the JDBC driver file. Here you must select that file before proceeding.

### Database

If you used the recommended database name then you should enter &quot;live\_database&quot;, if you named it something else you must use the other name.

#### Common Mistake

If the value entered here does not match the name of the database entered when creating the database then none of the code will work.

### Server

Enter &quot;localhost&quot; here.

### Port Number

By default it should populate 5432, and this should be perfect as long as the ports were never manually changed by someone for security purposes.

1. With all these fields filled in you can now click on the &quot;test&quot; button.
2. A prompt for the password and username will appear

![](RackMultipart20220315-4-1guvkrt_html_d05c3edea2fccdc4.png)

1. Enter &quot;postgres&quot; into the username and &quot;1234&quot; for the password

# Creating the Live Table In your database (createLiveTable.m)

It is important to create the live\_table because this is where everything will be uploaded and sorted. This table allows our project to quickly and efficiently access our data.

1. To create a table in the &quot;lab\_server&quot; database where the information will actually be stored locate the &quot;createLiveTable.m&quot; file
2. Fill in the password, and click run
3. The live\_table is now created and is ready to be written to
4. By default the live\_table has the following columns

  1. subjectID
  2. gender
  3. birthdate
  4. genotype
  5. cagenumber
  6. health
  7. cagemates
  8. experimenter
  9. tasktypedone
  10. notes
  11. intensityofcost1
  12. intensityofcost2
  13. intensityofcost3
  14. intensityofcost4
  15. costprobability1
  16. costprobability2
  17. costprobability3
  18. costporbability4
  19. rewardconcentration1
  20. rewardconcentration2
  21. rewardconcentration3
  22. rewardconcentration4
  23. rewardvolume1
  24. rewardvolume2
  25. rewardvolume3
  26. rewardvolume4
  27. rewardprobability1
  28. rewardprobability2
  29. rewardprobability4
  30. rewardprobability4
  31. mazenumber
  32. approachavoidtimestamp
  33. approachavoid
  34. playstarttrialtone
  35. presentcost
  36. lightlevel
  37. referencetime
  38. videostarttime
  39. feeder
  40. stoptrack
  41. trialname
  42. detectionsettings
  43. trialcontrolsettings
  44. referenceduration
  45. animalid
  46. mazeofferdelivery
  47. nazenoofferdelivery
  48. starttime
  49. recordingafter
  50. recordingduration
  51. trialduration
  52. mazecostoff
  53. coordinatetimes
  54. xcoordinates
  55. ycoordinates
  56. presentcostend
  57. costpresentationfinish
  58. stopincopixrecording
  59. decisionmakingtime
  60. startincopixrecording
  61. date
  62. activezonetimestamp
  63. activezonevalue
  64. presentcosttimestamp
  65. costacknowledgementtimestamp
  66. deliveryacknowledgedtimestamp

It should be noted that if a new table ever has to be created or if the desired variables change they can be changed in this file. PostgreSQL syntax should be studied in order to make well thought out changes.

# Creating Rat Table (createRatDatabase.m)

The rat table is functionally a list of the rats our project is experimenting on. Having this list is important to the project as knowing what rats have what attributes is will be important for our analysis.

1. This file creates a small table named &quot;rattable&quot; in your database that has all the rats currently being experimented on
2. By default, the table &quot;rattable&quot; has the following columns:
  1. name
  2. gender
  3. birthdate
  4. cagenumber
  5. health
  6. genotype
  7. cagemates
3. This file should be edited to match your rats: their age, name, health, and other things you may want to keep track of
4. If you are making edits, be sure to study PostgreSQL syntax to make sure they are done correctly

# Creating a Dummy Table (createDummyTable.m)

The dummy table is important for troubleshooting any updates before actually implementing them on the live table

1. The dummy table is an empty clone of the live\_table, and should be used for any tests before things are executed on the live\_table
2. The dummy table exists on the same database as the live\_table
3. Simply enter the password in the dummyTable.m script where indicated and click run, it should work simply from there

# Look at Tables(displayTables.m)

This file is useful for allowing programmers to look at the data and ensure it is being parsed and sorted correctly. This allows the project to verify it&#39;s results.

1. This function is helpful when you want to make sure things are being uploaded as expected
2. simply fill in the name of your database connection, the password, the username, and the name of the table you want to view where indicated and run the program
3. If the table you want to see is empty nothing will print
4. if the table you want to view has many rows then it might take a minute to run

# Establishing Backups (backupProtocal.bat)

From time to time the database may crash, and thus to not lose any information creating reliable backups is crucial

1. A .bat file has been included that will assist in this, it is named backupProtocal.bat
2. Look for the &quot;ENTER PASSWORD HERE&quot; prompt and enter the password that was created for the database
3. Look for the &quot;ENTER DIRECTORY YOU WANT TO BACKUP TO HERE&quot; prompt and enter the directory

### Pro tip

The directory you store the backup in should ideally be backed up on some kind of cloud service like OneDrive, google drive, etc. This ensures that as long as these companies don&#39;t shut down their servers you will always have access to your backups.

1. The backupProtocal.bat file by default creates 5 back .tar files, you can of course modify it to do more, but I would not recommend less
2. With the changes to backupProtocal.bat made, save the file and relocate it to your desktop.

1. Once this file is on the desktop go to the windows start icon and search for &quot;task scheduler&quot;

![Picture 66](RackMultipart20220315-4-1guvkrt_html_9161d055b3dd9719.gif)

1. Open task scheduler and arrive at the following page

![Picture 2](RackMultipart20220315-4-1guvkrt_html_3f0c7832781083e0.gif)

1. Look for the &quot;Create Basic Task&quot; option and click on it, opening the following task creation wizard

![Picture 68](RackMultipart20220315-4-1guvkrt_html_bb4a1d7686f8220b.gif)

1. I recommend naming the task &quot;Backup database Task&quot;, description can be left blank, click next

#### Recommended Task Name

Backup database Task

1. Arrive at the following Screen and Select &quot;daily&quot; then hit next

![Picture 70](RackMultipart20220315-4-1guvkrt_html_fc1838283cf00d03.gif)

1. Fill in Today&#39;s Date and 12:00:00 AM in the fields and click next

![Picture 71](RackMultipart20220315-4-1guvkrt_html_f94711909405f8ca.gif)

1. Click next again, no need to change anything

1. When you arrive at the following page click on the &quot;Browse&quot; button and select the &quot;backupProtocal.bat&quot; file which should be located on your desktop, Click next ![Picture 72](RackMultipart20220315-4-1guvkrt_html_5ac3823aa3d385e5.gif)
2. Click finish
3. You have now finished creating a backup
4. This backup is establishing a backup of the entire database, so all tables that exist within that database will be preserved by it

# The Serendipity App

The Serendipity app is a useful Graphic User Interface that has built in parsing, graphing, searching, and uploading capabilities. The app is very simple to use and lab-techs with little to no programming experience can upload, graph, and search data with little training. Using this system thousands of rows of data can be uploaded to the remote-database and scripts can be written to analyze all this data for verification purposes.

Before the Serendipity App can be deployed for use however it must first be modified for your specific purposes. What follows is a list of all the functions in the Serendipity App and their general purpose,

# 1
 as well as which functions need to be modified before deployment.
# Start.mlapp

## Callbacks

### SetDriverPathButtonPushed

Pushing this button simply opens a file explorer windows and allows the user to choose the .jar file located in the App deployment folder. This is necessary as this file is used in uploading.

Once a jar file is selected the Serendipity App is told the path was set.

### SetIPAddressButtonPushed

This function tells the computer that the user has entered an IP address.

### LoginButtonPushed

This callback opens the Main.mlapp function allowing the user to begin uploading. If the IP address and driver path are not set then Main.mlapp will not open.

## Properties

### app.IPAddressSet

0 if IP address is not set. 1 if it is set.

### app.driverPathSet

0 if the driver path is not set, 1 if it is set.

### app.driverPath

String representation of the driver path.

# Main.mlapp

## CallBacks

### startupFcn

Upon the opening of any instance of Main.mlapp 3 things occur.

1. The rat table is searched for the default &#39;none&#39; rat and its info are populated into the Serendipity App
2. The IP address and driver path are read from &quot;Start.mlapp&quot;
3. The database connection is uploaded

### SearchButtonPushed

Opens an instance of &quot;AdvanceSearchWindow.mlapp.

### SelectNodulusFileButtonPushed

Pressing this button allows the user to choose a folder full of excel files that will be parsed and uploaded

### SelectRatDropDownValueChanged

When the drop down is activated it reveals a list of rats to the users. Selecting a rat will populate all of that rat&#39;s information into the Serendipity App. This is accomplished by performing a search for that rat in the remote rat table. The rat chosen here should be the rat in maze 1.

### SelectRatDropDown\_2ValueChanged

Performs the same function as &quot;SelectRatDropDownValueChanged&quot;, but for the rat in Maze 2.

### SelectRatDropDown\_3ValueChanged

Performs the same function as &quot;SelectRatDropDownValueChanged&quot;, but for the rat in Maze 3.

### SelectRatDropDown\_4ValueChanged

Performs the same function as &quot;SelectRatDropDownValueChanged&quot;, but for the rat in Maze 4.

### AddDataToDatabaseButtonPushed

The activation of this button prompts the Serendipity app to parse all the excel documents in the Nodulus file specified by the user in &quot;SelectNodulusFileButtonPushed&quot;. Specifically it looks for all the items in the &quot;InfoWeWant.xlsx&quot; document also contained within the &quot;App Deployment&quot; folder, and returns their [row,column] position in an array that other functions can then access to get information out of.

### SetTodaysDateButtonPushed

This button simply get&#39;s the date in MM/DD/YYYY format, and puts in the GUI, so that it can later be read by the parsing. This allows for additional functionality later.

### Port1DropDownValueChanged

This function will import the text in the other Maze&#39;s information boxes, into Maze 1&#39;s information boxes. This function is more a quality-of-life function for any end-users, but also conveniently minimizes human error.

### Port2DropDownValueChanged

This function will import the text in the other Maze&#39;s information boxes, into Maze 2&#39;s information boxes. This function is more a quality-of-life function for any end-users, but also conveniently minimizes human error.

### Port3DropDownValueChanged

This function will import the text in the other Maze&#39;s information boxes, into Maze 3&#39;s information boxes. This function is more a quality-of-life function for any end-users, but also conveniently minimizes human error.

### Port4DropDownValueChanged

This function will import the text in the other Maze&#39;s information boxes, into Maze 4&#39;s information boxes. This function is more a quality-of-life function for any end-users, but also conveniently minimizes human error.

### SeeUploadHistoryButtonPushed

This button will open a new window where the history of all rats uploaded so far into the database will be displayed in a simple table. Information included are the dates that the rats ran the trials, the name of the rats that ran the trials, and what maze the rats were in on that particular day.

## Functions

### results(app)

This function takes the [row, column] positions found in the &quot;AddDataToDatabaseButtonPushed&quot; and then accesses various pieces of information from the excel file named &quot;InfoWeWant.xlsx&quot;. Those pieces of data are then stored into a table that other functions in the app can access when it is time to sort the data into rows and upload them to the remote database. The table is provided in the supplementary materials.

### organize(app)

This function takes all the relevant data for the rat in Maze 1, sorts it into a row and uses sqlwrite to write it to the live\_database table. In the case of duplicate data it prompts the user if they want to replace the old data, or not upload.

### organize2(app)

This function performs the same utility as &quot;organize(app)&quot;, but uses it for the rat in Maze 2.

### orgranize3(app)

This function performs the same utility as &quot;organize(app)&quot;, but uses it for the rat in Maze 3.

### organize4(app)

This function performs the same utility as &quot;organize(app)&quot;, but uses it for the rat in Maze 4.

### checkNamesInAppMatchNamesInFile(app)

Will check to make sure that the names put into the GUI, match the names that are in the user designated file path. If they do not match then a warning dialogue will alert the user, but not stop them from uploading the data. This function does not check for order, simply that all the rats appear.

### createDatabaseConnection(app)

Creates a database connection through code, allows it to be dynamic in case the server IP address changes.

## Properties

### app.rat1

A table representing the data of the rat in Maze 1.

### app.rat2

A table representing the data of the rat in Maze 2.

### app.rat3

A table representing the data of the rat in Maze 3.

### app.rat4

A table representing the data of the rat in Maze 4.

### app.actual\_table

The string representation of the table that all uploads will be directed towards. This table exists within the PostgreSQL database &quot;live\_database&quot; which exists within the PostgreSQL server created in the previous section. Updating this single variable to the name of another table will redirect ALL uploads to that other table. To know more about tables please refer to the &quot;createLiveTable.m&quot; file.

### app.rattable

The string representation of the table containing all of the information with all the rats active in the experiment. Please refer to the &quot;createRatTable.m&quot; file if you would like to know more about the rat table.

### app.password

The string representation of the password to the PostgreSQL server. Changing this password here will change all instances of password throughout the app.

### app.datasource

The string representation of the datasource name. Changing this will change the database that all PostgreSQL commands are executed on.

### app.username

The username of database we are accessing. By default, it is &quot;postgres&quot;.

### app.IPaddress

The IP address of the server, this is dynamic, and it comes from the &quot;Start.mlapp&quot; window.

### app.jarFilePath

The path of the PostgreSQL jar file, this is dynamic and gotten from the &quot;Start.mlapp&quot; window.

### app.files

A list of all the files in &quot;app.workingDirectory&quot;.

### app.workingDirectory

The path of the Nodulus file specified by the user in &quot;SelectNodulusFileButtonPushed&quot;. This folder should be full of excel files.

### app.info

This is a table of all the data parsed from each individual nodulus file. A complete break down of it can be seen in the &quot;HardCodeTable.xlsx&quot; file.

### app.universalCounter

Keeps track of which .xlsx file we are currently looking at in the nodulus file.

### app.variableList

The list of columns in the live\_table. As your own live\_table changes you may need to add, remove, or shift items from this list.

### app.universalCurrentNodulusFile

The current nodulus file that the Serendipity app is parsing.

### app.universalVariablesWeWant

A list of all the variables that the Serendipity parser is looking for. This list is read from &quot;InfoWeWant.xlsx&quot;.

### app.rat\_1\_timestamps

A horizontal string array of timestamps of the rat in Maze 1 during the trial.

### app.rat\_1\_x\_coordinates

A horizontal string array of the rat in Maze 1&#39;s x-coordinates during the trial.

### app.rat\_1\_y\_coordinates

A horizontal string array of the rat in Maze 1&#39;s y-coordinates during the trial.

### app.rat\_2\_timestamps

A horizontal string array of timestamps of the rat in Maze 2 during the trial.

### app.rat\_2\_x\_coordinates

A horizontal string array of the rat in Maze 2&#39;s x-coordinates during the trial.

### app.rat\_2\_y\_coordinates

A horizontal string array of the rat in Maze 2&#39;s y-coordinates during the trial.

### app.rat\_3\_timestamps

A horizontal string array of timestamps of the rat in Maze 3 during the trial.

### app.rat\_3\_x\_coordinates

A horizontal string array of the rat in Maze 3&#39;s x-coordinates during the trial.

### app.rat\_3\_y\_coordinates

A horizontal string array of the rat in Maze 3&#39;s y-coordinates during the trial.

### app.rat\_4\_timestamps

A horizontal string array of timestamps of the rat in Maze 4 during the trial.

### app.rat\_4\_x\_coordinates

A horizontal string array of the rat in Maze 4&#39;s x-coordinates during the trial.

### app.rat\_4\_y\_coordinates

A horizontal string array of the rat in Maze 4&#39;s y-coordinates during the trial.

### app.driverPath

The location of the PostgreSQL jar file. This is read from &quot;Start.mlapp&quot;

### app.IPAddress

The Server IP address. This is read from &quot;Start.mlapp&quot;.

### app.replaceALLDuplicates

This double will be 0 if the user is not uploading duplicates. If the user is uploading duplicates then the Serendipity App will ask them if they want to replace the duplicates, and if the user answers yes then this variable will change to 1 and all deletes and reuploads will be performed without further prompting.

### app.namesFoundUniversal

This is the file path of the user designated file in &quot;SelectNodulusFileButtonPushed&quot;.

### app.universalContainer

This is the MATLAB container object that contains the row/column position of all the items listed in app.universalVariablesWeWant.

# AdvanceSearchWindow.mlapp

## Callbacks

### startupFcn

Reads the name of the database connection from &quot;Main.mlapp&quot;.

### SearchButtonPushed

Performs a PostgreSQL query on the &quot;live\_table&quot;. Will return a table of results that match the parameters and display that table in Serendipity app.

### UITableCellSelection

When the user selects any cell on the table the app will record the [row, column] position of the cell they want, so that other functions can be performed.

### DeleteSelectedRowButtonPushed

Allows the user to delete specific rows, but it&#39;s always simpler and safer to reupload the data then to delete specific rows.

### ExportRowToFileButtonPushed

Exports a specific row to an excel file named &quot;yourExportFile.txt&quot;.

### UIFigureCloseRequest

Closes the app when the &quot;X&quot; button is pushed.

### ExportSearchResultToFileButtonPushed

Allows the user to export their search results into an excel file that they can name.

### ImportAndGraphResultsButtonPushed

Allows the user to take a .xlsx file created by the Serendipity app and create a cost/reward graph.

### AddMoreResultsToFileButtonPushed

Allows the user to append more search results to a previously existing search file. This allows the user to perform ranges.

### GraphTheseSearchResultsButtonPushed

Creates a cost/reward graph based off the user&#39;s latest search.

## Properties

### app.queryResult

A table representation of the results of the user&#39;s latest search.

### app.index

The [row, column] position of the cell that the user selects which triggers the UITableCellSelection callback.

### app.exportRow

The single row the user wants to export.

### app.firstOrNot

This double is a 0 if the user hasn&#39;t previously exported a row, and 1 if they have already exported a row.

### app.databaseConnection

The name of the database connection.

### app.username

The username for the remote database.

### app.password

The password for the database.

### app.actualTable

The name of the current live\_table.

### app.queryParts

All the possible parts of the query, this order is important.

### app.exportFile

The name of the file that the user wants to export their query to.

[1](#sdfootnote1anc) Functions Marked as &quot;MODIFY&quot; need to be modified before the Serendipity App can be deployed, some things needed to be hardcoded in order for them to work
