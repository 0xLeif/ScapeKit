//
//  SkillLevelAction.swift
//  
//
//  Created by Zach Eriksen on 10/31/20.
//


public enum SkillActionResult {
    case fail
    case succeed(Int)
}

public protocol SkillLevelAction {
    var name: String { get set }
    var level: Int { get set }
    
    func result(forLevel level: Int) -> SkillActionResult
    func resultDescription(forLevel level: Int) -> String
}

public struct ScapeSkillAction: SkillLevelAction {
    public var name: String
    public var level: Int
    
    public func result(forLevel level: Int) -> SkillActionResult {
        guard level >= self.level else {
            return .fail
        }
        
        guard level > self.level else {
            return Bool.random() ? .succeed(Int.random(in: 0 ... 1)) : .fail
        }
        
        return .succeed(Int.random(in: 0 ... (level - self.level)))
    }
    
    public func resultDescription(forLevel level: Int) -> String {
        switch result(forLevel: level) {
        case .fail:
            return "\(name) (Required Level: \(self.level)): Failed for level \(level)"
        case .succeed(let i):
            return "\(name) (Required Level: \(self.level)): Succeeded with a value of \(i) for level \(level)"
        }
    }
}
