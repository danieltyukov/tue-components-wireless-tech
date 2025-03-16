<Qucs Schematic 24.4.1>
<Properties>
  <View=22,-92,1108,668,1,0,0>
  <Grid=10,10,1>
  <DataSet=ex-1a.dat>
  <DataDisplay=ex-1a.dpl>
  <OpenDisplay=0>
  <Script=ex-1a.m>
  <RunScript=0>
  <showFrame=0>
  <FrameText0=Title>
  <FrameText1=Drawn By:>
  <FrameText2=Date:>
  <FrameText3=Revision:>
</Properties>
<Symbol>
</Symbol>
<Components>
  <GND * 1 340 210 0 0 0 0>
  <.SP SP1 1 100 320 0 64 0 0 "lin" 1 "0.5 GHz" 1 "10 GHz" 1 "1051" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn1 1 320 360 -31 17 0 0 "S11dB=dB(S[1,1])" 1 "yes" 0>
  <Pac P1 1 70 180 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <GND * 1 70 210 0 0 0 0>
  <R R1 1 340 180 15 -26 0 1 "100 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <SUBST Subst1 1 580 140 -30 24 0 0 "4.2" 1 "1.6 mm" 1 "35 um" 1 "0.001" 1 "0.022e-6" 1 "0.15e-6" 1>
  <CLIN CL1 1 220 150 -26 28 0 0 "Subst1" 1 "0.16974 mm" 1 "0.1 mm" 1 "2.46259 mm" 1 "Metal" 1 "yes" 0>
</Components>
<Wires>
  <70 150 190 150 "" 0 0 0 "">
  <250 150 340 150 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
