//
//  APIRequest.swift
//  Ticket-ordering
//
//  Created by KEFAN CHEN on 13/5/2022.
//

import Foundation



struct FilmRequest {
    
    
    
    
    let BaseUrl = "https://api-gate2.movieglu.com/"
    let version = "v200"
    let apiKey = "VuP4kO3iOG5HbbeJVfnBz5qbjjW5eAS12W2x6Bge"
    let authorization = "Basic VVRTXzBfWFg6RUpNdVNWZXAyYjR2"
    let deviceTime = "2022-05-13T10:42:58.797Z"
    let terriotory = "XX"
    let client = "UTS_0"
    
    
    func getFilm(for method:String, completion: @escaping(Result<[FilmInfo], Error>) -> Void) {
        let num = 100
        let urlString = "https://api-gate2.movieglu.com/filmsNowShowing/?n=100"
//        "\(BaseUrl)\(method)/?n=\(num)"
        let urlComponent = URLComponents(string: urlString)
        var request = URLRequest(url: urlComponent!.url!)
        
        request.setValue(version, forHTTPHeaderField: "api-version")
        request.setValue(authorization, forHTTPHeaderField: "Authorization")
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        request.setValue(deviceTime, forHTTPHeaderField: "device-datetime")
        request.setValue(terriotory, forHTTPHeaderField: "territory")
        request.setValue(client, forHTTPHeaderField: "client")
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request) {
            (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            if let safeData = data {
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode(Films.self, from: safeData)
                    let films = data.films
                    completion(.success(films))
                } catch{
                    completion(.failure(print(error) as! Error))
                }
            }
        }
        
        task.resume()
    }

}
