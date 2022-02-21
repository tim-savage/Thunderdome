//
//  Thunderdome.swift
//  Thunderdome
//
//  Created by Tim Savage on 5/3/21.
//

import Foundation

struct Thunderdome: Tournament {
	
	internal var contestants: [String:Contestant] = [:]
	var winner: Contestant?
	let verbose: Bool

	init(people: [String:(Int,Int)], verbose: Bool) {
		self.verbose = verbose
		for key in people.keys {
			let (lp, exp) = people[key]!
			contestants[key] = ScienceGeek(name: key, lifePoints: lp, experience: exp)
		}
	}


	mutating func begin() {
		
		guard !contestants.isEmpty else {
			print("There are no contestants.")
			return
		}
		
		guard contestants.count > 1 else {
			print("There is only one contestant.")
			winner = contestants.values.first
			return
		}

		while contestants.count > 1 {
			let matchContestants = getRandomContestants(count: 2)
			var contestant1 = matchContestants[0] as! SciencePerson
			var contestant2 = matchContestants[1] as! SciencePerson
			if self.verbose {
				print("BEGIN THUNDERDOME:")
				print(contestant1)
				print(contestant2)
			}
			var roundNumber = 0
			while contestant1.lifePoints > 0 && contestant2.lifePoints > 0 {
				contestant2.collaborate(target: &contestant1)
				if (contestant1 is EvolvableSciencePerson) {
					contestant1 = (contestant1 as! EvolvableSciencePerson).evolve()
				}
				if (contestant2 is EvolvableSciencePerson) {
					contestant2 = (contestant2 as! EvolvableSciencePerson).evolve()
				}
				if self.verbose {
					 print("-----------------")
					 print("After round", roundNumber)
					 print("-----------------")
					 print(contestant1)
					 print(contestant2)
				}
				eliminateOrUpdate(contestant: contestant1)
				eliminateOrUpdate(contestant: contestant2)
				roundNumber += 1
			}
		}
		winner = contestants.values.first
	}
	

	mutating func eliminateOrUpdate(contestant: SciencePerson) {
		if contestant.lifePoints <= 0 {
			eliminate(contestant: contestant)
			if self.verbose {
				print(contestant.name, "eliminated!")
			}
		}
		else {
			contestants.updateValue(contestant, forKey: contestant.name)
		}
	}

}
