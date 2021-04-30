//
//  Athlete.swift
//  FavoriteAthlete
//
//  Created by Med Mohanna on 30.04.21.
//

import Foundation

struct Athlete, CustomStringConvertible{
    let name: String
    let age: String
    let league: String
    let team: String
    
    var description: String{
        return "\(name) is \(age) years old and plays for the \(team) in the \(league)"
    }
    
    
}
