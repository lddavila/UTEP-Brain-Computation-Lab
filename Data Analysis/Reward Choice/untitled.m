X = [1,2,3,4];
Y = [1,2,3,4];
labels = {'label1','label2','label3','label4'};
p = plot(X,Y,'o');
dtt = p.DataTipTemplate;
dtt.DataTipRows(1).Label = 'myLabel';
dtt.DataTipRows(1).Value = labels;
display(dtt.DataTipRows(1))
%text(X,Y,labels)