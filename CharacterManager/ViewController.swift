//
//  ViewController.swift
//  CharacterManager
//
//  Created by Brent Fordham on 4/25/17.
//  Copyright © 2017 Brent Fordham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet var nameField: UITextField!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "createFighter"?:
            let name = nameField.text ?? ""
            let character = Fighter(name: name)
            let characterSheet = segue.destination as! CharacterSheetViewController
            characterSheet.currentCharacter = character
        case "createExpert"?:
            let name = nameField.text ?? ""
            let character = Expert(name: name)
            let characterSheet = segue.destination as! CharacterSheetViewController
            characterSheet.currentCharacter = character
        case "createMage"?:
            let name = nameField.text ?? ""
            let character = Mage(name: name)
            let characterSheet = segue.destination as! CharacterSheetViewController
            characterSheet.currentCharacter = character
        default:
            preconditionFailure("unexpected segue identifier")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

