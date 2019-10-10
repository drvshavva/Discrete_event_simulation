%soru_1_poisson hazýr fonksiyon
for i=1:1000
    R(i) = poissrnd(6);
end
hist(R,1000);