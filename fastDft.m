function xf = fastDft(n)

size= length(n);
% check if the size of the signal is power of 2 or not
if (rem(log(size)/log(2),1)~= 0)
    z=zeros(1,pow2(2,log2(size))-size);
n=[n z];
size= length(n);
end

if size == 1
    xf=n;
return
end

A=zeros(1,size/2);
B=zeros(1,size/2);
 
for i=1:size/2
    A(i)= n(2*i-1);
    B(i)= n(2*i);
end
 
n_even=fastDft(A);
n_odd=fastDft(B);
w=1;
wn=exp(-2i * pi / size);
for i=1:size/2
   xf(i)= n_even(i)+w*n_odd(i) ;
   xf(i+size/2)= n_even(i)-w*n_odd(i) ;
   w=w*wn;
end
end

