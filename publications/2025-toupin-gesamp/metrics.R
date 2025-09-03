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


# Convert images from PFG to JPG
library(magick)
image_write(image_read_pdf("images/Figure_1_GESAMP.pdf", density = 300), path = "images/Fig1.jpg", format = "jpg", quality = 300)
image_write(image_read_pdf("images/Figure_2_GESAMP.pdf", density = 300), path = "images/Fig2.jpg", format = "jpg", quality = 300)
image_write(image_read_pdf("images/Figure_3_GESAMP.pdf", density = 300), path = "images/Fig3.jpg", format = "jpg", quality = 300)
image_write(image_read_pdf("images/Figure_4_GESAMP.pdf", density = 300), path = "images/Fig4.jpg", format = "jpg", quality = 300)
image_write(image_read_pdf("images/Figure_5_GESAMP.pdf", density = 300), path = "images/Fig5.jpg", format = "jpg", quality = 300)
image_write(image_read_pdf("images/Figure_6_GESAMP.pdf", density = 300), path = "images/Fig6.jpg", format = "jpg", quality = 300)