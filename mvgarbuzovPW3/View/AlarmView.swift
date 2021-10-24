//
//  AlarmView.swift
//  mvgarbuzovPW3
//
//  Created by Matvey Garbuzov on 24.10.2021.
//

import UIKit

class AlarmView: UIView {
    
    let alarmTime = UILabel()
    let alarmDays = UILabel()
    let alarmSwitch = UISwitch()
    var alarmTimeText = ""
    var heightOfView = 0.0, heightOfStack = 0.0
    
    convenience init(_ alarmTimeText: String = "",
            _ countOfAlarms: Int = 0,
            _ heightOfView: Double = 0.0) {
        self.init()
        self.heightOfView = heightOfView
        self.heightOfStack = heightOfView / Double(countOfAlarms)
        self.alarmTimeText = alarmTimeText
        setupAlarmView()
    }
    
    
    private func setupAlarmView() {
        self.backgroundColor = .black
        addSubview(alarmTime)
        addSubview(alarmDays)
        addSubview(alarmSwitch)
        
        
        //MARK: Set random day for alarmDays
        let days = ["Monday", "Tuesday", "Wednesday", "Thursday",
                    "Friday, so it's time for iOS!", "Saturday", "Sunday",
                    "Every ", "", ""]  // Add "" and "" to have 2/3 chance of "" in alarmDays.text
        alarmTime.text = alarmTimeText
        alarmDays.text = days[Int.random(in: 7...9)] + days[Int.random(in: 0...6)]
        
        
        //MARK: Set fonts for Time and Day
        alarmTime.adjustsFontSizeToFitWidth = true
        alarmTime.font = UIFont.boldSystemFont(ofSize: CGFloat(heightOfStack * 0.45))
        alarmTime.textColor = .lightGray
        
        alarmDays.textColor = .gray
        alarmDays.font = UIFont.systemFont(ofSize: CGFloat(heightOfStack * 0.45) / 2)
        
        
        //MARK: Add constraints
        setHeight(to: heightOfStack)
        
        alarmTime.pinTop(to: self, heightOfStack / 2 * 0.38)
        alarmTime.pinLeft(to: safeAreaLayoutGuide.leadingAnchor, 10)
        
        alarmDays.pinTop(to: self, heightOfStack * 0.68)
        alarmDays.pinLeft(to: safeAreaLayoutGuide.leadingAnchor, 10)
        alarmDays.pinRight(to: self, 10)
        
        alarmSwitch.pinTop(to: self, heightOfStack / 2 * 0.58)
        alarmSwitch.pinRight(to: safeAreaLayoutGuide.trailingAnchor, 10)
    }
}
