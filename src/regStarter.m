
% id cont1	cont2	cont3	cont4	cont5	
% cont6	cont7	cont8	cont9	cont10	
% cont11	cont12	cont13	cont14	loss

% file in format that needs a bit of pruning
testIn = csvread('../train.csv')

multiFit(K,xTrain,yTrain,x,y)
