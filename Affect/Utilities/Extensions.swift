//
//  Extensions.swift
//  Affect
//
//  Created by Stephanie on 3/26/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

extension UIView {
    func titleTextView(text: String, textSize: CGFloat) -> UITextView {
        let textView = UITextView()
        textView.text = text
        textView.font = UIFont(name: "American Typewriter", size: textSize)
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.textContainer.lineBreakMode = .byWordWrapping
        return textView
    }
    
    func iconBtn(image: UIImage) -> UIButton {
        let iconBtnImage = UIButton(type: .custom)
        iconBtnImage.setImage(image, for: .normal)
        iconBtnImage.imageView?.contentMode = .scaleAspectFit
        iconBtnImage.addTarget(self, action: #selector(MoodController.nextViewFeelings(sender:)), for: .touchUpInside)
        return iconBtnImage
    }
    
    func navigationBtn(text: String) -> UIButton {
        let navBtn = UIButton(type: .custom)
        //navBtn.backgroundColor = UIColor(red: 216/256, green: 216/256, blue: 216/256, alpha: 0.5)
        navBtn.setTitle(text, for: .normal)
        navBtn.titleLabel?.font = UIFont(name: "Gill Sans", size: 18)
        navBtn.setTitleColor(.darkGray, for: .normal)
        navBtn.layer.cornerRadius = 5
        
        return navBtn
    }
    
    func inputTextView(placeholder: String) -> UITextView {
        let textView = UITextView()
        textView.font = UIFont(name: "Gill Sans", size: 14)
        textView.keyboardAppearance = .default
        textView.textAlignment = .left
        textView.isScrollEnabled = true
        textView.textContainer.lineBreakMode = .byWordWrapping
        textView.text = placeholder
        textView.textColor = .darkGray
        textView.backgroundColor = UIColor(red: 216/256, green: 216/256, blue: 216/256, alpha: 0.0)
        
        return textView
    }
    
    func inputContainerView(inputTextView: UITextView) -> UIView {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor(red: 216/256, green: 216/256, blue: 216/256, alpha: 0.3)

        view.addSubview(inputTextView)
        inputTextView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 15, paddingLeft: 15, paddingBottom: 15, paddingRight: 15)
        
        inputTextView.addDoneButton(title: "Done", target: self, selector: #selector(ActivitiesNotesController.tapDone(sender:)))

        return view
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil){
    
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func centerX(inView view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil,
                 paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        
        if let left = leftAnchor {
            anchor(left: left, paddingLeft: paddingLeft)
        }
    }}

//Adds Done button to dismiss keyboard from view
extension UITextView {
    func addDoneButton(title: String, target: Any, selector: Selector) {
        
        let toolBar = UIToolbar(frame: CGRect(x: 0.0,
                                              y: 0.0,
                                              width: UIScreen.main.bounds.size.width,
                                              height: 44.0))//1
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)//2
        let barButton = UIBarButtonItem(title: title, style: .plain, target: target, action: selector)//3
        toolBar.setItems([flexible, barButton], animated: false)//4
        self.inputAccessoryView = toolBar//5
    }
}

//Dismisses Mood, Feelings, and Activities views to Home view, sliding from top to bottom
//extension UINavigationController {
//    func setupNavigationBar() {
//        navigationController?.navigationBar.isTranslucent = false
//        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        navigationController?.navigationBar.shadowImage = UIImage()
//    }
//
//    @objc func closeView(sender: UIButton){
//        view.window?.rootViewController?.dismiss(animated: true, completion: nil)
//    }
//    
//    func pushViewControllerFromTop(controller: UIViewController) {
//        let transition = CATransition()
//        transition.duration = 0.5
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromRight
//        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
//        view.window!.layer.add(transition, forKey: kCATransition)
//        pushViewController(controller, animated: false)
//    }
//}
