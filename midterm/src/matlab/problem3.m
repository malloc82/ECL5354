%% Problem 3

fprintf('\n\nProblem 3\n\n');
count     = 10; % distribution count
plot_grid = [ceil(count/2), 2];
range     = [200, 400];

fX  = {};
X   = {};
len = zeros(count, 1);

sum_mean = 0;
sum_var  = 0;

means = zeros(count, 1);
vars  = zeros(count, 1);

fprintf('\nThere are %d random distributions in total\n\n', count);

%% Generate a few different random probability distribution

for i=1:count
    len(i) = range(1) + ...
             int32((range(2) - range(1))*rand());
    X{i}   = rand(len(i), 1);
    fX{i}  = X{i}/sum(X{i});
end

%% Plotting random probability distributions

row=plot_grid(1);
col=plot_grid(2);
figure
for idx=1:row*col
    subplot(row, col, idx);
    plot((1:len(idx))', fX{idx});
    E_x  = sum((1:len(idx))'.*fX{idx});                   % Calculate first moment
    E_x2 = sum((1:len(idx))'.*(1:len(idx))'.*fX{idx});    % Calculate second moment

    %% Calculating each distribution's mean and variance

    means(idx) = E_x;                                     % Calculate mean aka. first moment
    vars(idx)  = E_x2 - E_x^2;                            % Calculate variance
    title([sprintf('mean = %.2f\nvariance = %.2f', ...
                   means(idx), ...
                   vars(idx))]);
end

%% Convolute all the distributions together

mix = fX{1};
for i=2:count
    mix = conv(mix, fX{i});
end

%% Calculate the mean and variance of the covoluted distribution
E_mix    = sum((1:length(mix))'.*mix);                    % Calculate first moment
E_mix2   = sum((1:length(mix))'.*(1:length(mix))'.*mix);  % Calculate second moment
mix_mean = E_mix;
mix_var  = E_mix2 - E_mix^2;                              % Calculate variance

%% Plotting the convoluted distribution

figure
plot((1:length(mix))', mix, 'b');
title([sprintf('mean = %.2f\nvariance = %.2f', ...
               mix_mean, ...
               mix_var)]);
hold on

%% Calculate the difference between the mean, variance of the
%% convluted distribution and the sumed up means, variances
%% of all the rand distributions.

diff_mean = abs(sum(means) - mix_mean);                   % difference of means
diff_var  = abs(sum(vars)  - mix_var);                    % difference of variances
fprintf('difference of mean     : %.2f\n', diff_mean);
fprintf('difference of variance : %.2f\n', diff_var);

%% Plotting a gaussian distribution using the same mean, variance
%% of the convluted distribution.

plot((1:length(mix)), normpdf((1:length(mix)), mix_mean, sqrt(mix_var)), 'r');
legend('Convoluted result', ...
       'Gaussian with the same mean and variance');

