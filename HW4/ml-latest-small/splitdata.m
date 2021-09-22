function [train,test] = splitdata(M)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[ht,wd] = size(M);
train = M;
test = zeros(ht,wd);
for i = 1:ht
    for j = 1:wd
        if M(i,j)~=0
            r = rand;
            if r >= 0.9
                train(i,j) = 0;
                test(i,j) = M(i,j);
            end
        end
    end
end
end

