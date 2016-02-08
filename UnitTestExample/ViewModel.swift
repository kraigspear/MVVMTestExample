//
//  ViewModel.swift
//  UnitTestExample
//
//  Created by Kraig Spear on 2/8/16.
//  Copyright © 2016 Kraig Spear. All rights reserved.
//

import Foundation

protocol CurrentDateFetchable {
    func currentDate() -> NSDate
}

class CurrentDateFetcher: CurrentDateFetchable {
    func currentDate() -> NSDate {
        return NSDate()
    }
}

class ViewModel {
    
    private weak var delegate: AgeViewable?
    private let dateFormatter: NSDateFormatter
    private let currentDateFetchable: CurrentDateFetchable
    
    init(delegate: AgeViewable,
        currentDateFetchable: CurrentDateFetchable) {
        self.delegate = delegate
        self.currentDateFetchable = currentDateFetchable
        self.dateFormatter = NSDateFormatter()
        self.dateFormatter.dateFormat = "MM/dd/yyyy"
    }
    
    convenience init(delegate: AgeViewable) {
        self.init(delegate: delegate, currentDateFetchable: CurrentDateFetcher())
    }
    
    func calcAge() {
        
        guard let delegate = self.delegate else {
            return
        }
        
        guard let birthDate = brithDate else {
            delegate.showError("Not a valid date")
            return
        }
        
        guard let firstName = delegate.firstName,
            lastName = delegate.lastName else {
            delegate.showError("Not a valid name")
            return
        }
        
        let calendar = NSCalendar.currentCalendar()
        
        let components = calendar.components(.Year,
            fromDate: birthDate,
            toDate: currentDateFetchable.currentDate(),
            options: .MatchFirst)
        
        delegate.ageResult = "\(lastName), \(firstName) You are \(components.year) years old"
        
    }
    
    private var brithDate: NSDate? {
        
        guard let delegate = self.delegate,
            dateString = delegate.birthDate else {
            return nil
        }
        
        return dateFormatter.dateFromString(dateString)
    }
    
}