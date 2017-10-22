//
//  iTunesAPIClient.swift
//  SongsBrowser
//
//  Created by Kamil Chlebuś on 21/10/2017.
//  Copyright © 2017 Kamil Chlebuś. All rights reserved.
//

import Foundation

typealias FetchTracksResponse = ([Track], Error?) -> Void

class iTunesAPIClient {

    private let baseURL = "https://itunes.apple.com/search"
    private var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }

    func fetchTracks(for artistName: String, completion: @escaping FetchTracksResponse) {
        let params = "term=\(artistName)&media=music&limit=100"
        let task = URLSession.shared.dataTask(with: self.prepareGETRequest(params: params)) { [weak self] (data, response, error) in
            guard let _self = self else { completion([], nil); return }
            if let error = error {
                debugPrint(error)
                completion([], error)
            } else if let data = data {
                do {
                    let responseData = try _self.decoder.decode(ResponseData.self, from: data)
                    completion(responseData.results, nil)

                } catch {
                    debugPrint(error)
                    completion([], error)
                }
            }
        }
        task.resume()
    }

    private func prepareGETRequest(params: String) -> URLRequest {
        let encodedParams = params.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
        let url = URL(string: baseURL + "?" + encodedParams)!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        return request
    }

}
