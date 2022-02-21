//
//  SciencePerson.swift
//  Thunderdome
//
//  Created by Tim Savage on 4/26/21.
//

import Foundation


protocol SciencePerson: Contestant {

	static var incomingDamageFactor: Double { get }
	static var outgoingDamageFactor: Double { get }

	var lifePoints: Int { get set }
	var experience: Int { get set }

	mutating func collaborate(target: inout SciencePerson)
}


extension SciencePerson {
	
	var description: String {
		return "\(self.name) - life_points=\(self.lifePoints) experience=\(self.experience) level=\(type(of: self))"
	}


	mutating func collaborate(target: inout SciencePerson) {
		if type(of: target) == type(of: self) {
			self.lifePoints -= Int(max(1, abs(Double(target.experience - self.experience) / 2.0).rounded(.toNearestOrEven)))
			target.lifePoints -= Int(max(1, abs(Double(self.experience - target.experience) / 2.0).rounded(.toNearestOrEven)))
		}
		else {
			self.lifePoints -= Int(max(1, abs(Double(target.experience - self.experience) / 2.0) * Self.incomingDamageFactor).rounded(.toNearestOrEven))
			target.lifePoints -= Int(max(1, abs(Double(self.experience - target.experience) / 2.0) * Self.outgoingDamageFactor).rounded(.toNearestOrEven))
		}
		self.experience += 1
		target.experience += 1
	}
}


protocol EvolvableSciencePerson: SciencePerson {
	
	static var evolveLevel: Int { get }

	func evolve() -> SciencePerson
}


extension EvolvableSciencePerson {

	func evolve() -> SciencePerson {
		if (self is ScienceGeek) {
			if (self.experience >= ScienceGeek.evolveLevel) {
				return Scientist(name: self.name, lifePoints: self.lifePoints, experience: self.experience)
			}
		}
		else if (self is Scientist) {
			if (self.experience >= Scientist.evolveLevel) {
				return MadScientist(name: self.name, lifePoints: self.lifePoints, experience: self.experience)
			}
		}
		return self
	}
	
}
