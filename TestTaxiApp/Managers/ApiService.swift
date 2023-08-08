//
//  ApiService.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 02.08.2023.
//

import Foundation

// TODO: - Добавить реализацию через протокол +
protocol ApiServiceProtocol {
    func execute<T: Codable> (_ request: String, expecting type: T.Type, completion: @escaping(Result<T, Error>) -> Void)
}

final class ApiService: ApiServiceProtocol {
    
    // TODO: - Убрать синглтон +
    
    enum ApiServiceError: Error {
        case failedToCreateRequest
        case failedToGetData
    }
    
    func execute<T: Codable> (_ request: String, expecting type: T.Type, completion: @escaping(Result<T, Error>) -> Void) {
        guard let url = URL(string: request) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(error ?? ApiServiceError.failedToGetData))
                return
            }
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let result = try decoder.decode(type.self, from: data)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
