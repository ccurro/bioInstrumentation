v 20130925 2
C 44300 46300 1 0 0 opamp-1.sym
{
T 45000 47100 5 10 0 0 0 0 1
device=OPAMP
T 45000 46900 5 10 1 1 0 0 1
refdes=LF411
T 45000 47700 5 10 0 0 0 0 1
symversion=0.1
}
C 44600 47100 1 0 0 5V-plus-1.sym
C 45000 46300 1 180 0 5V-minus-1.sym
C 44200 44700 1 90 0 resistor-1.sym
{
T 43800 45000 5 10 0 0 90 0 1
device=RESISTOR
T 43900 45300 5 10 1 1 180 0 1
refdes=RA
T 43900 45100 5 10 1 1 180 0 1
value=1K
}
C 45300 45700 1 180 0 resistor-1.sym
{
T 45000 45300 5 10 0 0 180 0 1
device=RESISTOR
T 44800 45400 5 10 1 1 180 0 1
refdes=RB
}
N 41900 46900 42300 46900 4
N 43200 46900 43200 45600 4
N 43200 46900 44300 46900 4
N 44300 46500 44100 46500 4
N 44100 46500 44100 45600 4
N 44100 45600 44400 45600 4
N 45300 46700 46300 46700 4
N 45300 45600 45800 45600 4
N 45800 45600 45800 46700 4
N 45800 46700 45800 47900 4
N 45800 47900 44400 47900 4
N 43500 47900 42100 47900 4
N 42100 47900 42100 46900 4
C 44000 44400 1 0 0 gnd-1.sym
C 43100 44400 1 0 0 gnd-1.sym
C 46300 46600 1 0 0 output-1.sym
{
T 46400 46900 5 10 1 1 0 0 1
device=OUTPUT
}
C 40200 46800 1 0 0 input-1.sym
{
T 40200 47100 5 10 1 1 0 0 1
device=INPUT
}
T 42700 47200 5 10 1 1 0 0 1
value=487 nF
T 43000 45100 5 10 1 1 180 0 1
value=7K
T 45100 45400 5 10 1 1 180 0 1
value=1K
C 43500 47800 1 0 0 resistor-1.sym
{
T 43800 48200 5 10 0 0 0 0 1
device=RESISTOR
T 43700 48100 5 10 1 1 0 0 1
refdes=R1
T 44000 48100 5 10 1 1 0 0 1
value=1.5K
}
C 43200 47100 1 180 0 capacitor-1.sym
{
T 43000 46400 5 10 0 0 180 0 1
device=CAPACITOR
T 42400 47200 5 10 1 1 0 0 1
refdes=C3
T 43000 46200 5 10 0 0 180 0 1
symversion=0.1
}
C 43300 44700 1 90 0 resistor-1.sym
{
T 42900 45000 5 10 0 0 90 0 1
device=RESISTOR
T 43000 45300 5 10 1 1 180 0 1
refdes=R4
}
C 41900 47100 1 180 0 capacitor-1.sym
{
T 41700 46400 5 10 0 0 180 0 1
device=CAPACITOR
T 41100 46500 5 10 1 1 0 0 1
refdes=C1
T 41700 46200 5 10 0 0 180 0 1
symversion=0.1
T 41400 46500 5 10 1 1 0 0 1
value=487 nF
}