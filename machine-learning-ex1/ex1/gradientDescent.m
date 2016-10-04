function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    theta_length = length(theta);
    cost_deriv = zeros(theta_length, 1);

    for j = 1:theta_length,
    	sum = 0;
	for i = 1:m,
		sum = sum + ((theta' * X(i,:)' - y(i)) * X(i,:)');
	end
	cost_deriv = sum;
    end

    theta = theta - ((alpha/m) * cost_deriv);


    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
