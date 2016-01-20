
% Load GENDATA
if (~exist('GENDATA', 'var')), error('Data not loaded'); end;

% number of Gaussian components
numClusters = 100;
exemplarsize = 3;

%% convert frame-level features to exemplars
% the bigger the exemplar, the more temporal info captured.
% recommended value for exemplarsize = 5. 
% The resulting feature vector's size is exemplarsize * 2 - 1 times
% the original feature size.
EXE = cell(length(GENDATA.mfcc), 1);
for j = 1 : length(GENDATA.mfcc)
    EXE{j} = inferqgram(GENDATA.mfcc{j}, exemplarsize);
end

%% collect all exemplar features into a big matrix. 
allexedata = collectfeature(EXE, []);

% You may consider using PCA to reduce the dimensionality of your exemplars
% here. Because the dimensionality of FV is 
%   (the dimension of your exemplar) x (num of Gaussian components) x 2

% compute GMM
[means, covariances, priors] = vl_gmm(allexedata, numClusters);

%% compute Fisher Vector, 
% stored in FV. Each exemplar corresponds to a column
FV = zeros(numel(means)*2, length(GENDATA.mfcc));
for j = 1 : length(GENDATA.mfcc)
    FV(:,j) = vl_fisher(EXE{j}, means, covariances, priors, 'Improved');
end