//
//  FilmData.swift
//  Ticket-ordering
//
//  Created by KEFAN CHEN on 13/5/2022.
//

import Foundation



struct Films: Decodable {
    let films: [FilmInfo]
}

struct FilmInfo: Decodable {
    let film_id: Int
    let film_name: String
    let synopsis_long: String
    let images: Image
}

struct FilmDetails: Decodable {
    let film_name: String
    let film_id: Int
    let images: Image
    let synopsis_long: String
    let genres : [Genre]
    let cast: [Cast]
    let directors: [Director]
    let duration_mins: Int
    let review_stars: Double
    let review_txt: String
    let trailers: Trailers?
    let show_dates: [ShowDate]
}

struct FilmBookingLink: Decodable {
    let url: String
}

struct FilmShowingTime: Decodable {
    let cinemas: [Cinema]
}

struct Cinema: Decodable {
    let cinema_id: Int
    let cinema_name: String
    let showings: ShowingTypes
}
struct ShowingTypes: Decodable {
    let Standard: Times
}
struct Times: Decodable {
    let times: [TimeDetails]
}
struct TimeDetails: Decodable {
    let start_time: String
    let end_time: String
}

struct ShowDate: Decodable {
    let date:String
}

struct Trailers: Decodable {
    let high: [TrailerInfo]
}

struct TrailerInfo: Decodable {
    let film_trailer: String
    let trailer_image: String
}


struct Director: Decodable {
    let director_name: String
}

struct Cast: Decodable {
    let cast_name: String
}

struct Genre: Decodable {
    let genre_name: String
}

struct Image: Decodable {
    var poster: Index?
    enum CodingKeys: String, CodingKey {
        case poster
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        if let new = try? values.decodeIfPresent(Index.self, forKey: .poster) {
            poster = new
        }
    }
}

struct Index: Decodable {
    let one: Medium
    enum CodingKeys: String, CodingKey {
        case one = "1"
    }
}

struct Medium: Decodable {
    
    let medium: ImageInfo

}

struct ImageInfo: Decodable {
    let film_image: String
}




