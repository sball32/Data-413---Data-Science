library(rvest)
library(tidyverse)

# load html on desktop
page <- read_html("~/Desktop/Faculty, Math & Statistics _ American University, Washington, DC.html")

# extract the articles
faculty_nodes <- page %>% html_elements("article.profile-item")

# extract info
faculty_df <- tibble(
  name = faculty_nodes %>%
    html_element(".profile-name span[itemprop='name']") %>% # <- name
    html_text2(),
  
  email = faculty_nodes %>%
    html_element(".profile-email a") %>% # <- email
    html_text2(),
  
  phone = faculty_nodes %>%
    html_element(".profile-phone a") %>% # <- phone number
    html_text2()
)

# save csv
write_csv(faculty_df, "~/Desktop/faculty.csv")

