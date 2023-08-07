keySet = {'alexis','kryssia', 'harley','raissa','andrea','fiona','sully','jafar','kobe','jr',...
    'scar','jimi','sarah','raven','shakira','renata','neftali','juana',...
    'mike','aladdin','carl','simba','johnny','captain','pepper','buzz', ...
    'ken', 'woody','slinky','rex', 'trixie','barbie','bopeep','wanda', ...
    'vision','buttercup','monster'};

valueSet = {'f', 'f','f','f','f','f','m','m','m','m','m','m','f','f','f','f',...
    'f','f','m','m','m','m','m','m','f','m','m','m','m','m','f','f',...
    'f','f','f','f','f'};
%count = 0;
ratGenders = containers.Map(keySet,valueSet);

% allClusters ={M1,M2,M3,M4,A1WithoutM,A2WithoutM,A3WithoutM,M2A1,M2A2,M2A3,M3A2,M3A3,M4A1,M4A2,...
% M4A3,A1D2,A1H3,A2D2,A2H1,A2H3,A3D2,A3H3,M2A2K3,M2A3K1,M2A3K3,M3A2K3,M3A3K1,M4A2K3,M4A3K1,M2A2K3H3,...
% M2A3K1H3,M4A2K3H3,M4A3K1H3};
% allNodesInTree = ["M1","M2","M3","M4","A1WithoutM","A2WithoutM","A3WithoutM","M2A1","M2A2","M2A3","M3A2","M3A3","M4A1","M4A2",...
% "M4A3","A1D2","A1H3","A2D2","A2H1","A2H3","A3D2","A3H3","M2A2K3","M2A3K1","M2A3K3","M3A2K3","M3A3K1","M4A2K3","M4A3K1","M2A2K3H3",...
% "M2A3K1H3","M4A2K3H3","M4A3K1H3"];

allClusters = {A1,A2,A3};
allNodesInTree = ["A1","A2","A3"];



for i=1:length(allClusters)
    maleCount = 0;
    femaleCount =0;
    %disp(strcat(string(height(allClusters{i})),'+'))
    for j=1:height(allClusters{i})
        label = char(allClusters{i}{j,1});
        label = split(label);
        label = string(label(1));
        %disp(label)
        label = ratGenders(label);
        if strcmp(label,"m")
            maleCount = maleCount+1;
        else
            femaleCount = femaleCount+1;
        end

        %count = count +1;
    end
    disp(allNodesInTree(i))
    disp(height(allClusters{i}))
    disp(strcat("Size Of The Node: ",string(height(allClusters{i}))))
    disp(strcat("Female Count: ",string(femaleCount),"|   Female Percentage:", string((femaleCount/height(allClusters{i})) *100)))
    disp(strcat("Male Count: ", string(maleCount),"|   Male Percentage:",string((maleCount/height(allClusters{i}))*100)))
    disp("____________________________________________________")
end
%disp(count)