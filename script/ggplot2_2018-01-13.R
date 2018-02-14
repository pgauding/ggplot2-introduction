## An Introduction to ggplot2
## Kansas City R Users Group

## Patrick Gauding
## 2018-01-13
## patrick.gauding@ku.edu

pack_list <- c("ggplot2", "ggthemes", "dplyr", "magrittr", "fiftystater", "maps",
               "mapproj")
sapply(pack_list, install.packages)

library(ggplot2)
library(ggthemes)

## Scatter Plots and Continuous/Continuous Figures

plot(mtcars$disp, mtcars$mpg)
q <- plot(mtcars$disp, mtcars$mpg)
q

ggplot(mtcars, aes(x = disp, y = mpg)) +
    geom_point()
ggsave("../output/plot2.png")

p <- ggplot(mtcars, aes(x = disp, y = mpg, col = factor(gear))) +
    geom_point()
p
ggsave("../output/plot3.png")

ggplot(mtcars, aes(x = disp, y = mpg)) +
    geom_point() +
    geom_smooth()
ggsave("../output/plot4.png")

ggplot(mtcars, aes(x = disp, y = mpg, col = factor(gear))) +
    geom_point() +
    geom_smooth(method = "lm")
p + geom_smooth(method = "lm")
ggsave("../output/plot5.png")

ggplot(mtcars, aes(x = disp, y = mpg, col = factor(gear))) +
    geom_point(col = "black", shape = 20, alpha = 0.6) +
    geom_smooth(method = "lm", se = FALSE, linetype = 2, alpha = 0.6)
ggsave("../output/plot6.png")

ggplot(mtcars, aes(x = disp, y = mpg)) +
    geom_point(alpha = 0.6, shape = 20) +
    geom_smooth(method = "lm", se = FALSE, linetype = 1) +
    ggtitle("MPG to Displacement") +
    labs(x = "Displacement", y = "Miles per Gallon", fill = "Cylinders")
ggsave("../output/plot7.png")

p8 <- ggplot(mtcars, aes(x = disp, y = mpg, fill = factor(cyl))) +
    geom_point(alpha = 0.6, shape = 20) +
    geom_smooth(method = "lm", se = FALSE, linetype = 1) +
    scale_x_continuous(limits = c(70, 500)) +
    scale_color_discrete() +
    coord_cartesian() +
    ggtitle("MPG to Displacement") +
    labs(x = "Displacement", y = "Miles per Gallon", fill = "Cylinders")
p8
ggsave("../output/plot8.png")

p8 + facet_grid(. ~ cyl)
ggsave('../output/plot8a.png')

## Bar plots

bartab <- table(mtcars$cyl)
barplot(bartab, beside = TRUE)

ggplot(mtcars, aes(x = cyl)) +
  geom_bar()
ggsave('../output/plot10.png')


## Histograms

hist(mtcars$disp)

ggplot(mtcars, aes(x = disp)) +
  geom_histogram(binwidth = 30)
ggsave('../output/plot12.png')

## Density Plot

plot(density(mtcars$disp),
    main = "Density of Displacement",
    xlab = "Displacement in Inches Cubed",
    ylab = "Density")

ggplot(mtcars, aes(x = disp, fill = factor(gear))) +
    geom_density(kernel = "gaussian", alpha = 0.3) +
    ggtitle("Title", "Subtitle") +
    labs(x = "Displacement", y = "Density", fill = "Number of Gears") +
    theme_fivethirtyeight()
ggsave('../output/plot14.png')




## A map

library(fiftystater)
library(maps)
library(mapproj)

list <- c("alaska", "california", "colorado", "connecticut", "florida", "hawaii",
          "illinois", "kentucky", "maryland", "massachusetts", "michigan", "minnesota",
          "nevada", "new mexico", "new york", "north carolina", "ohio", "oregon", "pennsylvania", "texas",
          "vermont","virginia", "washington")
listdf <- data.frame(list)
colnames(listdf) <- c("state")

data("fifty_states")
fifty <- data.frame(unique(fifty_states$id))
colnames(fifty) <- c('state')

m <- ggplot(fifty, aes(map_id = state)) +
  geom_map(map = fifty_states) +
  geom_map(fill="white", map= fifty_states, color="black") +
  geom_map(data = listdf, map = fifty_states, color = "white") +
  expand_limits(x = fifty_states$long, y = fifty_states$lat) +
  coord_map() +
  labs(x = "", y = "") +
  ggtitle("States with At Least One LGBT Judge") +
  theme_fivethirtyeight()
m
ggsave('../output/plot15.png')
