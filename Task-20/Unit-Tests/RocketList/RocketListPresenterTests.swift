//
//  RocketListPresenterTests.swift
//  Unit-Tests
//
//  Created by Егор Бадмаев on 21.12.2022.
//

import XCTest
@testable import Task_20

class RocketListPresenterTests: XCTestCase {
    
    var presenter: RocketListPresenter!

    override func setUpWithError() throws {
        let router = MockRocketListRouter()
        let interactor = MockRocketListInteractor()
        presenter = RocketListPresenter(router: router, interactor: interactor)
    }

    override func tearDownWithError() throws {
        presenter = nil
    }
    
    func testProvidingData() throws {
        // Given
        let stubView = StubRocketListView()
        presenter.view = stubView
        
        // When
        presenter.dataDidRecieved(data: [])
        
        // Then
        XCTAssertNotNil(stubView.data)
    }
    
    func testProvidingError() throws {
        let stubView = StubRocketListView()
        presenter.view = stubView
        
        presenter.handleError(error: .networkError)
        
        XCTAssertNotNil(stubView.errorTitle)
        XCTAssertNotNil(stubView.errorMessage)
    }
    
    func testProvidingDataToRouter() throws {
        let rocket = Rocket()
        
        XCTAssertNoThrow(presenter.didSelect(rocket: rocket))
    }
}
