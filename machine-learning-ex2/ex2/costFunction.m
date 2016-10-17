function [J, grad] = costFunction(theta, X, y)
%COSTFUNCTION Compute cost and gradient for logistic regression
%   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
%   parameter for logistic regression and the gradient of the cost
%   w.r.t. to the parameters.

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
%
% Note: grad should have the same dimensions as theta
%

errors = zeros(m,1);
error_changerate = zeros(size(X));

for i=1:m,
	h = hypo(theta, X(i,:)');
	errors(i) = ( -y(i)*log(h) - ( (1-y(i))*log(1-h) ) );


	for j=1:size(theta),
		error_changerate(i,j) = (hypo(theta, X(i,:)') - y(i)) * X(i,j);
	end;

end;

J = sum(errors) / m;

for j=1:size(theta),
	grad(j) = sum(error_changerate(:,j)) / m;
end;


% =============================================================

end

function predictedY = hypo(theta, x)
% HYPO Predict the hypothesis function for logistic regression
%      where theta and x are column vectors

predictedY = sigmoid(theta' * x);

end
