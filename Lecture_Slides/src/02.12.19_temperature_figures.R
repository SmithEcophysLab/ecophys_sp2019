# create figures for the temperature lecture for Plant Ecophys

## Enzymatic response figure using arhenious equation
### temperature response function (parameter values taken from Kattge and Knorr, 2007)
### note: temperatures are in Kelvin
calc_tresp_mult = function(tleaf , delS){
  
  trefK = 298.15
  kbeg=exp(71513*(tleaf-trefK)/(trefK*8.314*tleaf))
  kend=(1+exp((trefK*delS-200000)/(trefK*8.314)))/
        (1+exp((tleaf*delS-200000)/(tleaf*8.314)))
  kbeg*kend
  
}

### calculate vmax
tempK = seq(273.15, 313.15, 1)
vmax_t = calc_tresp_mult(tempK, 649.12)

### plot response
par(oma = c(3, 3, 1, 1))
vmax_plot = plot(vmax_t ~ c(tempK - 273.15), type = 'l', lwd = 8, col = 'black',
                 yaxt = 'n', xaxt ='n', ylim = c(0, 2), xlim = c(0, 40),
                 ylab = '', xlab = '')
axis(2, seq(0, 2, 0.5), las = 1)
axis(1, seq(0, 40, 10))
mtext(side = 1, 'Temperature (°C)', line = 3.5, cex = 2)
mtext(side = 2, expression('V'[max] * ' rate'), line = 3.5, cex = 2)

## add a hot line
vmax_t_hot = calc_tresp_mult(tempK, 640)
lines(vmax_t_hot ~ c(tempK - 273.15), type = 'l', lwd = 8, col = 'red', lty = 3)

## add a cold line
vmax_t_hot = calc_tresp_mult(tempK, 660)
lines(vmax_t_hot ~ c(tempK - 273.15), type = 'l', lwd = 8, col = 'blue', lty = 3)



## Enzymatic affinity figure
### temperature response function (parameter values from Bernacchi et al., 2003)
#### functions for kc and ko
calc_kc = function(tempK) {
  
  R = 8.314        
  Hkc = 79430  

  Kc =exp(Hkc * ((tempK - 298.15) / (298.15 * R * tempK)))
  Kc

}

calc_ko = function(tempK) {
  
  R = 8.314        
  Hko = 36380 
  
  Ko = exp(Hko * ((tempK - 298.15) / (298.15 * R * tempK)))
  Ko
  
}

#### calculate CO2 (kc) and O2 (ko) afficnity for Rubisco
kc_t = calc_kc(tempK)
ko_t = calc_ko(tempK)

#### plot responses
par(oma = c(3, 3, 1, 1))
kc_plot = plot(kc_t ~ c(tempK - 273.15), type = 'l', lwd = 8, col = 'black',
                 yaxt = 'n', xaxt ='n', ylim = c(0, 5), xlim = c(0, 40),
                 ylab = '', xlab = '')
axis(2, seq(0, 5, 1), las = 1)
axis(1, seq(0, 40, 10))
mtext(side = 1, 'Temperature (°C)', line = 3.5, cex = 2)
mtext(side = 2, expression('Sustrate affinity (K)'), line = 3.5, cex = 2)


## create a plot for rubisco specificity
## calculate vc and vo
calc_vc = function(tempK) {
  
  R = 8.314        
  Hvc = 65330  
  
  vc =exp(Hvc * ((tempK - 298.15) / (298.15 * R * tempK)))
  vc
  
}

calc_vo = function(tempK) {
  
  R = 8.314        
  Hvo = 60110 
  
  vo = exp(Hvo * ((tempK - 298.15) / (298.15 * R * tempK)))
  vo
  
}

### calculate sc and so
vc_t = calc_vc(tempK)
vo_t = calc_vo(tempK)
sc_t = vc_t / kc_t 
so_t = vo_t / ko_t

scsco_t = sc_t / so_t

#### plot Rubisco specificity (v/k)
par(oma = c(3, 3, 1, 1))
kc_plot = plot(scsco_t ~ c(tempK - 273.15), type = 'l', lwd = 8, col = 'black',
                 yaxt = 'n', xaxt ='n', ylim = c(0, 5), xlim = c(0, 40),
                 ylab = '', xlab = '')
axis(2, seq(0, 5, 1), las = 1)
axis(1, seq(0, 40, 10))
mtext(side = 1, 'Temperature (°C)', line = 3.5, cex = 2)
mtext(side = 2, expression('Rubisco specificity to CO'[2]), line = 3.5, cex = 2)

## plot stomatal closure at high temperatures (due to VPD)
## uses Medlyn (2011) model

### calculate vpd from t
calc_vpd = function(temp){
  
  tempC = temp - 273.15
  es = 610.8 * exp((17.27 * tempC) / (237.3 + tempC)) # saturation vapor pressure (Pa) http://cronklab.wikidot.com/calculation-of-vapour-pressure-deficit
  vpd = 0.5 * es # at 50% rh
  vpd
  
}

vpd_t = calc_vpd(tempK) / 1000 # convert to kPa

### cacluate stomatal conductance (gs)
gs_t = 1 + (10 / sqrt(vpd_t))

#### plot stomatal conductance (gs)
par(oma = c(3, 3, 1, 1))
gs_plot = plot(gs_t/gs_t[26] ~ c(tempK - 273.15), type = 'l', lwd = 8, col = 'black',
               yaxt = 'n', xaxt ='n', ylim = c(0, 3), xlim = c(0, 40),
               ylab = '', xlab = '')
axis(2, seq(0, 3, 1), las = 1)
axis(1, seq(0, 40, 10))
mtext(side = 1, 'Temperature (°C)', line = 3.5, cex = 2)
mtext(side = 2, expression('Stomatal conductance'), line = 3.5, cex = 2)


