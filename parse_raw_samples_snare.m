clear all;
close all;

% --------------------------------------------------------
% System parameters
% --------------------------------------------------------
N=4096; % block size of 46.s4 ms at 44.1 kHz sampling rate
snare_samples = [];
file_append = '.wav';
num = {'01','02','03','04','05','06','07','08','09','10', ...
       '11','12','13','14','15','16','17','18','19','20'};
       
% --------------------------------------------------------
% parse snare samples: DrumSamples.org-DS1000
% --------------------------------------------------------
num_samples = 200;
dir = 'raw_samples/DrumSamples.org-DS1000/SnareDrumsAll/';
file_prefix = 'snaredrum';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num2str(i), file_append, N)];
end

% --------------------------------------------------------
% parse snare samples: musicradar-drum-samples
% --------------------------------------------------------
% Acoustic
num_samples = 4;
dir = 'raw_samples/musicradar-drum-samples/Assorted Hits/Snares/Acoustic/';
file_prefix = 'Acoustic Snare-';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Ludwig A
num_samples = 5;
dir = 'raw_samples/musicradar-drum-samples/Assorted Hits/Snares/Ludwig A/';
file_prefix = 'CYCdh_LudSnrA-';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Ludwig B
num_samples = 5;
dir = 'raw_samples/musicradar-drum-samples/Assorted Hits/Snares/Ludwig B/';
file_prefix = 'CYCdh_LudSnrB-';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Ludwig C
num_samples = 5;
dir = 'raw_samples/musicradar-drum-samples/Assorted Hits/Snares/Ludwig C/';
file_prefix = 'CYCdh_LudSnrC-';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Sonor Force 3000
num_samples = 6;
dir = 'raw_samples/musicradar-drum-samples/Assorted Hits/Snares/Sonor Force 3000/';
file_prefix = 'CYCdh_SonSnr-';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Tama Wood
num_samples = 8;
dir = 'raw_samples/musicradar-drum-samples/Assorted Hits/Snares/Tama Wood/';
file_prefix = 'CYCdh_TamSnr-';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end
num_samples = 8;
file_prefix = 'CYCdh_TamSnrEd-';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end
num_samples = 7;
file_prefix = 'CYCdh_TamSnrTgt-';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Wooden Piccolo
num_samples = 4;
dir = 'raw_samples/musicradar-drum-samples/Assorted Hits/Snares/Wooden Piccolo/';
file_prefix = 'CYCdh_PiccoloA-';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end
file_prefix = 'CYCdh_PiccoloB-';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end
file_prefix = 'CYCdh_PiccoloC-';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end
file_prefix = 'CYCdh_PiccoloD-';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end
file_prefix = 'CYCdh_PiccoloE-';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Kit 1 - Acoustic close
num_samples = 5;
dir = 'raw_samples/musicradar-drum-samples/Drum Kits/Kit 1 - Acoustic close/';
file_prefix = 'CYCdh_K1close_Snr-';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Kit 2 - Acoustic room
num_samples = 5;
dir = 'raw_samples/musicradar-drum-samples/Drum Kits/Kit 2 - Acoustic room/';
file_prefix = 'CYCdh_K2room_Snr-';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Kit 3 - Acoustic
num_samples = 10;
dir = 'raw_samples/musicradar-drum-samples/Drum Kits/Kit 3 - Acoustic/';
file_prefix = 'CYCdh_K3Snr-';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Kit 13 - Acoustic
num_samples = 11;
dir = 'raw_samples/musicradar-drum-samples/Drum Kits/Kit 13 - Acoustic/';
file_prefix = 'CYCdh_K4-Snr';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Kit 14 - Acoustic
num_samples = 4;
dir = 'raw_samples/musicradar-drum-samples/Drum Kits/Kit 14 - Acoustic/';
file_prefix = 'CYCdh_K5-Snr';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Kit 18 - Acoustic
num_samples = 4;
dir = 'raw_samples/musicradar-drum-samples/Drum Kits/Kit 18 - Acoustic/';
file_prefix = 'CYCdh_K6-Snr';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% --------------------------------------------------------
% parse snare samples: Jazz Funk Kit
% --------------------------------------------------------
num_samples = 16;
dir = 'raw_samples/Jazz Funk Kit/samples/';          
file_prefix = 'snare - snares on - ';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num2str(i), file_append, N)];
end
num_samples = 9;
dir = 'raw_samples/Jazz Funk Kit/samples/';          
file_prefix = 'rimshot - snares on - ';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num2str(i), file_append, N)];
end

% --------------------------------------------------------
% parse snare samples: kondratko
% --------------------------------------------------------
num_samples = 52;
dir = 'raw_samples/kondratko/snare/';          
file_prefix = 's';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num2str(i), file_append, N)];
end

% --------------------------------------------------------
% parse snare samples: freewavesamples
% --------------------------------------------------------
num_samples = 20;
dir = 'raw_samples/freewavesamples/snare/';          
file_prefix = 'Snare-Drum-';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num2str(i), file_append, N)];
end

% --------------------------------------------------------
% parse kick samples: drumhits
% --------------------------------------------------------
num_samples = 15;
dir = 'raw_samples/drumhits/SNARE/';          
file_prefix = 'SNARE_';
for i=1:num_samples
  snare_samples = [snare_samples ; get_samples(dir, file_prefix, num2str(i), file_append, N)];
end

% --------------------------------------------------------
% save snare samples
% --------------------------------------------------------
save snare_samples.mat snare_samples;



