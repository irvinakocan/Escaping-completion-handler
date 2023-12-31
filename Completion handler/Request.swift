//
//  Request.swift
//  Completion handler
//
//  Created by Macbook Air 2017 on 17. 12. 2023..
//

import Foundation

class Request {
    static func getUsers(completion: @escaping ([User]?) -> Void) {
        
        guard let url = URL(string: GET_USERS_ENDPOINT) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
            
            if let data = data, error == nil {
                let users = try? JSONDecoder().decode([User].self, from: data)
                completion(users)
            }
        })
        task.resume()
    }
}
