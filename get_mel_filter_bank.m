% --------------------------------------------------------
% Get Mel freq filter bank
% --------------------------------------------------------
function H_m = get_mel_filter_bank(f_start_hz, f_end_hz, num_coeff, N_fft)

Fs = 44100;
%N_fft = 2048;
%f_start_hz = 100;
%f_end_hz = 8000;
%num_coeff = 26;
f_start_mel = 1125*log(1+f_start_hz/700);
f_end_mel = 1125*log(1+f_end_hz/700);

step_mel = (f_end_mel - f_start_mel)/(num_coeff-1);
f_bin_mel = [];
f_bin_hz = [];
f_bin_fft = 1;
for n=1:num_coeff
  temp_mel = f_start_mel+(n-1)*step_mel;
  f_bin_mel = [f_bin_mel temp_mel];
  f_bin_hz = [f_bin_hz 700*(exp(temp_mel/1125)-1)];
  f_bin_fft = [f_bin_fft round(f_bin_hz(end)/Fs*N_fft)];
end

%figure(1);
H_m = [];
for n=1:num_coeff-1
  temp_arr = zeros(1,N_fft/2);
  for k=1:N_fft/2
    if (k >= f_bin_fft(n) && k <= f_bin_fft(n+1))
      temp_arr(k) = (k-f_bin_fft(n))/(f_bin_fft(n+1)-f_bin_fft(n));
    elseif (k >= f_bin_fft(n+1) && k <= f_bin_fft(n+2))
      temp_arr(k) = (f_bin_fft(n+2)-k)/(f_bin_fft(n+2)-f_bin_fft(n+1));
    end
  end
  H_m = [H_m ; temp_arr];
  
  %plot(temp_arr); hold on;
end
