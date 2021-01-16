library(tidyverse)


# ------------------------------------------------------------------------------
#clean 

df = read.csv2("chess_com_games_2020-12-15_2020-12-08.csv", sep = ",")
df$X = NULL

# remove noise
glimpse(df)
move_condition = c("e4")
clean_df = df %>% 
  group_by(game) %>% 
  filter(first(move) %in% move_condition) %>% 
  filter(turn <= 10)
len_noise = dim(df) - dim(clean_df)  
print(len_noise)
glimpse(clean_df)

write.csv2(df, file = "clean_df_alfons_small.csv", row.names = F)

# ------------------------------------------------------------------------------
# enrich 

dates = 1:dim(clean_df)[1]
class(dates) = "Date"
clean_df = clean_df %>% ungroup() %>%  arrange(game, turn) %>% mutate(date = dates)

write.csv2(clean_df, file = "enrich_df_alfons_small.csv", row.names = F)








# ------------------------------------------------------------------------------
#clean 

df = read.csv2("C54.csv", sep = ",")

# remove noise
glimpse(df)
move_condition = c("e4")
clean_df = df %>% 
  group_by(game) %>% 
  filter(first(move) %in% move_condition) %>% 
  filter(turn <= 10)
len_noise = dim(df) - dim(clean_df)  
print(len_noise)
glimpse(clean_df)


# group by first move
clean_df %>% 
  group_by(game) %>% 
  mutate(first_move = first(move)) %>% 
  group_by(first_move) %>% 
  count(sort = TRUE) 

write.csv2(clean_df, file = "clean_df.csv", row.names = F)

# ------------------------------------------------------------------------------
# enrich 

dates = 1:dim(clean_df)[1]
class(dates) = "Date"
clean_df = clean_df %>% ungroup() %>%  arrange(game, turn) %>% mutate(date = dates)

#write.csv2(clean_df, file = "enrich_df.csv", row.names = F)





















# ------------------------------------------------------------------------------
#clean 

library(tidyverse)
df = read.csv2("B10.csv", sep = ",")

# remove noise
glimpse(df)
move_condition = c("e4")
clean_df = df %>% 
  group_by(game) %>% 
  filter(first(move) %in% move_condition) %>% 
  filter(turn <= 10)
len_noise = dim(df) - dim(clean_df)  
print(len_noise)
glimpse(clean_df)


# group by first move
clean_df %>% 
  group_by(game) %>% 
  mutate(first_move = first(move)) %>% 
  group_by(first_move) %>% 
  count(sort = TRUE) 

write.csv2(clean_df, file = "clean_df_B10.csv", row.names = F)

# ------------------------------------------------------------------------------
# enrich 

dates = 1:dim(clean_df)[1]
class(dates) = "Date"
clean_df = clean_df %>% ungroup() %>%  arrange(game, turn) %>% mutate(date = dates)

write.csv2(clean_df, file = "enrich_df_B10.csv", row.names = F)



















# ------------------------------------------------------------------------------
#clean 

df = read.csv2("chess_com_games_2021-01-16_italian-game.csv", sep = ",")
df$X = NULL

# remove noise
glimpse(df)
move_condition = c("e4")
clean_df = df %>% 
  group_by(game) %>% 
  filter(first(move) %in% move_condition) %>% 
  filter(turn <= 10)
len_noise = dim(df) - dim(clean_df)  
print(len_noise)
glimpse(clean_df)

write.csv2(df, file = "clean_df_alfons_italian-game.csv", row.names = F)

# ------------------------------------------------------------------------------
# enrich 

dates = 1:dim(clean_df)[1]
class(dates) = "Date"
clean_df = clean_df %>% ungroup() %>%  arrange(game, turn) %>% mutate(date = dates)

write.csv2(clean_df, file = "enrich_df_alfons_italian-game.csv", row.names = F)





