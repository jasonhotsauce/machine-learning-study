function [error_train, error_val] = ...
    learningCurveRand(X, y, Xval, yval, lambda, num_iteration)

m = size(X, 1);

error_train = zeros(m, 1);
error_val = zeros(m, 1);

error_train_all = zeros(m, num_iteration);
error_val_all = zeros(m, num_iteration);

for i = 1:m
	for j = 1:num_iteration
		X_sample = X_val_sample = zeros(i, size(X, 2));
		y_sample = y_val_sample = zeros(i, size(y,2));
		random_index = randi(m, i, 1);
		random_index_val = randi(size(Xval, 1), i, 1);
		for k = 1:length(random_index)
			X_sample(k, :) = X(random_index(k), :);
			y_sample(k, :) = y(random_index(k), :);
			X_val_sample(k, :) = Xval(random_index_val(k), :);
			y_val_sample(k, :) = yval(random_index_val(k), :);
		end
		[theta] = trainLinearReg(X_sample, y_sample, lambda);
		error_train_all(i, j) = linearRegCostFunction(X_sample, y_sample, theta, 0);
		error_val_all(i, j) = linearRegCostFunction(X_val_sample, y_val_sample, theta, 0);
	end
end

error_train = mean(error_train_all, 2);
error_val = mean(error_val_all,2);
end