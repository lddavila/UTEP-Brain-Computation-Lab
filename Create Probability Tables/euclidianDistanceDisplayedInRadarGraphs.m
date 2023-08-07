old_baseline_probabilities = [0.12935883,0.410573678,0.460067492,0.122377622,0.697552448,0.18006993,0.709352518,0.143884892,0.01294964,0.13381295,0.035555556,0.434666667,0.145777778,0.384];
lg_etho_probabilities = [0.79,0.13,0.08,0.48,0.24,0.28,0.83,0.08,0.0,0.09,0.02,0.38,0.12,0.48];
lg_boost_probabilities = [0.685534591,0.220125786,0.094339623,0.586592179,0.251396648,0.162011173,0.777027027,0.114864865,0,0.108108108,0.009146341,0.402439024,0.256097561,0.332317073];
oxy_probabilities =[0.8125,0.116071429,0.071428571,0.508928571,0.330357143,0.160714286,0.695121951,0.109756098,0,0.195121951,0,0.638888889,0,0.361111111];
food_dep_probabilities = [0.387755102,0.06122449,0.551020408,0.080745342,0.795031056,0.124223602,0.696969697,0.121212121,0.012121212,0.16969697,0.006849315,0.506849315,0.181506849,0.304794521,];

eucDisOldBaseToLG_Etho = old_baseline_probabilities -lg_etho_probabilities;
eucDisOldBaseToLG_Etho = sqrt(eucDisOldBaseToLG_Etho * eucDisOldBaseToLG_Etho');
display(strcat("Euclidian Distance from Baseline to lg_etho: ",string(eucDisOldBaseToLG_Etho)))

eucDisOldBaseToLG_Boost = old_baseline_probabilities - lg_boost_probabilities;
eucDisOldBaseToLG_Boost = sqrt(eucDisOldBaseToLG_Boost * eucDisOldBaseToLG_Boost');
display(strcat("Euclidian Distance from Baseline to lg_boost: ",string(eucDisOldBaseToLG_Boost)));

eucDisOldBaseToOxy = old_baseline_probabilities - oxy_probabilities;
eucDisOldBaseToOxy = sqrt(eucDisOldBaseToOxy * eucDisOldBaseToOxy');
display(strcat("Euclidian Distance from Baseline to Oxy: ",string(eucDisOldBaseToOxy)))

eucDisOldBaseToFoodDep = old_baseline_probabilities - food_dep_probabilities;
eucDisOldBaseToFoodDep = sqrt(eucDisOldBaseToFoodDep * eucDisOldBaseToFoodDep');
display(strcat("Euclidian Distance From Baseline to Food Deprivation: ", string(eucDisOldBaseToFoodDep)))