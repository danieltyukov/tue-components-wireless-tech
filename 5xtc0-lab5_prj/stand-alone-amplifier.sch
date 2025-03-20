<Qucs Schematic 25.1.1>
<Properties>
  <View=-278,-231,1208,947,0.93205,0,106>
  <Grid=10,10,1>
  <DataSet=9tt.dat>
  <DataDisplay=9tt.dpl>
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
  <SPfile X1 1 330 290 -26 -57 0 0 "/home/danieltyukov/QucsWorkspace/tue-components-wireless-tech/TAMP-72LN+_S2P/TAMP-72LN+___85mA___Plus25degC.S2P" 1 "rectangular" 0 "linear" 0 "open" 0 "2" 0>
  <GND * 1 330 340 0 0 0 0>
  <GND * 1 180 290 0 0 0 3>
  <Pac P1 1 210 290 -26 -72 0 2 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <Pac P2 1 460 290 -26 -72 0 2 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <GND * 1 490 290 0 0 0 1>
  <Eqn Eqn1 1 270 50 -31 17 0 0 "dBS12=dB(S[1,2])" 1 "yes" 0>
  <Eqn Eqn2 1 420 50 -31 17 0 0 "dBS21=dB(S[2,1])" 1 "yes" 0>
  <Eqn Eqn3 1 570 50 -31 17 0 0 "dBS22=dB(S[2,2])" 1 "yes" 0>
  <Eqn Eqn5 1 420 130 -31 17 0 0 "K=Rollet(S)" 1 "yes" 0>
  <Eqn Eqn4 1 270 130 -31 17 0 0 "dBS11=dB(S[1,1])" 1 "yes" 0>
</Components>
<Wires>
  <330 320 330 340 "" 0 0 0 "">
  <240 290 300 290 "" 0 0 0 "">
  <360 290 430 290 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
