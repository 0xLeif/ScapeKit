//
//  ScapeKitCharacterTests.swift
//  
//
//  Created by Zach Eriksen on 11/4/20.
//

import Foundation
import XCTest
@testable import ScapeKit

final class ScapeKitCharacterTests: XCTestCase {
    func testCharacter() {
        let character = ScapeCharacter(name: "Hans")
        
        XCTAssertEqual(character.skills[.ranged]?.name, "Ranged")
        XCTAssertEqual(character.skills[.ranged]?.currentLevel, 1)
        XCTAssertEqual(character.skills[.ranged]?.maxLevel, 99)
        XCTAssertEqual(character.skills[.ranged]?.currentExperience, 0)
        
        XCTAssertEqual(character.skills.count, 23)
        XCTAssertEqual(character.totalLevel, 23)
    }
    
    func testCharacter_noSkills() {
        let character = ScapeCharacter(name: "Hans", skills: [:])
        
        XCTAssertNil(character.skills[.ranged])
        
        XCTAssertEqual(character.skills.count, 0)
        XCTAssertEqual(character.totalLevel, 0)
    }
    
    func testCharacter_ranged10() {
        var character = ScapeCharacter(name: "Hans")
        
        character.skills[.ranged]?.levelUp(levels: 9)
        
        XCTAssertEqual(character.skills[.ranged]?.name, "Ranged")
        XCTAssertEqual(character.skills[.ranged]?.currentLevel, 10)
        XCTAssertEqual(character.skills[.ranged]?.maxLevel, 99)
        XCTAssertEqual(character.skills[.ranged]?.currentExperience, 1154)
        
        XCTAssertEqual(character.skills.count, 23)
        XCTAssertEqual(character.totalLevel, 32)
    }
    
    func testCharacter_maxed() {
        var character = ScapeCharacter(name: "Hans")
        
        ScapeSkillType.allCases.forEach {
            character.skills[$0]?.levelUp(levels: 98)
        }
        
        XCTAssertEqual(character.skills[.ranged]?.name, "Ranged")
        XCTAssertEqual(character.skills[.ranged]?.currentLevel, 99)
        XCTAssertEqual(character.skills[.ranged]?.maxLevel, 99)
        XCTAssertEqual(character.skills[.ranged]?.currentExperience, 13034431)
        
        XCTAssertEqual(character.skills.count, 23)
        XCTAssertEqual(character.totalLevel, 2277)
    }
    

    static var allTests = [
        ("testCharacter", testCharacter),
        ("testCharacter_noSkills", testCharacter_noSkills),
        ("testCharacter_ranged10", testCharacter_ranged10),
        ("testCharacter_maxed", testCharacter_maxed)
    ]
}
