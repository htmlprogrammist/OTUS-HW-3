//
//  RocketListInteractorTests.swift
//  Unit-Tests
//
//  Created by Егор Бадмаев on 21.12.2022.
//

import XCTest
@testable import Task_20

class RocketListInteractorTests: XCTestCase {
    
    /// SUT.
    var interactor: RocketListInteractor!
    
    var presenter: StubRocketListPresenter!
    let mockNetworkManager = MockNetworkManager()

    override func setUpWithError() throws {
        interactor = RocketListInteractor(networkManager: mockNetworkManager)
        presenter = StubRocketListPresenter()
        interactor.presenter = presenter
    }

    override func tearDownWithError() throws {
        presenter = nil
        interactor = nil
    }

    func testProvidingData() throws {
        // Given
        mockNetworkManager.isSuccessful = true
        
        // When
        interactor.requestData()
        
        // Then
        guard let presenter = interactor.presenter as? StubRocketListPresenter else {
            XCTFail("Could cast presenter to stub")
            return
        }
        XCTAssertNotNil(presenter.recievedData, "Recieved data should not be nil")
    }
    
    func testProvidingError() throws {
        mockNetworkManager.isSuccessful = false
        
        interactor.requestData()
        
        guard let presenter = interactor.presenter as? StubRocketListPresenter else {
            XCTFail("Could cast presenter to stub")
            return
        }
        XCTAssertNotNil(presenter.recievedError, "Recieved error should not be nil")
    }
}
