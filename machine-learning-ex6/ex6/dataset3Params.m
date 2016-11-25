function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.

% This is from running the grid search below.
% Remove the return statement to run the grid search.
C = 0.25629;
sigma = 0.075938;
return;

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

best_error = -1;
temp_C = 0.01;
temp_sigma = 0.01;

multiply_by = 1.5;

i = 0;
while(temp_C <= 50)
	j = 0;
	while (temp_sigma <= 50)
		fprintf('trying sigma %f, C %f\n', temp_sigma, temp_C);
		model = svmTrain(X, y, temp_C, @(x1,x2) gaussianKernel(x1, x2, temp_sigma));
		predictions = svmPredict(model, Xval);
		error_rate = mean(double(predictions ~= yval))

		if (best_error == -1 || error_rate < best_error)
			C = temp_C;
			sigma = temp_sigma;
			best_error = error_rate;
		endif
		temp_sigma = temp_sigma * multiply_by;
		j++;

	endwhile
	temp_sigma = 0.01;
	temp_C = temp_C * multiply_by;
	i++;
endwhile




% =========================================================================

end
