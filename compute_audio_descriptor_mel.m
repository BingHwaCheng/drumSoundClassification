
% ==========================================================
%
% This function converts time domain audio samples to STFT
% coefficients. 
%
% Short time Fourier transform (STFT) with a size of 1024
% samples (23.2 ms @ sampling rate of 44.1k/s) and step size
% of 512 samples (11.6 ms) is used here. 
%
% The first 20 FFT coefficients are used to represent the 
% low frequency characteristic (0 to 861 Hz), since human 
% ears are more sensitive to low freq variations. For high 
% frequency parts, MEL coefficients are used since it aligns 
% with human hearing. 
%
% ==========================================================

close all; 
clear all;

% -----------------------------------------
% system params
% -----------------------------------------
N_fft = 1024;
N_step = 512;
num_steps = 6;
num_fft_used = 20; % this corresponds to freq range from 0 to 861 Hz
H_m = get_mel_filter_bank(1000, 22100, 11, 1024);

% -----------------------------------------
% load kick samples
% -----------------------------------------
load kick_samples.mat;
samples = kick_samples;
[num_samples temp] = size(samples);

% -----------------------------------------
% compute spectrogram
% -----------------------------------------
des_mel_kick = [];
for n=1:num_samples
  temp = [];
  temp_mel = [];
  for t=1:num_steps
    s = samples(n,[1:N_fft]+(t-1)*N_step);
    s_spec = abs(fft(s)).^2;
    temp = [temp s_spec(1:num_fft_used)];
    temp_mel = [temp_mel s_spec(1:N_fft/2)*H_m'];
  end
  des_mel_kick = [des_mel_kick ; temp temp_mel];
end

% -----------------------------------------
% load snare samples
% -----------------------------------------
load snare_samples.mat;
samples = snare_samples;
[num_samples temp] = size(samples);

% -----------------------------------------
% compute spectrogram
% -----------------------------------------
des_mel_snare = [];
for n=1:num_samples
  temp = [];
  temp_mel = [];
  for t=1:num_steps
    s = samples(n,[1:N_fft]+(t-1)*N_step);
    s_spec = abs(fft(s)).^2;
    temp = [temp s_spec(1:num_fft_used)];
    temp_mel = [temp_mel s_spec(1:N_fft/2)*H_m'];
  end
  des_mel_snare = [des_mel_snare ; temp temp_mel];
end

% -----------------------------------------
% load hihat samples
% -----------------------------------------
load hihat_samples.mat;
samples = hihat_samples;
[num_samples temp] = size(samples);

% -----------------------------------------
% compute spectrogram
% -----------------------------------------
des_mel_hihat = [];
for n=1:num_samples
  temp = [];
  temp_mel = [];
  for t=1:num_steps
    s = samples(n,[1:N_fft]+(t-1)*N_step);
    s_spec = abs(fft(s)).^2;
    temp = [temp s_spec(1:num_fft_used)];
    temp_mel = [temp_mel s_spec(1:N_fft/2)*H_m'];
  end
  des_mel_hihat = [des_mel_hihat ; temp temp_mel];
end

% -----------------------------------------
% save data
% -----------------------------------------
save des_mel_kick.mat des_mel_kick;
save des_mel_snare.mat des_mel_snare;
save des_mel_hihat.mat des_mel_hihat;
