function [w_history,c_history] = gd(x,y,lrate,rep)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[n,d] = size(x);
w0 = zeros(d,1);
w = w0;
w_history = zeros(d,n);
c_history = zeros(1,n);
for i = 1:rep
    y_pred = x*w;
    C = (1/2)*sum((y-y_pred).^2);
    G = -x'*(y-y_pred);
    w = w - lrate .* G;
    w_history(:,i) = w;
    c_history(i) = C;
end
end

