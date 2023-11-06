
Fs = 4;
beta = 0.99;
samples = 65;
t = (-32:32)./Fs;
impulse = sinc(t);
cos_impulse = (sin(pi.*t).*cos(beta.*pi.*t))./((pi.*t).*(1-2.*beta.*t).^2);

cos_impulse_idx = find(isnan(cos_impulse));
cos_impulse(cos_impulse_idx) = 1;

x = randsrc(1, 128);
bpsk = kron(x, ones(1,8));

y_n = conv(bpsk, cos_impulse);
figure;
plot(t, cos_impulse);
figure;

plot(bpsk);

figure;
plot(y_n);

samples = size(y_n, 2);

fftX = abs(fftshfit(fft(y_n, samples)));
figure;