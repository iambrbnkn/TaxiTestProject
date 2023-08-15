//
//  ImageManager.swift
//  TestTaxiApp
//
//  Created by Vitaliy on 11.08.2023.
//

import Foundation
import Kingfisher

protocol ImageServiceProtocol {
    func getImage(with url: String, completion: @escaping (Result<UIImage, Error>) -> Void)
}

final class ImageService: ImageServiceProtocol {

    func getImage(with url: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        let cache = ImageCache.default
        let downloader = ImageDownloader.default
        guard let url = URL(string: url) else {
            return
        }
        let key = url.absoluteString
        if cache.isCached(forKey: key) {
            if let image = cache.retrieveImageInMemoryCache(forKey: key, options: []) {
                completion(.success(image))
                return
            }
        }
        
        downloader.downloadImage(with: url) { result in
            switch result {
            case .success(let data):
                let image: UIImage = data.image
                cache.store(image, forKey: key, options: KingfisherParsedOptionsInfo([.memoryCacheExpiration(.seconds(600))]))
                completion(.success(image))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
