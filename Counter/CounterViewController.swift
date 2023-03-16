//
//  CounterViewController.swift
//  Counter
//
//  Created by Georgy on 15.03.2023.
//

import UIKit

class CounterViewController: UIViewController {
    @IBOutlet private weak var numberLabel: UILabel!
    
    @IBOutlet private weak var historyTextView: UITextView!
    private var number = 0 // переменная-счетчик
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func didChangeNumberLabel(_ sender: UIButton) {
        // Получаем текущее время
        let time = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY HH:mm:ss"
        let formatteddate = formatter.string(from: time as Date)
        
        //Проверяем по заранее заданным идентификаторам какая кнопка была нажата если такого не имется не делаем ничего
        var history = ""
        switch sender.restorationIdentifier {
        case "Minus":
            guard number > 0 else{
                history = "\n\(formatteddate): Попытка изменить значение счетчика ниже 0"
                break
            }
            number -= 1
            history = "\n\(formatteddate): Значение измененно на -1"
        case "Plus":
             number += 1
            history = "\n\(formatteddate): Значение измененно на +1"
        case "Refresh":
             number = 0
             history = "\n\(formatteddate): Значение сброшено"
        default: return
        }
        
        //Вносим визуальные изменения в historyTextView и в numberLabel
        historyTextView.text += history
        numberLabel.text = String(number)
    }
    
    
}
