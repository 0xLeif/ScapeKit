//
//  ScapeSkillType.swift
//  
//
//  Created by Zach Eriksen on 10/28/20.
//

public enum ScapeSkillType: String, CaseIterable {
    // Free
    case attack
    case strength
    case defence
    case ranged
    case prayer
    case magic
    case runecraft
    case hitpoints
    case crafting
    case mining
    case smithing
    case fishing
    case cooking
    case firemaking
    case woodcutting
    
    // Members
    case agility
    case herblore
    case thieving
    case fletching
    case slayer
    case farming
    case construction
    case hunter
    
    public var name: String {
        rawValue.prefix(1).uppercased() + rawValue.dropFirst()
    }
}
