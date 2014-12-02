//
//  BattleClasses.swift
//  Cool Sword SVA 0.02
//
//  Created by Victor Cook on 11/30/14.
//  Copyright (c) 2014 Victor Cook. All rights reserved.
//

import Foundation

class playerChar {
    let playerName: String
    let playerHitPoints: Int
    let playerAttackPower: Int
    var playerCurrentHitPoints: Int
    
    init(playerName: String, playerHitPoints: Int, playerAttackPower: Int) {
        self.playerName = playerName
        self.playerHitPoints = playerHitPoints
        self.playerAttackPower = playerAttackPower
        self.playerCurrentHitPoints = playerHitPoints
    }
    
    func yourDamage(normHit: Bool, critHit: Bool) ->Int {
        var dmg = Int (arc4random() % UInt32(playerAttackPower) + 1)
        if normHit == true && critHit == true {
            dmg = dmg + playerAttackPower
        }
        return dmg
    }
    
    func damageTaken(dmgTkn: Int) {
        playerCurrentHitPoints = playerCurrentHitPoints - dmgTkn
    }
}