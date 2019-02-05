# Script for doing a quick analysis of the CANTRIP dataset based on hypotheses
# presented in class on February 5, 2019

### Load packages
library(vioplot)

### create standard error function
se <- function(x) sd(x)/sqrt(length(x))

### Load the data
cantrip = read.csv('plasticityData4gitHub.csv')

## Hypothesis 1: Light-saturated photosynthesis will be higher at the top of the
## canopy, because of greater light availability
cantrip_h1 = subset(cantrip, Aa_40 > 0 & Aa_3 > 0)
cantrip_h1_ttest = t.test(cantrip_h1$Aa_40, cantrip_h1$Aa_3, paired = T)
cantrip_h1_ttest # greater photosynthesis, accept H1

cantrip_h1_vioplot = vioplot(cantrip_h1$Aa_40, cantrip_h1$Aa_3, yaxt = 'n',
                             names = c('Top', 'Bottom'), ylim = c(0, 50), 
                             ylab = '', xlab = '')
axis(2, seq(0, 50, 10), las = 1)
mtext(side = 2, expression('Photosynthesis (µmol m' ^ '-2' * ' s' ^ '-1' * ')'),
      line = 2.5)
text(1, 48, paste0('Mean: ', round(mean(cantrip_h1$Aa_40), digits = 2), 
                  '±', round(se(cantrip_h1$Aa_40), digits = 2)))
text(2, 48, paste0('Mean: ', round(mean(cantrip_h1$Aa_3), digits = 2), 
                  '±', round(se(cantrip_h1$Aa_3), digits = 2)))

## Hypothesis 2: Leaf Nitrogen will be higher at the top of the
## canopy, because of greater light availability
cantrip_h2 = subset(cantrip, Na_40 > 0 & Na_3 > 0)
cantrip_h2_ttest = t.test(cantrip_h2$Na_40, cantrip_h2$Na_3, paired = T)
cantrip_h2_ttest # greater photosynthesis, accept H2

cantrip_h2_vioplot = vioplot(cantrip_h2$Na_40, cantrip_h2$Na_3, yaxt = 'n',
                             names = c('Top', 'Bottom'), ylim = c(0, 10), 
                             ylab = '', xlab = '')
axis(2, seq(0, 10, 2), las = 1)
mtext(side = 2, expression('Nitrogen (gN m' ^ '-2' * ')'),
      line = 2.5)
text(1, 9, paste0('Mean: ', round(mean(cantrip_h2$Na_40), digits = 2), 
                  '±', round(se(cantrip_h2$Na_40), digits = 2)))
text(2, 9, paste0('Mean: ', round(mean(cantrip_h2$Na_3), digits = 2), 
                  '±', round(se(cantrip_h2$Na_3), digits = 2)))

## Hypothesis 3: LMA will be higher at the top of the
## canopy, because of greater light availability
cantrip_h3 = subset(cantrip, LMA_40 > 0 & LMA_3 > 0)
cantrip_h3_ttest = t.test(cantrip_h3$LMA_40, cantrip_h3$LMA_3, paired = T)
cantrip_h3_ttest # greater photosynthesis, accept H3

cantrip_h3_vioplot = vioplot(cantrip_h3$LMA_40, cantrip_h3$LMA_3, yaxt = 'n',
                             names = c('Top', 'Bottom'), ylim = c(0, 750), 
                             ylab = '', xlab = '')
axis(2, seq(0, 750, 250), las = 1)
mtext(side = 2, expression('LMA (g m' ^ '-2' * ')'),
      line = 2.5)
text(1, 725, paste0('Mean: ', round(mean(cantrip_h3$LMA_40), digits = 2), 
                  '±', round(se(cantrip_h3$LMA_40), digits = 2)))
text(2, 725, paste0('Mean: ', round(mean(cantrip_h3$LMA_3), digits = 2), 
                  '±', round(se(cantrip_h3$LMA_3), digits = 2)))
