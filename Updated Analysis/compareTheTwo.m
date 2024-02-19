og_files_dir = "C:\Users\ldd77\OneDrive\Desktop\ghrelin_paper\Baseline_Oxy_FoodDep_BoostAndEtho_Ghrelin_Saline_Cluster_Tables";

recreated_files_dir = "C:\Users\ldd77\OneDrive\Desktop\UTEP-Brain-Computation-Lab-Remote-Databases-and-Serendipity-App\Updated Analysis\Cluster_Tables";

og_files = strtrim(string(ls(strcat(og_files_dir,"\*.xlsx"))));
recreated_files = strtrim(string(ls(strcat(recreated_files_dir,"\*.xlsx"))));

for i=1:length(og_files)
    disp(og_files(i))
    og_table = readtable(strcat(og_files_dir,"\",og_files(i)));
    new_table = readtable(strcat(recreated_files_dir,"\",recreated_files(i)));
    og_first_col = string(og_table.clusterLabels);
    new_first_col = string(new_table.clusterLabels);
    disp("Overlap percentage");
    overlap_counter=0;
    for j=1:length(new_first_col)
        new_cluster_label=new_first_col(j);
        for k=1:length(og_first_col)
            og_cluster_label=og_first_col(k);
            if strcmpi(new_cluster_label,og_cluster_label)
                overlap_counter = overlap_counter+1;
            end
        end
    end
    disp(overlap_counter/height(new_table))
    
end
    