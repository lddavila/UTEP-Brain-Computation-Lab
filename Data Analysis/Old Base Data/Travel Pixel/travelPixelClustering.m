a = log(abs(newTable.A));
b = log(abs(newTable.B));
d = newTable.D;


[centers,U] = fcm(X,6);

maxU = max(U);
index1 = find(U(1,:) == maxU);
index2 = find(U(2,:) == maxU);
index3 = find(U(3,:) == maxU);
index4 = find(U(4,:) == maxU);
index5 = find(U(5,:) == maxU);
index6 = find(U(6,:) == maxU);

plot(X(index1,1),X(index1,2),'ob')
hold on
plot(X(index2,1),X(index2,2),'or')
hold on
plot(X(index3,1),X(index3,2),'oy')
hold on
plot(X(index4,1),X(index4,2),'og')
hold on
plot(X(index5,1),X(index5,2),'oc')
hold on
plot(X(index6,1),X(index6,2),'om')

plot(centers(1,1),centers(1,2),'xk','MarkerSize',15,'LineWidth',3)
plot(centers(2,1),centers(2,2),'xk','MarkerSize',15,'LineWidth',3)
plot(centers(3,1),centers(3,2),'xk','MarkerSize',15,'LineWidth',3)
plot(centers(4,1),centers(4,2),'xk','MarkerSize',15,'LineWidth',3)
plot(centers(5,1),centers(5,2),'xk','MarkerSize',15,'LineWidth',3)
plot(centers(6,1),centers(6,2),'xk','MarkerSize',15,'LineWidth',3)
hold off

disp(calculate_mpc(U));