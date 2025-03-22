<Qucs Schematic 25.1.1>
<Properties>
  <View=-295,-59,786,549,2.0407,0,0>
  <Grid=10,10,1>
  <DataSet=amplifier-board.dat>
  <DataDisplay=amplifier-board.dpl>
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
  <GND * 1 -230 290 0 0 0 3>
  <Pac P1 1 -200 290 -26 -72 0 2 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <R R1 1 -60 340 12 -16 0 1 "51 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <GND * 1 -60 370 0 0 0 0>
  <R R2 1 80 290 -26 15 0 0 "82 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <SUBST MSub1 1 -100 90 -30 24 0 0 "4.6" 1 "1.55 mm" 1 "35 um" 1 "0.02" 1 "0.022e-6" 1 "0" 1>
  <SPfile X1 1 250 290 -471 127 0 0 "/home/danieltyukov/QucsWorkspace/tue-components-wireless-tech/TAMP-72LN+_S2P/TAMP-72LN+___85mA___Plus25degC.S2P" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <GND * 1 250 340 0 0 0 0>
  <GND * 1 720 290 0 0 1 3>
  <GND * 1 550 370 0 0 1 2>
  <Pac P2 1 690 290 -26 -72 1 0 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <R R3 1 410 290 -26 15 1 2 "82 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <R R4 1 550 340 -84 -17 1 1 "51 Ohm" 1 "26.85" 0 "0.0" 0 "0.0" 0 "26.85" 0 "european" 0>
  <CLIN CL1 1 -140 290 -26 28 0 0 "MSub1" 1 "0.5 mm" 1 "0.5 mm" 1 "6 mm" 1 "Air" 0 "yes" 0>
  <CLIN CL2 1 0 290 -28 -60 0 0 "MSub1" 0 "0.5 mm" 0 "0.5 mm" 0 "2 mm" 1 "Air" 0 "yes" 0>
  <CLIN CL3 1 160 290 -30 -61 0 0 "MSub1" 0 "0.5 mm" 0 "0.5 mm" 0 "4.5 mm" 1 "Air" 0 "yes" 0>
  <CLIN CL4 1 330 290 -27 -63 1 2 "MSub1" 0 "0.5 mm" 0 "0.5 mm" 0 "4.5 mm" 1 "Air" 0 "yes" 0>
  <CLIN CL5 1 490 290 -25 -62 1 2 "MSub1" 0 "0.5 mm" 0 "0.5 mm" 0 "2 mm" 1 "Air" 0 "yes" 0>
  <CLIN CL6 1 630 290 -41 -67 1 2 "MSub1" 0 "0.5 mm" 0 "0.5 mm" 0 "2.9 mm" 1 "Air" 0 "yes" 0>
</Components>
<Wires>
  <-110 290 -60 290 "" 0 0 0 "">
  <-60 290 -60 310 "" 0 0 0 "">
  <-60 290 -30 290 "" 0 0 0 "">
  <30 290 50 290 "" 0 0 0 "">
  <110 290 130 290 "" 0 0 0 "">
  <250 320 250 340 "" 0 0 0 "">
  <190 290 220 290 "" 0 0 0 "">
  <550 290 600 290 "" 0 0 0 "">
  <550 290 550 310 "" 0 0 0 "">
  <520 290 550 290 "" 0 0 0 "">
  <440 290 460 290 "" 0 0 0 "">
  <360 290 380 290 "" 0 0 0 "">
  <280 290 300 290 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
