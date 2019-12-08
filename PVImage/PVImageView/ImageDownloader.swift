//
//  ImageDownloader.swift
//  PVImageView
//
//  Created by Parth Vasavada on 26/11/19.
//  Copyright © 2019 Parth Vasavada. All rights reserved.
//

import Foundation
import UIKit

class PVImageDownloader:imageDownloader {
    var task: URLSessionDataTask?
    
    func downloadImage(from url: String, onSuccess: @escaping (UIImage) -> (), onError: @escaping (Error?, HTTPURLResponse?) -> ()) {
        
        guard let url = URL(string: url) else { return }
        task = URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                onError(error, response as? HTTPURLResponse)
            }
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                onSuccess(image)
            }
        }
        task?.resume()
    }
    
    func stopDownloading() {
        task?.cancel()
    }
}
