readTravelPixelClusters
readStoppingPointsClusters
readRotationPointsClusters
readReactionTimeClusters
readRewardChoiceClusters
findHowMuchDifference;

aClusters = {A1,A2,A3};
bClusters = {B1,B2,B3};
cClusters = {C1,C2,C3,C4};
dClusters = {D1,D2,D3};
eClusters = {E1,E2,E3,E4};
fClusters = {F1,F2,F3};
gClusters = {G1,G2,G3,G4};
hClusters = {H1,H2,H3,H4};
iClusters = {I1,I2,I3};
jClusters = {J1,J2,J3,J4};
kClusters = {K1,K2,K3};
lClusters = {L1,L2,L3,L4};
mClusters = {M1,M2,M3,M4};
nClusters = {N1,N2,N3};
oClusters = {O1,O2,O3};

M2A1 = createMultiDimensionalClusters(M2,A1); %LEAF
M2A2 = createMultiDimensionalClusters(M2,A2);
M2A3 = createMultiDimensionalClusters(M2,A3);
M3A2 = createMultiDimensionalClusters(M3,A2);
M3A3 = createMultiDimensionalClusters(M3,A3);
M4A1 = createMultiDimensionalClusters(M4,A1); %LEAF
M4A2 = createMultiDimensionalClusters(M4,A2);
M4A3 = createMultiDimensionalClusters(M4,A3);

A1D2 = createMultiDimensionalClusters(A1WithoutM,D2); %LEAF
A1H3 = createMultiDimensionalClusters(A1WithoutM,H3); %LEAF
A2D2 = createMultiDimensionalClusters(A2WithoutM,D2); %LEAF
A2H1 = createMultiDimensionalClusters(A2WithoutM,H1); %LEAF
A2H3 = createMultiDimensionalClusters(A2WithoutM,H3); %LEAF
A3D2 = createMultiDimensionalClusters(A3WithoutM,D2); %LEAF
A3H3 = createMultiDimensionalClusters(A3WithoutM,H3); %LEAF


M2A2K3 = createMultiDimensionalClusters(M2A2,K3);
M2A3K1 = createMultiDimensionalClusters(M2A3,K1);
M2A3K3 = createMultiDimensionalClusters(M2A3,K3); %LEAF
M3A2K3 = createMultiDimensionalClusters(M3A2,K3); %LEAF
M3A3K1 = createMultiDimensionalClusters(M3A3,K1); %LEAF
M4A2K3 = createMultiDimensionalClusters(M4A2,K3); 
M4A3K1 = createMultiDimensionalClusters(M4A3,K1);



M2A2K3H3 = createMultiDimensionalClusters(M2A2K3,H3); %LEAF
M2A3K1H3 = createMultiDimensionalClusters(M2A3K1,H3); %LEAF
M4A2K3H3 = createMultiDimensionalClusters(M4A2K3,H3); %LEAF
M4A3K1H3 = createMultiDimensionalClusters(M4A3K1,H3); %LEAF

allClusters = {A1,A2,A3,B1,B2,B3,C1,C2,C3,C4,...
D1,D2,D3,E1,E2,E3,E4,...
F1,F2,F3,G1,G2,G3,G4,...
H1,H2,H3,H4,I1,I2,I3,...
J1,J2,J3,J4,K1,K2,K3,...
L1,L2,L3,L4,M1,M2,M3,M4,...
N1,N2,N3,O1,O2,O3,M2A1,M2A2,...
M2A3,M3A2,M3A3,M4A1, ...
M4A2,M4A3,A1D2,A1H3, ...
A2D2,A2H1,A2H3,A3D2, ...
A3H3,M2A2K3,M2A3K1,M2A3K3,... 
M3A2K3,M3A3K1,M4A2K3,M4A3K1, ...
M2A2K3H3,M2A3K1H3,M4A2K3H3,M4A3K1H3};

allClusterNames = ["A1","A2","A3","B1","B2","B3","C1","C2","C3","C4",...
"D1","D2","D3","E1","E2","E3","E4",...
"F1","F2","F3","G1","G2","G3","G4",...
"H1","H2","H3","H4","I1","I2","I3",...
"J1","J2","J3","J4","K1","K2","K3",...
"L1","L2","L3","L4","M1","M2","M3","M4",...
"N1","N2","N3","O1","O2","O3","M2A1","M2A2",...
"M2A3","M3A2","M3A3","M4A1", ...
"M4A2","M4A3","A1D2","A1H3", ...
"A2D2","A2H1","A2H3","A3D2", ...
"A3H3","M2A2K3","M2A3K1","M2A3K3",... 
"M3A2K3","M3A3K1","M4A2K3","M4A3K1", ...
"M2A2K3H3","M2A3K1H3","M4A2K3H3","M4A3K1H3"];

