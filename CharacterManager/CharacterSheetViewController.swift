//
//  CharacterSheetViewController.swift
//  CharacterManager
//
//  Created by Brent Fordham on 5/29/17.
//  Copyright © 2017 Brent Fordham. All rights reserved.
//

import Foundation
import UIKit

class CharacterSheetViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var classLabel: UILabel!
    @IBOutlet var levelLabel: UILabel!
    @IBOutlet var xpLabel: UILabel!
    @IBOutlet var strLabel: UILabel!
    @IBOutlet var dexLabel: UILabel!
    @IBOutlet var conLabel: UILabel!
    @IBOutlet var intLabel: UILabel!
    @IBOutlet var wisLabel: UILabel!
    @IBOutlet var chaLabel: UILabel!
    @IBOutlet var hpLabel: UILabel!
    @IBOutlet var mpLabel: UILabel!
    @IBOutlet var conditionLabel: UILabel!
    
    var currentCharacter: PlayerCharacter!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameLabel.text = currentCharacter.name
        classLabel.text = currentCharacter.className
        levelLabel.text = "\(currentCharacter.charLevel)"
        xpLabel.text = "\(currentCharacter.charXP)"
        strLabel.text = "\(currentCharacter.str)"
        dexLabel.text = "\(currentCharacter.dex)"
        conLabel.text = "\(currentCharacter.con)"
        intLabel.text = "\(currentCharacter.int)"
        wisLabel.text = "\(currentCharacter.wis)"
        chaLabel.text = "\(currentCharacter.cha)"
        hpLabel.text = "\(currentCharacter.currentHP)"
        mpLabel.text = "\(currentCharacter.currentMP)"
        conditionLabel.text = currentCharacter.status.description
    }
    
    func updateHPDisplay() {
        hpLabel.text = "\(currentCharacter.currentHP)"
        conditionLabel.text = currentCharacter.status.description
    }
    
    @IBAction func heal(_ sender: UIButton) {
        currentCharacter.increaseHPBy(1)
        updateHPDisplay()
    }
    
    @IBAction func heal10(_ sender: UIButton) {
        currentCharacter.increaseHPBy(10)
        updateHPDisplay()
    }
    
    @IBAction func wound(_ sender: UIButton) {
        currentCharacter.reduceHPBy(1)
        updateHPDisplay()
    }
    
    @IBAction func wound10(_ sender: UIButton) {
        currentCharacter.reduceHPBy(10)
        updateHPDisplay()
    }
}
