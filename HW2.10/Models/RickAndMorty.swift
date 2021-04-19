//
//  RickAndMorty.swift
//  HW2.10
//
//  Created by Андрей Аверьянов on 15.04.2021.
//


struct WebsiteDescription: Decodable {
    let results: [RickAndMorty]?
//    let websiteDescription: String?
//    let websiteName: String?
}

struct RickAndMorty: Decodable {
    let name: String?
    let image: String?
//    let link: String?
}
