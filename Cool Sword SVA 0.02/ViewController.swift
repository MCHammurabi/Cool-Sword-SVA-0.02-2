//
//  ViewController.swift
//  Cool Sword SVA 0.02
//
//  Created by Victor Cook on 11/30/14.
//  Copyright (c) 2014 Victor Cook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var battleText: UITextView!
    @IBOutlet weak var playerNameText: UILabel!
    @IBOutlet weak var playerHealthText: UILabel!
    @IBOutlet weak var playerATKPwrText: UILabel!
    @IBOutlet weak var enemyNameText: UILabel!
    @IBOutlet weak var enemyHealthText: UILabel!
    @IBOutlet weak var winsText: UILabel!
    @IBOutlet weak var lossesText: UILabel!
    @IBOutlet weak var roundText: UILabel!

    
    let player1 = playerChar(playerName: "Lord Steven", playerHitPoints: 20, playerAttackPower: 4)
    let enemy1 = playerChar(playerName: "Savage Dragon", playerHitPoints: 30, playerAttackPower: 6)
    var battleOutput = [""]
    var round = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func attackButton(sender: AnyObject) {
        var rstAtk = false
        battleOutput.append("\r***** ROUND \(round) *****")
        roundText.text = String (round); round++
        println("You attacked!")
        var (diceTotal, diceRolled) = rollDice(10, 3)
        battleOutput.append("You attacked and rolled \(diceTotal).")
        var hitTest = didHit(diceTotal)
        println(hitTest)
        let hitText = hitPrint(hitTest.0, hitTest.1)
        
        battleOutput.append("Your attack \(hitText)")
        var atkDmg = player1.yourDamage(hitTest.0, critHit: hitTest.1)
        if hitTest.0 == true {
            battleOutput.append("\rYou did \(atkDmg) damage!")
            enemy1.damageTaken(atkDmg)
        }
        println("Enemy attacked!")
        let (diceTotalEnmy, diceRolledEnmy) = rollDice(20, 1)
        battleOutput.append("\rEnemy attacked and rolled \(diceTotalEnmy).")
        let hitTestEnmy = didHit(diceTotalEnmy)
        println(hitTestEnmy)
        let hitTextEnmy = hitPrint(hitTestEnmy.0, hitTestEnmy.1)
        
        battleOutput.append("Enemy attack \(hitTextEnmy)")
        atkDmg = enemy1.yourDamage(hitTestEnmy.0, critHit: hitTestEnmy.1)
        if hitTestEnmy.0 == true {
            battleOutput.append("\rEnemy did \(atkDmg) damage!")
            player1.damageTaken(atkDmg)
        }

 
        if player1.playerCurrentHitPoints < 1 {
            playerNameText.text = player1.playerName + " DEAD"
            rstAtk = true
            player1.playerLosses++
            battleOutput.append("\(player1.playerName) is dead.")
        }
        playerHealthText.text = "\(player1.playerCurrentHitPoints) / \(player1.playerHitPoints)"
        playerATKPwrText.text = "\(player1.playerAttackPower)"
        enemyNameText.text = enemy1.playerName
        if enemy1.playerCurrentHitPoints < 1 {
            enemyNameText.text = enemy1.playerName + " DEAD"
            rstAtk = true
            player1.playerWins++
            battleOutput.append("\(enemy1.playerName) is dead.")
        }
        battleOutput.removeAtIndex(0)
        battleText.text = battleTextLines(battleOutput)
        playerNameText.text = player1.playerName

        enemyHealthText.text = "\(enemy1.playerCurrentHitPoints) / \(enemy1.playerHitPoints)"
        if rstAtk == true {
            resetAttack()
        }
        winsText.text = "\(player1.playerWins)"
        lossesText.text = "\(player1.playerLosses)"
    }
    func resetAttack(){
        player1.playerCurrentHitPoints = player1.playerHitPoints
        enemy1.playerCurrentHitPoints = enemy1.playerHitPoints
        round = 1
    }


}

