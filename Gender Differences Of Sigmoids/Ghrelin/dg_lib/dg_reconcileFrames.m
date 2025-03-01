function [canonicalstamps, activefnums] = dg_reconcileFrames(timestamps)
% When Cheetah recording stops, it sometimes happens that some channels
% record one frame more than the other channels.  Rodent data may contain
% many starts and stops, so there can be frame discrepancies in the middles
% of files.  We make the files uniform by deleting the extra frames
% wherever they occur.
%INPUT
% timestamps - a cell vector containing the list of timestamps from all the
% files that are to be reconciled.  May also contain empty cells, which are
% ignored.
%OUTPUTS
% canonicalstamps - the list of timestamps common to all files.
% activefnums - the equivalent of lfp_ActiveFilenums for the current
%   value of <timestamps>, i.e. a list of indices of non-empty cells in
%   <timestamps>.


%$Rev: 239 $
%$Date: 2016-03-10 19:30:16 -0500 (Thu, 10 Mar 2016) $
%$Author: dgibson $

if isempty(timestamps)
    error('dg_reconcileFrames:timestamps', ...
        '<timestamps> is empty.');
end

% Find <activefnums>, 
for k = 1:length(timestamps)
    gotstuff(k) = ~isempty(timestamps{k});
end
activefnums = find(gotstuff);

if length(activefnums) < 1
    canonicalstamps = [];
    return
end
if length(activefnums) == 1
    canonicalstamps = timestamps{activefnums(1)};
    return
else
    canonicalstamps = timestamps{activefnums(1)};
end
for filenum = activefnums(2:end)
    if ~isempty(timestamps{filenum})
        canonicalstamps = intersect(canonicalstamps, ...
            timestamps{filenum});
    end
end
