library(rvest)
library(readr)
library(dplyr)
library(purrr)

# functions ----
get_editors <- function(page) {
  # for a given html page, extract names of all editors
  editors <- page %>% html_nodes("div.publication-editor-name") %>% html_text(trim=T)
}

get_affiliations <- function(page) {
  # for a given html page, extract all editor affiliations
  affiliations <- page %>% html_nodes("span.publication-editor-affiliation") %>% html_text(trim=T)
}

get_editor_list <- function(page, journal_name) {
  # for a given html page, grab editors and affiliations and store in a table with the journal name
  editors <- get_editors(page)
  affiliations <- get_affiliations(page)
  
  # check to make sure there are the same number of editors as affiliations
  if (length(editors) > length(affiliations)) {
    # there are more editors than affiliations, so remove extra editors
    x <- length(editors) - length(affiliations)
    editors <- editors[1:(length(editors)-x[1])]
  }
  
  tibble(editor_name = editors, affiliation = affiliations) %>% mutate(journal = journal_name) %>%
    select(journal, editor_name, affiliation)
  
}

# create data table ----
# read in journal titles
journals <- read_csv("data/elsevier-cleaned.csv")

# create a list of urls
urls <- paste0("https://www.journals.elsevier.com/", journals$url_stub, "/editorial-board")

# create an empty list
all_rows <- list()

# iterate over list of journals to read html pages and extract editor info
for (i in 1:length(urls)) {
  # tryCatch wraps the extraction in case of a 404 error; if a page does not exist, return an empty list
  all_rows[[i]] <- tryCatch(read_html(urls[i]) %>% get_editor_list(journals$full_title[i]), error=function(e){list()})
}

# combine rows into single tibble
data <- bind_rows(all_rows)
  
# write table to csv
write_csv(data, "data/output.csv")