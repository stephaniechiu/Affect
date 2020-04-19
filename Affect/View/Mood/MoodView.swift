//
//  MoodView.swift
//  Affect
//
//  Created by Stephanie on 3/23/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

// MARK: - Properties
let btnClose: UIButton = UIView().iconBtn(image: #imageLiteral(resourceName: "btn_close_b"))

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

let editButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(#imageLiteral(resourceName: "down-arrow"), for: .normal)
    button.imageView?.contentMode = .scaleAspectFit
    return button
}()

func setIconButton() -> [UIButton] {
    let btnAwful: UIButton = UIView().iconBtn(image: #imageLiteral(resourceName: "Awful"))
    let btnOk: UIButton = UIView().iconBtn(image: #imageLiteral(resourceName: "Ok"))
    let btnMeh: UIButton = UIView().iconBtn(image: #imageLiteral(resourceName: "Meh"))
    let btnGreat: UIButton = UIView().iconBtn(image: #imageLiteral(resourceName: "Great"))
    let btnAwesome: UIButton = UIView().iconBtn(image: #imageLiteral(resourceName: "Awesome"))
    return [btnAwful, btnOk, btnMeh, btnGreat, btnAwesome]
}

let moodStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: setIconButton())
    stackView.spacing = 35
    stackView.distribution = .fillEqually
    return stackView
}()

let blurEffect = UIBlurEffect(style: .prominent)
let blurEffectView = UIVisualEffectView(effect: blurEffect)

// MARK: - Lifecycles
class MoodView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setupLayout()
    }
    
// MARK:- Setup View Layout
fileprivate func setupLayout() {
    addSubview(btnClose)
    btnClose.anchor(top: safeAreaLayoutGuide.topAnchor, left: safeAreaLayoutGuide.leftAnchor, paddingTop: 15, paddingLeft: 20, width: 15, height: 15)
    
    addSubview(moodQuestionTextView)
    moodQuestionTextView.anchor(top: safeAreaLayoutGuide.topAnchor, paddingTop: 100)
    moodQuestionTextView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
    addSubview(dateTimeLabel)
    dateTimeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    dateTimeLabel.anchor(top: moodQuestionTextView.bottomAnchor, paddingTop: 12)
    
    addSubview(editButton)
    editButton.anchor(top: moodQuestionTextView.bottomAnchor, left: dateTimeLabel.rightAnchor, paddingTop: 11, paddingLeft: 5, width: 20, height: 20)
        
    addSubview(moodStackView)
    moodStackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 350, paddingLeft: 20, paddingBottom: 350, paddingRight: 20)
}
    


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
}
