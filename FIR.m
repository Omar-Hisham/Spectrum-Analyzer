function F_coeff = FIR(L,fc,ftyp)
if (rem(L,2)==1)
    L=L+1;
end
n=1:L;
switch ftyp
    case 'l'
        F_coeff = sin(2*pi*fc*(n-L/2)) ./ (pi*(n-L/2));            
        F_coeff(L/2) = 2*fc;
    case 'h'
         F_coeff = -(sin(2*pi*fc*(n-L/2)) ./ (pi*(n-L/2)));            
        F_coeff(L/2) = 1-2*fc;
    case 'b'
        F_coeff = (sin(2*pi*fc(2)*(n-L/2)) ./ (pi*(n-L/2)))-(sin(2*pi*fc(1)*(n-L/2)) ./ (pi*(n-L/2)));            
        F_coeff(L/2) = 2*(fc(2)-fc(1));
    case 's'
         F_coeff = (sin(2*pi*fc(1)*(n-L/2)) ./ (pi*(n-L/2)))-(sin(2*pi*fc(2)*(n-L/2)) ./ (pi*(n-L/2)));            
        F_coeff(L/2) = 1-2*(fc(2)-fc(1));
end
end