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
        // didSet: 여러곳에서 값변경이 있을때 실시간으로 입력받아 View에 나타내줌.
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
        // [UIButton] 으로 배열이기 때문에 for each를 사용할 수 있다.
        for btnItem in phoneNumberButtons {
            btnItem.addTarget(self, action: #selector(onNumberBtnClicked(sender:)), for: .touchUpInside)
        }
        
        callButton.addTarget(self, action: #selector(onPhoneCallBtnClicked(_:)), for: .touchUpInside)
    }
    // phoneNumberButtons의 각각의 버튼들에서 하나를 누를때 마다 빈 배열에 눌려진 버튼을 추가함
    @objc fileprivate func onNumberBtnClicked(sender: UIButton) {
        guard let inputString = sender.titleLabel?.text else { return }
        phoneNumberString.append(inputString)
    }
    
    // 전화 버튼을 누르면 Label에 있는 모든 숫자 삭제 
    @objc fileprivate func onPhoneCallBtnClicked(_ sender: UIButton) {
        phoneNumberString.removeAll()
    }
}

