# ScapeKit

A package to manage Skills, Levels, and Experience.

## Example

```swift
var skill = ScapeSkill(name: ScapeSkillType.ranged.name,
   currentLevel: 1,
   maxLevel: 99)

skill.levelUp(levels: 5)

XCTAssertEqual(skill.name, "Ranged")
XCTAssertEqual(skill.currentLevel, 6)
XCTAssertEqual(skill.maxLevel, 99)
XCTAssertEqual(skill.currentExperience, 512)
```

***

**Inspired by RuneScape**

- [Skills](https://oldschool.runescape.wiki/w/Skills)
- [Experience](https://oldschool.runescape.wiki/w/Experience)