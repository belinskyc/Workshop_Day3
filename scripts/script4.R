# You should start your script with a clean Environment
rm(list=ls());            # clear Environment tab

# Every library directly called in your script should be listed
library(weathermetrics);  # RStudio will detect this
library(ggplot2);                  

weatherData = read.csv(file="data/weatherData.csv");

### RStudio will detect if weathermetrics is not install if you do this:
kelvin_high = weathermetrics::fahrenheit.to.kelvin(weatherData$maxTemp)

### But Rstudio will not detect this:
kelvin_low = fahrenheit.to.kelvin(weatherData$minTemp)

plot5 = ggplot( data=weatherData ) +
  geom_point( mapping=aes(x=kelvin_high, y=relHum) ) +
  labs( title="Humidity vs Temperature",
        subtitle="Lansing, MI -- 2016",
        x = "Average Temperatures (Kelvin)",
        y = "Relative Humidity") +
  scale_x_continuous( breaks = seq(from=240, to=350, by=10) ) +
  theme_bw() +
  theme( axis.text.x=element_text(angle=90, vjust=0.5) );
plot(plot5);
