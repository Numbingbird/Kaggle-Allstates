function y = evalPolynomial(x,w)
% Evaluate the polynomial defined by the given weight vector at the
% given values of x.
% Rewritten from ground up for project

% b is folded into w [w1..wd,b]


y = w(1:numel(w)-1)'*x' + w(numel(w));
y = y';


%{
% scalar case
if isscalar(x)
    y = 0;
    for iw = 1:numel(w)
        y = y + (w(iw) * (x^(iw - 1)));
    end

% vector case
else
    % preload matrix, recommended by MATLAB
    y = ones(size(x));
    % i is index, e is element: ix index of x, ex element of x.
    for ix = 1:numel(x)
        ex = x(ix);
        sum = 0;
        for iw = 1:numel(w)
            sum = sum + (w(iw) * (ex^(iw - 1)));
        end
        y(ix) = sum;
    end
end
end
%}