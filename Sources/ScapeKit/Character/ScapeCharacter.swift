//
//  ScapeCharacter.swift
//  
//
//  Created by Zach Eriksen on 10/28/20.
//

public struct ScapeCharacter {
    public var name: String
    
    public var skills: [ScapeSkillType: ScapeSkill] = ScapeSkillType.allCases.reduce(into: [:]) { (skills, type) in
        skills[type] = ScapeSkill(name: type.name, currentLevel: 1, maxLevel: 99)
    }
}


public extension ScapeCharacter {
    var totalLevel: Int {
        skills
            .map { (key, value) in
                value.currentLevel
            }
            .reduce(0, +)
    }
}
