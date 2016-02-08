//
//  UnitTestExampleTests.swift
//  UnitTestExampleTests
//
//  Created by admin on 2/8/16.
//  Copyright © 2016 admin. All rights reserved.
//

import XCTest
@testable import UnitTestExample

class UnitTestExampleTests: XCTestCase {
    
    class ViewMock: AgeViewable {
        
        var firstName: String?
        var lastName: String?
        var birthDate: String?
        var ageResult: String?
        
        var _error: String?
        func showError(error: String) {
            _error = error
        }
    }
    
    class DateFetchMock: CurrentDateFetchable {
        
        var date: NSDate?
        
        func currentDate() -> NSDate {
            XCTAssertNotNil(date, "You should really set the date first")
            return date!
        }
    }
    
    
    var viewModel: ViewModel!
    var viewMock: ViewMock!
    var dateFetcher: DateFetchMock!
    
    override func setUp() {
        super.setUp()
        viewMock = ViewMock()
        dateFetcher = DateFetchMock()
        viewModel = ViewModel(delegate: viewMock, currentDateFetchable: dateFetcher)
    }
    
    override func tearDown() {
        viewMock = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testAgeIsCorrect() {
        viewMock.firstName = "Johnny"
        viewMock.lastName = "Appleseed"
        viewMock.birthDate = "1/1/1980"
        
        let feb8th2016: NSTimeInterval = 1454959998
        dateFetcher.date = NSDate(timeIntervalSince1970: feb8th2016)
        
        viewModel.calcAge()
        
        let expectedMessage = "Appleseed, Johnny You are 36 years old"
        
        XCTAssertNotNil(viewMock.ageResult)
        print(viewMock.ageResult!)
        XCTAssertEqual(expectedMessage, viewMock.ageResult!)
        
    }
    
    func testErrorOccuresWhenDateIsEmpty() {
        viewMock.firstName = "Johnny"
        viewMock.lastName = "Appleseed"
        viewModel.calcAge()
        XCTAssertNotNil(viewMock._error)
    }
    
}
