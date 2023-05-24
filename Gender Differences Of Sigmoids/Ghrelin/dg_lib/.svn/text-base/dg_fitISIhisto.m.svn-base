function [m, b, f, gof, out] = dg_fitISIhisto(ISIcounts, binctrs)
% The ISIs of a Poisson process follow the probability distribution given
% by pdf = exp(-lambda) where <lambda> is the Poisson parameter as required
% by 'poisspdf', i.e. the expected number of events.  For spike trains, the
% expected number of events is rate * dt, where <dt> is the duration of a
% time interval, and <rate> is the average firing rate.  Plugging that in,
%   pdf = exp(-rate * dt)
%   log(pdf) = -rate * dt
% so if we estimate the pdf by making a histogram (that is pdf = counts/N
% where <counts> is the number of ISIs in a bin and <N> is the total number
% ISIs observed), then <rate> can be estimated as the negative of the slope
% of a fitted line of the form
%   log(counts/N) = -rate * dt
% where <dt> is the bin center.
%OUTPUTS
% m: slope of log ISI histogram.
% b: intercept of log ISI histogram.
% gof, out: as returned by 'fit'.
%NOTES
% The ISI log histo is fit as a two-part piecewise linear function.  The
% piece used to determine the value of m and b is the left piece if there
% are more than one-nonth as many good bins to the left of the break point
% as to the right, AND the slope is more negative on the left than the
% right.  Otherwise, the right piece is used. Both slopes are constrained
% to be less than zero.
%   If an error is raised while running 'fit', the error info is displayed
% and dg_fitISIhisto returns with out.exitflag = -998.
%   If the histogram is too sparse to analyze, dg_fitISIhisto returns with
% out.exitflag = -999.

%$Rev:  $
%$Date:  $
%$Author: dgibson $


ISIcounts = reshape(ISIcounts, [], 1);
binctrs = reshape(binctrs, [], 1);
% define span of data worth analyzing: first trim off any bins that have
% too few counts from the ends
goodbin = ISIcounts > 5;
lastgoodbin = find(goodbin, 1, 'last');
firstgoodbin = find(goodbin, 1);
if isempty(firstgoodbin) || isempty(lastgoodbin) || ...
        lastgoodbin <= firstgoodbin
    % It's time to bail:
    m = NaN;
    b = NaN;
    f = [];
    gof = [];
    out.exitflag = -999;
    return
end
logpdf = log(ISIcounts(1:end-1)/sum(ISIcounts(1:end-1)));
% Bins of zero produce -Inf in <logpdf>; just get rid of those points.
isgoodpt = ~isinf(logpdf);
if firstgoodbin > 1
    isgoodpt(1:firstgoodbin-1) = false;
end
if lastgoodbin < length(isgoodpt)
    isgoodpt(lastgoodbin+1:end) = false;
end
if sum(isgoodpt) < 2
    error('dg_fitISIhisto:nodata', ...
        'There are not enough "good" data points to fit.');
end
ft = fittype( @(b, m, r, k, x) dg_twopiece(x, b, m, r, k) );
fop = fitoptions(ft);

logpdf = log(ISIcounts / sum(ISIcounts));
[~, maxbin] = max(logpdf);
% Compute an initial guesstimate for m.  Require the bins used for the
% estimate to have at least one more bin in between them.
if maxbin >= lastgoodbin - 1
    m = -1;
else
    m = diff(logpdf([maxbin lastgoodbin])) / ...
        diff(binctrs([maxbin lastgoodbin]));
    if m >= 0 || isnan(m) || isinf(m)
        m = -1;
    end
end
startpt = [mean(logpdf([firstgoodbin lastgoodbin])), 2*m, m/2, ...
    mean(binctrs([firstgoodbin lastgoodbin]))];
fop.StartPoint = startpt;
fop.Lower = [min(logpdf) 10*m m binctrs(1)];
fop.Upper = [max(logpdf) 0 0 binctrs(end)];
fop.TolFun = 1e-15;
fop.TolX = 0.1;

try
    [f, gof, out] = fit( binctrs(isgoodpt), logpdf(isgoodpt), ft, fop);
catch e
    logmsg = 'dg_fitISIhisto: error while processing fit.';
    logmsg = sprintf('%s\n%s\n%s', ...
        logmsg, e.identifier, e.message);
    for stackframe = 1:length(e.stack)
        logmsg = sprintf('%s\n%s\nline %d', ...
            logmsg, e.stack(stackframe).file, ...
            e.stack(stackframe).line);
    end
    disp(logmsg);
    m = NaN;
    b = NaN;
    f = [];
    gof = [];
    out.exitflag = -998;
    return
end
% If there is a reasonable number of bins to the left of the break point,
% and the left line segment has a slope that is more negative than the
% right, use the left slope. Otherwise, use the right line segment.
if (f.k - binctrs(firstgoodbin) > (binctrs(lastgoodbin) - f.k) / 9) ...
        && f.m < f.r
    m = f.m;
    b = f.b;
else
    m = f.r;
    b = f.b + (f.m-f.r) * f.k;
end
end

