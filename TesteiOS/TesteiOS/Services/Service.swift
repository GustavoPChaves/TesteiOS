//
//  Networking.swift
//  TesteiOS
//
//  Created by Gustavo Chaves on 24/04/20.
//  Copyright © 2020 Gustavo Chaves. All rights reserved.
//

import Foundation

class Service{
    
    static let shared = Service()

    func fetchLoginForm(completion: @escaping ([Cell], Error?) -> ()) {
        let urlString = EndPoints.form
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url){ (data, resp, err) in
            if let err = err{
                print("Failed to fetch form:", err)
                completion([], nil)
                return
            }
            guard let data = data else {return}
            
            do{
                let formResult = try JSONDecoder().decode(FormFormat.self, from: data)
            
                completion(formResult.cells, nil) 
                
            }catch let jsonErr{
                print("Failed to decode json:", jsonErr)
                completion([], jsonErr)
            }
            
        }.resume()
    }
    
    func fetchFunds(completion: @escaping (Screen?, Error?) -> ()) {
        let urlString = EndPoints.form
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url){ (data, resp, err) in
            if let err = err{
                print("Failed to fetch form:", err)
                completion(nil, nil)
                return
            }
            guard let data = data else {return}
            
            do{
                let fundResult = try JSONDecoder().decode(Fund.self, from: data)
            
                completion(fundResult.screen, nil)
                
            }catch let jsonErr{
                print("Failed to decode json:", jsonErr)
                completion(nil, jsonErr)
            }
            
        }.resume()
    }

}
