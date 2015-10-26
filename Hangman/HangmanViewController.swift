//
//  ViewController.swift
//  Hangman
//
//  Created by Gene Yoo on 10/13/15.
//  Copyright © 2015 cs198-ios. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {

    @IBOutlet weak var imageSubView: UIImageView!
    var stateImages: [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stateImages.append(UIImage(named: "pic0.jpg")!)
        stateImages.append(UIImage(named: "pic1.jpg")!)
        stateImages.append(UIImage(named: "pic2.jpg")!)
        stateImages.append(UIImage(named: "pic3.jpg")!)
        stateImages.append(UIImage(named: "pic4.jpg")!)
        stateImages.append(UIImage(named: "pic5.jpg")!)
        stateImages.append(UIImage(named: "pic6.jpg")!)
        stateImages.append(UIImage(named: "pic7.jpg")!)
        stateImages.append(UIImage(named: "pic8.jpg")!)
        stateImages.append(UIImage(named: "pic9.jpg")!)
        stateImages.append(UIImage(named: "pic10.jpg")!)
        imageSubView.image = stateImages[10]
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

