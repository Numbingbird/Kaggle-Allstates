function B = polynomialRegression(K,x,y)
% technically this is just the basis function part
% messed up a little during remaking

B = [ones(size(x))];
for i = 1:K
    B = [B x.^i];
end

end