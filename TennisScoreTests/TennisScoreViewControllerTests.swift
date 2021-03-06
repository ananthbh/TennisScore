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

    func testPlayerAScoreButtonAction() {
        tennisScoreViewController?.playerAScoreButton.sendActions(for: .touchUpInside)
        let text = tennisScoreViewController?.scoreLabel.text
        XCTAssertEqual(text, "15 - Love")
    }
    
    func testPlayerBScoreButtonAction() {
        tennisScoreViewController?.playerBScoreButton.sendActions(for: .touchUpInside)
        let text = tennisScoreViewController?.scoreLabel.text
        XCTAssertEqual(text, "Love - 15")
    }
    
    func testResetButtonAction() {
        tennisScoreViewController?.playerAScoreButton.sendActions(for: .touchUpInside)
        tennisScoreViewController?.playerBScoreButton.sendActions(for: .touchUpInside)
        tennisScoreViewController?.resetButton.sendActions(for: .touchUpInside)
        XCTAssertEqual(tennisScoreViewController?.viewModel.playerAScore, 0)
        XCTAssertEqual(tennisScoreViewController?.viewModel.playerBScore, 0)
    }
}
