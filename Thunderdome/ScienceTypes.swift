//
//  ScienceTypes.swift
//  Thunderdome
//
//  Created by Tim Savage on 4/26/21.
//

struct ScienceGeek: EvolvableSciencePerson {
	static let incomingDamageFactor: Double = 1.0
	static let outgoingDamageFactor: Double = 1.0
	static let evolveLevel = 4

	var name: String
	var lifePoints: Int
	var experience: Int
}


struct Scientist: EvolvableSciencePerson {
	static let incomingDamageFactor: Double = 0.75
	static let outgoingDamageFactor: Double = 1.5
	static let evolveLevel = 8

	var name: String
	var lifePoints: Int
	var experience: Int
}


struct MadScientist: SciencePerson {
	static let incomingDamageFactor: Double = 0.5
	static let outgoingDamageFactor: Double = 2.0

	var name: String
	var lifePoints: Int
	var experience: Int
}
