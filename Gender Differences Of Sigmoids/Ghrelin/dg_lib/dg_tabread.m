function num = dg_tabread(filename)
%DG_TABREAD reads tab-delimited text spreadsheets
%num = dg_tabread(filename)
% Behaves similarly to num = xlsread(filename), except that <filename> must
% be the pathname of a tab-delimited text file:  dg_tabread ignores leading
% rows or columns of text; however, if a cell not in a leading row or
% column is empty or contains text, dg_tabread puts a NaN in its place in
% the return array, num.  Tolerates unequal numbers of tabs per line.
% "Text" and "numeric" strings are distinguished by passing the string to
% str2double, and if the result is NaN, then the string was text.
%NOTES
% The presence of even a single numerical field in a row or column causes
% that raw or column to be included in <num>, i.e. NOT to be treated as a
% header.  Also, if there is a header row containing fewer headers than
% there are columns of numerical data in the longest row in the file, then
% the missing columns in the header row are filled in with the value zero,
% and the entire row is therefore included in <num>, not trimmed off.

%$Rev: 54 $
%$Date: 2010-05-11 15:54:33 -0400 (Tue, 11 May 2010) $
%$Author: dgibson $

allocsize = 512;
num = zeros(allocsize); % pre-allocate for speed
linenum = 0;
numcols = 0;

fid = fopen(filename);
if fid == -1
    error('Could not open %s', filename);
end

line = fgetl(fid);
while ~isequal(line, -1)
    linenum = linenum + 1;
    tabs = regexp(line, '\t');
    tabs(end+1) = length(line) + 1;
    numcols = max(numcols, length(tabs));
    % Allocate more storage if needed:
    if linenum > size(num,1)
        num = [ num; zeros(allocsize, size(num,2)) ];
    end
    if numcols > size(num,2)
        num = [ num zeros(size(num,1), allocsize) ];
    end
    % convert text to number:
    value = str2double(line(1 : tabs(1)-1));
    if isnan(value)
        num(linenum, 1) = NaN;
    else
        num(linenum, 1) = value;
    end
    for tabnum = 2:length(tabs)
        value = str2double(line(tabs(tabnum-1)+1 : tabs(tabnum)-1));
        if isnan(value)
            num(linenum, tabnum) = NaN;
        else
            num(linenum, tabnum) = value;
        end
    end
    line = fgetl(fid);
end
% Trim off unused allocated storage:
num = num(1:linenum, 1:numcols);
% Trim off empty leading rows and columns:
while ~isempty(num) && all(isnan(num(1,:)))
    num(1,:) = [];
end
while ~isempty(num) && all(isnan(num(:,1)))
    num(:,1) = [];
end

fclose(fid);