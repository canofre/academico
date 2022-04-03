set encoding iso_8859_1
set terminal postscript eps enhanced color butt "Times-Roman" 36
set output 'g1a.eps'

set style data histogram
set xlabel 'Window size' font "Times-Roman,42" 
set ylabel "Packets reported to \n the INT Collector (in pps)" font ",42"
set size 1.5, 1.2
set grid ytics
set style data histogram
set style histogram cluster gap 1
set style fill pattern border -1
set key right top
set yrange [0:5000000]
set xtics font ", 32"
#set logscale y 10

set ytics ('1Mpps' 1, '2Mpps' 2000000, '3Mpps' 3000000, '4Mpps' 4000000 , '5Mpps' 5000000)

set style line 10 lw 3 ps 2.5 lc rgb "#000000"
set style line 9 lw 3 ps 2.5 lc rgb "#000000"
set style line 8 lw 3 ps 2.5 lc rgb "#000000"
set style line 7 lw 3 ps 2.5 lc rgb "#000000"
set style line 6 lw 3 ps 2.5 lc rgb "#000000" 
set style line 5 lw 3 ps 2.5 lc rgb "#000000" 
set style line 4 lw 3 ps 2.5 lc rgb "#000000" 
set style line 3 lw 3 ps 2.5 lc rgb "#000000" 
set style line 2 lw 3 ps 2.5 lc rgb "#000000" 
set style line 16 lw 3 ps 2.5 lc rgb "#000000" 

plot 'data.txt' using 2:xtic(1) title 'Baseline' fs pattern 3 lt -1, \
        '' using 3:xtic(1) title '20' fs pattern 4 lt -1, \
        '' using 4:xtic(1) title '21' fs pattern 5 lt -1, \
        '' using 5:xtic(1) title '22' fs pattern 6 lt -1, \
        '' using 6:xtic(1) title '23' fs pattern 7 lt -1
