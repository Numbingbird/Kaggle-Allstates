function B = polynomialRegression(K,x,y)


%X = [ones(size(x,1), 1)];
%X = [x X]
B = [ones(size(x))];
for i = 1:K
    B = [B x.^i];
end

end