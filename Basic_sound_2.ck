// actual FM using sinosc (sync is 0)
// (note: this is not quite the classic "FM synthesis"; also see fm2.ck)

// modulator to carrier
SinOsc m => SinOsc c => dac;

// carrier frequency
220 => c.freq;
// modulator frequency
200 => m.freq;
// index of modulation
100 => m.gain;

// time-loop
while( true ) 1::second => now;
