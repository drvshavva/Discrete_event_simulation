lambda=4.5;
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

%p(x) hesabý
for i=1:1000
    p_poiss_1(i)=exp(-lambda)*power(lambda,poisson(i))/factorial(poisson(i));
end

lambda2=6;
%1000 sample generating
for j=1:1000
    i=0;
    u2=rand();
    y2=-(1/lambda2)*log(u2);
    sum2=y2;
    while(sum2<=1)
        u2=rand();
        y2=-(1/lambda2)*log(u2);
        sum2=sum2+y2;
        i=i+1;
    end
    poisson2(j)=i;
end

%p(x) hesabý
for i=1:1000
    p_poiss_12(i)=exp(-lambda2)*power(lambda2,poisson2(i))/factorial(poisson2(i));
end
figure; hold on; 
stem(poisson,p_poiss_1,'LineStyle','-.',...
     'MarkerFaceColor','red',...
     'MarkerEdgeColor','black');
 stem(poisson2,p_poiss_12,'LineStyle','-.',...
     'MarkerFaceColor','blue',...
     'MarkerEdgeColor','black');
histogram(poisson,'Normalization','probability','FaceColor','w');
histogram(poisson2,'Normalization','probability','FaceColor','red');

legend('lambda=4.5 Analytical', 'lambda=6 Analytical','lambda=4.5 Simulated','lambda=6 Simulated');