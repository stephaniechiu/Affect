//
//  MoodView.swift
//  Affect
//
//  Created by Stephanie on 3/23/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class MoodView: UIView {
    
    // MARK: - Properties
    let moodQuestionTextView: UITextView = {
        return UIView().titleTextView(placeholderText: "How are you?", textSize: 35)
    }()
    
    let dateTimeLabel: UILabel = {
        let now = Date()
        let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.setLocalizedDateFormatFromTemplate("h:mm")
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            label.attributedText = NSAttributedString(string: "Today, " + dateFormatter.string(from: now), attributes:[.underlineStyle: NSUnderlineStyle.single.rawValue])
            label.textAlignment = .center
            label.font = UIFont(name: "American Typewriter", size: 18)
            label.isUserInteractionEnabled = true
        return label
    }()
    
    //func setIconButton() -> [UIButton] {
        let btnAwful: UIButton = UIView().iconBtn(image: #imageLiteral(resourceName: "Awful"))
        let btnOk: UIButton = UIView().iconBtn(image: #imageLiteral(resourceName: "Ok"))
        let btnMeh: UIButton = UIView().iconBtn(image: #imageLiteral(resourceName: "Meh"))
        let btnGreat: UIButton = UIView().iconBtn(image: #imageLiteral(resourceName: "Great"))
        let btnAwesome: UIButton = UIView().iconBtn(image: #imageLiteral(resourceName: "Awesome"))
    
    //    return [btnAwful, btnOk, btnMeh, btnGreat, btnAwesome]
    //}
    var moodButtonArray: [UIButton]

    enum Tag: Int {
        case awful = 1, ok, meh, great, awesome
    }

    // let chosenMood = Tag.Awful
    // print(chosenMood.rawValue)
    
    var moodStackView: UIStackView
    
    let closeViewButton: UIButton = { return UIView().navigationBtn(text: "Cancel") }()

    var blurEffect = UIBlurEffect()
    var blurEffectView = UIVisualEffectView()

    // MARK: - Lifecycles
    override init(frame: CGRect) {
        
        self.moodButtonArray = [btnAwful, btnOk, btnMeh, btnGreat, btnAwesome]
        self.moodStackView = UIStackView(arrangedSubviews: moodButtonArray)
            moodStackView.spacing = 10
            moodStackView.distribution = .fillEqually
        self.blurEffect = UIBlurEffect(style: .prominent)
        self.blurEffectView = UIVisualEffectView(effect: blurEffect)
        
        super.init(frame: frame)
        backgroundColor = .white
        setupLayout()
    }
    
// MARK:- Setup View Layout
fileprivate func setupLayout() {
    addSubview(moodQuestionTextView)
    moodQuestionTextView.anchor(top: safeAreaLayoutGuide.topAnchor, paddingTop: 100)
    moodQuestionTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    addSubview(dateTimeLabel)
    dateTimeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    dateTimeLabel.anchor(top: moodQuestionTextView.bottomAnchor, paddingTop: 12, paddingBottom: 30)

    addSubview(moodStackView)
    moodStackView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 350, paddingLeft: 10,  paddingRight: 10, height: 50)
    
    addSubview(closeViewButton)
    closeViewButton.anchor(top: moodStackView.bottomAnchor, left: leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, paddingTop: 350, paddingLeft: 10, paddingBottom: 10)
}
    
//    func setupMoodTags() {
//        for buttons in moodButtonArray {
//            if let moodButton = Tag(rawValue: buttons.tag) {
//                switch moodButton {
//                case .awful: print("Feeling awful")
//                case .ok: print("Feeling ok")
//                case .meh: print("Feeling meh")
//                case .great: print("Feeling great")
//                case .awesome: print("Feeling awesome")
//                }
//            }
//        }
//
////        for i in 0..<moodButtonArray.count {
////            moodButtonArray[i].tag = i
////        }
//    }
    
    //var moodTag = moodButtonTag.ButtonAwful

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
}
