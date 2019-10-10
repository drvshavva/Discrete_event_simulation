p_geo=0.3;
%generating geometric random variable
for i=1:1000
    K=1;
    while(rand()>p_geo)
        K=K+1;
    end
    geo_1(i)=K;
end

%calculating geometric pdf formula
for i=1:1000
    p_geo(i)=power(0.7,(geo_1(i)-1))*0.3 ;
end

figure; hold on; 
%plotting calculated results
plot(geo_1,p_geo,'o');
%plotting simulated results
[counter, bins]= hist(geo_1,100);
delta=bins(2)-bins(1);
EmpPDF=counter/sum(counter)/delta;
plot(bins,EmpPDF);

legend('p=0.3 Analytical','p=0.3 Simulated');