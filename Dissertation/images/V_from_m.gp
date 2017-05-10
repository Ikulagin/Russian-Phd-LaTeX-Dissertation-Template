#!/bin/gnuplot

set term pdfcairo enhanced solid font "Times New Roman,12" fontscale 1 size 12.0cm,8.5cm # size =  21.0cmx29.7cm - 2cm (top) - 2cm (bottom) - 2.5cm (left) - 1cm (right)
set output 'V_from_m.pdf'

set format y "10^{%L}"

set xrange [1:40000]
set yrange [10e3:10e14]
set grid
set key off
set xtics (1,2500,5000,10000,20000,30000,40000) rotate by -45
set ytics (10e3,10e5,10e7,10e10,10e12,10e14)

#set logscale x
set logscale y
#set autoscale

set style line 1 lt 1 lw 2
set style line 2 lt 2 lw 2
set style line 3 lt 3 lw 2
set style line 4 lt 4 lw 2
set style line 5 lt 5 lw 2
set style line 6 lt 6 lw 2
set style line 7 lt 7 lw 2

set xlabel offset graph 0.55,0.28  "{/:Italic m}"
set ylabel norotate offset graph 0.18,0.55 "{/:Italic V}"
set margins 4.4, 4.2, 2.4, 0.8

plot "generic_V_from_m" using 4:6 with linespoints ls 1 title "  1" at end, \
     "scalar_rep_V_from_m" using 4:6 with linespoints ls 2 title "  2" at end, \
     "array_preload_V_from_m" using 4:6 with linespoints ls 3 title "  3" at end