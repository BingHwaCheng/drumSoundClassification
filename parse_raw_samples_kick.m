clear all;
close all;

% --------------------------------------------------------
% System parameters
% --------------------------------------------------------
N=4096; % block size of 46.s4 ms at 44.1 kHz sampling rate
kick_samples = [];
file_append = '.wav';
num = {'01','02','03','04','05','06','07','08','09','10', ...
       '11','12','13','14','15','16','17','18','19','20'};
       
% --------------------------------------------------------
% parse kick samples: DrumSamples.org-DS1000
% --------------------------------------------------------
num_samples = 200;
dir = 'raw_samples/DrumSamples.org-DS1000/KickDrumsAll/';
file_prefix = 'kickdrum';
for i=1:num_samples
  kick_samples = [kick_samples ; get_samples(dir, file_prefix, num2str(i), file_append, N)];
end

% --------------------------------------------------------
% parse kick samples: musicradar-drum-samples
% --------------------------------------------------------
% Acoustic
num_samples = 20;
dir = 'raw_samples/musicradar-drum-samples/Assorted Hits/Kicks/Acoustic/';
file_prefix = 'CYCdh_AcouKick-';
for i=1:num_samples
  kick_samples = [kick_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Kes Kick
num_samples = 8;
dir = 'raw_samples/musicradar-drum-samples/Assorted Hits/Kicks/Kes Kick/';
file_prefix = 'CYCdh_KesKick-';
for i=1:num_samples
  kick_samples = [kick_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Loose Kick
num_samples = 8;
dir = 'raw_samples/musicradar-drum-samples/Assorted Hits/Kicks/Loose Kick/';
file_prefix = 'CYCdh_LooseKick-';
for i=1:num_samples
  kick_samples = [kick_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Kit 1 - Acoustic close
num_samples = 8;
dir = 'raw_samples/musicradar-drum-samples/Drum Kits/Kit 1 - Acoustic close/';
file_prefix = 'CYCdh_K1close_Kick-';
for i=1:num_samples
  kick_samples = [kick_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Kit 2 - Acoustic room
num_samples = 8;
dir = 'raw_samples/musicradar-drum-samples/Drum Kits/Kit 2 - Acoustic room/';
file_prefix = 'CYCdh_K2room_Kick-';
for i=1:num_samples
  kick_samples = [kick_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Kit 3 - Acoustic
num_samples = 3;
dir = 'raw_samples/musicradar-drum-samples/Drum Kits/Kit 3 - Acoustic/';
file_prefix = 'CYCdh_K3Kick-';
for i=1:num_samples
  kick_samples = [kick_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Kit 13 - Acoustic
num_samples = 5;
dir = 'raw_samples/musicradar-drum-samples/Drum Kits/Kit 13 - Acoustic/';
file_prefix = 'CYCdh_K4-Kick';
for i=1:num_samples
  kick_samples = [kick_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% Kit 14 - Acoustic
num_samples = 3;
dir = 'raw_samples/musicradar-drum-samples/Drum Kits/Kit 14 - Acoustic/';
file_prefix = 'CYCdh_K5-Kick';
for i=1:num_samples
  kick_samples = [kick_samples ; get_samples(dir, file_prefix, num{i}, file_append, N)];
end

% --------------------------------------------------------
% parse kick samples: Jazz Funk Kit
% --------------------------------------------------------
num_samples = 5;
dir = 'raw_samples/Jazz Funk Kit/samples/';          
file_prefix = 'kick - snares off - ';
for i=1:num_samples
  kick_samples = [kick_samples ; get_samples(dir, file_prefix, num2str(i) , file_append, N)];
end
file_prefix = 'kick - snares on - ';
for i=1:num_samples
  kick_samples = [kick_samples ; get_samples(dir, file_prefix, num2str(i) , file_append, N)];
end

% --------------------------------------------------------
% parse kick samples: kondratko
% --------------------------------------------------------
num_samples = 96;
dir = 'raw_samples/kondratko/kick/';          
file_prefix = 'k';
for i=1:num_samples
  kick_samples = [kick_samples ; get_samples(dir, file_prefix, num2str(i) , file_append, N)];
end

% --------------------------------------------------------
% parse kick samples: freewavesamples
% --------------------------------------------------------
num_samples = 21;
dir = 'raw_samples/freewavesamples/kick/';          
file_prefix = 'Kick-Drum-';
for i=1:num_samples
  kick_samples = [kick_samples ; get_samples(dir, file_prefix, num2str(i) , file_append, N)];
end

% --------------------------------------------------------
% parse kick samples: drumhits
% --------------------------------------------------------
num_samples = 15;
dir = 'raw_samples/drumhits/KICK/';          
file_prefix = 'KICK_';
for i=1:num_samples
  kick_samples = [kick_samples ; get_samples(dir, file_prefix, num2str(i) , file_append, N)];
end

% --------------------------------------------------------
% save kick samples
% --------------------------------------------------------
save kick_samples.mat kick_samples;
