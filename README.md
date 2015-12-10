# drumSoundClassification
This project tries to classify drum sounds (snare, kick, and hihat) using 2 layer neural network. Each of the sound recordings is converted into a 180-state time-frequency parameters. 
All the raw samples are store in the folder raw_samples, each contains few second of wav recording. 
Then the samples are parsed and labeled by the three scripts below parse_raw_samples_hihat.m parse_raw_samples_kick.m parse_raw_samples_snare.m
Each of the raw audio samples is then converted to the 180 state time-frequency parameter via the script below compute_audio_descriptor_mel.m 
Finally, 2 layer neural network is used to train the drum sound classification sound_classification_mel.m
