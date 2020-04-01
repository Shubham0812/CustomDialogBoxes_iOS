//
//  ViewController.swift
//  CustomDialogBox
//
//  Created by Shubham Singh on 01/04/20.
//  Copyright © 2020 Shubham Singh. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, PopUpProtocol {
    
    let url: String = "https://www.apple.com/in/ios/app-store/"
    
    //MARK:- lifecyle methods for the view controller
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- outlets for the view controller
    @IBAction func customPopupPressed(_ sender: Any) {
        NormalPopupViewController.showPopup(parentVC: self)
    }
    
    @IBAction func customPopupActionPressed(_ sender: Any) {
        PopUpActionViewController.showPopup(parentVC: self)
    }
    
    //MARK:- functions for the view controller
    func handleAction(action: Bool) {
        
        //opening a link to the app store if the user clickes on the go to app store button
        if (action) {
            guard let url = URL(string: url) else {
                return
            }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

