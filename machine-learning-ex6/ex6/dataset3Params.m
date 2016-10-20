function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1.0;
sigma = 0.1;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

error_min = 10^10;

C_list = [1]; %[0.01; 0.03; 0.1; 0.3; 1; 10; 30];
sigma_list = [0.1];%[0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];

for i = 1 : length(C_list)

  C_i = C_list(i);

  for j = 1 : length(sigma_list)

    sigma_j = sigma_list(j);

    fprintf('\n******************\n');
    fprintf('C(%d) = %0.5f / sigma(%d) = %0.5f \n', i, C_i, j, sigma_j);
    
    error = test_C_Sigma(X, y, Xval, yval, C_i, sigma_j);
    
    fprintf('error_min = %f\n', error_min);
    fprintf('error = %f \n', error);
    
    if error < error_min    

      C = C_i;
      sigma = sigma_j;
      error_min = error;
      fprintf('new C = %0.5f / new sigma = %0.5f \n', C_i, sigma_j);

    end
    
  end

end

% =========================================================================

end


function error = test_C_Sigma(X, y, Xval, yval, C, sigma)

model = svmTrain(X, y, C, @(X, y) gaussianKernel(X, y, sigma));

predictions = svmPredict(model, Xval);

error = mean(double(predictions ~= yval));

end