function J=chronux_mtfftc(data,tapers,nfft)
% Multi-taper fourier transform - continuous data
%
% Usage:
% J=mtfftc(data,tapers,nfft) - all arguments required
% Input: 
%       data (in form samples x channels/trials) 
%       tapers (precalculated tapers from dpss) 
%       nfft (length of padded data)
%                                   
% Output:
%       J (fft in form frequency index x taper index x channels/trials)
if nargin < 3; error('Need all arguments'); end;
[NC,C]=size(data); % size of data
[NK K]=size(tapers); % size of tapers
if NK~=NC; error('length of tapers is incompatible with length of data'); end;
tapers=tapers(:,:,ones(1,C)); % add channel indices to tapers
data=data(:,:,ones(1,K)); % add taper indices to data
data=permute(data,[1 3 2]); % reshape data to get dimensions to match those of tapers
data_proj=data.*tapers; % product of data with tapers
J=fft(data_proj,nfft);   % fft of projected data
