function dg_makeClusterList(sessiondir)
%dg_makeClusterList(sessiondir)
%   For each Rodent Cluster file belonging to sessiondir (note that these
%   files reside at the same level as sessiondir, not within sessiondir),
%   output a line to a Yasuo-compatible spreadsheet for each cluster in the
%   file.  Creates or appends to file 'ClusterList.xls'.  Format is a
%   subset of the one Hu Dan is using as of 2-May-2005, which is at least
%   one version behind Yasuo's current unit catalog spreadsheet format.

%$Rev: 153 $
%$Date: 2012-07-17 18:40:53 -0400 (Tue, 17 Jul 2012) $
%$Author: dgibson $

outfilename = 'ClusterList.xls';
newoutfile = (exist(outfilename) ~= 2);
outfid = fopen(outfilename, 'a');
if outfid == -1
    error('Could not open %s for appending', ...
        outfilename );
end
if newoutfile
    fprintf(outfid, 'Filename\tID\tS#\tT#\tU#\n');
end

[animaldir, sessionID] = fileparts(sessiondir);
[basedir, animalID] = fileparts(animaldir);
sessionnum = sessionID(regexp(sessionID, '[0-9]+$') : end);

% Find all the *.TTn and *.Tnn files for this session:
clusterfiles = cell(1,0);
files = dir(animaldir);
for f = files'
    [pathstr,name,ext] = fileparts(upper(f.name));
    if (length(ext) >= 2) && (ext(2) == 'T') ...
            && isequal(upper(sessionID), name(1:length(sessionID)))
        tees = strfind(ext, 'T');
        trode = str2num(ext(tees(end)+1:end));
        if ~isempty(trode)
            clusterfiles{end+1} = f.name;
        end
    end
end

for fileidx = 1:length(clusterfiles)
    filename = clusterfiles{fileidx};
    [pathstr,name,ext] = fileparts(upper(filename));
    tees = strfind(ext, 'T');
    trodenum = ext(tees(end)+1:end);
    FileHeader = dg_ReadRodentFormat(fullfile(animaldir, filename), 'header');
    for cnum = 1:FileHeader.CSize
        fprintf(outfid, '%s\t%s\t%s\t%s\t%d\n', ...
            filename, animalID, sessionnum, trodenum, cnum );
    end
end

fclose(outfid);
