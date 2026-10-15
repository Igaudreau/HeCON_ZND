#set terminal postscript eps enhanced color font "Times-Roman,16"
set terminal pdfcairo enhanced color font "Times-Roman,16" size 6in, 5in
set datafile separator " "
#set output "gamezo.eps"
set output "react.pdf"
set title "Evolution for 0.5C+0.5O"
set size 1.0,1.0
set yrange [0:1]
set xrange [*:*]
set y2range[0:10]
set y2tics 2
set xlabel "{/Times-Italic t} (s)"
set ylabel "{/Times-Italic X}"
set y2label "{/Times-Italic T} (10^9 K)"
set format y "{%g}"
set format x "{%g}"
set logscale x
set key left columns 2
#set key samplen 2
plot "./reactor_xa_he4_t.xq" every ::3 using 1:2 with lines ls 8 lw 2 linecolor 1 dt 2 title 'He^{4}',\
"./reactor_xa_c12_t.xq" every ::3 using 1:2 with lines ls 8 lw 2 linecolor 2 title 'C^{12}',\
"./reactor_xa_o16_t.xq" every ::3 using 1:2 with lines ls 8 lw 2 linecolor 3 title 'O^{16}',\
"./reactor_xa_ne20_t.xq" every ::3 using 1:2 with lines ls 8 lw 2 linecolor 4 dt 2 title 'Ne^{20}',\
"./reactor_xa_mg24_t.xq" every ::3 using 1:2 with lines ls 8 lw 2 linecolor 5 dt 2 title 'Mg^{22}',\
"./reactor_xa_si28_t.xq" every ::3 using 1:2 with lines ls 1 lw 2 linecolor 6 title 'Si^{28}',\
"./reactor_xa_s32_t.xq" every ::3 using 1:2 with lines ls 1 lw 2 linecolor 7 dt 2 title 'S^{30}',\
"./reactor_xa_ar36_t.xq" every ::3 using 1:2 with lines ls 1 lw 2 linecolor 8 dt 2 title 'Ar^{36}',\
"./reactor_xa_ca40_t.xq" every ::3 using 1:2 with lines ls 1 lw 2 linecolor 1 dt 3 title 'Ca^{40}',\
"./reactor_xa_ti44_t.xq" every ::3 using 1:2 with lines ls 1 lw 2 linecolor 2 dt 2 title 'Ti^{44}',\
"./reactor_xa_cr48_t.xq" every ::3 using 1:2 with lines ls 1 lw 2 linecolor 3 dt 2 title 'Cr^{48}',\
"./reactor_xa_fe52_t.xq" every ::3 using 1:2 with lines ls 3 lw 2 linecolor 4 dt 2 title 'Fe^{52}',\
"./reactor_xa_ni56_t.xq" every ::3 using 1:2 with lines ls 3 lw 2 linecolor 5 title 'Ni^{56}',\
"./reactor_temp_t.xq" every ::3 using 1:($2/10e9) with lines ls 4 lw 3 linecolor 7 dt 4 title '{/Times-Italic T}'

