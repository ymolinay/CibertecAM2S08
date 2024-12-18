//
//  Cat.swift
//  Session07b
//
//  Created by DAMII on 16/12/24.
//

import Foundation

struct Cat: Codable, Identifiable {
    let id: String
    let name: String
    let origin: String
    let description: String
    let temperament: String
    let image: CatImage?
    
    struct CatImage: Codable {
        let url: String?
    }
}

