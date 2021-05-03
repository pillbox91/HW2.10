//
//  RickAndMorty.swift
//  HW2.10
//
//  Created by Андрей Аверьянов on 15.04.2021.
//
import Foundation

struct RickAndMorty {
    let results: Any?
    let name: String?
    let image: String?
    let species: String?
    let gender: String?
    let status: String?
    
    init(rickData: [String: Any]) {
        results = rickData["results"] as? [Any]
        name = rickData["name"] as? String
        image = rickData["image"] as? String
        species = rickData["species"] as? String
        gender = rickData["gender"] as? String
        status = rickData["status"] as? String


    }
    
    static func getRick(from value: Any) -> [RickAndMorty]? {
        guard let ricksData = value as? [String : Any], let result = ricksData["results"] as? [[String: Any]] else { return [] }
        return result.compactMap { RickAndMorty(rickData: $0) }
    }
}
