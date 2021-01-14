#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import re
import json
import chess.pgn
import traceback as tb

def get_data(pgn_file):
    node = chess.pgn.read_game(pgn_file)
    while node is not None:
        data = node.headers

        data["moves"] = []
        data["timestamp"] = []

        while node.variations:
            next_node = node.variation(0)
            #data ["timestamp"].append(re.findall(".\:..\:..", next_node.comment)[0])
            data["moves"].append(re.sub("\{.*?\}", "", node.board().san(next_node.move)))
            node = next_node

        node = chess.pgn.read_game(pgn_file)

        out_dict = {}

        for key in data.keys():
            out_dict[key] = data.get(key)

        yield out_dict


def convert_file(file_path):
    file_name = file_path.split(".")[0] + ".json"
    out_list = []
    try:
        json_file = open(file_name, "w")
        pgn_file = open(file_path, encoding = "utf-8")

        for count_d, data in enumerate(get_data(pgn_file), start = 0):
            out_list.append(data)

        json.dump(out_list, json_file)
        json_file.close()
        pgn_file.close()
    except Exception as e:
        tb.print_exc()
        print("ERROR file " + file_name + " not converted")

if __name__ == "__main__":
    #convert_file("chess_com_games_2020-12-15_2020-12-08.pgn")
    #convert_file("C54.pgn")
    convert_file("B10.pgn")
