#set terminal postscript eps enhanced color font "Times-Roman,16"
set terminal pdfcairo enhanced color font "Times-Roman,16" size 6in, 5in
set datafile separator " "
#set output "gamezo_znd_k0.eps"
set output "znd_k0.pdf"
set title "ZND structure for 0.5C+0.5O, k = 0"
set size 1.0,1.0
set yrange [0:1]
set xrange [1E-3:*]
set y2range[0:10]
set y2tics 2
set xlabel "{/Times-Italic x} (cm)"
set ylabel "{/Times-Italic X}, {/Times-Italic M}"
set y2label "{/Times-Italic T} (10^9 K)"
set format y "{%g}"
set format x "{%g}"
set logscale x
set key left columns 2
#set key samplen 2
plot "./znd_xa_he4_x.xq" every ::3 using 1:2 with lines ls 8 lw 2 linecolor 1 dt 2 title 'He^{4}',\
"./znd_xa_c12_x.xq" every ::3 using 1:2 with lines ls 8 lw 2 linecolor 2 title 'C^{12}',\
"./znd_xa_o16_x.xq" every ::3 using 1:2 with lines ls 8 lw 2 linecolor 3 title 'O^{16}',\
"./znd_xa_ne20_x.xq" every ::3 using 1:2 with lines ls 8 lw 2 linecolor 4 dt 2 title 'Ne^{20}',\
"./znd_xa_mg24_x.xq" every ::3 using 1:2 with lines ls 8 lw 2 linecolor 5 dt 2 title 'Mg^{22}',\
"./znd_xa_si28_x.xq" every ::3 using 1:2 with lines ls 1 lw 2 linecolor 6 title 'Si^{28}',\
"./znd_xa_s32_x.xq" every ::3 using 1:2 with lines ls 1 lw 2 linecolor 7 dt 2 title 'S^{30}',\
"./znd_xa_ar36_x.xq" every ::3 using 1:2 with lines ls 1 lw 2 linecolor 8 dt 2 title 'Ar^{36}',\
"./znd_xa_ca40_x.xq" every ::3 using 1:2 with lines ls 1 lw 2 linecolor 1 dt 3 title 'Ca^{40}',\
"./znd_xa_ti44_x.xq" every ::3 using 1:2 with lines ls 1 lw 2 linecolor 2 dt 2 title 'Ti^{44}',\
"./znd_xa_cr48_x.xq" every ::3 using 1:2 with lines ls 1 lw 2 linecolor 3 dt 2 title 'Cr^{48}',\
"./znd_xa_fe52_x.xq" every ::3 using 1:2 with lines ls 3 lw 2 linecolor 4 dt 2 title 'Fe^{52}',\
"./znd_xa_ni56_x.xq" every ::3 using 1:2 with lines ls 3 lw 2 linecolor 5 dt 3 title 'Ni^{56}',\
"./znd_mach_x.xq" every ::3 using 1:2 with lines ls 4 lw 3 linecolor -1 dt 4 title '{/Times-Italic M}',\
"./znd_temp_x.xq" every ::3 using 1:($2/10e9) with lines ls 4 lw 3 linecolor 7 dt 4 title '{/Times-Italic T}'


