function kersim=wfrda_kersim(a,x,e)
if (e==0)
    if (a==x)
       kersim=1;
    else
       kersim=0;
    end
else
     kersim=max(min((x-a+e)/e,(a-x+e)/e),0);    
end