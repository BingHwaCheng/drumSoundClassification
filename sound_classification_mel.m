
% ==========================================================
%
% Here a 2-layer neural network is used: 180 and 32 states.
% The size of validation set is about 25% of the total 
% available samples. 
% 
% ==========================================================

close all; 
clear all;

% -----------------------------------------
% load descriptor data
% -----------------------------------------
load des_mel_kick.mat 
load des_mel_snare.mat;
load des_mel_hihat.mat;

% -----------------------------------------
% randomely permutes the data
% -----------------------------------------
[num_samples, num_des] = size(des_mel_kick);
des_kick_perm = des_mel_kick(randperm(num_samples),:);
[num_samples, num_des] = size(des_mel_snare);
des_snare_perm = des_mel_snare(randperm(num_samples),:);
[num_samples, num_des] = size(des_mel_hihat);
des_hihat_perm = des_mel_hihat(randperm(num_samples),:);

% -----------------------------------------
% construct X and y
% -----------------------------------------
X_train = [];
y_train = [];
for n=1:300
    X_train = [X_train ; des_kick_perm(n,:)];
    y_train = [y_train ; 1 -1 -1];
end
for n=1:300
    X_train = [X_train ; des_snare_perm(n,:)];
    y_train = [y_train ; -1 1 -1];
end
for n=1:150
    X_train = [X_train ; des_hihat_perm(n,:)];
    y_train = [y_train ; -1 -1 1];
end

    
X_valid = [];
y_valid = [];
for n=301:400
    X_valid = [X_valid ; des_kick_perm(n,:)];
    y_valid = [y_valid ; 1 -1 -1];
end
for n=301:400
    X_valid = [X_valid ; des_snare_perm(n,:)];
    y_valid = [y_valid ; -1 1 -1];
end
for n=151:200
    X_valid = [X_valid ; des_hihat_perm(n,:)];
    y_valid = [y_valid ; -1 -1 1];
end

% -----------------------------------------
% neural network weight initialization
% -----------------------------------------
%randn('seed', 1);
w0 = randn(num_des,32);
w1 = randn(32,3);

% -----------------------------------------
% training
% -----------------------------------------
lambda = 0.1;
mu = 0.005;
for iter = 1:500
    % forward path compute
    l0 = X_train; 
    l1 = tanh(l0 * w0);
    l2 = tanh(l1 * w1);
    
    l2_error = y_train - l2;
    
    error(iter) = mean(mean(abs(l2_error)));
    
    % backpropagation
    l2_delta = l2_error .* (1 - tanh(l2).^2);
    
    l1_error = l2_delta * w1';
    l1_delta = l1_error .* (1 - tanh(l1).^2);
    
    w1 = w1*(1-2*mu*lambda) + mu*l1'*l2_delta;
    w0 = w0*(1-2*mu*lambda) + mu*l0'*l1_delta;

end
figure(1); 
plot(error);

figure(2);
n=1:750;
plot(n, l2(n,1), '-x', n, l2(n,2), '-o', n, l2(n,3), '-d');

% -----------------------------------------
% validation
% -----------------------------------------
y_result = [];
error_cnt = 0;

% forward path compute
l0 = X_valid; 
l1 = tanh(l0 * w0);
l2 = tanh(l1 * w1);
y_result = l2;

for n=1:250
    [val ind] = max(l2(n,:));
    [val_true ind_true] = max(y_valid(n,:));
    
    if (ind ~= ind_true)
        error_cnt = error_cnt + 1;
    end
end
fprintf("error rate = %1.2f\n", error_cnt/250*100);

figure(3);
n=1:250;
plot(n, y_result(n,1), n, y_result(n,2), n, y_result(n,3)); 
    
    
