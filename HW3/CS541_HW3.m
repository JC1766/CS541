%Jerry Chen
%I pledge my honor that I have abided by the Stevens Honor System

%4) 
n=101; d=101;
x=randn(n,d);
y=randn(n,1);
in=inv(x'*x);
w=in*x'*y;
H=x'*x;
e=eig(H);
%upper bound L, best learning rate 1/L
n0=1/ceil(max(e));
n_rates = [0.01,0.1,1,2,20,100];
t = 1:100;
for i = 1:6
    [w_history,c_history] = gd(x,y,n_rates(i)*n0,100);
    diff = zeros(1,100);
    for j = 1:100
        diff(:,j) = norm(w_history(:,j)-w);
    end
    figure(i)
    %plot(t,c_history)
    plot(t,diff)
    title("Learning rate: " + n_rates(i) + "*n0")
    xlabel('t')
    ylabel('F(w)')
end 