//
//  NetworkEngine.swift
//  FilmXpress
//
//  Created by Murad Farhat on 10/07/2023.
//

import Foundation

class NetworkEngine {
    
    
    /// overlaod methode to return an array of models
    /// - Parameters:
    ///   - movieEndPoint: movieEndPoint description
    ///   - completionHandler: completionHandler description
    class func request<T: Codable>(movieEndPoint: EndPoint, completionHandler: @escaping (Result<[T], Error>) -> Void) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = movieEndPoint.scheme
        urlComponents.host = movieEndPoint.baseURL
        urlComponents.path = movieEndPoint.path
        urlComponents.queryItems = movieEndPoint.parameters
        
        guard let url = urlComponents.url else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = movieEndPoint.method
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                completionHandler(.failure(error!))
                return
            }
            
            guard let data = data, response != nil else { return }
            
            do {
                let responseData = try JSONDecoder().decode([T].self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(responseData))
                }
            } catch {
                let decodingError = NSError(domain: "\(url)", code: 200, userInfo: [NSLocalizedDescriptionKey: "Failed to decode response."])
                DispatchQueue.main.async {
                    completionHandler(.failure(decodingError))
                }
            }
        }
        dataTask.resume()
    }
    
    /// Overload method to return a single model
    /// - Parameters:
    ///   - movieEndPoint: movieEndPoint
    ///   - completionHandler: completionHandler description
    class func request<T: Codable>(movieEndPoint: EndPoint, completionHandler: @escaping (Result<T, Error>) -> Void) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = movieEndPoint.scheme
        urlComponents.host = movieEndPoint.baseURL
        urlComponents.path = movieEndPoint.path
        urlComponents.queryItems = movieEndPoint.parameters
        
        guard let url = urlComponents.url else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = movieEndPoint.method
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            guard error == nil else {
                completionHandler(.failure(error!))
                return
            }
            
            guard let data = data, response != nil else { return }
            
            do {
                let responseData = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completionHandler(.success(responseData))
                }
            } catch {
                let decodingError = NSError(domain: "\(url)", code: 200, userInfo: [NSLocalizedDescriptionKey: "Failed to decode response."])
                DispatchQueue.main.async {
                    completionHandler(.failure(decodingError))
                }
            }
        }
        dataTask.resume()
    }
}
