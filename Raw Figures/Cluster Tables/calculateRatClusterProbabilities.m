% keySet = {'alexis','kryssia', 'harley','raissa','andrea','fiona','sully','jafar','kobe','jr',...
%     'scar','jimi','sarah','raven','shakira','renata','neftali','juana',...
%     'mike','aladdin','carl','simba','johnny','captain','pepper','buzz', ...
%     'ken', 'woody','slinky','rex', 'trixie','barbie','bopeep','wanda', ...
%     'vision','buttercup','monster'};
% 
% valueSet = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,...
%     0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,...
%     0,0,0,0,0};
% %count = 0;
% travelPixelRatCount = containers.Map(keySet,valueSet);
% stoppingPointsRatCount = containers.Map(keySet,valueSet);
% rotationPointsRatCount =containers.Map(keySet,valueSet);
% reactionTimeRatCount =containers.Map(keySet,valueSet);
% rewardChoiceRatCount=containers.Map(keySet,valueSet);

%Get a list of all the Clusters in the folder which are stored as .xlsx
%files
% fileWithAllClusters = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Data Analysis\New Base Data\All Clusters In Dataset";
% allClusters = ls(strcat(fileWithAllClusters,"\*.xlsx"));
% allClusters = string(allClusters);
% % disp(allClusters);

%Get All of the feature data 

% workingFolder = cd(fileWithAllClusters);
% travelPixelTable = [];
% stoppingPointsTable =[];
% rotationPointsTable = [];
% reactionTimeTable = [];
% rewardChoiceTable = [];

% for i=1:length(allClusters)
%     disp(class(i))
%     disp(i)
% %     disp(contains(i,"A"))
%     if contains(allClusters(i),"A")
%         disp("Went into first contains")
%         %To get unique travel pixel data you need only to get all A-files and put them together in one table
%         if isempty(travelPixelTable)
%             travelPixelTable = readtable(allClusters(i));
%             disp("Went into travel Pixel IF")
%         else
%             disp("Went into the else")
%             travelPixelTable = [travelPixelTable;readtable(allClusters(i))];
%         end
%         
%     elseif contains(allClusters(i),"D")
%         %same principle, but with Stopping Points Points
%         if isempty(stoppingPointsTable)
%             stoppingPointsTable = readtable(allClusters(i));
%         else
%             stoppingPointsTable = [stoppingPointsTable;readtable(allClusters(i))];
%         end
%     elseif contains(allClusters(i),"G")
%         %same thing, but with Rotation Points
%         if isempty(rotationPointsTable)
%             rotationPointsTable = readtable(allClusters(i));
%         else
%             rotationPointsTable = [rotationPointsTable;readtable(allClusters(i))];
%         end
%     elseif contains(allClusters(i),"J")
%         %Same thing but with reaction time
%         if isempty(reactionTimeTable)
%             reactionTimeTable = readtable(allClusters(i));
%         else
%             reactionTimeTable = [reactionTimeTable;readtable(allClusters(i))];
%         end
%     elseif contains(allClusters(i),"M")
%         %same thing, but with reward choice
%         if isempty(rewardChoiceTable)
%             rewardChoiceTable = readtable(allClusters(i));
%         else
%             rewardChoiceTable = [rewardChoiceTable;readtable(allClusters(i))];
%         end
%     end
% end
% cd(workingFolder)

%these 5 loops will count how many times each rat appears in each dataset
for i=1:length(aClusters)
    %disp(strcat(string(height(allClusters{i})),'+'))
    for j=1:height(aClusters{i})
        label = char(aClusters{i}{j,1});
        label = split(label);
        label = string(label(1));
        %disp(label)
        travelPixelRatCount(label)=travelPixelRatCount(label)+1;
    end

end

for i=1:length(dClusters)

    %disp(strcat(string(height(allClusters{i})),'+'))
    for j=1:height(dClusters{i})
        label = char(dClusters{i}{j,1});
        label = split(label);
        label = string(label(1));
        %disp(label)
        stoppingPointsRatCount(label)=stoppingPointsRatCount(label)+1;
    end

end

for i=1:length(gClusters)

    %disp(strcat(string(height(allClusters{i})),'+'))
    for j=1:height(gClusters{i})
        label = char(gClusters{i}{j,1});
        label = split(label);
        label = string(label(1));
        %disp(label)
        rotationPointsRatCount(label)=rotationPointsRatCount(label)+1;
    end

end

for i=1:length(jClusters)
    for j=1:height(jClusters{i})
        label = char(jClusters{i}{j,1});
        label = split(label);
        label = string(label(1));
        %disp(label)
        reactionTimeRatCount(label)=reactionTimeRatCount(label)+1;
    end

end

for i=1:length(mClusters)
    for j=1:height(mClusters{i})
        label = char(mClusters{i}{j,1});
        label = split(label);
        label = string(label(1));
        %disp(label)
        rewardChoiceRatCount(label)=rewardChoiceRatCount(label)+1;
    end

end
% 
% %Below I'll use loops to count how many times each rat appears in each
% %cluster
% 
% allOneDimensionalClusters = {A1,A2,A3,B1,B2,B3,C1,C2,C3,C4,...
% D1,D2,D3,E1,E2,E3,E4,...
% F1,F2,F3,G1,G2,G3,G4,...
% H1,H2,H3,H4,I1,I2,I3,...
% J1,J2,J3,J4,K1,K2,K3,...
% L1,L2,L3,L4,M1,M2,M3,M4,...
% N1,N2,N3,O1,O2,O3};
% 
% allOneDimensionalClusterNames = ["A1","A2","A3","B1","B2","B3","C1","C2","C3","C4",...
% "D1","D2","D3","E1","E2","E3","E4",...
% "F1","F2","F3","G1","G2","G3","G4",...
% "H1","H2","H3","H4","I1","I2","I3",...
% "J1","J2","J3","J4","K1","K2","K3",...
% "L1","L2","L3","L4","M1","M2","M3","M4",...
% "N1","N2","N3","O1","O2","O3"];
% 
% ratCountByCluster = containers.Map('KeyType','char','ValueType','any');
% 
% for i=1:length(allOneDimensionalClusters)
%     for j=1:height(allOneDimensionalClusters{i})
%         label = char(allOneDimensionalClusters{i}{j,1});
%         label = split(label);
%         label = string(label(1));
%         %disp(label)
%         try
%             ratCountByCluster(strcat(label," ",allOneDimensionalClusterNames{i}))=ratCountByCluster(strcat(label," ",allOneDimensionalClusterNames{i}))+1;
%         catch
%             ratCountByCluster(strcat(label," ",allOneDimensionalClusterNames{i}))= 1;
%         end
%         
%     end
% 
% end
% %display([keys(ratCountByCluster).',values(ratCountByCluster).'])
% 
% rat_cluster_name = keys(ratCountByCluster).';
% rat_cluster_count = values(ratCountByCluster).';
% rat_total_appeareces = [];
% for i=1:height(rat_cluster_name)
%     name = strsplit(rat_cluster_name{i}," ");
%     cluster = name{2};
%     name = name{1};
%     if contains(cluster,"A") || contains(cluster,"B") || contains(cluster,"C")
%         rat_total_appeareces=[rat_total_appeareces;travelPixelRatCount(name)];
%     elseif contains(cluster,"D") || contains(cluster,"E") || contains(cluster,"F")
%         rat_total_appeareces=[rat_total_appeareces;stoppingPointsRatCount(name)];
%     elseif contains(cluster,"G") || contains(cluster,"H") || contains(cluster,"I")
%         rat_total_appeareces=[rat_total_appeareces;rotationPointsRatCount(name)];
%     elseif contains(cluster,"J") || contains(cluster,"K") || contains(cluster,"L")
%         rat_total_appeareces=[rat_total_appeareces;reactionTimeRatCount(name)];
%     elseif contains(cluster,"M") || contains(cluster,"N") || contains(cluster,"O")
%         rat_total_appeareces=[rat_total_appeareces;rewardChoiceRatCount(name)];
%     end
% end
% 
% 
% 
% display(size(rat_cluster_name))
% display(size(rat_cluster_count))
% display(size(rat_total_appeareces))
% probabilitiesTable = table(rat_cluster_name,rat_cluster_count,rat_total_appeareces);
% display(probabilitiesTable)
% 
% writetable(probabilitiesTable,strcat("C:\Users\ldd77\OneDrive\Desktop\Raw Figures\All Clusters\","Probabilities Table.csv"))
