//
//  ScapeSkill.swift
//  
//
//  Created by Zach Eriksen on 10/28/20.
//

import Foundation

public struct ScapeSkill {
    public var type: ScapeSkillType
    public var name: String
    public var currentLevel: Int
    public var currentExperience: Int
    public var maxLevel: Int
    public var actions: [SkillLevelAction] = []
    
    public init(
        name: String,
        type: ScapeSkillType,
        currentLevel: Int = 1,
        maxLevel: Int = 99
    ) {
        self.name = name
        self.type = type
        self.currentLevel = currentLevel
        self.currentExperience = ScapeSkill.experience(forLevel: currentLevel)
        self.maxLevel = maxLevel
    }
    
    public init(
        type: ScapeSkillType,
        currentLevel: Int = 1,
        maxLevel: Int = 99
    ) {
        self.name = type.name
        self.type = type
        self.currentLevel = currentLevel
        self.currentExperience = ScapeSkill.experience(forLevel: currentLevel)
        self.maxLevel = maxLevel
    }
}

// MARK: action

public extension ScapeSkill {
    func use(actionNamed name: String) -> SkillActionResult? {
        actions
            .first(where: { $0.name == name })?
            .result(forLevel: currentLevel)
    }
    
    func use(actionNamed name: String) -> String {
        actions
            .first(where: { $0.name == name })?
            .resultDescription(forLevel: currentLevel) ?? "The Skill \(name) does not contain an action named: \(name)"
    }
}

// MARK: mutating

public extension ScapeSkill {
    mutating func gain(experience: Int) {
        currentExperience += experience
        
        while currentExperience >= ScapeSkill.experience(forLevel: currentLevel + 1),
              currentLevel < maxLevel {
            currentLevel += 1
        }
    }
    
    mutating func levelUp(levels: Int = 1) {
        let expLeft = currentExperience - ScapeSkill.experience(forLevel: currentLevel)
        
        defer {
            currentExperience = ScapeSkill.experience(forLevel: currentLevel) + expLeft
        }
        
        guard (currentLevel + levels) <= maxLevel else {
            currentLevel = maxLevel
            return
        }
        
        currentLevel += levels
    }
    
    mutating func levelDown(levels: Int = 1) {
        let expLeft = currentExperience - ScapeSkill.experience(forLevel: currentLevel)
        
        defer {
            currentExperience = ScapeSkill.experience(forLevel: currentLevel) + expLeft
        }
        
        guard (currentLevel - levels) >= 1 else {
            currentLevel = 1
            return
        }
        
        currentLevel -= levels
    }
}


// MARK: static

public extension ScapeSkill {
    static func experience(forLevel level: Int) -> Int {
        guard level > 1 else {
            return 0
        }
        
        return (1 ..< level)
            .map { x in
                let i = pow(2.0, Double(x) / 7.0)
                return x + Int(300 * i)
            }
            .reduce(0, +) / 4
    }
}
