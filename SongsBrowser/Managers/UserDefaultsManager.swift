//
//  UserDefaultsManager.swift
//  SongsBrowser
//
//  Created by Kamil Chlebuś on 21/10/2017.
//  Copyright © 2017 Kamil Chlebuś. All rights reserved.
//

import Foundation

protocol Storage {

    func saveUsedArtists(artists: [String])
    func getUsedArtists() -> [String]
    func deleteUsedArtists()

}

class UserDefaultsManger: Storage {

    let userDefaults = UserDefaults.standard
    enum Keys: String {
        case usedArtits
    }

    func saveUsedArtists(artists: [String]) {
        userDefaults.set(artists, forKey: Keys.usedArtits.rawValue)
    }

    func getUsedArtists() -> [String] {
        return userDefaults.array(forKey: Keys.usedArtits.rawValue) as? [String] ?? [String]()
    }

    func deleteUsedArtists() {
        userDefaults.set(nil, forKey: Keys.usedArtits.rawValue)
    }

}
