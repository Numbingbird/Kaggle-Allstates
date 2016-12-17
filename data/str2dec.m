function dec = str2dec(str)
% turn an entire str matrix into dec, base 10.
% a = 1, z = 26.

% textread generated cell objects
% incredibly annoying to deal with
% iterate over str matrix and make numbers
dec = zeros(size(str));
for i = 1:numel(str)
	sum = 0;
	tmp = str(i);
	tmp = tmp{1};
	for j = 1:numel(tmp)
		sum = sum + letterToNum(tmp(j));
	end
	dec(i) = sum;
end