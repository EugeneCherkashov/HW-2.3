//
//  MainViewController.swift
//  HW 2.3
//
//  Created by Евгений on 12.05.2024.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setColor (_ color: UIColor)
}

final class MainViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController
        settingsVC?.delegate = self
        settingsVC?.viewColor = view.backgroundColor
    }
}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
