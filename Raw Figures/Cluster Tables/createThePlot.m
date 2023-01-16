function x = subCluster(xVsY, labels, numberOfClusters,xAxis,yAxis,name)
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
        writetable(clusterTable,strcat("C:\Users\ldd77\OneDrive\Desktop\Raw Figures\Cluster Tables\",name,"\",name," " ,xAxis," Vs ",yAxis," Cluster ", string(i), ".xlsx"))
        if plotCounter == 10
            plotCounter = 1;
        else
            plotCounter = plotCounter+1;
        end
    end
    title(strcat(name," ",xAxis, " vs ", yAxis, " Clusters"))
    xlabel(xAxis)
    ylabel(yAxis)
    disp(calculate_mpc(U))
end