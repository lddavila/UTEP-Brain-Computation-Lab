cluster1 = readtable("Reaction Time  Max Vs Shift Cluster 1.xlsx"); %Red
cluster2 = readtable("Reaction Time  Max Vs Shift Cluster 2.xlsx"); %Green
cluster3 = readtable("Reaction Time  Max Vs Shift Cluster 3.xlsx"); % Blue
cluster4 = readtable("Reaction Time  Max Vs Shift Cluster 4.xlsx"); %Light Blue

cluster1Labels = cluster1.clusterLabels;
cluster2Labels = cluster2.clusterLabels;
cluster3Labels = cluster3.clusterLabels;
cluster4Labels = cluster4.clusterLabels;

twoParamSigmoidFilePath = 'C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\New Base Data\Reaction Time 2 Parameter Sigmoid\';
threeParamSigmoidFilePath = 'C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\New Base Data\Reaction Time 3 Parameter Sigmoid\';
fourParamSigmoidFilePath = 'C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab\Data Analysis\New Base Data\Reaction Time 4 Parameter Sigmoid\';


% clusterFigure = 'Cluster 1 All Sigmoids.fig';
% clusterFig = 'Cluster 1 All Sigmoids';
% for i=1:height(cluster1Labels)
%     try
%         fh1 = open(clusterFigure);
%         fh2 = open(strrep(strcat(threeParamSigmoidFilePath,string(cluster1Labels(i))),".mat",".fig"));
%         ax1 = get(fh1, 'Children');
%         ax2 = get(fh2, 'Children');
%         ax2p = get(ax2(2),'Children');
%         set(ax2p,'color',[rand,rand,rand]);
%         copyobj(ax2p, ax1(1));
%         savefig(fh1,clusterFig)
%         close all
%     catch
%         try
%             fh1 = open(clusterFigure);
%             fh2 = open(strrep(strcat(twoParamSigmoidFilePath,string(cluster1Labels(i))),".mat",".fig"));
%             ax1 = get(fh1, 'Children');
%             ax2 = get(fh2, 'Children');
%             ax2p = get(ax2(2),'Children');
%             set(ax2p,'color',[rand,rand,rand]);
%             copyobj(ax2p, ax1(1));
%             savefig(fh1,clusterFig)
%             close all
%         catch
%             try
%                 fh1 = open(clusterFigure);
%                 fh2 = open(strrep(strcat(fourParamSigmoidFilePath,string(cluster1Labels(i))),".mat",".fig"));
%                 ax1 = get(fh1, 'Children');
%                 ax2 = get(fh2, 'Children');
%                 ax2p = get(ax2(2),'Children');
%                 set(ax2p,'color',[rand,rand,rand]);
%                 copyobj(ax2p, ax1(1));
%                 savefig(fh1,clusterFig)
%                 close all
%             catch
%             end
%         end
%     end
% 
% 
% end
clusterFigure = 'Cluster 2 All Sigmoids.fig';
clusterFig = 'Cluster 2 All Sigmoids';
for i=1:height(cluster2Labels)
    try
        fh1 = open(clusterFigure);
        fh2 = open(strrep(strcat(threeParamSigmoidFilePath,string(cluster2Labels(i))),".mat",".fig"));
        ax1 = get(fh1, 'Children');
        ax2 = get(fh2, 'Children');
        ax2p = get(ax2(2),'Children');
        set(ax2p,'color',[rand,rand,rand]);
        copyobj(ax2p, ax1(1));
        savefig(fh1,clusterFig)
        close all
    catch
        try
            fh1 = open(clusterFigure);
            fh2 = open(strrep(strcat(twoParamSigmoidFilePath,string(cluster2Labels(i))),".mat",".fig"));
            ax1 = get(fh1, 'Children');
            ax2 = get(fh2, 'Children');
            ax2p = get(ax2(2),'Children');
            set(ax2p,'color',[rand,rand,rand]);
            copyobj(ax2p, ax1(1));
            savefig(fh1,clusterFig)
            close all
        catch
            try
                fh1 = open(clusterFigure);
                fh2 = open(strrep(strcat(fourParamSigmoidFilePath,string(cluster2Labels(i))),".mat",".fig"));
                ax1 = get(fh1, 'Children');
                ax2 = get(fh2, 'Children');
                ax2p = get(ax2(2),'Children');
                set(ax2p,'color',[rand,rand,rand]);
                copyobj(ax2p, ax1(1));
                savefig(fh1,clusterFig)
                close all
            catch
            end
        end
    end


end

clusterFigure = 'Cluster 3 All Sigmoids.fig';
clusterFig = 'Cluster 3 All Sigmoids';
for i=1:height(cluster3Labels)
    try
        fh1 = open(clusterFigure);
        fh2 = open(strrep(strcat(threeParamSigmoidFilePath,string(cluster3Labels(i))),".mat",".fig"));
        ax1 = get(fh1, 'Children');
        ax2 = get(fh2, 'Children');
        ax2p = get(ax2(2),'Children');
        set(ax2p,'color',[rand,rand,rand]);
        copyobj(ax2p, ax1(1));
        savefig(fh1,clusterFig)
        close all
    catch
        try
            fh1 = open(clusterFigure);
            fh2 = open(strrep(strcat(twoParamSigmoidFilePath,string(cluster3Labels(i))),".mat",".fig"));
            ax1 = get(fh1, 'Children');
            ax2 = get(fh2, 'Children');
            ax2p = get(ax2(2),'Children');
            set(ax2p,'color',[rand,rand,rand]);
            copyobj(ax2p, ax1(1));
            savefig(fh1,clusterFig)
            close all
        catch
            try
                fh1 = open(clusterFigure);
                fh2 = open(strrep(strcat(fourParamSigmoidFilePath,string(cluster3Labels(i))),".mat",".fig"));
                ax1 = get(fh1, 'Children');
                ax2 = get(fh2, 'Children');
                ax2p = get(ax2(2),'Children');
                set(ax2p,'color',[rand,rand,rand]);
                copyobj(ax2p, ax1(1));
                savefig(fh1,clusterFig)
                close all
            catch
            end
        end
    end


end

clusterFigure = 'Cluster 4 All Sigmoids.fig';
clusterFig = 'Cluster 4 All Sigmoids';
for i=1:height(cluster4Labels)
    try
        fh1 = open(clusterFigure);
        fh2 = open(strrep(strcat(threeParamSigmoidFilePath,string(cluster4Labels(i))),".mat",".fig"));
        ax1 = get(fh1, 'Children');
        ax2 = get(fh2, 'Children');
        ax2p = get(ax2(2),'Children');
        set(ax2p,'color',[rand,rand,rand]);
        copyobj(ax2p, ax1(1));
        savefig(fh1,clusterFig)
        close all
    catch
        try
            fh1 = open(clusterFigure);
            fh2 = open(strrep(strcat(twoParamSigmoidFilePath,string(cluster4Labels(i))),".mat",".fig"));
            ax1 = get(fh1, 'Children');
            ax2 = get(fh2, 'Children');
            ax2p = get(ax2(2),'Children');
            set(ax2p,'color',[rand,rand,rand]);
            copyobj(ax2p, ax1(1));
            savefig(fh1,clusterFig)
            close all
        catch
            try
                fh1 = open(clusterFigure);
                fh2 = open(strrep(strcat(fourParamSigmoidFilePath,string(cluster4Labels(i))),".mat",".fig"));
                ax1 = get(fh1, 'Children');
                ax2 = get(fh2, 'Children');
                ax2p = get(ax2(2),'Children');
                set(ax2p,'color',[rand,rand,rand]);
                copyobj(ax2p, ax1(1));
                savefig(fh1,clusterFig)
                close all
            catch
            end
        end
    end


end