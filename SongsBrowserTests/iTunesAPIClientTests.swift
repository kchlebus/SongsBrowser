//
//  iTunesAPIClientTests.swift
//  SongsBrowserTests
//
//  Created by Kamil Chlebuś on 21/10/2017.
//  Copyright © 2017 Kamil Chlebuś. All rights reserved.
//

import XCTest
@testable import SongsBrowser

class iTunesAPIClientTests: XCTestCase {

    private func wait() {
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testFetchTracks() {
        let artist = "Linkin Park"
        let expect = expectation(description: "Fetch tracks for given artist name")
        let client = iTunesAPIClient()
        client.fetchTracks(for: artist) { (tracks, error) in
            XCTAssertNil(error, "\(String(describing: error))")
            XCTAssert(tracks.count > 0, "No tasks fetched")
            expect.fulfill()
        }
        wait()
    }
    
}
