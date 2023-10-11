foodDepEuc = findEuclidianDistancesOfAllRatsFromEachOtherForFoodDep("..\..\Create Probability Tables\Food Deprivation",".xlsx",true,true,"A");
baseEuc = findEuclidianDistancesOfAllRatsFromEachOtherForFoodDep("..\..\Create Probability Tables\Baseline Clusters",".csv",true,true,"A");
[~,p] = ttest2(foodDepEuc,baseEuc);
title("Travel Pixel Baseline and Food Deprivation")
subtitle(strcat("P Value From ttest2: ",string(p)))
legend("food Deprivation","Baseline")
% 
figure

foodDepEuc = findEuclidianDistancesOfAllRatsFromEachOtherForFoodDep("..\..\Create Probability Tables\Food Deprivation",".xlsx",true,true,"D");
baseEuc = findEuclidianDistancesOfAllRatsFromEachOtherForFoodDep("..\..\Create Probability Tables\Baseline Clusters",".csv",true,true,"D");
[~,p] = ttest2(foodDepEuc,baseEuc);
title("Stopping Points Baseline and Food Deprivation")
subtitle(strcat("P Value From ttest2: ",string(p)))
legend("food Deprivation","Baseline")
