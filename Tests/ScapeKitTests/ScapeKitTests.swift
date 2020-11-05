import XCTest
@testable import ScapeKit

final class ScapeKitTests: XCTestCase {
    func testSkill() {
        let skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 1,
                               maxLevel: 99)
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 1)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 0)
    }
    
    func testSkillCustomName() {
        let skill = ScapeSkill(name: "Archery",
                               type: ScapeSkillType.ranged,
                               currentLevel: 1,
                               maxLevel: 99)
        
        XCTAssertEqual(skill.name, "Archery")
        XCTAssertEqual(skill.currentLevel, 1)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 0)
    }
    
    func testSkillLevelUp_1() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 1,
                               maxLevel: 99)
        
        skill.levelUp()
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 2)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 83)
    }
    
    func testSkillLevelUp_5() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 1,
                               maxLevel: 99)
        
        skill.levelUp(levels: 5)
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 6)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 512)
    }
    
    func testSkillLevelUp_10() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 1,
                               maxLevel: 99)
        
        skill.levelUp(levels: 10)
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 11)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 1358)
    }
    
    func testSkillLevelUp_98() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 1,
                               maxLevel: 99)
        
        skill.levelUp(levels: 98)
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 99)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 13_034_431)
    }
    
    func testSkillLevelUp_99() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 1,
                               maxLevel: 99)
        
        skill.levelUp(levels: 99)
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 99)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 13_034_431)
    }
    
    func testSkillLevelUp_100() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 1,
                               maxLevel: 99)
        
        skill.levelUp(levels: 100)
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 99)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 13_034_431)
    }
    
    func testSkillGainExperience_1_Level() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 1,
                               maxLevel: 99)
        
        skill.gain(experience: ScapeSkill.experience(forLevel: skill.currentLevel + 1))
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 2)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 83)
    }
    
    func testSkillGainExperience_5_Level() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 1,
                               maxLevel: 99)
        
        skill.gain(experience: ScapeSkill.experience(forLevel: skill.currentLevel + 5))
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 6)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 512)
    }
    
    func testSkillGainExperience_10_Level() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 1,
                               maxLevel: 99)
        
        skill.gain(experience: ScapeSkill.experience(forLevel: skill.currentLevel + 10))
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 11)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 1358)
    }
    
    func testSkillGainExperience_98_Level() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 1,
                               maxLevel: 99)
        
        skill.gain(experience: ScapeSkill.experience(forLevel: skill.currentLevel + 98))
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 99)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 13_034_431)
    }
    
    func testSkillGainExperience_99_Level() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 1,
                               maxLevel: 99)
        
        skill.gain(experience: ScapeSkill.experience(forLevel: skill.currentLevel + 99))
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 99)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 14_391_160)
    }
    
    func testSkillGainExperience_100_Level() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 1,
                               maxLevel: 99)
        
        skill.gain(experience: ScapeSkill.experience(forLevel: skill.currentLevel + 100))
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 99)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 15_889_109)
    }
    
    func testSkillLevelDown_1() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 99,
                               maxLevel: 99)
        
        skill.levelDown()
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 98)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 11_805_606)
    }
    
    func testSkillLevelDown_5() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 99,
                               maxLevel: 99)
        
        skill.levelDown(levels: 5)
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 94)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 7_944_614)
    }
    
    func testSkillLevelDown_10() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 99,
                               maxLevel: 99)
        
        skill.levelDown(levels: 10)
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 89)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 4_842_295)
    }
    
    func testSkillLevelDown_98() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 99,
                               maxLevel: 99)
        
        skill.levelDown(levels: 98)
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 1)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 0)
    }
    
    func testSkillLevelDown_99() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 99,
                               maxLevel: 99)
        
        skill.levelDown(levels: 99)
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 1)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 0)
    }
    
    func testSkillLevelDown_100() {
        var skill = ScapeSkill(type: ScapeSkillType.ranged,
                               currentLevel: 99,
                               maxLevel: 99)
        
        skill.levelDown(levels: 100)
        
        XCTAssertEqual(skill.name, "Ranged")
        XCTAssertEqual(skill.currentLevel, 1)
        XCTAssertEqual(skill.maxLevel, 99)
        XCTAssertEqual(skill.currentExperience, 0)
    }

    static var allTests = [
        ("testSkill", testSkill),
        ("testSkillLevelUp_1", testSkillLevelUp_1),
        ("testSkillLevelUp_5", testSkillLevelUp_5),
        ("testSkillLevelUp_10", testSkillLevelUp_10),
        ("testSkillLevelUp_98", testSkillLevelUp_98),
        ("testSkillLevelUp_99", testSkillLevelUp_99),
        ("testSkillLevelUp_100", testSkillLevelUp_100),
        ("testSkillGainExperience_1_Level", testSkillGainExperience_1_Level),
        ("testSkillGainExperience_5_Level", testSkillGainExperience_5_Level),
        ("testSkillGainExperience_10_Level", testSkillGainExperience_10_Level),
        ("testSkillGainExperience_98_Level", testSkillGainExperience_98_Level),
        ("testSkillGainExperience_99_Level", testSkillGainExperience_99_Level),
        ("testSkillGainExperience_100_Level", testSkillGainExperience_100_Level),
        ("testSkillLevelDown_1", testSkillLevelDown_1),
        ("testSkillLevelDown_5", testSkillLevelDown_5),
        ("testSkillLevelDown_10", testSkillLevelDown_10),
        ("testSkillLevelDown_98", testSkillLevelDown_98),
        ("testSkillLevelDown_99", testSkillLevelDown_99),
        ("testSkillLevelDown_100", testSkillLevelDown_100),
    ]
}
