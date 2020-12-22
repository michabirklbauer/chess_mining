#!/usr/bin/env python
# -*- coding: utf-8 -*-
import json
import chess.pgn
import re

def get_data(pgn_file):
    node = chess.pgn.read_game(pgn_file)
    while node is not None:
        data = node.headers

        data["moves"] = []

        while node.variations:
            next_node = node.variation(0)
            data["moves"].append(
                    re.sub("\{.*?\}", "", node.board().san(next_node.move)))
            node = next_node

        node = chess.pgn.read_game(pgn_file)

        out_dict = {}

        for key in data.keys():
            out_dict[key] = data.get(key)

        # log(data.get('Event'))
        yield out_dict


def convert_file(file_path):
    file_name = file_path.split(".")[0] + '.json'
    out_list = []
    try:
        json_file = open(file_name, 'w')
        pgn_file = open(file_path, encoding='utf-8')

        for count_d, data in enumerate(get_data(pgn_file), start=0):
            out_list.append(data)

        json.dump(out_list, json_file)
        json_file.close()
    except Exception as e:
        print('ERROR file '+file_name+' not converted')

