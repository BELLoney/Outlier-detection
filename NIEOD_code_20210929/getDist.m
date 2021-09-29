function D=getDist(s1,s2,l,delta)
if delta(l)==0
    if s1==s2
       D=0;
    else
        D=10;
    end
end
if delta(l)~=0
    a=s1;
    b=s2;
    D=abs(a-b);
end
end