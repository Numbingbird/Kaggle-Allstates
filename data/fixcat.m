% going from text csv to numbers has significantly more steps than number csv.
% this code need not be further run, was a preprocessing step.
% builtin reshape does not work, columns and rows mixed up

% csvs had to be broken up as it was too big for a single read
files = ['traincat - part1.csv';'traincat - part2.csv';
	'traincat - part3.csv';'traincat - part4.csv'];

% pre-initialize output
traincat = zeros([188318, 116]);

out = textread('traincat - part1.csv', '%s', 'whitespace', ',');
out = str2dec(out);
% don't want to use hexadec here, since there are some dimensions with nonhexa entries like 'SA'
traincat(:,1:29) = fixrows(out, 29);

out = textread('traincat - part2.csv', '%s', 'whitespace', ',');
out = str2dec(out);
traincat(:,30:58) = fixrows(out, 29);

out = textread('traincat - part3.csv', '%s', 'whitespace', ',');
out = str2dec(out);
traincat(:,59:87) = fixrows(out, 29);

out = textread('traincat - part4.csv', '%s', 'whitespace', ',');
out = str2dec(out);
traincat(:,88:116) = fixrows(out, 29);