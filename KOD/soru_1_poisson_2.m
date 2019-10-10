lambda=6;
%1000 sample generating
for j=1:1000
    i=0;
    u=rand();
    y=-(1/lambda)*log(u);
    sum=y;
    while(sum<=1)
        u=rand();
        y=-(1/lambda)*log(u);
        sum=sum+y;
        i=i+1;
    end
    poisson(j)=i;
end
%figure(1)
%histogram(poisson,'probability');
%p(x) hesabý
for i=1:1000
    p_poiss_1(i)=exp(-lambda)*power(lambda,poisson(i))/factorial(poisson(i));
end
%figure(2)
%stem(poisson,p_poiss_1,'filled');
figure; hold on; 
stem(poisson,p_poiss_1);
histogram(poisson,'Normalization','probability');
legend('Theoretical', 'Simulation');
