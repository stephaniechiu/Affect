//
//  MoodView.swift
//  Affect
//
//  Created by Stephanie on 3/23/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class MoodView: UIView {

// MARK:- Mood Question
let moodQuestionTextView: UITextView = {
    let textView = UITextView()
        textView.text = "How are you?"
        textView.font = UIFont(name: "American Typewriter", size: 35)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
}()

// MARK:- Mood Icons
private func setIconButton() -> [UIButton] {
    let iconBtnAwful:UIButton = UIButton(type: .custom)
        iconBtnAwful.setImage(#imageLiteral(resourceName: "Awful"), for: .normal)
        iconBtnAwful.imageView?.contentMode = .scaleAspectFit
    let iconBtnOk:UIButton = UIButton(type: .custom)
        iconBtnOk.setImage(#imageLiteral(resourceName: "Ok"), for: .normal)
        iconBtnOk.imageView?.contentMode = .scaleAspectFit
    let iconBtnMeh:UIButton = UIButton(type: .custom)
        iconBtnMeh.setImage(#imageLiteral(resourceName: "Meh"), for: .normal)
        iconBtnMeh.imageView?.contentMode = .scaleAspectFit
    let iconBtnGreat:UIButton = UIButton(type: .custom)
        iconBtnGreat.setImage(#imageLiteral(resourceName: "Great"), for: .normal)
        iconBtnGreat.imageView?.contentMode = .scaleAspectFit
    let iconBtnAwesome:UIButton = UIButton(type: .custom)
        iconBtnAwesome.setImage(#imageLiteral(resourceName: "Awesome"), for: .normal)
        iconBtnAwesome.imageView?.contentMode = .scaleAspectFit
    return [iconBtnAwesome, iconBtnGreat, iconBtnMeh, iconBtnOk, iconBtnAwful]
}

    // MARK:- Date and Time Label, Picker
    
//Date and Time label
    let dateTimeLabel: UILabel = {
        let now = Date()
        let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.setLocalizedDateFormatFromTemplate("h:mm")
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
            label.attributedText = NSAttributedString(string: "Today, " + dateFormatter.string(from: now), attributes:[.underlineStyle: NSUnderlineStyle.single.rawValue])
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textAlignment = .center
            label.font = UIFont(name: "American Typewriter", size: 18)
            label.isUserInteractionEnabled = true
        return label
    }()

    // MARK:- UI View
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
        
    // MARK:- Setup View Layout
    private func setupLayout() {
        self.backgroundColor = .white
        
        let view = UIView()
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        
        //Set mood question view
            moodQuestionTextView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
            moodQuestionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            moodQuestionTextView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
            moodQuestionTextView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        //Set DateTime label
            dateTimeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            dateTimeLabel.topAnchor.constraint(equalTo: moodQuestionTextView.bottomAnchor, constant: 12).isActive = true
        
        let moodStackView = UIStackView(arrangedSubviews: setIconButton())
            moodStackView.translatesAutoresizingMaskIntoConstraints = false
            moodStackView.spacing = 20
            moodStackView.distribution = .fillEqually
        
            moodStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
            moodStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300).isActive = true
            moodStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
            moodStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        
        view.addSubview(moodQuestionTextView)
        view.addSubview(dateTimeLabel)
        view.addSubview(moodStackView)
        }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
}
