//
//  StreetbeesiOSChallengeTests.swift
//  StreetbeesiOSChallengeTests
//
//  Created by Benoit Deguine on 23/06/2018.
//  Copyright © 2018 Benoit Deguine. All rights reserved.
//

import XCTest
@testable import StreetbeesiOSChallenge

class StreetbeesiOSChallengeTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStringToMD5() {
        let myString = "Benoît"
        XCTAssertEqual(myString.toMD5(), "99e2e84aa685ea585d735b3a0fa389d5")
    }
    
    func testGenerateUrl() {
        let url = "http://gateway.marvel.com/v1/public/comics?"
        
        let timestamp = NSDate().timeIntervalSince1970
        let ts:String = "\(timestamp)"

        // hash - a md5 digest of the ts parameter, your private key and your public key (e.g. md5(ts+privateKey+publicKey)
        print(url + "ts=" + ts + "&apikey=" + API.APIPublicKey + "&hash=" + String(ts+API.APIPrivateKey+API.APIPublicKey).toMD5())
    }

    
}
