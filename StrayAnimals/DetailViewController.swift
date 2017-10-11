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
        if let detail = selectedAnimal["Name"] as? String {
            if let label = detailDescriptionLabel {
                label.text = detail
            }
        }
    }
}

