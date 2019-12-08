//
//  DownloaderProtocol.swift
//  PVImageView
//
//  Created by Parth Vasavada on 26/11/19.
//  Copyright © 2019 Parth Vasavada. All rights reserved.
//

import Foundation
import UIKit

protocol imageDownloader {
    func downloadImage(from url: String,  onSuccess: @escaping (UIImage)->(),
       onError: @escaping (Error?, HTTPURLResponse?)->())
    
    func stopDownloading()
}
