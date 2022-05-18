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
    let review_stars: Int
    let review_txt: String
    let trailers: Trailers
    let show_dates: [ShowDate]
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
    let poster: Index
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




