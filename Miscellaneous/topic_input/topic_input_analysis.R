# load libraries
library(tidyverse)

# read in results
results = read.csv('topic_input_results.csv')
head(results)

#summarise results
results_group_by_topic = group_by(results, Topic)
results_mean = summarise(results_group_by_topic, n = n(), mean_score = mean(Score), ci_score = (sd(Score) / sqrt(n)) * 1.96)
results_mean$color = c('white', 'green', 'green', 'blue', 'white', 'white', 'blue', 'blue', 'green', 'white', 'white')
results_mean_arrange = arrange(results_mean, mean_score)

# plot results
#plot(results$Score ~ results$Topic)
results_barplot = barplot(results_mean_arrange$mean_score, ylim = c(0,5), col = results_mean_arrange$color)
segments(results_barplot, results_mean_arrange $mean_score + results_mean_arrange $ci_score, results_barplot, results_mean_arrange $mean_score - results_mean_arrange $ci_score)
segments(results_barplot + 0.1, results_mean_arrange $mean_score + results_mean_arrange $ci_score, results_barplot - 0.1, results_mean_arrange $mean_score + results_mean_arrange $ci_score)
segments(results_barplot + 0.1, results_mean_arrange $mean_score - results_mean_arrange $ci_score, results_barplot - 0.1, results_mean_arrange $mean_score - results_mean_arrange $ci_score)
axis(1, at = results_barplot, labels = results_mean_arrange $Topic)
legend('topleft', c('tissue', 'plant', 'ecosystem'), col = 'black', pt.bg = c('white', 'blue', 'green'), pch = 22, pt.cex = 2, cex = 1.5)
