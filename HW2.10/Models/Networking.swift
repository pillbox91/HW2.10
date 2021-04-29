//
//  Networking.swift
//  HW2.10
//
//  Created by Андрей Аверьянов on 28.04.2021.
//

import Alamofire
import Foundation

class NetworkManager{
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func getResponse(from urlString: String, with complition: @escaping ([RickAndMorty]) -> ()) {
        AF.request(urlString)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let ricks = RickAndMorty.getRick(from: value)
                    DispatchQueue.main.async {
                        complition(ricks ?? [] )
                    }
                case .failure(let error):
                    print(error)
                }
            }
    }
}
