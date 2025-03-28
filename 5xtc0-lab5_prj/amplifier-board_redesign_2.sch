<Qucs Schematic 25.1.1>
<Properties>
  <View=-938,-858,724,1366,0.557495,1,0>
  <Grid=10,10,1>
  <DataSet=amplifier-board_redesign_2.dat>
  <DataDisplay=amplifier-board_redesign_2.dpl>
  <OpenDisplay=0>
  <Script=9tt.m>
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
  <.SP SP1 1 40 50 0 64 0 0 "lin" 1 "0.1 GHz" 1 "1.5 GHz" 1 "141" 1 "yes" 1 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn1 1 270 50 -31 17 0 0 "dBS12=dB(S[1,2])" 1 "yes" 0>
  <Eqn Eqn2 1 420 50 -31 17 0 0 "dBS21=dB(S[2,1])" 1 "yes" 0>
  <Eqn Eqn3 1 570 50 -31 17 0 0 "dBS22=dB(S[2,2])" 1 "yes" 0>
  <Eqn Eqn5 1 420 130 -31 17 0 0 "K=Rollet(S)" 1 "yes" 0>
  <Eqn Eqn4 1 270 130 -31 17 0 0 "dBS11=dB(S[1,1])" 1 "yes" 0>
  <SUBST MSub1 1 -100 90 -30 24 0 0 "4.6" 1 "1.55 mm" 1 "35 um" 1 "0.02" 1 "0.022e-6" 1 "0" 1>
  <SPfile X1 1 130 290 -349 124 0 0 "/home/danieltyukov/QucsWorkspace/tue-components-wireless-tech/TAMP-72LN+_S2P/TAMP-72LN+___85mA___Plus25degC.S2P" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <CLIN CL1 1 40 290 -42 34 0 0 "MSub1" 1 "0.5 mm" 1 "0.5 mm" 1 "4.5 mm" 1 "Air" 0 "yes" 0>
  <CLIN CL2 1 210 290 -41 32 1 2 "MSub1" 1 "0.5 mm" 1 "0.5 mm" 1 "4.5 mm" 1 "Air" 0 "yes" 0>
  <GND * 1 130 320 0 0 0 0>
  <GND * 1 -210 290 0 0 0 3>
  <Pac P1 1 -180 290 -26 -72 0 2 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <GND * 1 390 290 0 0 1 3>
  <Pac P2 1 360 290 -26 -72 1 0 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <C C4 1 -30 290 -26 17 0 0 "6.8 pF" 1 "" 0 "neutral" 0>
  <GND * 1 -130 350 0 0 0 0>
  <GND * 1 -100 320 0 0 0 1>
  <SPICE X3 1 -130 320 -83 138 0 1 "/home/danieltyukov/QucsWorkspace/LQW18AN43NG00.mod" 1 "_netPORT1,_netPORT2" 0 "yes" 0 "none" 0 "" 0>
</Components>
<Wires>
  <70 290 100 290 "" 0 0 0 "">
  <160 290 180 290 "" 0 0 0 "">
  <240 290 330 290 "" 0 0 0 "">
  <-150 290 -130 290 "" 0 0 0 "">
  <0 290 10 290 "" 0 0 0 "">
  <-130 290 -60 290 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
