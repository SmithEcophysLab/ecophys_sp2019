## script to create randomized presentation order for students that did not volunteer to present on early days

library(dplyr)

grads = c('mcnellis', 'guo', 'perkowski', 'liu')

ugs = c('ortiz', 'perezvaldezestrada', 'sundgren', 'carruth', 'beaird', 'tijerina', 'duenez', 'jurado')

grad_rand = rnorm(4, mean = 10, sd = 2)

ug_rand = rnorm(8, mean = 10, sd = 2)

gr_bind = data.frame(grads, grad_rand)
colnames(gr_bind) = c('grads', 'rand')
arrange(gr_bind, rand)

ug_bind = data.frame(ugs, grad_rand)
colnames(ug_bind) = c('ugs', 'rand')
arrange(ug_bind, rand)




