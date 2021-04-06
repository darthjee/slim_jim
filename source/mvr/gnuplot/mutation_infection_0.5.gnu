reset
set pm3d
set xr [0:0.001]
set yr [0:0.001]

set xlabel "Mutation"
set ylabel "Activation"
set zlabel "K index"

f1(m, a, i) = i * log(1-m) - log(1 - m * a)
z(x, y) = 0

set term png
set out "mvr/plots/mutation_infection_0.5.png"

splot f1(x, y, 0.5) t "Infection Rate 50%"
