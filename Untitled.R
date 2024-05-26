# Define the data
group_names <- c("Nongraft", "Maxifort")
observation_names <- c("OB1", "OB2", "OB3")
group1_values <- c(20, 30, 10)
group2_values <- c(60, 70, 50)

# Create the dataframe
df <- data.frame(
  Observation = rep(observation_names, 2),  # Repeat observation names for each group
  Value = c(group1_values, group2_values), # Combine values for both groups
  Treatment = rep(group_names, each = length(observation_names)) # Repeat treatment group names
)

# Display the dataframe
print(df)
library(tidyverse)

gg_all <- ggplot(df, aes(x = "", y = Value, color = Treatment)) +
  geom_point(size = 3) +
  labs(x = "Observation", y = "Yield", title = "") +
  theme_classic()+
  theme(axis.title = element_text(size=20, face="bold"),
        axis.text = element_text(size=20, face="bold"),
        axis.line = element_line(linewidth = 1),
        legend.title = element_blank(),
        legend.text = element_text(size = 20),
        legend.position = "bottom")
  
gg_all
ggsave("within_total_sum_of_squares.pdf", gg_all, height = 4, width = 4)

