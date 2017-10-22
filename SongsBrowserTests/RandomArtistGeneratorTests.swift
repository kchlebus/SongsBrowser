//
//  RandomArtistGeneratorTests.swift
//  SongsBrowserTests
//
//  Created by Kamil Chlebuś on 22/10/2017.
//  Copyright © 2017 Kamil Chlebuś. All rights reserved.
//

import XCTest
@testable import SongsBrowser

class RandomArtistGeneratorTests: XCTestCase {

    let artistsGenerator = RandomArtistGenerator()

    func testGetRandomValue() {
        let min = 0
        let max = 10
        for _ in min..<max {
            let randomValue = artistsGenerator.getRandomValue(from: min, to: max)
            XCTAssert(randomValue >= min, "Random value is less than min: \(randomValue)")
            XCTAssert(randomValue <= max, "Random value is greater than max: \(randomValue)")
        }
    }
    
}
