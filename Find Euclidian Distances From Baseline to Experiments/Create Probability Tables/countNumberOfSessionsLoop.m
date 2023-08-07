counter=0;
for i=1:height(sessionTable)
    allRatsOnThatDay = string(sessionTable{i,2});
    allRatsSeparated = split(allRatsOnThatDay,',');
    ratsOnOurDate = length(allRatsSeparated)-1;
    counter = counter+ratsOnOurDate;
end
display(counter)