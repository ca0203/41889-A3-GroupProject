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
    let terriotory = "XX"
    let client = "UTS_0"
    let date = Date()
    var deviceTime = ""
    var geolocation = "-22.0;14.0"
    
    mutating func getFilm(for method:String, completion: @escaping(Result<[FilmInfo], Error>) -> Void) {
        let urlString = "https://api-gate2.movieglu.com/\(method)/?n=100"
        let urlComponent = URLComponents(string: urlString)
        var request = URLRequest(url: urlComponent!.url!)
        
        let iso8601DateFormatter = ISO8601DateFormatter()
            iso8601DateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        deviceTime = iso8601DateFormatter.string(from: date);
        
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
    
    mutating func getFilmDetail(for filmId:Int, completion: @escaping(Result<FilmDetails, Error>) -> Void) {
        let id = filmId
        let urlString = "https://api-gate2.movieglu.com/filmDetails/?film_id=\(id)"
//        "\(BaseUrl)\(method)/?n=\(num)"
        let urlComponent = URLComponents(string: urlString)
        var request = URLRequest(url: urlComponent!.url!)
        
        
        let iso8601DateFormatter = ISO8601DateFormatter()
            iso8601DateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        deviceTime = iso8601DateFormatter.string(from: date);
//        deviceTime = "2022-05-18T10:00:56.312Z"
        
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
                    let data = try decoder.decode(FilmDetails.self, from: safeData)
                    completion(.success(data))
                } catch{
                    completion(.failure(print(error) as! Error))
                }
            }
        }
        
        task.resume()
    }
    
    
    
    mutating func getFilmShowingTime(for filmId:Int,for date: String, completion: @escaping(Result<FilmShowingTime, Error>) -> Void) {
        
        
        let urlString = "https://api-gate2.movieglu.com/filmShowTimes/?n=1&film_id=7772&date=2022-05-24"
//        "\(BaseUrl)\(method)/?n=\(num)"
        let urlComponent = URLComponents(string: urlString)
        var request = URLRequest(url: urlComponent!.url!)
        let iso8601DateFormatter = ISO8601DateFormatter()
            iso8601DateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
//        deviceTime = iso8601DateFormatter.string(from: self.date);
        deviceTime = "2022-05-19T12:57:01.028Z"
        
        request.setValue(version, forHTTPHeaderField: "api-version")
        request.setValue(authorization, forHTTPHeaderField: "Authorization")
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        request.setValue(deviceTime, forHTTPHeaderField: "device-datetime")
        request.setValue(terriotory, forHTTPHeaderField: "territory")
        request.setValue(client, forHTTPHeaderField: "client")
        request.setValue(geolocation, forHTTPHeaderField: "geolocation")
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
                    let data = try decoder.decode(FilmShowingTime.self, from: safeData)
                    completion(.success(data))
                } catch {
                    completion(.failure(print(error) as! Error))
                }
            }
        }
        task.resume()
    }
    
    mutating func getFilmBookingLink(for filmId:Int,for cinemaId: Int, for date: String, for time: String, completion: @escaping(Result<FilmBookingLink, Error>) -> Void) {
        
        
        let urlString = "https://api-gate2.movieglu.com/purchaseConfirmation/?film_id=7772&cinema_id=8930&date=2022-05-24&time=15%3A00"
//        "\(BaseUrl)\(method)/?n=\(num)"
        let urlComponent = URLComponents(string: urlString)
        var request = URLRequest(url: urlComponent!.url!)
        let iso8601DateFormatter = ISO8601DateFormatter()
            iso8601DateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
//        deviceTime = iso8601DateFormatter.string(from: self.date);
        deviceTime = "2022-05-19T12:57:01.028Z"
        
        request.setValue(version, forHTTPHeaderField: "api-version")
        request.setValue(authorization, forHTTPHeaderField: "Authorization")
        request.setValue(apiKey, forHTTPHeaderField: "x-api-key")
        request.setValue(deviceTime, forHTTPHeaderField: "device-datetime")
        request.setValue(terriotory, forHTTPHeaderField: "territory")
        request.setValue(client, forHTTPHeaderField: "client")
        request.setValue(geolocation, forHTTPHeaderField: "geolocation")
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
                    let data = try decoder.decode(FilmBookingLink.self, from: safeData)
                    completion(.success(data))
                } catch {
                    completion(.failure(print(error) as! Error))
                }
            }
        }
        task.resume()
    }
}
