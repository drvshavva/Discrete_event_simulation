%define lambda value of the distribution
lambda_exp=1.2;
%generating 1000 exponential random variable
for i=1:1000
    u_exp=rand;
    exp_1(i)=-log(u_exp)/lambda_exp;
end
%calculating mean and variance values of these generated rv
mean_exp=mean(exp_1);
var_exp=var(exp_1);
%calculation of exponential pdf formula
for i=1:1000
   p_exp(i)=1-exp(-lambda_exp*exp_1(i));
end

figure(1)
%plotting CDF simulation results
[counter, bins]= hist(exp_1,1000);
PDF=counter/sum(counter);
CDF=cumsum(PDF);
plot(bins,CDF);

hold on
%plotting calculated results
plot(exp_1,p_exp,'o','MarkerFaceColor','w');
legend('Empirical CDF for lambda 1.2','Theoretical CDF for lambda 1.2')
