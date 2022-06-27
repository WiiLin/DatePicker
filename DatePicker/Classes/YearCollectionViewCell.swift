//
//  YearCollectionViewCell.swift
//  FreshDate
//
//  Created by Amir Shayegh on 2018-08-06.
//

import UIKit

class YearCollectionViewCell: UICollectionViewCell {
    // MARK: Optionals
    var parent: YearsCollectionViewCell?

    // MARK: Outlets
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!

    // MARK: Outlet Actions
    @IBAction func butonClicked(_ sender: UIButton) {
        guard let p = parent, let gp = p.parent, let y = label.text else {return}
        var newY = y.replacingOccurrences(of: "民國", with: "")
        newY = newY.replacingOccurrences(of: "年", with: "")
        newY = newY.replacingOccurrences(of: " ", with: "")
        guard let year = Int(newY) else {return}
        gp.changeYear(to: year + 1911)
    }

    // MARK: Setup
    func setup(year: Int, parent: YearsCollectionViewCell) {
        self.parent = parent
        if year != 0 {
            self.label.text = "民國 \(year - 1911) 年"
        } else {
            self.label.text = ""
        }
        if let gp = parent.parent {
            if year == gp.year {
                select()
                return
            }
        }

        deselect()
    }

    func select() {
        UIView.animate(withDuration: 0.3, animations: {
            self.label.font = Fonts.heavy
            self.label.textColor = DatePickerColors.main
        })
    }

    func deselect() {
        UIView.animate(withDuration: 0.3, animations: {
            self.label.font = Fonts.regular
            self.label.textColor = DatePickerColors.inactiveText
        })
    }
}
