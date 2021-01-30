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
    
    //MARK: - OnGoing Tests
    
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
    
    //MARK: - Win Tests
    
    func testPlayerAWinsStraight() {
        // Game won by Player A
        var score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerA)
        XCTAssertEqual(score?.focusPlayer, .playerA)
        XCTAssertEqual(score?.status, .win)
        XCTAssertEqual(score?.score, "Player A Win!")
    }
    
    func testPlayerBWinsStraight() {
        // Game won by Player B
        var score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerB)
        XCTAssertEqual(score?.focusPlayer, .playerB)
        XCTAssertEqual(score?.status, .win)
        XCTAssertEqual(score?.score, "Player B Win!")
    }
    
    //MARK: - Deuce Tests
    
    func testDeuce() {
        // Game won by Player A
        var score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerB)
        XCTAssertEqual(score?.focusPlayer, .none)
        XCTAssertEqual(score?.status, .deuce)
        XCTAssertEqual(score?.score, "Deuce!")
    }
    
    func testDeuceAfterAdvantage() {
        // Game won by Player A
        var score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerA)
        XCTAssertEqual(score?.focusPlayer, .none)
        XCTAssertEqual(score?.status, .deuce)
        XCTAssertEqual(score?.score, "Deuce!")
    }
    
    //MARK: - Advantage Tests
    
    func testPlayerAAdvantage() {
        // Game won by Player A
        var score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerA)
        XCTAssertEqual(score?.focusPlayer, .playerA)
        XCTAssertEqual(score?.status, .advantage)
        XCTAssertEqual(score?.score, "Player A Advantage!")
    }
    
    func testPlayerAWinAfterAdvantage() {
        // Game won by Player A
        var score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerA)
        XCTAssertEqual(score?.focusPlayer, .playerA)
        XCTAssertEqual(score?.status, .win)
        XCTAssertEqual(score?.score, "Player A Win!")
    }
    
    func testPlayerBAdvantage() {
        // Game won by Player A
        var score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerB)
        XCTAssertEqual(score?.focusPlayer, .playerB)
        XCTAssertEqual(score?.status, .advantage)
        XCTAssertEqual(score?.score, "Player B Advantage!")
    }
    
    func testPlayerBWinAfterAdvantage() {
        // Game won by Player A
        var score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerA)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerB)
        score = tennisScoreViewModel?.score(for: .playerB)
        XCTAssertEqual(score?.focusPlayer, .playerB)
        XCTAssertEqual(score?.status, .win)
        XCTAssertEqual(score?.score, "Player B Win!")
    }
    
    //MARK: - Reset
    
    func testReset() {
        tennisScoreViewModel?.reset()
        XCTAssertEqual(tennisScoreViewModel?.playerAScore, 0)
        XCTAssertEqual(tennisScoreViewModel?.playerBScore, 0)
    }
    
}
