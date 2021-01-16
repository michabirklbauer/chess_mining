source("heatmap.R")

df <- read.csv2("df_white.csv")
moves <- df["move"]

board_w <- get_board_matrix(moves, color = "White")

p_1 <- visualize_heatmap(board_w, title = "Chess Tile Heatmap - Robert Fischer: White")
p_1

df <- read.csv2("df_black.csv")
moves <- df["move"]

board_b <- get_board_matrix(moves, color = "Black")

p_2 <- visualize_heatmap(board_b, title = "Chess Tile Heatmap - Robert Fischer: Black",
                         high = "firebrick3")
p_2

board <- board_b + board_w

p_3 <- visualize_heatmap(board, title = "Chess Tile Heatmap - Robert Fischer: Both Colours",
                         high = "black")
p_3
