library(tidyverse)
alt<-read_tsv("data/altmetrics_toupin_2023.txt")

colnames(alt)

alt %>% 
  select(record_id, policy) %>% 
  filter(!is.na(record_id)) %>% 
  reframe(mean_policy = mean(policy))


alt %>% 
  select(record_id, news) %>% 
  filter(!is.na(record_id)) %>% 
  reframe(mean_news = mean(news))

art<-read_tsv("data/articles.txt")

read_tsv("data/citations.txt") %>% 
  filter(cited_ut %in% art$ut) %>% 
  group_by(cited_ut) %>% 
  reframe(n_cit = n()) %>% 
  ungroup() %>% 
  reframe(avg_cit = mean(n_cit))

