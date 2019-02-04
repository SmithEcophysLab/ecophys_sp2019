# Figures for Light lecture for BIOL 4350/6350

## load libraries
library(plantecophys)

## plot instantaneous response
inst_response = Photosyn(PPFD = seq(10, 2000, 10), Vcmax = 100, Jmax = 200, 
                         theta = 0.65)
par(oma = c(4, 4, 1, 1))

### full instantaneous response
plot(ALEAF ~ PPFD, data = inst_response, type = 'l', lwd = 8, col = 'purple', 
     ylab = '', xlab = '', yaxt = 'n', xaxt = 'n', ylim = c(0, 30))
axis(1, seq(0, 2000, 500), cex.axis = 1.5)
axis(2, seq(0, 30, 10), cex.axis = 1.5, las = 1)
mtext(side = 1, expression('PAR (µmol m' ^ '-2' * ' s' ^ '-1' * ')'), 
      cex = 2, line = 4)
mtext(side = 2, expression('Photosynthesis (µmol m' ^ '-2' * ' s' ^ '-1' * ')'), 
      cex = 2, line = 4)

### response broken into limitations
plot(Aj ~ PPFD, data = inst_response, type = 'l', lwd = 8, col = 'red', 
     ylab = '', xlab = '', yaxt = 'n', xaxt = 'n', ylim = c(0, 30))
lines(Ac ~ PPFD, data = inst_response, type = 'l', lwd = 8, col = 'blue')
axis(1, seq(0, 2000, 500), cex.axis = 1.5)
axis(2, seq(0, 30, 10), cex.axis = 1.5, las = 1)
mtext(side = 1, expression('PAR (µmol m' ^ '-2' * ' s' ^ '-1' * ')'), 
      cex = 2, line = 4)
mtext(side = 2, expression('Photosynthesis (µmol m' ^ '-2' * ' s' ^ '-1' * ')'), 
      cex = 2, line = 4)

## examine acclimted responses
low_light = Photosyn(PPFD = seq(10, 2000, 10), Vcmax = 50, Jmax = 100, 
                         theta = 0.65)
high_light = Photosyn(PPFD = seq(10, 2000, 10), Vcmax = 100, Jmax = 200, 
                     theta = 0.65)
par(mfrow = c(1, 2), oma = c(4, 4, 1, 1), mar = c(1, 1, 1, 1))

### full instantaneous response
plot(ALEAF ~ PPFD, data = low_light, type = 'l', lwd = 8, col = 'brown', 
     ylab = '', xlab = '', yaxt = 'n', xaxt = 'n', ylim = c(0, 30))
axis(1, seq(0, 2000, 500), cex.axis = 0.8)
axis(2, seq(0, 30, 10), cex.axis = 0.8, las = 1)
mtext(side = 1, expression('PAR (µmol m' ^ '-2' * ' s' ^ '-1' * ')'), 
      cex = 1.5, line = 3)
mtext(side = 2, expression('Photosynthesis (µmol m' ^ '-2' * ' s' ^ '-1' * ')'), 
      cex = 1.5, line = 3)

plot(ALEAF ~ PPFD, data = high_light, type = 'l', lwd = 8, col = 'orange', 
     ylab = '', xlab = '', yaxt = 'n', xaxt = 'n', ylim = c(0, 30))
axis(1, seq(0, 2000, 500), cex.axis = 0.8)
axis(2, seq(0, 30, 10), cex.axis = 0.8, las = 1, labels = F)
mtext(side = 1, expression('PAR (µmol m' ^ '-2' * ' s' ^ '-1' * ')'), 
      cex = 1.5, line = 3)
# mtext(side = 2, expression('Photosynthesis (µmol m' ^ '-2' * ' s' ^ '-1' * ')'), 
#      cex = 1.5, line = 3)
