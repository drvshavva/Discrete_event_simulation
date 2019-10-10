lambda=4.5;
%generating poþsson random variable
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
    pois_rv(j)=i;
end

%calculation of poisson pdf function
for i=1:1000
    p_poiss_1(i)=exp(-lambda)*power(lambda,pois_rv(i))/factorial(pois_rv(i));
end
figure; hold on; 
%plotting calculated results
stem(pois_rv,p_poiss_1,'LineStyle','-.',...
     'MarkerFaceColor','red',...
     'MarkerEdgeColor','black');
 %plotting simulation results
histogram(pois_rv,'Normalization','probability','FaceColor','c');
legend('Analytical', 'Simulation');
