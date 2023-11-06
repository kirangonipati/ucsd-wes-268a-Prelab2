
fs = 8000;

x = (randsrc(1, 128)+1)/2;
xinput = kron(x,ones(1,8));

fb = fs / 8;

P_avg = sum(xinput.^2)/length(xinput);
et = sum(xinput.^2)/fs;

snrdb = 3;
ebn0 = 10^(snrdb/10);

eb = sum(x.^2)/(length(xinput)*fb);

n0 = eb/ebn0;

pn = n0 * fs/2;

n = sqrt(pn) * randn(1, length(xinput));

y = xinput+n;

bpsk_demod = pskdemod(y, 2);


bit_errors = 0;

for i = 1:length(x)
    if x(i) ~= bpsk_demod(i)
        bit_errors = bit_errors + 1;
    end
end

te = sum(abs(err));

ber = te / size(y,2)

figure; plot(x);
figure; plot(xinput);
figure; plot(y);
figure; plot(bpsk_demod);

