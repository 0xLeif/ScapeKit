//
//  ScapeKitActionTests.swift
//  
//
//  Created by Zach Eriksen on 10/31/20.
//

import XCTest
@testable import ScapeKit

final class ScapeKitActionTests: XCTestCase {
    func testSkill() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 1,
                               maxLevel: 99)
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 1)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 0)
        
        let skillAction = ScapeSkillAction(name: "Arrow Volley", level: 10)
        
        skill.actions.append(skillAction)
        
        
    }
    
    static var allTests = [
        ("testSkill", testSkill),
    ]
}
