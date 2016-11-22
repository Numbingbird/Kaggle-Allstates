function [c1, c2] = split(inputs, classes);

% Split input into two classes.
% gcc and logistic takes two classes, cleanly seperated
% one entry per row on inputs and classes

c1 = zeros(1,size(inputs,2));
c2 = zeros(1,size(inputs,2));
for i = 1:size(inputs,1)
	if isequal(classes(i,:),[1 0])
		c1 = [c1;inputs(i,:)];
	else
		c2 = [c2;inputs(i,:)];
	end
end

c1 = c1(2:end,:);
c2 = c2(2:end,:);