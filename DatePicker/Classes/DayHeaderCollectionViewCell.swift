//
//  DayHeaderCollectionViewCell.swift
//  FreshDate
//
//  Created by Amir Shayegh on 2018-08-06.
//

import UIKit

class DayHeaderCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dayLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(day: String) {

        switch day {
        case "Sun":
            self.dayLabel.text = "日"
        case "Mon":
            self.dayLabel.text = "一"
        case "Tue":
            self.dayLabel.text = "二"
        case "Wed":
            self.dayLabel.text = "三"
        case "Thu":
            self.dayLabel.text = "四"
        case "Fri":
            self.dayLabel.text = "五"
        case "Sat":
            self.dayLabel.text = "六"
        default:
            self.dayLabel.text = day
        }

        style()
    }

    func style() {
        self.backgroundColor = DatePickerColors.background
        self.dayLabel.textColor = DatePickerColors.main
        self.dayLabel.font = Fonts.medium
    }

}
