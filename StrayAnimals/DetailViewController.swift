//
//  DetailViewController.swift
//  StrayAnimals
//
//  Created by RTC57 on 2017/10/11.
//  Copyright © 2017年 JasonHuang. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailResettlementLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var selectedAnimal = [String: Any]() {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
    func configureView() {
        // Update the user interface for the detail item.
        let resettlement = selectedAnimal["Resettlement"] as? String
        self.detailResettlementLabel?.text = resettlement
        
        // Download and Show image
        let imageName = selectedAnimal["ImageName"] as? String
        let imageUrl = URL(string: imageName!)
        if let url = imageUrl {
            let urlSession = URLSession(configuration: .default)
            let task = urlSession.dataTask(with: url, completionHandler: {
                (data: Data?, response: URLResponse?, error: Error?) in
                if error != nil {
                    print("session.dataTask 資料錯誤: \(error!.localizedDescription)")
                    return
                }
                if let downloadedData = data {
                    self.detailImageView.image = UIImage(data: downloadedData)
                }
            })
            task.resume()
        }
    }
}

