//
//  TennisScoreViewControllerTests.swift
//  TennisScoreTests
//
//  Created by Ananth Bhamidipati on 30/01/2021.
//

import XCTest
@testable import TennisScore

class TennisScoreViewControllerTests: XCTestCase {
    
    var tennisScoreViewController: TennisScoreViewController?
    
    override func setUp() {
        let tennisScoreVC = TennisScoreViewController(viewModel: TennisScoreViewModel())
        tennisScoreViewController = tennisScoreVC
        _ = tennisScoreViewController?.view
    }

    override func tearDown() {
        tennisScoreViewController = nil
    }
    
    //tests
    
    //check tapping first button calls method
    // second button tap calls method
    //check label update button 1
    //check label update button 2

    func testPlayerAScoreButtonAction() {
        tennisScoreViewController?.playerAScoreButton.sendActions(for: .touchUpInside)
        let text = tennisScoreViewController?.scoreLabel.text
        XCTAssertEqual(text, "15 - 0")
    }
    
    func testPlayerBScoreButtonAction() {
        tennisScoreViewController?.playerBScoreButton.sendActions(for: .touchUpInside)
        let text = tennisScoreViewController?.scoreLabel.text
        XCTAssertEqual(text, "0 - 15")
    }
    
    func testResetButtonAction() {
        tennisScoreViewController?.playerAScoreButton.sendActions(for: .touchUpInside)
        tennisScoreViewController?.playerBScoreButton.sendActions(for: .touchUpInside)
        tennisScoreViewController?.resetButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(tennisScoreViewController?.viewModel.playerAScore, 0)
        XCTAssertEqual(tennisScoreViewController?.viewModel.playerBScore, 0)
    }
}
