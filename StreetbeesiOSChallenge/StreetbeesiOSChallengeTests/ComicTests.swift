//
//  Comic.swift
//  StreetbeesiOSChallengeTests
//
//  Created by Benoit Deguine on 23/06/2018.
//  Copyright © 2018 Benoit Deguine. All rights reserved.
//

import XCTest
@testable import StreetbeesiOSChallenge

class Comic: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func loadStubFromBundle(withName name: String, extension: String) -> Data {
        let bundle = Bundle(for: classForCoder)
        let url = bundle.url(forResource: name, withExtension: `extension`)
        
        return try! Data(contentsOf: url!)
    }
    
    func testJson() {
        let data = loadStubFromBundle(withName: "ComicData", extension: "json")
        let comicData:ComicData = try! JSONDecoder.decode(data: data)
        
        XCTAssertEqual(comicData.title, "Kabuki Reflections Vol. 1 (Hardcover)")
    }
    
    func testFullJson() {
        let data = loadStubFromBundle(withName: "exampleFull", extension: "json")
        let resultData:ResultData = try! JSONDecoder.decode(data: data)
        
        XCTAssertEqual(resultData.comics.first?.title, "Kabuki Reflections Vol. 1 (Hardcover)")
    }
    
    
}
