#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import json
import pandas as pd
import traceback as tb

def json_to_eventlog(file_path):

    with open(file_path, "r", encoding = "utf-8") as f:
        data = json.load(f)
        f.close()

    game = []
    player = []
    color = []
    move = []
    timestamp_1 = []

    game_counter = 1

    for match in data:
        move_counter = 1
        for mv in match["moves"]:
            game.append(game_counter)
            c = "White"
            if move_counter % 2 == 0:
                c = "Black"
            move_counter = move_counter + 1
            move.append(mv)
            timestamp_1.append(move_counter-1)
            color.append(c)
            player.append(match[c])
        game_counter = game_counter + 1

    df = pd.DataFrame({"game":game, "player":player, "color":color, "move":move, "turn":timestamp_1})

    df.to_csv(file_path.split(".")[0] + ".csv", sep = ",")

    return df

if __name__ == "__main__":
    json_to_eventlog("bobby_fisher_games.json")
