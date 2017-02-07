function clusterplot(cluster)
markerSize = 5 ;
cmap = [0.8750    0.1250    0.1250
    0.2500    0.5000    0.7500
    0.2500    0.6250    0.2500
    0.6250    0.2500    0.6250
    0.8750    0.3750    0.3750
    1.0000    0.5000         0
    1.0000    1.0000    0.2500
    0.6250    0.3750    0.1250
    1.0000    0.5000    0.7500
    1         1         1     ] ;
gplotmatrix(cluster.probability, cluster.probability,...
  cluster.class, cmap, '.', markerSize)
set(findobj('type', 'Legend'), 'color', .25 * [1 1 1], 'location', 'none', 'position', [0.925 0.75 0.05 0.125])
set(findobj('-property', 'xlim'), 'color', .05 * [1 1 1])
set(gcf, 'color', .1 * [1 1 1])
set(findobj('type', 'axes'), 'xtick', [], 'ytick', []) 