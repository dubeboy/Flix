//
//  UIViewController+Elements.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/08.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import UIKit

// MARK: TOASTS
extension UIViewController {
    // TODO: - should be bale to show image animation
    // TODO: should be able to blur view controller below and should appear on top
    func presentToast(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
            alert.dismiss(animated: true, completion: nil)
        })
    }
    
    func presentAlert(title: String = "", message: String, ok: ((UIAlertAction) -> Void)?, cancel: ((UIAlertAction) -> Void)? = nil) {
        let okAction = UIAlertAction(title: "ok".localized, style: .default, handler: ok)
        let cancelAction = UIAlertAction(title: "cancel".localized, style: .cancel, handler: cancel)
        presentAlert(title: title, message: message, actions: okAction, cancelAction )
    }
    
    func presentAlert(title: String = "", message: String, actions: UIAlertAction...) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { action in
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: Keyboard Events
extension UIViewController {
    func listenToEvent(
        name: NSNotification.Name,
        selector: Selector
    ) {
        NotificationCenter.default.addObserver(
            self,
            selector: selector,
            name: name,
            object: nil
        )
    }
    
    func removeSelfFromNotificationObserver() {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: Keyboard
    func keyboardFrame(from notification: NSNotification) -> CGRect? {
        guard let userInfo = notification.userInfo else { return nil }
    
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey]
                as? NSValue else { return nil }
    
        return keyboardSize.cgRectValue
    }

}

// MARK navigation item additions
extension UIViewController {
    func addCloseButtonItem(toLeft: Bool = false, alertOnClose: Bool = false) {
        if toLeft {
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissViewController))
        } else {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(dismissViewController))
        }
    }
    
    @objc private func dismissViewController() {
        if isBeingPresented {
            self.dismiss(animated: true, completion: nil)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
}
