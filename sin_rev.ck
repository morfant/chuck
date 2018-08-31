// hello everyone.
// a chuck is born...
// its first words:

SinOsc s => JCRev r => dac;
.2 => s.gain;
.1 => r.mix;

// an array
[ 0, 1, 2, 4, 7, 9, 11, 12, 13 ] @=> int hi[];

while( true )
{
    Std.mtof( 45 + Math.random2(0,3) * 5 +
    hi[Math.random2(0, hi.cap()-1)] ) => s.freq;
    100::ms => now;
}
