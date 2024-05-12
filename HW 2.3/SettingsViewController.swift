//
//  ViewController.swift
//  HW 2.3
//
//  Created by Евгений on 01.04.2024.
//

import UIKit

final class SettingsViewController: UIViewController {
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLable: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var redSlider: UISlider!
    
    weak var delegate: SettingsViewControllerDelegate?
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        colorView.backgroundColor = viewColor
        
        setSlider(for: redSlider, greenSlider, blueSlider)
        
        redLable.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            redLable.text = String(format: "%.2f", redSlider.value)
        case greenSlider:
            greenLabel.text = String(format: "%.2f", greenSlider.value)
        default:
            blueLabel.text = String(format: "%.2f", blueSlider.value)
        }
    }
    
    
    @IBAction func doneButtonPressed() {
        delegate?.setColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}
    
extension SettingsViewController {
    private func setColor() {
        colorView.backgroundColor = UIColor.init(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setSlider(for sliders: UISlider...) {
        let ciColor = CIColor(color: viewColor)
        for slider in sliders {
            switch slider {
            case redSlider: redSlider.value = Float(ciColor.red)
            case greenSlider: greenSlider.value = Float(ciColor.green)
            default: blueSlider.value = Float(ciColor.blue)
            }
        }
    }
}

