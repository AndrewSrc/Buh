//
//  Network.swift
//  buh
//
//  Created by Пользователь on 07/11/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//

import Foundation

enum HTTPMethods: String {
    case get = "get"
    case post = "post"
}

class RequestOptions {
    var method: HTTPMethods = .get
    var url: URL
    var option: [String: Any]?
    var headers:[String: String]?
    
    init(url: URL){
        self.url = url
    }
}

protocol Network{
    func performRequest(options: RequestOptions,
                        completion:@escaping (URLResponse?, Data?)->()) -> URLSessionTask
}

class URLSessionNetwork: Network {
    func performRequest(options: RequestOptions,
        completion: @escaping (URLResponse?, Data?) -> ()) -> URLSessionTask {
        var request = URLRequest(url: options.url)
        request.httpMethod = options.method.rawValue
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: request, completionHandler:
        {data, response, error in
            completion(response, data)
        })
        task.resume()
        return task
    }

}


