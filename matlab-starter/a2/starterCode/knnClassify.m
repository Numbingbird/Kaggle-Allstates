function class = knnClassify(test, k, trainingInputs, trainingTargets);
% classify one data point.
%
% Inputs:
%   test: test input vector. can be row or column, it is sanitized.
%   k: number of nearest neighbours to use in classification.
%   trainingInputs: array of training exemplars, one exemplar per row
%   trainingTargets: identity vector per row
%
% Basic Algorithm of kNN Classification
% 1) find distance from test input to each training exemplar,
% 2) sort distances
% 3) take smallest k distances, and use the median class among 
%    those exemplars to label the test input.
%

% ensure the test is a row vector.
% Transfer data into another variable so as not to change input.
if iscolumn(test)
	t = test';
else
	t = test;
end

% preload matrix of desired size.
% distances is a nx2 matrix, where the first column is distances
% and the second column tracks the column number during sort
distances = [zeros(size(trainingInputs,1),2)];
% write over the second column to keep track of entry during sort.
for i = 1:size(trainingInputs,1)
	distances(i,2) = i;
end

% iterate over rows, in this case examplars
for i = 1:size(trainingInputs,1)
	distances(i,1) = sqrt(sum((t - trainingInputs(i,:)) .^ 2));
end

distances = sortrows(distances);
% now the second row of distances indicates, by above tracking, which entries were closest
% follow that second row for class identity vector

% preloading the entire matrix here complicates matrix summation, so it is not done.
classTotal = zeros(1,size(trainingTargets,2));
for i = 1:k
	classTotal = classTotal + trainingTargets(distances(i,2),:);
end
% write in a second row to keep track of entry during sort.
classTotal = [classTotal;zeros(1,size(classTotal,2))];
for i = 1:size(classTotal,2)
	classTotal(2,i) = i;
end

% sort to find the highest number of class. since sort is lowest to highest, this is at end of row 2.
classTotal = sortrows(classTotal')';

% create a new identity vector..
class = zeros(1, size(classTotal,2));
% set the indicator for most occuring class to 1.
class(1, classTotal(2,size(classTotal,2))) = 1;

