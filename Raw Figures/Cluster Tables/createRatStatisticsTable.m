rats = keys(M).';
appearences = values(M).';
ratClusterStats = table(rats,appearences);
display(ratClusterStats)
display(ratClusterStats{1,1})
display(ratClusterStats{1,2})

writetable(ratClusterStats,strcat("C:\Users\ldd77\OneDrive\Desktop\Raw Figures\All Clusters\","Rat Statistics.csv"))