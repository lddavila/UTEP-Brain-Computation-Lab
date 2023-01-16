
a = log(abs(newTable.A));
b = log(abs(newTable.C));
a = a(b==real(b));
a = a(a ==real(a));
b = b(b==real(b));
b = b(a==real(a));
disp(size(a))
disp(size(b))
scatter(a,b)
%disp(b)
X = [a, b];
%display(X)
%idx= Cluster indices, returned as a numeric column vector. idx has as many
% rows as X, and each row indicates the cluster assignment of the 
% corresponding observation.
[idx, C] = kmeans(X,4);

figure;
plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12)
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12)
plot(X(idx==3,1),X(idx==3,2),'g.','MarkerSize',12)
plot(X(idx==4,1),X(idx==4,2),'y.','MarkerSize',12)
%plot(X(idx==5,1),X(idx==5,2),'m.','MarkerSize',12)


plot(C(:,1),C(:,2),'kx',...
     'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Cluster 3', 'Cluster 4','Centroids',...
       'Location','NW')
title 'Clustering of Sigmoids and Centroids'
xlabel("Sigmoid Shift")
ylabel("Sigmoid Steepness")
hold off


