# ScapeKit

A package to manage Skills, Levels, and Experience.

## Example

```swift
let character = ScapeCharacter(name: "Hans")

XCTAssertEqual(character.skills[.ranged]?.name, "Ranged")
XCTAssertEqual(character.skills[.ranged]?.currentLevel, 1)
XCTAssertEqual(character.skills[.ranged]?.maxLevel, 99)
XCTAssertEqual(character.skills[.ranged]?.currentExperience, 0)

XCTAssertEqual(character.skills.count, 23)
XCTAssertEqual(character.totalLevel, 23)

XCTAssertEqual(character.skills[.ranged]?.name, "Ranged")
XCTAssertEqual(character.skills[.ranged]?.currentLevel, 1)
XCTAssertEqual(character.skills[.ranged]?.maxLevel, 99)
XCTAssertEqual(character.skills[.ranged]?.currentExperience, 0)

let nonexistentActionName = "Some Action"

let skillActionResult = character.skills[.ranged]?.roll(actionNamed: nonexistentActionName)
let skillActionResultText = character.skills[.ranged]?.use(actionNamed: nonexistentActionName)

XCTAssertNil(skillActionResult)
XCTAssertEqual(skillActionResultText, "The Skill Some Action does not contain an action named: \(nonexistentActionName)")

let skillAction = ScapeSkillAction(name: "Arrow Volley", level: 10)

character.skills[.ranged]?.actions.append(skillAction)

let skillActionResult = character.skills[.ranged]?.roll(actionNamed: "Arrow Volley")
let skillActionResultText = character.skills[.ranged]?.use(actionNamed: "Arrow Volley")

XCTAssertEqual(skillActionResult, SkillActionResult.fail)
XCTAssertEqual(skillActionResultText, "Arrow Volley (Required Level: 10): Failed for level 1")
```

***

**Inspired by RuneScape**

- [Skills](https://oldschool.runescape.wiki/w/Skills)
- [Experience](https://oldschool.runescape.wiki/w/Experience)
