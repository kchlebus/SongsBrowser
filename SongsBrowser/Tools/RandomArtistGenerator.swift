//
//  RandomArtistGenerator.swift
//  SongsBrowser
//
//  Created by Kamil Chlebuś on 21/10/2017.
//  Copyright © 2017 Kamil Chlebuś. All rights reserved.
//

import Foundation

class RandomArtistGenerator {

    var artists = ["Linkin Park", "Coldplay", "Audiomachine", "Shakira", "David Guetta", "Led Zeppelin",
                   "Adele", "Thirty Seconds To Mars", "Tinie Tempah", "Imagine Dragons"]
    let storage: Storage = UserDefaultsManger()

    func getRandomArtist() -> String {
        var usedArtists = storage.getUsedArtists()
        var filteredArtists = artists.filter { return !usedArtists.contains($0) }

        let allArtistsWerePulled = filteredArtists.count == 0 && usedArtists.count >= artists.count
        if allArtistsWerePulled {
            resetArtistsPool(usedArtists: &usedArtists, filteredArtists: &filteredArtists)
        }

        guard let randomArtistIndex = getRandomArtistIndex(filteredArtists) else { return "" }
        let randomArtist = filteredArtists[randomArtistIndex]
        usedArtists.append(randomArtist)
        storage.saveUsedArtists(artists: usedArtists)

        return randomArtist
    }

    private func getRandomArtistIndex(_ filteredArtists: [String]) -> Int? {
        let randomArtistIndex = getRandomValue(from: 0, to: filteredArtists.count-1)
        if randomArtistIndex > filteredArtists.count-1 {
            debugPrint("Error: Artist index is out of range")
            return nil
        }
        return randomArtistIndex
    }

    func getRandomValue(from min: Int, to max: Int) -> Int {
        return min + Int(arc4random_uniform(UInt32(max - min + 1)))
    }

    private func resetArtistsPool(usedArtists: inout [String], filteredArtists: inout [String]) {
        storage.deleteUsedArtists()
        usedArtists = []
        filteredArtists.append(contentsOf: artists)
    }

}
