lengthOfSimilarityCell = size(similarityCell);
lengthOfSimilarityCell = lengthOfSimilarityCell(2);
disp(lengthOfSimilarityCell)

for i =1:lengthOfSimilarityCell
%     disp([string(similarityCell{i}{1,1}).', whatever.'])
    ogCluster = [whatever{i},string(similarityCell{i}{1,1})];
    ogCluster = ogCluster.';
    comparingToCluster = ["XXXXXXXX",whatever];
    comparingToCluster = comparingToCluster.';
    disp([ogCluster,comparingToCluster])
    disp(class(similarityCell{i}))
    comparisonTable = table(ogCluster,comparingToCluster);
    writetable(comparisonTable,strcat(whatever{i},'.xlsx'),'WriteMode','Append',...
    'WriteVariableNames',false,'WriteRowNames',true)  
end