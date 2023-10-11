function x = createThePlot(xVsY1, labels1, numberOfClusters1,xVsY2,labels2,numberOfClusters2,xAxis,yAxis,name)
%     x = 1;
    [centers,U] = fcm(xVsY1,numberOfClusters1);
    maxU = max(U);
    plotColors = ['og','ob','oc','oy','ok',"#EDB120", "#7E2F8E","#D95319","#A2142F" ];
    plotCounter = 1;
%     figure
    for i = 1:numberOfClusters1
        indexes = find(U(i,:)==maxU);
        gray = [0.7,0.7,0.7];
        scatter([xVsY1(indexes,1)],xVsY1(indexes,2),"MarkerEdgeColor",gray,"MarkerFaceColor",gray)
        hold on
        plot(centers(i,1),centers(i,2),'xk','MarkerSize',15,'LineWidth',3)
%         clusterTable = getClusterTable(xVsY1,labels1,indexes);
    end
    disp(calculate_mpc(U))
    hold on

    [centers,U] = fcm(xVsY2,numberOfClusters2);
    maxU = max(U);
    for i=1:numberOfClusters2
        indexes = find(U(i,:)==maxU);
        scatter([xVsY2(indexes,1)],xVsY2(indexes,2),plotColors(plotCounter))
        hold on
        plot(centers(i,1),centers(i,2),'xr','MarkerSize',15,'LineWidth',3)
        clusterTable = getClusterTable(xVsY2,labels2,indexes);

        if plotCounter == 8
            plotCounter = 1;
        else
            plotCounter = plotCounter+1;
        end
%         writetable(clusterTable,strcat(pwd,"\",name," " ,xAxis," Vs ",yAxis," Cluster ", string(i), ".xlsx"))
        title(strcat(name," ",xAxis, " vs ", yAxis, " Clusters"))
        xlabel(xAxis)
        ylabel(yAxis)
    end
    hold on


    calculate_mpc(U)
end