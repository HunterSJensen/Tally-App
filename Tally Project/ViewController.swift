//
//  ViewController.swift
//  Tally Project
//
//  Created by Hunter Jensen on 9/25/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    var currentNumberToAdd: Int {
        segmentedControl.selectedSegmentIndex + 1
    }
    var labelValue: Int = 0 {
        didSet {
            countLabel.text = "\(labelValue)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelValue = Int(countLabel.text!) ?? 0
    }
    
    @IBAction func countButtonPressed(_ sender: Any) {
        increase()
    }
    
    @IBAction func swipedDown(_ sender: UISwipeGestureRecognizer) {
        labelValue -= currentNumberToAdd
    }
    
    
    func increase() {
         labelValue += currentNumberToAdd
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            showShakeAlert()
        }
    }

    func showShakeAlert() {
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        let resetAction = UIAlertAction(title: "Reset", style: .destructive) { _ in
            self.resetCount()
        }
        alert.addAction(resetAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func resetCount() {
        labelValue = 0
    }
}

