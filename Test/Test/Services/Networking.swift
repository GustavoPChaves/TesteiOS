//
//  Networking.swift
//  Test
//
//  Created by Gustavo Chaves on 29/04/20.
//  Copyright © 2020 Gustavo Chaves. All rights reserved.
//

import Foundation

class Networking{
    
    static let shared = Networking()
    //, completion: @escaping () -> ()
    func doLogin(user: String, password: String, completion: @escaping (LoginResponse) -> ()){
        let path = Endpoints.Login.doLogin.url
        let parameters = ["user": user, "password": password]
        
        guard let url = URL(string: path) else {return}
        
        let session = URLSession.shared
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        do{
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        }
        catch let error{
            print(error.localizedDescription)
            let error =  Error(code: nil, message: error.localizedDescription)
            completion(LoginResponse(userAccount: nil, error: error))
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in

               guard error == nil else {
                   return
               }

               guard let data = data else {
                   return
               }

               do {
                   //create json object from data
                   //if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                       var response = try JSONDecoder().decode(LoginResponse.self, from: data)
                       response.error = nil
                       completion(response)
                       // handle json...
                   //}
               } catch let error {
                   print(error.localizedDescription)
                let error =  Error(code: nil, message: error.localizedDescription)
                    completion(LoginResponse(userAccount: nil, error: error))
               }
           })
           task.resume()
    }
    
    func getUserStatements(userId: Int, completion: @escaping (StatementResponse) -> ()){
        let path = Endpoints.Statements.getStatements(userId).path
        guard let url = URL(string: path) else {return}
        
        URLSession.shared.dataTask(with: url){ (data, resp, err) in
            if let err = err{
                print("Failed to fetch apps:", err)
                completion(StatementResponse(statementList: [], error: Error(code: nil, message: err.localizedDescription)))
                return
            }
            guard let data = data else {return}
            
            do{
                let response = try JSONDecoder().decode(StatementResponse.self, from: data)
            
                completion(response)
                
            }catch let jsonErr{
                print("Failed to decode json:", jsonErr)
                completion(StatementResponse(statementList: [], error: Error(code: nil, message: jsonErr.localizedDescription)))
            }
            
        }.resume()
    }

}
