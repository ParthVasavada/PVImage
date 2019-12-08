//
//  demoListViewControllerTableViewController.swift
//  PVImageView
//
//  Created by Parth Vasavada on 24/11/19.
//  Copyright © 2019 Parth Vasavada. All rights reserved.
//

import UIKit

class demoListViewController: UITableViewController {

    private var images: [String] = ["https://www.httpwatch.com/httpgallery/authentication/authenticatedimage/default.aspx?0.35786508303135633", "https://assets.sbnation.com/assets/2512203/dogflops.gif", "httpss://raw.githubusercontent.com/liyong03/YLGIFImage/master/YLGIFImageDemo/YLGIFImageDemo/joy.gif", "https://apng.onevcat.com/assets/elephant.png", "http://www.ioncannon.net/wp-content/uploads/2011/06/test2.webp", "https://www.ioncannon.net/wp-content/uploads/2011/06/test9.webp", "https://littlesvr.ca/apng/images/SteamEngine.webp","http://littlesvr.ca/apng/images/world-cup-2014-42.webp", "https://isparta.github.io/compare-webp/image/gif_webp/webp/2.webp", "https://nokiatech.github.io/heif/content/images/ski_jump_1440x960.heic", "https://nokiatech.github.io/heif/content/image_sequences/starfield_animation.heic", "https://s2.ax1x.com/2019/11/01/KHYIgJ.gif", "https://nr-platform.s3.amazonaws.com/uploads/platform/published_extension/branding_icon/275/AmazonS3.png", "https://via.placeholder.com/200x200.jpg" ,
                                    "https://via.placeholder.com/anything.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return images.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: demoCell = tableView.dequeueReusableCell(withIdentifier: "demoCell", for: indexPath) as! demoCell

        cell.asyncImageView.PlaceHolderImage = UIImage(named: "AppleLogo")
        cell.asyncImageView.imageURL =  images[indexPath.row]
        cell.asyncImageView.showSpinner = true
        return cell
    }
}
