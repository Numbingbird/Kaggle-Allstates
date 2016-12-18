% Loading takes a long time. Do it once and never again.
% id cont1	cont2	cont3	cont4	cont5	
% cont6	cont7	cont8	cont9	cont10	
% cont11	cont12	cont13	cont14	loss

% files had to be seperated because matlab signifi digits cut them off
%train = csvread('../data/train.csv');
%trainID = csvread('../data/trainID.csv');
%trainY = csvread('../data/trainY.csv');

load('../data/train.mat');
load('../data/traincat.mat');
load('../data/traincont.mat');
load('../data/trainY.mat');