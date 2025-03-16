<Qucs Schematic 25.1.1>
<Properties>
  <View=35,-186,910,916,1.12515,0,0>
  <Grid=10,10,1>
  <DataSet=quarter-wave_stub.dat>
  <DataDisplay=quarter-wave_stub.dpl>
  <OpenDisplay=0>
  <Script=quarter-wave_stub.m>
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
  <Pac P1 1 150 400 18 -26 0 1 "1" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <GND * 1 150 430 0 0 0 0>
  <MLIN MS2 1 500 350 -26 15 0 0 "Subst1" 1 "3.2 mm" 1 "18 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS1 1 300 350 -26 15 0 0 "Subst1" 1 "3.2 mm" 1 "18 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <MLIN MS3 1 400 170 15 -26 0 1 "Subst1" 1 "3.2 mm" 1 "18 mm" 1 "Hammerstad" 0 "Kirschning" 0 "26.85" 0>
  <Pac P2 1 630 400 18 -26 0 1 "2" 1 "50 Ohm" 1 "0 dBm" 0 "1 MHz" 0 "26.85" 0 "true" 0>
  <GND * 1 630 430 0 0 0 0>
  <SUBST Subst1 1 180 120 -30 24 0 0 "4.3" 1 "1.55 mm" 1 "35 um" 1 "2e-4" 1 "0.022e-6" 1 "0.15e-6" 1>
  <.SP SP1 1 550 80 0 64 0 0 "lin" 1 "0.4 GHz" 1 "1.4 GHz" 1 "101" 1 "no" 0 "1" 0 "2" 0 "no" 0 "no" 0>
  <Eqn Eqn1 1 300 480 -31 17 0 0 "S11_dB=dB(S[1,1])" 1 "yes" 0>
  <Eqn Eqn2 1 450 480 -31 17 0 0 "S21_dB=dB(S[2,1])" 1 "yes" 0>
</Components>
<Wires>
  <150 350 150 370 "" 0 0 0 "">
  <150 350 270 350 "" 0 0 0 "">
  <330 350 400 350 "" 0 0 0 "">
  <400 200 400 350 "" 0 0 0 "">
  <400 350 470 350 "" 0 0 0 "">
  <530 350 630 350 "" 0 0 0 "">
  <630 350 630 370 "" 0 0 0 "">
  <400 110 400 140 "" 0 0 0 "">
</Wires>
<Diagrams>
</Diagrams>
<Paintings>
</Paintings>
