library(tidyverse)

df = read.csv2("bobby_fisher_games.csv", sep = ",")
df$X = NULL

df <- dplyr::filter(df, grepl("Fischer|fischer", player))
df <- df[which(df$color=="White"),]
df <- df[which(df$turn<=20),]

write.csv2(df, file = "df_white.csv", row.names = F)

df = read.csv2("bobby_fisher_games.csv", sep = ",")
df$X = NULL

df <- dplyr::filter(df, grepl("Fischer|fischer", player))
df <- df[which(df$color=="Black"),]
df <- df[which(df$turn<=20),]

write.csv2(df, file = "df_black.csv", row.names = F)