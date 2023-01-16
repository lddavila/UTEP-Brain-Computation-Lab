allLabels = [A1;A2;A3;D1;D2;D3;G1;G2;G3;G4;J1;J2;J3;J4;M1;M2;M3;M4];
display(allLabels)
uniqueCount = 0;
uniqueMap = containers.Map('KeyType','char','ValueType','double');
disp(string(allLabels{1,1}))
for i=1:height(allLabels)
    try
        disp(uniqueMap(string(allLabels{i,1})))
    catch
        uniqueMap(string(allLabels{i,1})) = 1;
        uniqueCount = uniqueCount+1;
    end
end

disp(uniqueCount)