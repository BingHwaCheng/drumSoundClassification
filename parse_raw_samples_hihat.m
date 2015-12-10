clear all;
close all;

% --------------------------------------------------------
% System parameters
% --------------------------------------------------------
N=4096; % block size of 46.s4 ms at 44.1 kHz sampling rate
hihat_samples = [];
file_append = '.wav';
num = {'01','02','03','04','05','06','07','08','09','10', ...
       '11','12','13','14','15','16','17','18','19','20'};
       
% --------------------------------------------------------
% parse kick samples: DrumSamples.org-DS1000
% --------------------------------------------------------
num_samples = 100;
dir = 'raw_samples/DrumSamples.org-DS1000/HiHatsAll/';
file_prefix = 'hihat';
for i=1:num_samples
  hihat_samples = [hihat_samples ; get_samples(dir, file_prefix, num2str(i), file_append, N)];
end

% --------------------------------------------------------
% parse kick samples: musicradar-drum-samples
% --------------------------------------------------------
% Acoustic
num_samples = 6;
dir = 'raw_samples/musicradar-drum-samples/Assorted Hits/Hi Hats/Acoustic/';
file_prefix = 'Acoustic Hat-';
for i=1:num_samples
  hihat_samples = [hihat_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Sabian B8
num_samples = 14;
dir = 'raw_samples/musicradar-drum-samples/Assorted Hits/Hi Hats/Sabian B8/';
file_prefix = 'CYCdh_Sab_ClHat-';
for i=1:num_samples
  hihat_samples = [hihat_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Zildjian K Hats
num_samples = 11;
dir = 'raw_samples/musicradar-drum-samples/Assorted Hits/Hi Hats/Zildjian K Hats/';
file_prefix = 'KHats Clsd-';
for i=1:num_samples
  hihat_samples = [hihat_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Kit 1 - Acoustic close
num_samples = 9;
dir = 'raw_samples/musicradar-drum-samples/Drum Kits/Kit 1 - Acoustic close/';
file_prefix = 'CYCdh_K1close_ClHat-';
for i=1:num_samples
  hihat_samples = [hihat_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Kit 2 - Acoustic room
num_samples = 9;
dir = 'raw_samples/musicradar-drum-samples/Drum Kits/Kit 2 - Acoustic room/';
file_prefix = 'CYCdh_K2room_ClHat-';
for i=1:num_samples
  hihat_samples = [hihat_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Kit 3 - Acoustic
num_samples = 4;
dir = 'raw_samples/musicradar-drum-samples/Drum Kits/Kit 3 - Acoustic/';
file_prefix = 'CyCdh_K3ClHat-';
for i=1:num_samples
  hihat_samples = [hihat_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Kit 13 - Acoustic
num_samples = 3;
dir = 'raw_samples/musicradar-drum-samples/Drum Kits/Kit 13 - Acoustic/';
file_prefix = 'CYCdh_K4-ClHat';
for i=1:num_samples
  hihat_samples = [hihat_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Kit 14 - Acoustic
num_samples = 3;
dir = 'raw_samples/musicradar-drum-samples/Drum Kits/Kit 14 - Acoustic/';
file_prefix = 'CYCdh_K5-ClHat';
for i=1:num_samples
  hihat_samples = [hihat_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Kit 18 - Acoustic
num_samples = 1;
dir = 'raw_samples/musicradar-drum-samples/Drum Kits/Kit 18 - Acoustic/';
file_prefix = 'CYCdh_K6-ClHat';
for i=1:num_samples
  hihat_samples = [hihat_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% --------------------------------------------------------
% parse kick samples: Jazz Funk Kit
% --------------------------------------------------------
num_samples = 20;
dir = 'raw_samples/Jazz Funk Kit/samples/';          
file_prefix = 'hihat - close - ';
for i=1:num_samples
  hihat_samples = [hihat_samples ; get_samples(dir, file_prefix, num2str(i) , file_append, N)];
end

% --------------------------------------------------------
% parse kick samples: kondratko
% --------------------------------------------------------
num_samples = 17;
dir = 'raw_samples/kondratko/hihat/';          
file_prefix = 'hh';
for i=1:num_samples
  hihat_samples = [hihat_samples ; get_samples(dir, file_prefix, num2str(i) , file_append, N)];
end

% --------------------------------------------------------
% parse kick samples: freewavesamples
% --------------------------------------------------------
num_samples = 7;
dir = 'raw_samples/freewavesamples/hihat/';          
file_prefix = 'Closed-Hi-Hat-';
for i=1:num_samples
  hihat_samples = [hihat_samples ; get_samples(dir, file_prefix, num2str(i) , file_append, N)];
end

% --------------------------------------------------------
% parse kick samples: drumhits
% --------------------------------------------------------
num_samples = 15;
dir = 'raw_samples/drumhits/HAT/';          
file_prefix = 'HAT_';
for i=1:num_samples
  hihat_samples = [hihat_samples ; get_samples(dir, file_prefix, num2str(i) , file_append, N)];
end

% --------------------------------------------------------
% save kick samples
% --------------------------------------------------------
save hihat_samples.mat hihat_samples;
