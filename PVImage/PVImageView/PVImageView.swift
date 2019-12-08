//
//  PVImageView.swift
//  PVImageView
//
//  Created by Parth Vasavada on 24/11/19.
//  Copyright © 2019 Parth Vasavada. All rights reserved.
//

import UIKit

final class PVImageView: UIImageView {
    
    var imageURL = String(){
        didSet {
            self.downloadImageFromURL(url: self.imageURL)
        }
    }
    
    var PlaceHolderImage: UIImage? {
        didSet {
            self.image = self.PlaceHolderImage
        }
    }
    
    var showSpinner: Bool? = false
    
    lazy var sucessCallBack: (UIImage)->() = { (pvImage) in
        self.setDownloadedImage(pvImage: pvImage)
    }
    
    var errorCallBack:(Error?, HTTPURLResponse?)->() = { (error, response) in
        print("within PVImage view class",error?.localizedDescription ?? "")
    }
    
    lazy var activityIndicator = UIActivityIndicatorView(style: .large)
    
    private var imageDownloader = PVImageDownloader()
    
    private func addSpinner() {
        if self.showSpinner == true, !imageURL.isEmpty {
            self.activityIndicator.center = CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height/2)
            self.activityIndicator.color = .white
            self.activityIndicator.hidesWhenStopped = true
            self.addSubview(self.activityIndicator)
            self.activityIndicator.startAnimating()
        }
    }
    
    private func removeSpinner() {
        if self.showSpinner == true {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.removeFromSuperview()
        }
    }
    
    private func downloadImageFromURL(url: String) {
        self.addSpinner()
        self.imageDownloader.downloadImage(from: url, onSuccess: self.sucessCallBack, onError: self.errorCallBack)
    }
    
    private func setDownloadedImage(pvImage:UIImage) {
        self.image = pvImage
        self.removeSpinner()
    }
    
    func stopImageDownloading() {
        self.imageDownloader.stopDownloading()
    }
    
}
