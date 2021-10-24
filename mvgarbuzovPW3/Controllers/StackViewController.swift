//
//  StackViewController.swift
//  mvgarbuzovPW3
//
//  Created by Matvey Garbuzov on 24.10.2021.
//

import UIKit

class StackViewController: UIViewController {
    private var scroll = UIScrollView()
    private var stack = UIStackView()
    private var arrayOfTime = [String]()
    private var strHours = "", strMinutes = "", alarmTimeText = ""
    var hours = 0
    var minutes = 0
    private let countOfAlarms = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
//MARK:   I dont know why does it doesnt work
//        title = "Hello World"
//        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .black
        setupStackView()
        SetupScroll()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scroll.contentSize = CGSize(
            width: self.view.frame.width,
            height: (stack.frame.height)
        )
    }
    
    private func SetupScroll() {
        view.addSubview(scroll)
        scroll.alwaysBounceVertical = true
        scroll.showsVerticalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        scroll.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        scroll.pin(to: view, .left, .right)
    }
    
    private func setupStackView() {
        let stack = UIStackView()
    
        stack.backgroundColor = .systemGray2
        stack.axis = .vertical
        stack.spacing = 1
        
        scroll.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.pin(to: scroll)
        
        let heightOfView = view.frame.height
        
        //MARK: Generate time and convert to String
        for _ in 0..<countOfAlarms {
            hours   = Int.random(in: 0...23)
            minutes = Int.random(in: 0...59)
            intToStringTime(hours: hours, minutes: minutes)
            print(alarmTimeText)
            arrayOfTime.append(alarmTimeText)
        }
        
        //MARK: Sort
        arrayOfTime.sort()
        
        //MARK: Send data to alarmView
        let heightOfStack = Double(heightOfView) / Double(countOfAlarms)
        for i in 0..<countOfAlarms {
            let alarm = AlarmView(
                arrayOfTime[i],
                heightOfStack
            )
            stack.addArrangedSubview(alarm)
            alarm.pinWidth(to: scroll.widthAnchor)
        }
        self.stack = stack
    }
    
    
    private func intToStringTime(hours:Int, minutes:Int) {
        strHours = String(hours)
        strMinutes = String(minutes)
        if (hours < 10) {
            strHours = "0" + strHours
        }
        if (minutes < 10) {
            strMinutes = "0" + strMinutes
        }
        alarmTimeText = strHours + ":" + strMinutes
    }
}
