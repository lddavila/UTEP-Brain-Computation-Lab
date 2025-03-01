function [LRatio, numspikes, clustID] = dg_rateClusters(fn1)
% Reads cluster feature data from .MAT file <fn1>, and returns a list of
% quality ratings with one element for each cluster in the file.  Cluster 0
% is not included in <LRatio>, but it must be supplied in <fn1> in order to
% do the computation.  The quality computation is the L(ratio) described in
% the CLUSTER QUALITY section of Schmitzer-Torbert N & Redish AD (2004) J
% Neurophysiol 91:2259-2272. For explanation of Mahalanobis distance, see
% Fall 2005 web notes for Princeton Computer Science 436 at
% http://www.cs.princeton.edu/courses/archive/fall05/cos436/Duda/PR_Mahal/M_metric.htm. 
%INPUTS
% The file specified by <fn1> is a .MAT file containing cluster ID numbers
% in column 2 and spike feature values in subsequent columns.  Warning:
% computation time goes as the square of the number of features.  Column 1
% is ignored.  The file must contain "unassigned" or "noise" samples as
% cluster #0 in order to get a legitimate assessment of quality.  The
% cluster numbers in <fn1> do not need to be consecutive; any missing
% cluster numbers are simply skipped.  A literal data array can be given as
% the value of <fn1> instead of a filename, in which case file reading is
% skipped.
%OUTPUTS
% LRatio: a vector containing LRatio values for each cluster other than the
%   "noise cluster" number 0.
% numspikes: the number of spikes in each cluster, in the same order as the
%   values in <LRatio>. 
% clustID: a column vector containing the integer cluster IDs as supplied in
%   <fn1>, in the same order as the values in <LRatio>.

%$Rev: 239 $
%$Date: 2016-03-10 19:30:16 -0500 (Thu, 10 Mar 2016) $
%$Author: dgibson $

if ischar(fn1)
    % Load the data into arrays s:
    S = load(fn1);
    fields = fieldnames(S);
    s = S.(fields{1});
    clear S;
elseif isnumeric(fn1)
    s = fn1;
else
    error('dg_rateClusters:fn1', ...
        '<fn1> must be either char or numeric.');
end

clusters = unique(s(:,2))';
if ~ismember(0, clusters)
    error('dg_rateClusters:no0', ...
        'There is no cluster #0 in %s', fn1 );
end
Nfeatures = size(s, 2) - 2;
if Nfeatures < 1
    error('dg_rateClusters:nofeat', ...
        'There are no feature data in %s', fn1 );
end
fprintf('Rating clusters based on %d features\n', Nfeatures);
L = NaN(length(clusters) - 1, 1);
LRatio = NaN(length(clusters) - 1, 1);
numspikes = NaN(length(clusters) - 1, 1);
clustID = reshape(clusters(2:end), [], 1);
for clustidx = 1:length(clustID)
    clustselect = (s(:,2) == clustID(clustidx));
    numspikes(clustidx) = sum(clustselect);
    % I make the leap of faith that the incredibly compact formulas in the
    % Matlab 'mahal' function really do compute the Mahalanobis distances
    % of Y from mean(X) using the the covariance matrix calculated from X.
    L(clustidx) = sum(1 - chi2cdf(...
        mahal(s(clustselect, 3:end), s(~clustselect, 3:end)), ...
        Nfeatures ));
    LRatio(clustidx) = L(clustidx) / numspikes(clustidx);
end

