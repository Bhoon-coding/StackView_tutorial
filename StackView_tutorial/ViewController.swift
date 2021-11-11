//
//  ViewController.swift
//  StackView_tutorial
//
//  Created by BH on 2021/11/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var phoneNumberLabel: UILabel!

    @IBOutlet var phoneNumberButtons: [UIButton]!
    
    @IBOutlet var callButton: UIButton!
    
    var phoneNumberString = "" {
        didSet{
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.phoneNumberLabel.textColor = .black
                self.phoneNumberLabel.text = self.phoneNumberString
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for btnItem in phoneNumberButtons {
            btnItem.addTarget(self, action: #selector(onNumberBtnClicked(sender:)), for: .touchUpInside)
        }
        
        callButton.addTarget(self, action: #selector(onPhoneCallBtnClicked(_:)), for: .touchUpInside)
    }

    @objc fileprivate func onNumberBtnClicked(sender: UIButton) {
        guard let inputString = sender.titleLabel?.text else { return }
        phoneNumberString.append(inputString)
    }
    
    @objc fileprivate func onPhoneCallBtnClicked(_ sender: UIButton) {
        phoneNumberString.removeAll()
    }
}

