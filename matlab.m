%% INETRACTIVE FIR/IIR FILTER DESIGN
fs = 1000;                     % Sampling frequency
t = 0:1/fs:1;                  
signal = sin(2*pi*50*t);       % Original signal
noisy_signal = signal + 0.5*randn(size(t));

disp('Choose Filter Type:')
disp('1. FIR Filter')
disp('2. IIR Filter')
choice = input('Enter 1 or 2: ');

order = input('Enter filter order: ');
cutoff_freq = input('Enter cutoff frequency (Hz): ');
Wn = cutoff_freq/(fs/2);       % Normalized cutoff

if choice == 1
    b = ones(1,order+1)/(order+1);
    a = 1;
    filter_name = 'FIR Filter';
elseif choice == 2
    [b,a] = butter(order, Wn);
    filter_name = 'IIR Butterworth Filter';
else
    error('Invalid choice');
end

filtered_output = filter(b,a,noisy_signal);

%% Plot Results
figure;

subplot(3,1,1)
plot(t,noisy_signal)
title('Noisy Signal')
xlabel('Time')
ylabel('Amplitude')

subplot(3,1,2)
plot(t,filtered_output)
title(['Filtered Output - ' filter_name])
xlabel('Time')
ylabel('Amplitude')

subplot(3,1,3)
freqz(b,a)
title('Frequency Response')
