function factors = ComputePairwiseFactors (images, pairwiseModel, K)
% This function computes the pairwise factors for one word and uses the
% given pairwise model to set the factor values.
%
% Input:
%   images: An array of structs containing the 'img' value for each
%     character in the word.
%   pairwiseModel: The provided pairwise model. It is a K-by-K matrix. For
%     character i followed by character j, the factor value should be
%     pairwiseModel(i, j).
%   K: The alphabet size (accessible in imageModel.K for the provided
%     imageModel).
%
% Output:
%   factors: The pairwise factors for this word.
%
% Copyright (C) Daphne Koller, Stanford University, 2012

n = length(images);

% If there are fewer than 2 characters, return an empty factor list.
if (n < 2)
    factors = [];
    return;
end

factors = repmat(struct('var', [], 'card', [K,K], 'val', []), n - 1, 1);

% Your code here:

t = zeros(1,K*K);
i = 1;
for j = 1:K,
    for k = 1:K,
       t(i) = pairwiseModel(k,j);
       i = i + 1;
    end       
end   
   
for i=1:n-1,
   factors(i).var = [i,i+1];
   factors(i).val = t;
end

end

