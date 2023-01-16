X = [newTable.A, newTable.B];
%display(X)

[idx, C] = kmeans(X,5);

figure;
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12)
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12)
plot(X(idx==3,1),X(idx==3,2),'g.','MarkerSize',12)
plot(X(idx==4,1),X(idx==4,2),'y.','MarkerSize',12)
plot(X(idx==5,1),X(idx==5,2),'m.','MarkerSize',12)


plot(C(:,1),C(:,2),'kx',...
     'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Cluster 3', 'Cluster 4','Cluster 5','Centroids',...
       'Location','NW')
title 'Clustering of Sigmoids and Centroids'
xlabel("Sigmoid Shift")
ylabel("Sigmoid Steepness")
hold off