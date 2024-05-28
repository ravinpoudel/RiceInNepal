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







print(vector)
# Load required library
library(stringdist)

# Define the vector
vector <- c("NARC",
            "MoALD",
            "PU",
            "Private Co",
            "iDE",
            "MBU",
            "Agrovet",
            "SQCC",
            "NPDA",
            "TU",
            "NRRP",
            "AFU", 
            "China",
            "India",
            "Bangladesh")
# Define the custom function to calculate pairwise string distances
pairwise_distance <- function(x, y) {
  stringdist::stringdist(x, y, method = "jaccard")
}

# Create an empty matrix
n <- length(vector)
pairwise_matrix <- matrix(0, nrow = n, ncol = n)

# Fill the lower triangle of the matrix with pairwise distances
for (i in 1:(n - 1)) {
  for (j in (i + 1):n) {
    pairwise_matrix[j, i] <- " "
  }
}

# Fill the upper half of the matrix with "N/A"
pairwise_matrix[upper.tri(pairwise_matrix)] <- "N/A"

# Fill the diagonal with NA
diag(pairwise_matrix) <-"N/A"

# Print the half lower triangle matrix with upper half as "N/A"
print(pairwise_matrix)
rownames(pairwise_matrix) <- vector
colnames(pairwise_matrix) <- vector
pairwise_matrix

write.csv(pairwise_matrix, "pairwise_matrix.csv")
