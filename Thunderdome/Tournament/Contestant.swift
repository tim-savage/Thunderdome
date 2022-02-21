//
//  Contestant.swift
//  Thunderdome
//
//  Created by Tim Savage on 5/12/21.
//

protocol Contestant: CustomStringConvertible {
	var name: String { get }
}


extension Contestant {
	
	var description: String {
		return "\(self.name)"
	}

}
