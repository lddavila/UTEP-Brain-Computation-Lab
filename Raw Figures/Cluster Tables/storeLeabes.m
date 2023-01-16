% M2A1 = createMultiDimensionalClusters(M2,A1); %LEAF 2
% M4A1 = createMultiDimensionalClusters(M4,A1); %LEAF 3
% A1D2 = createMultiDimensionalClusters(A1,D2); %LEAF 4
% A1H3 = createMultiDimensionalClusters(A1,H3); %LEAF 5
% A2D2 = createMultiDimensionalClusters(A2,D2); %LEAF 6
% A2H1 = createMultiDimensionalClusters(A2,H1); %LEAF 7
% A2H3 = createMultiDimensionalClusters(A2,H3); %LEAF 8 
% A3D2 = createMultiDimensionalClusters(A3,D2); %LEAF 9
% A3H3 = createMultiDimensionalClusters(A3,H3); %LEAF 10
% M2A3K3 = createMultiDimensionalClusters(M2A3,K3); %LEAF 11
% M3A2K3 = createMultiDimensionalClusters(M3A2,K3); %LEAF 12
% M3A3K1 = createMultiDimensionalClusters(M3A3,K1); %LEAF 13
% M2A2K3H3 = createMultiDimensionalClusters(M2A2K3,H3); %LEAF 14
% M2A3K1H3 = createMultiDimensionalClusters(M2A3K1,H3); %LEAF 15
% M4A2K3H3 = createMultiDimensionalClusters(M4A2K3,H3); %LEAF 16
% M4A3K1H3 = createMultiDimensionalClusters(M4A3K1,H3); %LEAF 17

allLeafNames = ["M1","M2A1","M4A1","A1D2","A1H3","A2D2","A2H1","A2H3","A3D2", ... 
"A3H3", "M2A3K3","M3A2K3","M3A3K1","M2A2K3H3","M2A3K1H3","M4A2K3H3","M4A3K1H3"];
allLeaves = {M1,M2A1,M4A1,A1D2,A1H3,A2D2,A2H1,A2H3,A3D2, ... 
A3H3, M2A3K3,M3A2K3,M3A3K1,M2A2K3H3,M2A3K1H3,M4A2K3H3,M4A3K1H3};

for i=1:16
    writetable(allLeaves{i}, strcat("C:\Users\ldd77\OneDrive\Desktop\Raw Figures\Cluster Tables\Leaves\",allLeafNames(i),".csv"));
end