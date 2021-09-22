function rmse = RMSE(test_data,prediction)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[ht,wd] = size(test_data);
rmse = 0;
ct = 0;
for i = 1:ht
    for j = 1:wd
        if test_data(i,j) ~= 0
            rmse = rmse + (test_data(i,j)-prediction(i,j))^2;
            ct = ct + 1;
        end
    end
end
rmse = sqrt(rmse/ct);
end

