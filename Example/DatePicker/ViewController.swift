//
//  ViewController.swift
//  DatePicker
//
//  Created by amirshayegh on 08/08/2018.
//  Copyright (c) 2018 amirshayegh. All rights reserved.
//

import UIKit
import DatePicker

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label.alpha =  0

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }

    @IBAction func popover(_ sender: UIButton) {
        self.label.alpha = 1
        let picker = DatePicker()
        
        picker.setupYearless(minMonth: 3, minDay: 8 ) { (selected, month, day) in
            if selected, let day = day, let month = month {
                self.label.text = "selected \(DatePickerHelper.shared.month(number: month)) \(day)"
            } else {
                self.label.text = "Cancelled"
            }
        }
        
        picker.show(in: self, on: sender)

    }

    @IBAction func present(_ sender: UIButton) {
        self.label.alpha = 0
        let picker = DatePicker()
        let min = "1922/01/01"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        picker.setup(beginWith: Date(),min: dateFormatter.date(from: min)!,max: Date()) { (selected, date) in
            if selected, let selectedDate = date {
                print(selectedDate.string())
            } else {
                print("Cancelled")
            }
        }

        picker.show(in: self)
            
    }
}

