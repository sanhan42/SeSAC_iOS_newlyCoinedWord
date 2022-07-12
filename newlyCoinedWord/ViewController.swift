//
//  ViewController.swift
//  newlyCoinedWord
//
//  Created by 한상민 on 2022/07/11.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet var buttonList: [UIButton]!
    
    let newlyWord = ["억텐":"'억지 텐션'의 줄임말.", "찐텐":"'진짜 텐션'의 줄임말", "당모치":"'당연히 모든 치킨은 옳다' = 뭘 시켜도 맛있을 것이다.", "식집사":"반려 식물을 키우는 사람.","자컨":"자체 제작 컨텐츠. 소속사에서 직접 만드는 컨텐츠.","머선129":"무슨 일이고!","알잘딱깔센":"'알아서 잘 딱 깔끔하고 센스있게'를 줄인 말.","좋댓구알":"좋아요, 댓글, 구독, 알림설정을 요청할 때 사용."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldStyle()
        setPlaceholder(textField: searchTextField, placeholder: "검색어를 입력해주세요.", color: .gray)
        setButtonTitle()
        setButtonStyle()
    }
    
    func setPlaceholder(textField tf:UITextField, placeholder str:String, color:UIColor) {
        tf.attributedPlaceholder = NSAttributedString(string: str, attributes: [NSAttributedString.Key.foregroundColor : color])
    }
    
    func setTextFieldStyle(){
        searchTextField.layer.borderColor = UIColor.black.cgColor
        searchTextField.layer.borderWidth = 2
    }
    
    func setButtonStyle(){
        for button in buttonList {
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 6
        }
    }
    
    func setButtonTitle(){
        var titleSet = Set<String>()
        while(titleSet.count < 4) {
            let word = newlyWord.randomElement()?.key
            if word != searchTextField.text {
                titleSet.insert(word!)
            }
        }
        for button in buttonList {
            button.setTitle(titleSet.popFirst(), for: .normal)
        }
    }
}

