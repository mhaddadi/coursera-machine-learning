function centroids = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returs the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);


% ====================== YOUR CODE HERE ======================
% Instructions: Go over every centroid and compute mean of all points that
%               belong to it. Concretely, the row vector centroids(i, :)
%               should contain the mean of the data points assigned to
%               centroid i.
%
% Note: You can use a for-loop over the centroids to compute this.
%

#centroids = basicMethod(X, idx, K, m, n);
centroids = vectorizedMethod(X, idx, K, m, n);


end

% =============================================================

function centroids = basicMethod(X, idx, K, m, n)

centroids = zeros(K, n);

for k = 1 : K

  num_k = 0;

  for i = 1 : m
  
    if (idx(i) == k)
    
      centroids(k,:) = centroids(k,:) + X(i,:);
      
      num_k = num_k + 1;
    
    end
      
  end 

  if (num_k > 0)  
      centroids(k,:) = centroids(k,:) / num_k;
  end

  
end

end

% =============================================================

function centroids = vectorizedMethod(X, idx, K, m, n)

centroids = zeros(K, n);

for k = 1 : K

  assigned_points = [idx == k];

  centroids(k,:) = sum(assigned_points .* X) / sum(assigned_points);

end

end