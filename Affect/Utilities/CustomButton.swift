////
////  CustomButton.swift
////  Affect
////
////  Created by Stephanie on 4/21/20.
////  Copyright © 2020 Stephanie Chiu. All rights reserved.
////
//
//import UIKit
//
//class CustomButton: UIButton {
//
////    func iconBtn(image: UIImage) -> UIButton {
////        let iconBtnImage = UIButton(type: .custom)
////        iconBtnImage.setImage(image, for: .normal)
////        iconBtnImage.imageView?.contentMode = .scaleAspectFit
////        iconBtnImage.addTarget(self, action: #selector(MoodController.nextViewFeelings(sender:)), for: .touchUpInside)
////        return iconBtnImage
////    }
////
////    func navigationBtn(text: String) -> UIButton {
////        let navBtn = UIButton(type: .custom)
////        //navBtn.backgroundColor = UIColor(red: 216/256, green: 216/256, blue: 216/256, alpha: 0.5)
////        navBtn.setTitle(text, for: .normal)
////        navBtn.titleLabel?.font = UIFont(name: "Gill Sans", size: 18)
////        navBtn.setTitleColor(.darkGray, for: .normal)
////        navBtn.layer.cornerRadius = 5
////
////        return navBtn
////    }
//    
//    override init(frame: CGRect) {
//        let nextBtn = setupBottomNavButton(text: "Next")
//        let doneBtn = setupBottomNavButton(text: <#T##String#>)
//        super.init(frame: frame)
//
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func setupBottomNavButton(text: String) {
//        let navBtn = UIButton(type: .custom)
//        //navBtn.backgroundColor = UIColor(red: 216/256, green: 216/256, blue: 216/256, alpha: 0.5)
//        navBtn.setTitle(text, for: .normal)
//        navBtn.titleLabel?.font = UIFont(name: "Gill Sans", size: 18)
//        navBtn.setTitleColor(.darkGray, for: .normal)
//        navBtn.layer.cornerRadius = 5
//    }
//    
//    func setupMoodButton(image: UIImage) {
//        setImage(image, for: .normal)
//        imageView?.contentMode = .scaleAspectFit
//        addTarget(self, action: #selector(MoodController.nextViewFeelings(sender:)), for: .touchUpInside)
//    }
//    
//}
