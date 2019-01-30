# make a "fill-in-the-graph" for expected response of photosynthesis to environmental conditions

par(mfrow = c(2, 2), oma = c(4, 3, 1, 1), mar = c(4, 2, 1, 1))

plot(NULL, ylab = '', xlab = '', yaxt = 'n', xaxt = 'n', xlim = c(0, 2000), ylim = c(0, 30))
mtext(side = 1, expression('Light (µmol m'^'-2' * ' s'^'-1' * ')'), line = 3, cex = 1)
axis(1, seq(0, 2000, 500))
axis(2, seq(0, 30, 10), las = 1)

plot(NULL, ylab = '', xlab = '', yaxt = 'n', xaxt = 'n', xlim = c(0, 1000), ylim = c(0, 30))
mtext(side = 1, expression('CO'[2] * ' (µmol mol'^'-1' * ')'), line = 3, cex = 1)
axis(1, seq(0, 1000, 250))
axis(2, seq(0, 30, 10), las = 1, labels = F)

plot(NULL, ylab = '', xlab = '', yaxt = 'n', xaxt = 'n', xlim = c(0, 200), ylim = c(0, 30))
mtext(side = 1, expression('O'[2] * ' (mmol mol'^'-1' * ')'), line = 3, cex = 1)
axis(1, seq(0, 200, 50))
axis(2, seq(0, 30, 10), las = 1, labels = T)

plot(NULL, ylab = '', xlab = '', yaxt = 'n', xaxt = 'n', xlim = c(0, 20), ylim = c(0, 30))
mtext(side = 1, expression('Soil N' * ' (mM nitrate)'), line = 3, cex = 1)
axis(1, seq(0, 20, 5))
axis(2, seq(0, 30, 10), las = 1, labels = F)

mtext(side = 2, expression('Photosynthesis (µmol m'^'-2' * ' s'^'-1' * ')'),
      outer = T, las = 3, cex = 1.5, line = 0.8)
