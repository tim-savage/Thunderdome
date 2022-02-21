//
//  main.swift
//  Thunderdome
//
//  Created by Tim Savage on 4/26/21.
//

import Foundation

let dict1: [String:(Int,Int)] = [
	"Captain Ahab": (25, 0),
	"Mr. Bean": (20, 10),
	"Elmo": (100, 2),
]

var game = Thunderdome(people: dict1, verbose: true)

game.begin()
game.announceWinner()
