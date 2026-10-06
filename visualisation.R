library(tidyverse)
library(stringr)
library(ggplot2)

# Read previously saved
# datasets from Part B

beehive <- readRDS("beehive.rds")
ministers <- readRDS("ministers.rds")


# Combine Beehive data with
# Wikipedia minister data
# using a left join

combined_data <- left_join(
  beehive,
  ministers,
  by = c("ministers" = "minister")
)


# Analyse climate-related
# keywords in release titles
# using stringr functions

combined_data <- combined_data %>%
  mutate(
    climate = str_detect(str_to_lower(title), "climate"),
    energy = str_detect(str_to_lower(title), "energy"),
    emissions = str_detect(str_to_lower(title), "emission"),
    sustainability = str_detect(str_to_lower(title), "sustain"),
    environment = str_detect(str_to_lower(title), "environment"),
    carbon = str_detect(str_to_lower(title), "carbon")
  )



combined_data <- combined_data %>%
  filter(!is.na(title))


# Count how many times each
# climate-related keyword
# appears in the dataset

keyword_counts <- tibble(
  topic = c(
    "Climate",
    "Energy",
    "Emissions",
    "Sustainability",
    "Environment",
    "Carbon"
  ),
  
  count = c(
    sum(combined_data$climate),
    sum(combined_data$energy),
    sum(combined_data$emissions),
    sum(combined_data$sustainability),
    sum(combined_data$environment),
    sum(combined_data$carbon)
  )
)


# Horizontal bar chart
# using ggplot2 
# to compare keyword frequencies

my_plot <- ggplot(
  keyword_counts,
  aes(
    x = reorder(topic, count),
    y = count,
    fill = topic
  )
) +
  
  geom_col(show.legend = FALSE) +
  
  coord_flip() +
  
  labs(
    title = "Climate-Related Topics in Simon Watts' Beehive Releases",
    subtitle = "Keyword analysis of media releases connected to the Climate Change portfolio",
    x = "Topic",
    y = "Number of Mentions",
    caption = "Data Sources: NZ Beehive Website and Wikipedia"
  ) +
  
 
  theme_minimal() +
  
  
  
  theme(
    plot.title = element_text(
      size = 18,
      face = "bold"
    ),
    
    plot.subtitle = element_text(
      size = 12
    ),
    
    axis.text = element_text(
      size = 11
    )
  )


# Display visualisation

my_plot



ggsave(
  "my_viz.png",
  plot = my_plot,
  width = 10,
  height = 6
)