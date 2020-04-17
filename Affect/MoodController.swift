//
//  MoodController.swift
//  Affect
//
//  Created by Stephanie on 3/17/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit

class MoodController: UIViewController, UIPopoverPresentationControllerDelegate {

    let moodView = MoodView()
      
// MARK: - Lifecycle
    override func loadView() {
        view = moodView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        actionButtons()
        let tapGuestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelClicked(_:)))
        dateTimeLabel.addGestureRecognizer(tapGuestureRecognizer)
    }
    
// MARK: - Selectors
    
    //Exits from view
    @objc func labelClicked(_ sender: UITapGestureRecognizer? = nil) {
        print("432")
    }
    
    @objc func closeView(sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func loadPopover(sender: UIButton) {
        let presentingViewController = DateTimeController()
        let popoverNavigationController = UINavigationController(rootViewController: presentingViewController)
        popoverNavigationController.modalPresentationStyle = .popover
        let popover = popoverNavigationController.popoverPresentationController!
            popover.sourceRect = sender.bounds
            popover.delegate = self
            popover.permittedArrowDirections = .up
            popover.sourceView = sender

        presentingViewController.preferredContentSize = CGSize(width: 300, height: 200)
        presentingViewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelTapped))
        presentingViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(dateChanged))

        self.present(popoverNavigationController, animated: true, completion: nil)
    }
    
    @objc func cancelTapped(sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @objc func dateChanged() {
        let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US")
            dateFormatter.setLocalizedDateFormatFromTemplate("MMMd h:mm")
            dateTimeLabel.text = dateFormatter.string(from: dateTimePicker.date)
        self.dismiss(animated: true, completion: nil)
    }
    
    //Show Feelings view controller
    @objc func nextViewFeelings(sender: UIButton) {
        let feelingsController = FeelingsController()
        let navController = UINavigationController(rootViewController: feelingsController)
        self.present(navController, animated: false, completion: nil)
//        self.navigationController?.pushViewController(navController, animated: true)
    }

 
// MARK: - Helper Functions
    func actionButtons() {
        btnClose.addTarget(self, action: #selector(closeView(sender:)), for: .touchUpInside)
        editButton.addTarget(self, action: #selector(self.loadPopover), for: .touchUpInside)
    }
    
    //Delegate function to ensure adaption of presenting popup view controller
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none
    }
}

