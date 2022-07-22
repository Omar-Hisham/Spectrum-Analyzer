clc
clear
close all

audio = input('please choose your file name: (audio1.wav),(audio2.wav) ','s');

[signal,fs] = audioread(audio);
signal=signal';
t=(0:length(signal)-1)./fs;
figure(1)
subplot(2,1,1)
plot(t,signal);
title('Input signal in time domain')
xlabel('Time(s)')
ylabel('Sound (V)')
Signal_F = abs(fastDft(signal));
n=length(Signal_F);
fhz= (0:n-1)*fs/n;
subplot(2,1,2)
plot(fhz,Signal_F);
title('Input signal in freq domain')
xlabel('freq(hz)')
ylabel('mag.')
%/////////////////////////////////////////////////////////////
z = input('Which mode do you want? (1) calculation mode (averaging)  , (2) comparison mode  : ');
switch z
    case 1 
     fsize = input('enter your FFT size');
     disp('RBW = ')
     disp(fs/fsize)
     X = averaging(signal,fsize);
     n=length(X);
     fhz= (0:n-1)*fs/n;
     figure
   plot(fhz,X)
  title('RMS averaging')
  xlabel('freq(hz)')
ylabel('mag.')
    case 2
        q = input('choose your first window :(Hamming(1)),(Hanning(2)),(rect(3)), (tri(4)) : ');
        w_size = input('enter your window size');
        fsize = input('enter your FFT size');
        
        q2 = input('choose your second window :(Hamming(1)),(Hanning(2)),(rect(3)), (tri(4)) : ');
        w_size2 = input('enter your window size');
        fsize2 = input('enter your FFT size');
        switch (q) 
            case 1
             Hamming_window(signal,w_size,fsize,fs)
            case 2 
             Hanning_window(signal,w_size,fsize,fs)
            case 3
             rect_window(signal,w_size,fsize,fs)
            case 4
             tri_window(signal,w_size,fsize,fs) 
             
        end
         disp('first RBW = ')
     disp(fs/fsize)
         switch (q2)
            case 1
             Hamming_window(signal,w_size2,fsize2,fs)
            case 2 
             Hanning_window(signal,w_size2,fsize2,fs)
            case 3
             rect_window(signal,w_size2,fsize2,fs)
            case 4
             tri_window(signal,w_size2,fsize2,fs)  
         end
        disp('second RBW = ')
     disp(fs/fsize2)
end