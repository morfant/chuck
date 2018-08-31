// patch
Blit s => ADSR e => JCRev r => dac;
.5 => s.gain;
.5 => r.mix;

// set adsr
e.set( 10::ms, 3::ms, .5, 0.1::ms );

// an array
[ 0, 1, 20 ] @=> int hi[];

// infinite time loop
while( true )
{
    // frequency
    Std.mtof( 13 + Math.random2(2,3) * 12 +
    hi[Math.random2(0,hi.cap()-1)] ) => s.freq;
    
    // harmonics
    
    Math.random2( 1, 20 ) => int r;
    
    r => s.harmonics;
    
    // key on
    e.keyOn();
    // advance time
    220::ms => now;
    // key off
    e.keyOff();
    // advance time
    r*2::ms => now;
}
