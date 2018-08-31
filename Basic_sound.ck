// basic FM synthesis using sinosc

// modulator to carrier
SinOsc m => SinOsc c => ADSR e => JCRev r => dac;
e.set(0.1::second, 0.01::second, .6, 0.2::second);
r.mix(0.2);


// carrier frequency
Std.mtof(59) => c.freq;
// modulator frequency
600 => m.freq;
// index of modulation
30 => m.gain;

// phase modulation is FM synthesis (sync is 2)
2 => c.sync;

[66, 59] @=> int notes[];

0 => int cur;
// time-loop
while( true ) {
    
    Std.mtof(notes[cur%2]) => c.freq;
    
    e.keyOn();
    2.9::second => now;
    e.keyOff();
    0.1::second => now;
    
    <<<"3 sec">>>;
    cur++;
}
