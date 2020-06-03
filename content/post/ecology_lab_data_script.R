# UNDER LOG AREA - UPDATE SCRIPT

#load packages and dataset, check structure
library(tidyverse)
ecology_lab_data <-read_csv("C:/Users/chfal/OneDrive - University of Massachusetts Boston/Ecology & Lab/Ecology_lab_data.csv")

ecology_lab_data<-as_tibble(ecology_lab_data)

#t.test
t.test(ecology_lab_data$matrix_species, ecology_lab_data$log_species, alternative=c("less"))

#this is the section where i had to log it according to McArthur & Wilson's postulates
ecology_lab_data <- ecology_lab_data %>%
  mutate(log_area_log = log(log_area) + .01) %>%
  mutate(log_species_log = log(log_species) + .01) %>%
  mutate(log_distance_nearest_log = log(distance_nearest_log + .01)) %>%
  mutate(under_log_area_log = log(under_log_area) + .01)

ggplot(ecology_lab_data, aes(under_log_area_log, log_species_log)) +
  geom_point() +
  geom_smooth(method="lm",se=FALSE) +
  labs(title="The Species-Area Relationship of Tested Logs: Area Underneath Log", x="Logarithm of Area Under Overturned Log (cm^2)", y="Logarithm of Species Number", subtitle="y = .126x+6.771, R^2 = .0859, p = .664") +
  ggsave("ecology_graph_1.jpg")

cor.test(ecology_lab_data$under_log_area_log, ecology_lab_data$log_species_log)
# t = 2.0849, df=27, p=.664
# .085 is correlation coefficient

lm(under_log_area_log ~ log_species_log, data= ecology_lab_data)

ggplot(ecology_lab_data, aes(log_area_log, log_species_log)) +
  geom_point() +
  geom_smooth(method="lm",se=FALSE) +
  labs(title="The Species-Area Relationship of Tested Logs: Area of Top of Log", x="Logarithm of Area Atop Overturned Log (cm^2)", y="Logarithm of Species Number", subtitle="y = .3959 x + 6.596, R^2 = .372, p = .04667") +
  ggsave("ecology_graph_2.jpg")
  
cor.test(ecology_lab_data$log_area_log, ecology_lab_data$log_species_log)
#t = .40343, df=26
#.08 is correlation coefficient

lm(log_area_log ~ log_species_log, ecology_lab_data)
#now distance
ggplot(ecology_lab_data, aes(log_distance_nearest_log, log_species_log)) +
  geom_point() +
  geom_smooth(method="lm", se=FALSE) +
  labs(title="The Species-Distance Relationship", x="Logarithm of the Distance from the Log to Another Log (cm)", y="Logarithm of Species Numbers", subtitle="y = .113x+.1941, R^2 = .04739, p=.8071") +
  ggsave("ecology_graph_3.jpg")

cor.test(ecology_lab_data$log_distance_nearest_log, ecology_lab_data$log_species_log)

lm(log_distance_nearest_log ~ log_species_log, ecology_lab_data)
#this correlation test won't work because one of the values of distance was zero. must remove this row, try again.
cor(ecology_lab_data$log_distance_nearest_log, ecology_lab_data$log_species_log, use="pairwise.complete.obs")


cor.test(ecology_lab_data$log_distance_nearest_log,ecology_lab_data$log_species_log)
# t=.10166, df = 26, p =. 9198
# .04738. these variables on the log scale are not correlated at all!

#this section is before i realized i needed to add the log scale

ggplot(ecology_lab_data, aes(log_area, log_species)) +
  geom_point(color="magenta", size=3) +
  geom_smooth(method="lm",se=FALSE, color="sky blue", size=2) +
  labs(title="The Species-Area Relationship", x="Area Underneath Log in Centimeters", y="Number of Species") +
  theme_bw()

cor.test(ecology_lab_data$log_area, ecology_lab_data$log_species)

#the p-value for the Pearson's correlation test is .05667
#t=1.9911 and df = 27
#.3578 is the corellation coefficient

ggplot(ecology_lab_data, aes(under_log_area, log_species)) +
  geom_point() +
  geom_smooth(method="lm", se=FALSE)

cor.test(ecology_lab_data$under_log_area, ecology_lab_data$log_species)
#the p-value for the Pearson's correlation test is .1765
#t=1.3895 and df=26
# .269176 is the correlation coefficient

ggplot(ecology_lab_data, aes(distance_nearest_log,log_species)) +
  geom_point() +
  geom_smooth(method="lm", se=FALSE)

cor.test(ecology_lab_data$distance_nearest_log,ecology_lab_data$log_species)

#the p-value for the Pearson's correlation test is .4277
#t=.8053, df = 27
#.153 is the corellation coefficient

ggplot(ecology_lab_data, aes(log_species)) +
  geom_histogram()

ggplot(ecology_lab_data, aes(log_area)) +
  geom_histogram()

#we _did_ find slight significant statistical evidence that the logs followed the species-area relationship but it did not appear that they followed the nearest-neighbor relationship.

#why is this?