function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

positiveY = find(y==1);
negativeY = find(y==0);

plot(X(positiveY, 1), X(positiveY,2), 'k+', 'linewidth', 2, 'markersize', 5);
plot(X(negativeY,1), X(negativeY,2), 'ko', 'markerfacecolor', 'y', 'markersize',5);







% =========================================================================



hold off;

end
