function coeff = LS_FIR(n,f,hd)
k=length(f);
if(rem(n,2) == 0)
    n=n+1;
end
l=(n-1)/2;
M=zeros(k,l+1);
M(:,1)=1;
for i = 1 : k
    s=1;
    for j = 2 : l+1
        M(i,j)=2*cos(s*f(i));
        s=s+1;
    end
end

h_ls= M\hd';
flipped=fliplr(h_ls(2:length(h_ls))');
coeff=[flipped h_ls'];

end


