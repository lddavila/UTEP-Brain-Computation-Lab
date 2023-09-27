
% display(allTables)

%% run 2 sample t-test
baseline = readtable("base Euclidian Distances of this subset.xlsx");
boostAndEtho = readtable("Boost and etho uclidian Distances of this subset.xlsx");
baseline =baseline.euclidianDistances;
boostAndEtho = boostAndEtho.euclidianDistances;
figure
h1 = histogram(baseline,10,'Normalization','probability');
hold on
h2 = histogram(boostAndEtho,10,'Normalization','probability');
title("Boost and Etho 28 day bin size and Baseline Bin Size 28 Days")
legend

% display(class(baseline.'))
% display(boostAndEtho.')

[htt2,ptt2] = ttest2(baseline,boostAndEtho);
display(strcat("H of t test: ",string(htt2)));
display(strcat("P of t test: ",string(ptt2)))


%% run kstest2

[hks2,pks2] = kstest2(baseline,boostAndEtho);
display(strcat("H of ks test: ",string(hks2)));
display(strcat("P of ks test: ",string(pks2)))

%% find gender distribution 
baseline = readtable("base Euclidian Distances of this subset.xlsx");
boostAndEtho = readtable("Boost and etho uclidian Distances of this subset.xlsx");
baselineEu =baseline.euclidianDistances;
boostAndEthoEu = boostAndEtho.euclidianDistances;
h1Edges = [0 0.0890 0.1780 0.2670 0.3560 0.4450 0.5340 0.6230 0.7120 0.8010 0.8900];
h2Edges = [0 0.1500 0.3000 0.4500 0.6000 0.7500 0.9000 1.0500 1.2000 1.3500 1.5000];
boostAndEthoNa = boostAndEtho.ratNames;
baseNa = baseline.ratNames;

values = {"","","","","","","","","",""};
for i=1:length(h1Edges)
    %     display(baselineEu(i))
    for j=1:length(baselineEu)
        if baselineEu(j) >= h1Edges(i) && baselineEu(j) <= h1Edges(i+1)
            
            values{i} = strcat(string(values{i})," ",baseNa(j));
        end
    end
end
disp("For Baseline")
for i =1:length(values)
    disp(strcat("Bin Number ",string(i)," Of 28 days"))
    display(values{i})
end

values = {"","","","","","","","","",""};
for i=1:length(h2Edges)
    %     display(baselineEu(i))
    for j=1:length(boostAndEthoEu)
        if boostAndEthoEu(j) >= h2Edges(i) && boostAndEthoEu(j) <= h2Edges(i+1)
            
            values{i} = strcat(string(values{i})," ",boostAndEthoNa(j));
        end
    end
end
disp("For Boost and Ethonal ")
for i =1:length(values)
    disp(strcat("Bin Number ",string(i)," Of 28 days"))
    display(values{i})
end