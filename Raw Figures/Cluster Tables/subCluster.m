function x = subCluster(xVsY, labels, numberOfClusters,xAxis,yAxis,name,subclusterFolder,ogClusterName)
%xvsY is the [log(abs(one_column_of_data),log(abs(another_column_of_data))]
%labels = the labels associated with each xvsy pair
%NumberOfClusters = an int with the number of expected clusters
%xAxis = string to put on the x-axis graphs 
%y axis = string to put on the y-axis graphs
%name = string of the feature (travel pixel, reward choice, etc)
%subcluster folder = string of a folder will subcluster tables will be
%stored, may or may not already exist
    x = 1;
    [centers,U] = fcm(xVsY,numberOfClusters);
    maxU = max(U);
    plotColors = ['or','og','ob','oc','om','oy',[0.4940 0.1840 0.5560], [0.4660 0.6740 0.1880],[0.8500 0.3250 0.0980],[0.6350 0.0780 0.1840] ];
    plotCounter = 1;
    figure
    hold on
    for i = 1:numberOfClusters
        indexes = find(U(i,:)==maxU);
        scatter([xVsY(indexes,1)],xVsY(indexes,2),plotColors(plotCounter))
        plot(centers(i,1),centers(i,2),'xk','MarkerSize',15,'LineWidth',3)
        clusterTable = getClusterTable(xVsY,labels,indexes);
        if ~exist(strcat("C:\Users\ldd77\OneDrive\Desktop\Raw Figures\Cluster Tables\",name,"\",subclusterFolder),'dir')
            mkdir(strcat("C:\Users\ldd77\OneDrive\Desktop\Raw Figures\Cluster Tables\",name,"\",subclusterFolder))
        end
        writetable(clusterTable,strcat("C:\Users\ldd77\OneDrive\Desktop\Raw Figures\Cluster Tables\",name,"\",subclusterFolder,"\",ogClusterName,"-" ," Cluster ", string(i), ".xlsx"))
        if plotCounter == 10
            plotCounter = 1;
        else
            plotCounter = plotCounter+1;
        end
    end
    title(strcat(name," ",ogClusterName," ",xAxis, " vs ", yAxis, " Clusters"))
    xlabel(xAxis)
    ylabel(yAxis)
    disp(calculate_mpc(U))
end