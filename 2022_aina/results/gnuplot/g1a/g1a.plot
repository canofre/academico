set encoding iso_8859_1
set terminal postscript eps enhanced color butt "Times-Roman" 36
set output 'g1a.eps'

set style data histogram
set xlabel 'Window size' font "Times-Roman,36" 
set ylabel "Packets reported to \n the INT Collector (in packets)" font ",36"
set size 1.5, 1.2
set grid ytics
set style data histogram
set style histogram cluster gap 1
set style fill pattern border -1
set key right top width -2 maxrows 3
set key font ", 30"
set yrange [0:11000000]
set xtics font ", 30"
#set logscale y 10

set ytics ('1M' 1, '2M' 2000000, '4M' 4000000, '6M' 6000000 , '8M' 8000000, '10M' 10000000)

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

plot 'data.txt' using 2:xtic(1) title 't=15s' fs pattern 3 lt -1, \
        '' using 3:xtic(1) title 't=30s' fs pattern 4 lt -1, \
        '' using 4:xtic(1) title 't=45s' fs pattern 5 lt -1, \
        '' using 5:xtic(1) title 't=60s' fs pattern 6 lt -1, \
        '' using 6:xtic(1) title 't=75s' fs pattern 7 lt -1, \
        '' using 7:xtic(1) title 't=90s' fs pattern 8 lt -1, \
        '' using 8:xtic(1) title 't=105s' fs pattern 9 lt -1
