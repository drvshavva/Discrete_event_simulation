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

p_geo22=0.5;
for i=1:1000
    K2=1;
    while(rand()>p_geo22)
        K2=K2+1;
    end
    geo_12(i)=K2;
end

for i=1:1000
    p_geo2(i)=power(0.5,(geo_12(i)-1))*0.5 ;
end
figure; hold on; 
stem(geo_1,p_geo,'LineStyle','-.',...
     'MarkerFaceColor','red',...
     'MarkerEdgeColor','k');
 stem(geo_12,p_geo2,'LineStyle','-.',...
     'MarkerFaceColor','b',...
     'MarkerEdgeColor','c');
 histogram(geo_1,'Normalization','probability','FaceColor','red');
histogram(geo_12,'Normalization','probability','FaceColor','w');
legend('p=0.3 Analytical', 'p=0.5 Analytical','p=0.3 Simulated','p=0.5 Simulated');