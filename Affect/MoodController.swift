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
      
// MARK: - Lifecycle
    override func loadView() {
        view = moodView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        actionRecognizers()
        
        closeViewButton.addTarget(self, action: #selector(closeView(_:)), for: .touchUpInside)

    }
    
// MARK: - Selectors
    
//    //Exits from view
    @objc func closeView(_ sender: UITapGestureRecognizer? = nil){
//        view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
    }

    @objc func labelClicked(_ sender: UITapGestureRecognizer? = nil) {
        popoverView.alpha = 0
        
        popoverLayout()
        addBlurEffect(view: view, style: .systemUltraThinMaterialDark)
        
        UIView.animate(withDuration: 0.3, animations: {
            popoverView.alpha = 1
            popoverView.frame.origin.y = -self.view.frame.height / 2
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
        
//        let dateComponents = DateComponents(calendar: .current, timeZone: .current, month: 1, day: 1, hour: 10, minute: 10)
//        let currentCalender = Calendar.current
//        let currentDate = currentCalender.date(from: dateComponents)
        
        if Calendar.current.isDateInToday(dateTimePicker.date){
            dateTimeLabel.text = dateFormatter.string(for: dateTimePicker.date)
        } else if Calendar.current.isDateInTomorrow(dateTimePicker.date){
            dateFormatter.doesRelativeDateFormatting = false
            dateTimeLabel.text = dateFormatter.string(for: dateTimePicker.date)
        } else {
            dateTimeLabel.text = dateFormatter.string(for: dateTimePicker.date)
            print(dateTimePicker.date)
        }
        removePopoverView()
        removeBlurEffect(view: view)
    }
    
    //Show Feelings view controller
    @objc func nextViewFeelings(sender: UIButton) {
        for i in 0..<moodButtonArray.count {
            print("\(moodButtonArray[i]) + 1")
        }

//
        let feelingsController = FeelingsController()
//        self.navigationController?.pushViewController(feelingsController, animated: true)

        let navController = UINavigationController(rootViewController: feelingsController)
//        self.present(navController, animated: false, completion: nil)
        self.navigationController?.pushViewController(navController, animated: true)
//        let activitiesController = ActivitiesNotesController()
//        navigationController?.pushViewController(activitiesController, animated: true)
        
//        iconBtnImage.addTarget(self, action: #selector(MoodController.nextViewFeelings), for: .touchUpInside)
    }

 
// MARK: - Helper Functions
    func actionRecognizers() {
        //User can edit date and time by tapping on the dateTimeLabel
        let tapGuestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelClicked(_:)))
        dateTimeLabel.addGestureRecognizer(tapGuestureRecognizer)

        
//        btnClose.addTarget(self, action: #selector(closeView(sender:)), for: .touchUpInside)
    }
    
    func popoverLayout() {
        popoverView.addSubview(popoverStackView)
        popoverStackView.anchor(top: popoverView.topAnchor, left: popoverView.leftAnchor, right: popoverView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
        
        popoverView.addSubview(dateTimePicker)
        dateTimePicker.anchor(top: popoverStackView.bottomAnchor, left: popoverView.leftAnchor, bottom: popoverView.bottomAnchor, right: popoverView.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
        
        view.addSubview(popoverView)
        popoverView.centerX(inView: view)
        popoverView.centerY(inView: view)
        popoverView.anchor(width: 300, height: 200)
        
        cancelButton.addTarget(self, action: #selector(cancelTapped(sender:)), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
    }
    
    fileprivate func removePopoverView() {
        UIView.animate(withDuration: 0.3, animations: {
            popoverView.alpha = 0
            popoverView.frame.origin.y = -self.view.frame.height
        }, completion: {(value: Bool) in
            popoverView.removeFromSuperview()
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

