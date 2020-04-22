//
//  MoodController.swift
//  Affect
//
//  Created by Stephanie on 3/17/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class MoodController: UIViewController {
    let moodView = MoodView()
    let dateTimeController = PickerView()
    let customNavigationController = CustomNavigationController()
      
// MARK: - Lifecycle
    override func loadView() {
        view = moodView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupNavigationBar()
        actionRecognizers()
        setupNavigationBarItem()
    }
    
// MARK: - Selectors
    
//    //Exits from view
    @objc func closeView(_ sender: UITapGestureRecognizer? = nil){
//        view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
    }

    @objc func labelClicked(_ sender: UITapGestureRecognizer? = nil) {
        dateTimeController.popoverView.alpha = 0
        
        popoverLayout()
        addBlurEffect(view: view, style: .systemUltraThinMaterialDark)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.dateTimeController.popoverView.alpha = 1
            self.dateTimeController.popoverView.frame.origin.y = -self.view.frame.height / 2
        })
    }
    
    @objc func cancelTapped(sender: Any) {
        removePopoverView()
        removeBlurEffect(view: view)
    }

    @objc func saveTapped() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        dateFormatter.doesRelativeDateFormatting = true
        
        if Calendar.current.isDateInToday(dateTimeController.dateTimePicker.date){
            moodView.dateTimeLabel.text = dateFormatter.string(for: dateTimeController.dateTimePicker.date)
        } else if Calendar.current.isDateInTomorrow(dateTimeController.dateTimePicker.date){
            dateFormatter.doesRelativeDateFormatting = false
            moodView.dateTimeLabel.text = dateFormatter.string(for: dateTimeController.dateTimePicker.date)
        } else {
            moodView.dateTimeLabel.text = dateFormatter.string(for: dateTimeController.dateTimePicker.date)
            print(dateTimeController.dateTimePicker.date)
        }
        removePopoverView()
        removeBlurEffect(view: view)
    }

    //Show Feelings view controller
    fileprivate func setupNavigationBarItem() {
        let backButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backButtonItem
    }
    
    @objc func nextViewFeelings(sender: UIButton?) {
//        for i in 0..<moodButtonArray.count {
//            print("\(moodButtonArray[i])")
//        }

//        for buttons in moodButtonArray {
//            if let buttonTapped = sender! {
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
        let feelingsController = FeelingsController()
        self.navigationController?.pushViewController(feelingsController, animated: true)
    }

 
// MARK: - Helper Functions
    private func setupNavigationBar() {
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func actionRecognizers() {
        //User can edit date and time by tapping on the dateTimeLabel
        let tapGuestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelClicked(_:)))
        moodView.dateTimeLabel.addGestureRecognizer(tapGuestureRecognizer)
        moodView.closeViewButton.addTarget(self, action: #selector(closeView(_:)), for: .touchUpInside)
    }
    
    func popoverLayout() {
        dateTimeController.popoverView.addSubview(dateTimeController.popoverStackView)
        dateTimeController.popoverStackView.anchor(top: dateTimeController.popoverView.topAnchor, left: dateTimeController.popoverView.leftAnchor, right: dateTimeController.popoverView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
        
        dateTimeController.popoverView.addSubview(dateTimeController.dateTimePicker)
        dateTimeController.dateTimePicker.anchor(top: dateTimeController.popoverStackView.bottomAnchor, left: dateTimeController.popoverView.leftAnchor, bottom: dateTimeController.popoverView.bottomAnchor, right: dateTimeController.popoverView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
        
        view.addSubview(dateTimeController.popoverView)
        dateTimeController.popoverView.centerX(inView: view)
        dateTimeController.popoverView.centerY(inView: view)
        dateTimeController.popoverView.anchor(width: 300, height: 200)
        
        dateTimeController.cancelButton.addTarget(self, action: #selector(cancelTapped(sender:)), for: .touchUpInside)
        dateTimeController.doneButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
    }
    
    fileprivate func removePopoverView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.dateTimeController.popoverView.alpha = 0
            self.dateTimeController.popoverView.frame.origin.y = -self.view.frame.height
        }, completion: {(value: Bool) in
            self.dateTimeController.popoverView.removeFromSuperview()
        })
    }
    
    //Background is blurred when user clicks on dateTimeLabel and popover appears
    func addBlurEffect(view: UIView, style: UIBlurEffect.Style) {
        view.backgroundColor = .white

        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.tag = 9
        view.insertSubview(blurEffectView, at: 4)
    }

    func removeBlurEffect(view: UIView){
        UIView.animate(withDuration: 0.3, animations: {
            view.viewWithTag(9)?.alpha = 0
            }, completion: {(value: Bool) in
                view.viewWithTag(9)?.removeFromSuperview()
            })
    }
}

