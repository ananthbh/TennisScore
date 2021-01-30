//
//  TennisScoreViewModelTests.swift
//  TennisScoreTests
//
//  Created by Ananth Bhamidipati on 30/01/2021.
//

import XCTest
@testable import TennisScore

class TennisScoreViewModelTests: XCTestCase {
    
    var tennisScoreViewModel: TennisScoreViewModel?
    
    override func setUp() {
        tennisScoreViewModel = TennisScoreViewModel()
    }

    override func tearDown() {
        tennisScoreViewModel = nil
    }
    
    //MARK: - Tests
    
    func testPlayerAFocusOnGoing() {
        // Game is ongoing and player A is leading
        var score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerA)
        XCTAssertEqual(score?.focusPlayer, .playerA)
        XCTAssertEqual(score?.status, .ongoing)
        XCTAssertEqual(score?.score, "30 - 15")
    }
    
    func testPlayerBFocusOnGoing() {
        // Game is ongoing and player B is leading
        var score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerB)
        XCTAssertEqual(score?.focusPlayer, .playerB)
        XCTAssertEqual(score?.status, .ongoing)
        XCTAssertEqual(score?.score, "15 - 30")
    }
    
    func testPlayerABScoresLevelOnGoing() {
        // Game is ongoing and players scores are level
        var score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerA)
        XCTAssertEqual(score?.focusPlayer, nil)
        XCTAssertEqual(score?.status, .ongoing)
        XCTAssertEqual(score?.score, "30 All!")
    }
    
    func testPlayerAWinsStraight() {
        // Game won by Player A
        var score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerA)
        XCTAssertEqual(score?.focusPlayer, .playerA)
        XCTAssertEqual(score?.status, .win)
    }
    
    func testPlayerBWinsStraight() {
        // Game won by Player B
        var score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerB)
        XCTAssertEqual(score?.focusPlayer, .playerB)
        XCTAssertEqual(score?.status, .win)
    }
    
}
