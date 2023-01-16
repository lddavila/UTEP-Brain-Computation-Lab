allLabels = [A1;A2;A3;D1;D2;D3;G1;G2;G3;G4;J1;J2;J3;J4;M1;M2;M3;M4];
labelsInM = [M1;M2;M3;M4];
labelsInA = [A1;A2;A3];
labelsInD = [D1;D2;D3];
labelsInG = [G1;G2;G3;G4];
labelsInJ = [J1;J2;J3;J4];
%display(allLabels)
uniqueCount = 0;
mMap = containers.Map('KeyType','char','ValueType','double');
%disp(string(allLabels{1,1}))
for i=1:height(labelsInM)
        mMap(string(labelsInM{i,1})) = 1;
end

for i=1:height(labelsInA)
    try
        disp(mMap(string(labelsInA{i,1})))
    catch
        %mMap(string(allLabels{i,1})) = 1;
        uniqueCount = uniqueCount+1;
    end
end
disp(strcat("Unique Count: ",string(uniqueCount)))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clusterLabels = "";
clusterX = "";
clusterY = "";
A1WithoutM= table(clusterLabels,clusterX,clusterY);
for i=1:height(A1)
    try
        disp(mMap(string(A1{i,1})))
    catch
        A1WithoutM = [A1WithoutM;A1(i,:)];
    end
end
A1WithoutM(A1WithoutM.clusterLabels == '',:) = [];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clusterLabels = "";
clusterX = "";
clusterY = "";
A2WithoutM= table(clusterLabels,clusterX,clusterY);
for i=1:height(A2)
    try
        disp(mMap(string(A2{i,1})))
    catch
        A2WithoutM = [A2WithoutM;A2(i,:)];
    end
end
A2WithoutM(A2WithoutM.clusterLabels == '',:) = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clusterLabels = "";
clusterX = "";
clusterY = "";
A3WithoutM= table(clusterLabels,clusterX,clusterY);
for i=1:height(A3)
    try
        disp(mMap(string(A3{i,1})))
    catch
        A3WithoutM = [A3WithoutM;A3(i,:)];
    end
end
A3WithoutM(A3WithoutM.clusterLabels == '',:) = [];