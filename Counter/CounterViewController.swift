//
//  CounterViewController.swift
//  Counter
//
//  Created by Georgy on 15.03.2023.
//

import UIKit

class CounterViewController: UIViewController {
    @IBOutlet weak var numberLabel: UILabel!
    
    @IBOutlet weak var historyTextView: UITextView!
    var number = 0 // переменная-счетчик
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Counter(_ sender: UIButton) {
        // Получаем текущее время
        var time = NSDate()
        var formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY HH:mm:ss"
        var formatteddate = formatter.string(from: time as Date)
        
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
