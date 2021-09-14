//
//  ViewController.swift
//  fiftchElement2
//
//  Created by Diana on 14/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var numbersLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var numberNavItem: UINavigationItem!
    
    var screenNumber = 0
    let randomNumber: Int = .random(in: 1...100)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUserInterface()
    }
    
    private func updateUserInterface() {
        numbersLabel.text = numbers[screenNumber]
        textLabel.text = text[screenNumber]
        numberNavItem.backButtonTitle = numbers[screenNumber]
        if screenNumber == 4 {
            nextButton.isHidden = true
        }
    }
    
    let numbers: [String] = [
        "Первый",
        "Второй",
        "Третий",
        "Четвертый",
        "Пятый"
    ]
    var text: [String] = [
        "загадано число от 1 до 100",
        "скоро узнаем это число",
        "пока рано знать о нем",
        "на следующем экране узнаем",
        "было загадано число "
    ]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewContr = segue.destination as? ViewController {
            viewContr.screenNumber = screenNumber + 1
            if viewContr.screenNumber == 4{
                viewContr.text[4] += "\(randomNumber)"
            }
        }
    }
}

