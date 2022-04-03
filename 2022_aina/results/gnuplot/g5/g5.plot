set encoding iso_8859_1
set terminal postscript eps enhanced color butt "Times-Roman" 36
set output 'g5.eps'

set style data histogram
set xlabel ' ' font "Times-Roman,36" 
set ylabel "Throughput (in pps)" font ",36"
set size 1.5, 1.2
set grid ytics
set style data histogram
set style histogram cluster gap 0.01
set style fill pattern border -1
set key right top width -2 maxrows 3
set key font ", 30"
set yrange [0:2000000]
set xtics font ", 30"
set boxwidth 2 absolute

#set logscale y 10

#set ytics ('100K' 100000, '500K' 500000, '1M' 1000000, '2M' 2000000)

set ytics ('250K' 250000, '500K' 500000, '750K' 750000, '1M' 1000000, '2M' 2000000)

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

plot 'data.txt' using 2:xtic(1) title '' fs pattern 3 lt -1, \
        '' using 3:xtic(1) title '' fs pattern 4 lt -1, \
        '' using 4:xtic(1) title '' fs pattern 5 lt -1, \
        '' using 5:xtic(1) title '' fs pattern 6 lt -1, \
        '' using 6:xtic(1) title '' fs pattern 7 lt -1, \
        '' using 7:xtic(1) title '' fs pattern 8 lt -1, \
        '' using 8:xtic(1) title '' fs pattern 9 lt -1, \
        '' using 9:xtic(1) title '' fs pattern 10 lt -1
