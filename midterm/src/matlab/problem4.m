
mu    = 0;
sigma = 3;

X = (-sigma^2:0.1:sigma^2);
fX = normpdf(X, mu, sigma);

S = zeros(size(X));
% Calculate area under the curve between [-a, a]
for i=1:length(S)
    S(i) = abs(1 - normcdf(X(i), mu, sigma)*2);
end

X1 = (-sigma^2:0.1:-sigma);
Y1 = zeros(size(X1));

X2 = (sigma:0.1:sigma^2);
Y2 = zeros(size(X2));

for i=1:length(X1)
    Y1(i) = 1 - (sigma / X1(i))^2;
end
for i=1:length(X2)
    Y2(i) = 1 - (sigma / X2(i))^2;
end

plot(X,  fX, 'b', ...
     X,  S,  'g', ...
     X1, Y1, 'r', ...
     X2, Y2, 'r');
title([sprintf('mean = %d\nvariance = %d', mu, sigma^2)]);