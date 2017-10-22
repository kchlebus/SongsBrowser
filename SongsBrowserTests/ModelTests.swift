//
//  ModelTests.swift
//  SongsBrowserTests
//
//  Created by Kamil Chlebuś on 21/10/2017.
//  Copyright © 2017 Kamil Chlebuś. All rights reserved.
//

import XCTest
@testable import SongsBrowser

class ModelTests: XCTestCase {

    private var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }

    func testTrackSerialization() {
        let trackData = MockData.Tracks.track1
        do {
            let data = try JSONSerialization.data(withJSONObject: trackData, options: [])
            let track = try decoder.decode(Track.self, from: data)
            XCTAssertNotNil(track)
            XCTAssertEqual(track.artistName, trackData["artistName"] as! String)
            XCTAssertEqual(track.artworkUrl, URL(string: trackData["artworkUrl100"] as! String)!)
            XCTAssertEqual(track.collectionName, (trackData["collectionName"] as! String))
            XCTAssertEqual(track.genre, trackData["primaryGenreName"] as! String)
            XCTAssertEqual(track.releaseDate, ISO8601DateFormatter().date(from: trackData["releaseDate"] as! String))
            XCTAssertEqual(track.trackCount, trackData["trackCount"] as? Int)
        } catch {
            XCTAssertNil(error, "\(error)")
        }
    }

    func testResponseDataSerialization() {
        let responseData: [String: Any] = ["resultCount":50,"results": [MockData.Tracks.track1, MockData.Tracks.track2]]
        do {
            let data = try JSONSerialization.data(withJSONObject: responseData, options: [])
            let response = try decoder.decode(ResponseData.self, from: data)
            XCTAssertNotNil(response)
            XCTAssertEqual(response.resultCount, responseData["resultCount"] as! Int)
            let results = responseData["results"] as! [[String: Any]]
            XCTAssertEqual(response.results.count, results.count)
            let track1 = response.results[0]
            let track2 = response.results[1]
            XCTAssertEqual(track1.artistName, results[0]["artistName"] as! String)
            XCTAssertEqual(track2.artistName, results[1]["artistName"] as! String)
            XCTAssertEqual(track1.artworkUrl, URL(string: results[0]["artworkUrl100"] as! String)!)
            XCTAssertEqual(track2.artworkUrl, URL(string: results[1]["artworkUrl100"] as! String)!)
            XCTAssertEqual(track1.releaseDate, ISO8601DateFormatter().date(from: results[0]["releaseDate"] as! String))
            XCTAssertEqual(track2.releaseDate, ISO8601DateFormatter().date(from: results[1]["releaseDate"] as! String))
            XCTAssertEqual(track1.trackCount, results[0]["trackCount"] as? Int)
            XCTAssertEqual(track2.trackCount, results[1]["trackCount"] as? Int)
        } catch {
            XCTAssertNil(error, "\(error)")
        }
    }
    
}
