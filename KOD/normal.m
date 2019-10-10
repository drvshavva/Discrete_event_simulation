sigma=sqrt(5);
nu=3.1;
norm_r= sigma*randn(1,1000)+nu;    

mean_norm=mean(norm_r);
var_norm=var(norm_r);
format long
fun= @(x)exp((-power(x-nu,2)/(2*5)));
for i=1:1000
  norm_cdf(i)=(1/(sigma*sqrt(2*pi)))*integral(fun,-inf,norm_r(i));
end
figure(1)
cdfplot(norm_r);
hold on
plot(norm_r,norm_cdf,'o','MarkerFaceColor','w')
legend('Empirical CDF for sigma 5,nu=3.1','Theoretical CDF for sigma 5,nu=3.1')

sigma2=sqrt(2);
nu2=1;
norm_r2= sigma2*randn(1,1000)+nu2;    

mean_norm2=mean(norm_r2);
var_norm2=var(norm_r2);
format long
fun2= @(x)exp((-power(x-nu2,2)/(2*2)));
for i=1:1000
  norm_cdf2(i)=(1/(sigma2*sqrt(2*pi)))*integral(fun2,-inf,norm_r2(i));
end;
figure(2)
cdfplot(norm_r2);
hold on
plot(norm_r2,norm_cdf2,'o','MarkerFaceColor','w')
legend('Empirical CDF for sigma^2 2,nu=1','Theoretical CDF for sigma^2 2,nu=1')


figure(3)
cdfplot(norm_r2);
hold on
plot(norm_r2,norm_cdf2,'o','MarkerFaceColor','w')
hold on
cdfplot(norm_r);
hold on
plot(norm_r,norm_cdf,'o','MarkerFaceColor','w')
legend('Empirical CDF for sigma^2 2,nu=1','Theoretical CDF for sigma^2 2,nu=1','Empirical CDF for sigma^2 5,nu=3.1','Theoretical CDF for sigma^2 5,nu=3.1')

figure(4)
cdfplot(norm_r2);
hold on
cdfplot(norm_r);
legend('Empirical CDF for sigma^2 2,nu=1','Empirical CDF for sigma^2 5,nu=3.1')

figure(5)
plot(norm_r2,norm_cdf2,'o','MarkerFaceColor','w')
hold on
plot(norm_r,norm_cdf,'o','MarkerFaceColor','w')
legend('Theoretical CDF for sigma^2 2,nu=1','Theoretical CDF for sigma^2 5,nu=3.1')

