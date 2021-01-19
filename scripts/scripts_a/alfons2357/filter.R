df = read.csv2("chess_com_games_2020-12-15_2020-12-08.csv", sep = ",")
df$X = NULL

df <- df[which(df$player=="Alfons2357"),]
df <- df[which(df$color=="White"),]
df <- df[which(df$turn<=20),]

write.csv2(df, file = "df_white.csv", row.names = F)

df = read.csv2("chess_com_games_2020-12-15_2020-12-08.csv", sep = ",")
df$X = NULL

df <- df[which(df$player=="Alfons2357"),]
df <- df[which(df$color=="Black"),]
df <- df[which(df$turn<=20),]

write.csv2(df, file = "df_black.csv", row.names = F)