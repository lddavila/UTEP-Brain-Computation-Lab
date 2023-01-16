level1Appearence = 0;
level2Appearence = 0;
level3Appearence = 0; 
level1Acceptance = 0;
level2Acceptance = 0;
level3Acceptance = 0;

everythingMap = containers.Map('Keytype', 'char', 'ValueType', 'any');
everythingMapAcceptances = containers.Map('Keytype', 'char', 'ValueType', 'any');
for i=1:height(result)
    try
        everythingMap(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(string(result{i,3}),'l',''),'.0',''),'u',''),'x',''),'L',''),'U',''),'X',''),' ','')) = everythingMap(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(string(result{i,3}),'l',''),'.0',''),'u',''),'x',''),'L',''),'U',''),'X',''),' ','')) +1;
        if str2double(string(result{i,1})) > 0
            everythingMapAcceptances(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(string(result{i,3}),'l',''),'.0',''),'u',''),'x',''),'L',''),'U',''),'X',''),' ','')) = everythingMapAcceptances(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(string(result{i,3}),'l',''),'.0',''),'u',''),'x',''),'L',''),'U',''),'X',''),' ','')) + 1;
        end
    catch
        everythingMap(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(string(result{i,3}),'l',''),'.0',''),'u',''),'x',''),'L',''),'U',''),'X',''),' ','')) = 1;
        if str2double(string(result{i,1})) > 0
            everythingMapAcceptances(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(string(result{i,3}),'l',''),'.0',''),'u',''),'x',''),'L',''),'U',''),'X',''),' ','')) = 1;
        end
    end
    try
        everythingMap(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(string(result{i,4}),'l',''),'.0',''),'u',''),'x',''),'L',''),'U',''),'X',''),' ','')) = everythingMap(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(string(result{i,4}),'l',''),'.0',''),'u',''),'x',''),'L',''),'U',''),'X',''),' ','')) +1;
        if str2double(string(result{i,1})) > 0
            everythingMapAcceptances(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(string(result{i,4}),'l',''),'.0',''),'u',''),'x',''),'L',''),'U',''),'X',''),' ','')) = everythingMapAcceptances(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(string(result{i,4}),'l',''),'.0',''),'u',''),'x',''),'L',''),'U',''),'X',''),' ','')) + 1;
        end
    catch
        everythingMap(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(string(result{i,4}),'l',''),'.0',''),'u',''),'x',''),'L',''),'U',''),'X',''),' ','')) = 1;
        if str2double(string(result{i,1})) > 0
            everythingMapAcceptances(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(string(result{i,4}),'l',''),'.0',''),'u',''),'x',''),'L',''),'U',''),'X',''),' ','')) = 1;
        end
    end
    try
        everythingMap(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(string(result{i,5}),'l',''),'.0',''),'u',''),'x',''),'L',''),'U',''),'X',''),' ','')) = everythingMap(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(string(result{i,5}),'l',''),'.0',''),'u',''),'x',''),'L',''),'U',''),'X',''),' ','')) +1;
        if str2double(string(result{i,1})) > 0
            everythingMapAcceptances(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(string(result{i,5}),'l',''),'.0',''),'u',''),'x',''),'L',''),'U',''),'X',''),' ','')) = everythingMapAcceptances(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(string(result{i,5}),'l',''),'.0',''),'u',''),'x',''),'L',''),'U',''),'X',''),' ','')) + 1;
        end
    catch
        everythingMap(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(string(result{i,5}),'l',''),'.0',''),'u',''),'x',''),'L',''),'U',''),'X',''),' ','')) = 1;
        if str2double(string(result{i,1})) > 0
            everythingMapAcceptances(strrep(strrep(strrep(strrep(strrep(strrep(strrep(strrep(string(result{i,5}),'l',''),'.0',''),'u',''),'x',''),'L',''),'U',''),'X',''),' ','')) = 1;
        end
    end
end

everythingMapKeys = everythingMap.keys;
everythingMapAcceptancesKeys = everythingMapAcceptances.keys;

% display([15,everythingMap('15'),str2double(everythingMapAcceptances('15'))])
% display([40,everythingMap('40'),everythingMapAcceptances('40')])
% display([160,everythingMap('160'),everythingMapAcceptances('160')])
% display([162,everythingMap('162'),everythingMapAcceptances('162')])
% display([168,everythingMap('168'),everythingMapAcceptances('168')])
% display([218,everythingMap('218'),everythingMapAcceptances('218')])
% display([240,everythingMap('240'),everythingMapAcceptances('240')])
% display([260,everythingMap('260'),everythingMapAcceptances('260')])
% display([290,everythingMap('290'),everythingMapAcceptances('290')])
% display([320,everythingMap('320'),everythingMapAcceptances('320')])
% 
% X = [15 40 160 162 168 218 240 260 290 320];
% Y = [everythingMapAcceptances('15')/everythingMap('15')
%     everythingMapAcceptances('40')/everythingMap('40')
%     everythingMapAcceptances('160')/everythingMap('160')
%     everythingMapAcceptances('162')/everythingMap('162')
%     everythingMapAcceptances('168')/everythingMap('168')
%     everythingMapAcceptances('218')/everythingMap('218')
%     everythingMapAcceptances('240')/everythingMap('240')
%     everythingMapAcceptances('260')/everythingMap('260')
%     everythingMapAcceptances('290')/everythingMap('290')
%     everythingMapAcceptances('320')/everythingMap('320')];
% display(X)
% display(Y)


scatter(X,Y)










% 
% intensityOfCost1 = containers.Map('Keytype', 'char', 'ValueType', 'any');
% intensityOfCost2 = containers.Map('Keytype', 'char', 'ValueType', 'any');
% intensityOfCost3 = containers.Map('Keytype', 'char', 'ValueType', 'any');
% for i=1:height(result)
%     try
%         intensityOfCost1(strrep(string(result{i,3}),'lux','')) = intensityOfCost1(result{i,3}) + 1;
%     catch
%         intensityOfCost1(strrep(string(result{i,3}),'lux','')) = 1;
%     end
% end
% for i=1:height(result)
%     try
%         intensityOfCost2(strrep(string(result{i,4}),'lux','')) = intensityOfCost2(result{i,3}) + 1;
%     catch
%         intensityOfCost2(strrep(string(result{i,4}),'lux','')) = 1;
%     end
% end
% for i=1:height(result)
%     try
%         intensityOfCost3(strrep(string(result{i,5}),'lux','')) = intensityOfCost3(result{i,3}) + 1;
%     catch
%         intensityOfCost3(strrep(string(result{i,5}),'lux','')) = 1;
%     end
% end