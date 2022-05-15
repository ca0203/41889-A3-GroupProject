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
    let film_name: String
    let synopsis_long: String
    let images: Image
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




