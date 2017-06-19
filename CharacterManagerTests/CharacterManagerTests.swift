//
//  CharacterManagerTests.swift
//  CharacterManagerTests
//
//  Created by Brent Fordham on 4/25/17.
//  Copyright © 2017 Brent Fordham. All rights reserved.
//

import XCTest
@testable import CharacterManager

class CharacterManagerTests: XCTestCase {
    
    func testCharacterFromJSONDictionary() {
        let newCharacter = Mage(name: "Paulinus")
        let jsonDictionary = newCharacter.jsonObject
        let characterFromJSON = Mage(jsonObject: jsonDictionary)
        XCTAssertEqual(newCharacter, characterFromJSON)
    }
    
}
