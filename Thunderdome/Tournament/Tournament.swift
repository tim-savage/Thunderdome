//
//  Tournament.swift
//  Thunderdome
//
//  Created by Tim Savage on 5/3/21.
//

import Foundation

protocol Tournament {
	
	var contestants: [String:Contestant] { get set }
	var winner: Contestant? { get set }

	func getRandomContestants(count: Int) -> [Contestant]
	mutating func eliminate(contestant: Contestant)
	mutating func begin()
	func announceWinner()
}


extension Tournament {
	
	func getRandomContestants(count: Int) -> [Contestant] {
		return Array(contestants.values.shuffled().prefix(count))
	}

	mutating func eliminate(contestant: Contestant) {
		contestants.removeValue(forKey: contestant.name)
	}

	func announceWinner() {
		if self.winner != nil {
			print("WINNER:", self.winner!)
		}
		else {
			print("There was no winner.")
		}
	}

}
