function rect_window(signal,size,fftsize,fs)   

w= rectwin(size);

figure
subplot(5,1,1)
plot(w)
hold on
w=w';
x=signal(1:size).*w;
plot(x, 'r')
hold on
plot(signal,'g')
title('comparring signal with window')
x=[x zeros(1, 10000)];



X1 =abs(fastDft1(x,fftsize));
n=length(X1);
fhz= (0:length(X1)-1)*fs/n;

subplot(5,1,2)
plot(x)
title('windowing signal with zero padding (rect window)')
xlabel('sample')
ylabel('Amplitude')

subplot(5,1,3)
plot(fhz,X1)
title('mag. of windowing signal in frequency domain')
xlabel('freq (Hz)')
ylabel('mag.')

subplot(5,1,4)
plot(fhz,20*log10(X1))
title('power spectrum in db and Hertz')
xlabel('freq (Hz)')
ylabel('Power (dB)')

subplot(5,1,5)
semilogx(fhz,20*log10(X1))%%mg2db()= 20log10()
title('power spectrum in dB and frequency on a log scale ')
xlabel('freq (Hz)')
ylabel('Power (dB)')
end

