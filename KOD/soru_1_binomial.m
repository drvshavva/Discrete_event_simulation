%set of variables we will plot in the diyagram
p=0.5;
n=50;
x=ones(1,1000);
%generating 1000 binomial random variables
for i=1:1000
    U=rand(n,1);
    x(i)=sum(U<p);
end
%calculation of mean and variance values of generated random variables 
ort=mean(x);
vari=var(x);
%calculation of binomial pdf formula 
for i=1:1000
    p2(i)= nchoosek(50,x(i))*power(0.5,x(i))*power(0.5,(50-x(i)));
end

%second parameters of the question
p_22=0.7;
n_22=40;
%generating binomial random variable
for i=1:1000
    U2=rand(n_22,1);
    x2(i)=sum(U2<p_22);
end

%calculation of pdf formula 
for i=1:1000
    p22(i)= nchoosek(40,x2(i))*power(0.7,x2(i))*power(0.3,(40-x2(i)));
end

figure; hold on; 
%plot the calculated results for both parameters 
stem(x,p2,'LineStyle','-.',...
     'MarkerFaceColor','red',...
     'MarkerEdgeColor','black');
stem(x2,p22,'LineStyle','-.',...
     'MarkerFaceColor','blue',...
     'MarkerEdgeColor','green');
%plot the simulated results for both parameters 
histogram(x,'Normalization','probability','FaceColor','red');
histogram(x2,'Normalization','probability','FaceColor','w');
legend('n=50,p=0.5 Analytical', 'n=40,p=0.7 Analytical','n=50,p=0.5 Simulated', 'n=40,p=0.7 Simulated');