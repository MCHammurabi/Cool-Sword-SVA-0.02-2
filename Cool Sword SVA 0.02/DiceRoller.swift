//
//  DiceRoller.swift
//  Cool Sword SVA 0.01
//
//  Created by Victor Cook on 11/30/14.
//  Copyright (c) 2014 Victor Cook. All rights reserved.
//

import Foundation


func rollDice(sides: UInt32, rolls: Int) ->(Int,[Int]){         // dice rolling function
    var total = 0                                       // sets face total to zero
    var allRolls: [Int] = []
    for var roll = 0; roll < rolls; ++roll {            // rolls dice until finished
        var thisRoll = Int (arc4random() % sides) + 1   // assigns roll value to the die
        total = total + thisRoll                        // adds the current roll to the total
        allRolls.append(thisRoll)
        println(allRolls)
        println("Roll \(roll+1) is \(thisRoll) totaling \(total)")   // prints the current roll
        
    }
    println(allRolls)                                      // prints total before setting finTotal to total
    return (total, allRolls)                                 // supposed to return the final total
    
}

/*******HIT CHECK*******/
func didHit(hitChance: Int) ->(Bool, Bool) {

    var playerHit = false
    var playerCrit = false
    if hitChance >= 19 {
        playerHit = true
        playerCrit = true
    } else if hitChance >= 12 {
        playerHit = true
    }
    
    return (playerHit, playerCrit)

}

func hitPrint(normHit: Bool, critHit: Bool) -> NSString {
    var hitMSG = ""
    if critHit == true {
        hitMSG = "WAS A CRITICAL HIT!"
    } else if normHit == true {
        hitMSG = "HIT!"
    } else {
        hitMSG = "missed."
    }
    return hitMSG
}

/*******BATTLE TEXT DISPLAY*******/
func battleTextLines(textLines: [NSString]) ->NSString {
    var displayText = ""
    var maxLines = 8
    if textLines.count < 8 {
        maxLines = textLines.count
    }
    for var textLineNumber = 0; textLineNumber < maxLines; textLineNumber++ {
        if textLineNumber < textLines.count {
            var nextLine = textLines [(textLines.count - maxLines) + textLineNumber] + "\r"
            displayText = displayText + nextLine
        }
        
        }
    return displayText
}
