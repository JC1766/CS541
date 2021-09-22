%Jerry Chen
%I pledge my honor that I have abided by the Stevens Honor System

d = 1000;
x = randi([-100 100],d,1);
kvalue = [10,30,50,80,100,150,200,300,400,500,600,800,1000];
rvalue = zeros(1,13);
for val = 1:13
    k = kvalue(val);
    A = zeros(k,d);
    for i = 1:k
        for j = 1:d
            A(i,j) = normrnd(0,1/sqrt(k));
        end
    end
    Ax = A*x;
    ratio = norm(Ax)/norm(x);
    rvalue(val) = ratio;
end
plot(kvalue,rvalue)