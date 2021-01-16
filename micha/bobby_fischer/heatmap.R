# https://vizual-statistix.tumblr.com/post/78821780083/when-i-started-this-blog-one-of-my-first

library(tidyverse)

get_board_matrix <- function(moves, color){

  board <- matrix(data = 0, nrow = 8, ncol = 8)
  
  for (i in seq(nrow(moves))){
    move = moves[i, 1]
    if (grepl("a1", move, fixed = TRUE)) board[8, 1] = board[8, 1] + 1
    if (grepl("a2", move, fixed = TRUE)) board[7, 1] = board[7, 1] + 1
    if (grepl("a3", move, fixed = TRUE)) board[6, 1] = board[6, 1] + 1
    if (grepl("a4", move, fixed = TRUE)) board[5, 1] = board[5, 1] + 1
    if (grepl("a5", move, fixed = TRUE)) board[4, 1] = board[4, 1] + 1
    if (grepl("a6", move, fixed = TRUE)) board[3, 1] = board[3, 1] + 1
    if (grepl("a7", move, fixed = TRUE)) board[2, 1] = board[2, 1] + 1
    if (grepl("a8", move, fixed = TRUE)) board[1, 1] = board[1, 1] + 1
    if (grepl("b1", move, fixed = TRUE)) board[8, 2] = board[8, 2] + 1
    if (grepl("b2", move, fixed = TRUE)) board[7, 2] = board[7, 2] + 1
    if (grepl("b3", move, fixed = TRUE)) board[6, 2] = board[6, 2] + 1
    if (grepl("b4", move, fixed = TRUE)) board[5, 2] = board[5, 2] + 1
    if (grepl("b5", move, fixed = TRUE)) board[4, 2] = board[4, 2] + 1
    if (grepl("b6", move, fixed = TRUE)) board[3, 2] = board[3, 2] + 1
    if (grepl("b7", move, fixed = TRUE)) board[2, 2] = board[2, 2] + 1
    if (grepl("b8", move, fixed = TRUE)) board[1, 2] = board[1, 2] + 1
    if (grepl("c1", move, fixed = TRUE)) board[8, 3] = board[8, 3] + 1
    if (grepl("c2", move, fixed = TRUE)) board[7, 3] = board[7, 3] + 1
    if (grepl("c3", move, fixed = TRUE)) board[6, 3] = board[6, 3] + 1
    if (grepl("c4", move, fixed = TRUE)) board[5, 3] = board[5, 3] + 1
    if (grepl("c5", move, fixed = TRUE)) board[4, 3] = board[4, 3] + 1
    if (grepl("c6", move, fixed = TRUE)) board[3, 3] = board[3, 3] + 1
    if (grepl("c7", move, fixed = TRUE)) board[2, 3] = board[2, 3] + 1
    if (grepl("c8", move, fixed = TRUE)) board[1, 3] = board[1, 3] + 1
    if (grepl("d1", move, fixed = TRUE)) board[8, 4] = board[8, 4] + 1
    if (grepl("d2", move, fixed = TRUE)) board[7, 4] = board[7, 4] + 1
    if (grepl("d3", move, fixed = TRUE)) board[6, 4] = board[6, 4] + 1
    if (grepl("d4", move, fixed = TRUE)) board[5, 4] = board[5, 4] + 1
    if (grepl("d5", move, fixed = TRUE)) board[4, 4] = board[4, 4] + 1
    if (grepl("d6", move, fixed = TRUE)) board[3, 4] = board[3, 4] + 1
    if (grepl("d7", move, fixed = TRUE)) board[2, 4] = board[2, 4] + 1
    if (grepl("d8", move, fixed = TRUE)) board[1, 4] = board[1, 4] + 1
    if (grepl("e1", move, fixed = TRUE)) board[8, 5] = board[8, 5] + 1
    if (grepl("e2", move, fixed = TRUE)) board[7, 5] = board[7, 5] + 1
    if (grepl("e3", move, fixed = TRUE)) board[6, 5] = board[6, 5] + 1
    if (grepl("e4", move, fixed = TRUE)) board[5, 5] = board[5, 5] + 1
    if (grepl("e5", move, fixed = TRUE)) board[4, 5] = board[4, 5] + 1
    if (grepl("e6", move, fixed = TRUE)) board[3, 5] = board[3, 5] + 1
    if (grepl("e7", move, fixed = TRUE)) board[2, 5] = board[2, 5] + 1
    if (grepl("e8", move, fixed = TRUE)) board[1, 5] = board[1, 5] + 1
    if (grepl("f1", move, fixed = TRUE)) board[8, 6] = board[8, 6] + 1
    if (grepl("f2", move, fixed = TRUE)) board[7, 6] = board[7, 6] + 1
    if (grepl("f3", move, fixed = TRUE)) board[6, 6] = board[6, 6] + 1
    if (grepl("f4", move, fixed = TRUE)) board[5, 6] = board[5, 6] + 1
    if (grepl("f5", move, fixed = TRUE)) board[4, 6] = board[4, 6] + 1
    if (grepl("f6", move, fixed = TRUE)) board[3, 6] = board[3, 6] + 1
    if (grepl("f7", move, fixed = TRUE)) board[2, 6] = board[2, 6] + 1
    if (grepl("f8", move, fixed = TRUE)) board[1, 6] = board[1, 6] + 1
    if (grepl("g1", move, fixed = TRUE)) board[8, 7] = board[8, 7] + 1
    if (grepl("g2", move, fixed = TRUE)) board[7, 7] = board[7, 7] + 1
    if (grepl("g3", move, fixed = TRUE)) board[6, 7] = board[6, 7] + 1
    if (grepl("g4", move, fixed = TRUE)) board[5, 7] = board[5, 7] + 1
    if (grepl("g5", move, fixed = TRUE)) board[4, 7] = board[4, 7] + 1
    if (grepl("g6", move, fixed = TRUE)) board[3, 7] = board[3, 7] + 1
    if (grepl("g7", move, fixed = TRUE)) board[2, 7] = board[2, 7] + 1
    if (grepl("g8", move, fixed = TRUE)) board[1, 7] = board[1, 7] + 1
    if (grepl("h1", move, fixed = TRUE)) board[8, 8] = board[8, 8] + 1
    if (grepl("h2", move, fixed = TRUE)) board[7, 8] = board[7, 8] + 1
    if (grepl("h3", move, fixed = TRUE)) board[6, 8] = board[6, 8] + 1
    if (grepl("h4", move, fixed = TRUE)) board[5, 8] = board[5, 8] + 1
    if (grepl("h5", move, fixed = TRUE)) board[4, 8] = board[4, 8] + 1
    if (grepl("h6", move, fixed = TRUE)) board[3, 8] = board[3, 8] + 1
    if (grepl("h7", move, fixed = TRUE)) board[2, 8] = board[2, 8] + 1
    if (grepl("h8", move, fixed = TRUE)) board[1, 8] = board[1, 8] + 1
    if (grepl("O-O", move, fixed = TRUE)){
      if (color == "White"){
        board[8, 7] = board[8, 7] + 1
        board[8, 6] = board[8, 6] + 1
      }
      if (color == "Black"){
        board[1, 7] = board[1, 7] + 1
        board[1, 6] = board[1, 6] + 1
      }
    }
    if (grepl("O-O-O", move, fixed = TRUE)){
      if (color == "White"){
        board[8, 3] = board[8, 3] + 1
        board[8, 4] = board[8, 4] + 1
      }
      if (color == "Black"){
        board[1, 3] = board[1, 3] + 1
        board[1, 4] = board[1, 4] + 1
      }
    }
  }
  
  row.names(board) <- c("8", "7", "6", "5", "4", "3", "2", "1")
  colnames(board) <- c("A", "B", "C", "D", "E", "F", "G", "H")
  
  return(board)
}

visualize_heatmap <- function(board, low = "ghostwhite", high = "royalblue4",
                              title = "Chess Tile Heatmap"){
  
  melted_board <- board %>% 
    as.data.frame() %>%
    rownames_to_column("board_row") %>%
    pivot_longer(-c(board_row), names_to = "board_col", values_to = "Count")
  
  p <- ggplot(melted_board, aes(x=board_col, y=board_row, fill=Count)) + 
        geom_raster() +
        scale_fill_gradient(low = low, high = high) +
        ggtitle(title) + 
        xlab("Board Column") + 
        ylab("Board Row") + 
        theme_minimal()
  
  return(p)
}
