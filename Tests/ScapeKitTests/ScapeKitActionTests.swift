//
//  ScapeKitActionTests.swift
//  
//
//  Created by Zach Eriksen on 10/31/20.
//

import XCTest
@testable import ScapeKit

final class ScapeKitActionTests: XCTestCase {
    func testSkillAction_none() {
        let skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 1,
                               maxLevel: 99)
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 1)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 0)
        
        let nonexistentActionName = "Some Action"
        
        let skillActionResult = skill.roll(actionNamed: nonexistentActionName)
        let skillActionResultText = skill.use(actionNamed: nonexistentActionName)
        
        XCTAssertNil(skillActionResult)
        XCTAssertEqual(skillActionResultText, "The Skill Some Action does not contain an action named: \(nonexistentActionName)")
    }
    
    func testSkillAction_lowerLevel() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 1,
                               maxLevel: 99)
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 1)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 0)
        
        let skillAction = ScapeSkillAction(name: "Arrow Volley", level: 10)
        
        skill.actions.append(skillAction)
        
        let skillActionResult = skill.roll(actionNamed: "Arrow Volley")
        let skillActionResultText = skill.use(actionNamed: "Arrow Volley")
        
        XCTAssertEqual(skillActionResult, SkillActionResult.fail)
        XCTAssertEqual(skillActionResultText, "Arrow Volley (Required Level: 10): Failed for level 1")
    }
    
    func testSkillAction_sameLevel() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 1,
                               maxLevel: 99)
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 1)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 0)
        
        skill.levelUp(levels: 9)
        
        let skillAction = ScapeSkillAction(name: "Arrow Volley", level: 10)
        
        skill.actions.append(skillAction)
        
        let skillActionResult = skill.roll(actionNamed: "Arrow Volley")
        let skillActionResultText = skill.use(actionNamed: "Arrow Volley")
        
        switch skillActionResult {
        case .succeed(let value):
            XCTAssertGreaterThanOrEqual(value, 0)
            XCTAssertLessThanOrEqual(value, 1)
        case .fail:
            XCTAssertEqual(skillActionResult, SkillActionResult.fail)
        case .none:
            XCTAssert(false)
        }
        
        var isValidFail: Bool {
            skillActionResultText == "Arrow Volley (Required Level: \(skillAction.level)): Failed for level \(skill.currentLevel)"
        }
        
        var isValidSuccess: Bool {
            (0 ... skill.currentLevel)
                .map({ skillActionResultText == "Arrow Volley (Required Level: \(skillAction.level)): Succeeded with a value of \($0) for level \(skill.currentLevel)" })
                .reduce(into: false) { (result, value) in
                    if value {
                        result = true
                    }
                }
        }
        
        XCTAssert({ () -> Bool in
            isValidFail ||
                isValidSuccess
            
        }(), "Whoops! skillActionResultText: '\(skillActionResultText)'")
    }
    
    func testSkillAction_Level20() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 1,
                               maxLevel: 99)
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 1)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 0)
        
        skill.levelUp(levels: 19)
        
        let skillAction = ScapeSkillAction(name: "Arrow Volley", level: 10)
        
        skill.actions.append(skillAction)
        
        let skillActionResult = skill.roll(actionNamed: "Arrow Volley")
        let skillActionResultText = skill.use(actionNamed: "Arrow Volley")
        
        switch skillActionResult {
        case .succeed(let value):
            XCTAssertGreaterThanOrEqual(value, 0)
            XCTAssertLessThanOrEqual(value, 20)
        case .fail:
            XCTAssertEqual(skillActionResult, SkillActionResult.fail)
        case .none:
            XCTAssert(false)
        }
        
        var isValidFail: Bool {
            skillActionResultText == "Arrow Volley (Required Level: \(skillAction.level)): Failed for level \(skill.currentLevel)"
        }
        
        var isValidSuccess: Bool {
            (0 ... skill.currentLevel)
                .map({ skillActionResultText == "Arrow Volley (Required Level: \(skillAction.level)): Succeeded with a value of \($0) for level \(skill.currentLevel)" })
                .reduce(into: false) { (result, value) in
                    if value {
                        result = true
                    }
                }
        }
        
        XCTAssert({ () -> Bool in
            isValidFail ||
                isValidSuccess
            
        }(), "Whoops! skillActionResultText: '\(skillActionResultText)'")
    }
    
    static var allTests = [
        ("testSkillAction_none", testSkillAction_none),
        ("testSkillAction_lowerLevel", testSkillAction_lowerLevel),
        ("testSkillAction_sameLevel", testSkillAction_sameLevel),
        ("testSkillAction_Level20", testSkillAction_Level20)
    ]
}
