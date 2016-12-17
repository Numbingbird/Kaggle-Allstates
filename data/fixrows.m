function fix = fixrows(inp, cols)
% textread returns all the rows as one, so it needs reformatting back into its dimensions

datap = size(inp,1)/cols;

% preload matrix
fix = zeros([datap, cols]);
prev = 1;
for i = 1:datap
	fix(i,:) = inp((i-1)*cols+1:i*cols,1)';
end
