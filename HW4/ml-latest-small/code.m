%Jerry Chen
%CS541 HW4
ratings = readmatrix('ratings.xlsx','Sheet','ratings','Range','A:C');
movies = readmatrix('movies.xlsx','Sheet','movies','Range','A:A');
num_users = max(ratings(:,1));
num_movies = length(movies);
M = zeros(num_users,num_movies);
for i = 1:length(ratings)
    M(ratings(i,1),ratings(i,2)) = ratings(i,3);
end
[trainInd,testInd] = splitdata(M);
lambdas = [10^-6,10^-3,0.1,0.5,2,5,10,20,50,100,500,1000];
rmse_hist = zeros(1,length(lambdas));
for i = 1:length(lambdas)
    [U,V,e_history] = rec_gd(trainInd,lambdas(i),0.001);
    t = 1:100;
%     figure(i)
    %plot(t,e_history);
    %title("Lambda value: " + lambdas(i))
    X = U*V;
    rmse = RMSE(testInd,X);
    rmse_hist(1,i) = rmse;
end
plot(1:12,rmse_hist);
title("RMSE vs. lambda")
xlabel('lambda(10^-6,10^-3,0.1,0.5,2,5,10,20,50,100,500,1000)')
ylabel('RMSE')