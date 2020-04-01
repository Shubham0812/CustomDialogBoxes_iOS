//
//  ViewController.swift
//  CustomDialogBox
//
//  Created by Shubham Singh on 01/04/20.
//  Copyright © 2020 Shubham Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PopUpProtocol {
    
    
    let url: String = "https://www.apple.com/in/ios/app-store/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func customPopupPressed(_ sender: Any) {
        NormalPopupViewController.showPopup(presentVC: self)
    }
    
    
    @IBAction func customPopupActionPressed(_ sender: Any) {
        PopUpActionViewController.showPopup(presentVC: self)
    }
    
    func handleAction(action: Bool) {
        print("The action received", action)
        if (action) {
            guard let url = URL(string: url) else {
              return
            }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
}

