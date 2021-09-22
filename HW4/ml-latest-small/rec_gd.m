function [U,V,e_history] = rec_gd(data,lambda,lrate)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[ht,wd] = size(data);
U = randn(ht,1);
V = randn(1,wd);
e_history = zeros(100,1);
[x,y,v] = find(data);
for rep = 1:100
    for i = 1:length(x)
        pred = U(x(i),1).*V(1,y(i));
        error = v(i) - pred;
        U(x(i),1) = U(x(i),1) - lrate.*(error.*-V(1,y(i)) + lambda.*U(x(i),1));
        V(1,y(i)) = V(1,y(i)) - lrate.*(error.*-U(x(i),1) + lambda.*V(1,y(i)));
        e_history(rep,1) = e_history(rep,1) + error;
    end
    e_history(rep,1) = e_history(rep,1)/length(x);

end
end

