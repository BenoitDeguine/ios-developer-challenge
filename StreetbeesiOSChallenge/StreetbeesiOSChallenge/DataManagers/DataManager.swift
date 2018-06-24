//
//  DataManager.swift
//  StreetbeesiOSChallenge
//
//  Created by Benoit Deguine on 23/06/2018.
//  Copyright © 2018 Benoit Deguine. All rights reserved.
//

import Foundation

enum DataManagerError: Error {
    case unknown
    case failedRequest
    case invalidResponse
}

class DataManager {
    
    typealias ComicDataCompletion = (ResultData?, DataManagerError?) -> ()
    
    private let baseURL: URL
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    func getParameter()->String {
        
        let ts = "\(NSDate().timeIntervalSince1970)"
        
        return "ts=" + ts + "&apikey=" + API.APIPublicKey + "&hash=" + String(ts+API.APIPrivateKey+API.APIPublicKey).toMD5()
    }
    
    func getComic(completion: @escaping ComicDataCompletion) {
        let url = URL(string: baseURL.absoluteString + "public/comics?format=comic&offset=150&" + self.getParameter())
        
        if let url = url {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
                    self.didFetchResultData(data: data, response: response, error: error, completion: completion)
                }
                }.resume()
        }
    }
    
    private func didFetchResultData(data: Data?, response: URLResponse?, error: Error?, completion: ComicDataCompletion) {
        if let _ = error {
            completion(nil, .failedRequest)
            
        } else if let data = data, let response = response as? HTTPURLResponse {

            if response.statusCode == 200 {
                do {
                    let resultData: ResultData = try JSONDecoder.decode(data: data)
                    
                    completion(resultData, nil)
                } catch {
                    completion(nil, .invalidResponse)
                }
                
            } else {
                completion(nil, .failedRequest)
            }
            
        } else {
            completion(nil, .unknown)
        }
    }
    
}
