//
//  PopupActionViewController.swift
//  CustomDialogBox
//
//  Created by Shubham Singh on 01/04/20.
//  Copyright © 2020 Shubham Singh. All rights reserved.
//

import UIKit

protocol PopUpProtocol {
    func handleAction(action: Bool)
}

class PopUpActionViewController: UIViewController {
    
    static let identifier = "PopUpActionViewController"
    
    var delegate: PopUpProtocol?
    
    
    @IBOutlet weak var dialogBoxView: UIView!
    @IBOutlet weak var gotoStoreButton: UIButton!
    @IBOutlet weak var laterButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.backgroundColor = UIColor.black.withAlphaComponent(0.50)
        
        dialogBoxView.layer.cornerRadius = 6.0
        dialogBoxView.layer.borderWidth = 1.2
        dialogBoxView.layer.borderColor = UIColor(named: "dialogBoxGray")?.cgColor
        
        gotoStoreButton.backgroundColor = UIColor(named: "primaryBackground")?.withAlphaComponent(0.85)
        gotoStoreButton.setTitleColor(UIColor.white, for: .normal)
        gotoStoreButton.layer.borderWidth = 1.2
        gotoStoreButton.layer.cornerRadius = 4.0
        gotoStoreButton.layer.borderColor = UIColor(named: "primaryBackground")?.cgColor
    }
    
    @IBAction func goToStorePressed(_ sender: Any) {
        self.delegate?.handleAction(action: true)
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func laterButtonPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    static func showPopup(presentVC: UIViewController){
        if let popupViewController = UIStoryboard(name: "CustomView", bundle: nil).instantiateViewController(withIdentifier: "PopUpActionViewController") as? PopUpActionViewController {
            popupViewController.modalPresentationStyle = .custom
            popupViewController.delegate = presentVC as? PopUpProtocol
            popupViewController.modalTransitionStyle = .crossDissolve
            presentVC.present(popupViewController, animated: true)
        }
    }
    
}
