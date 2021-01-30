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
    
    func testPlayerAWinsStraight() {
        var score = tennisScoreViewModel?.score(score: .playerA)
        score = tennisScoreViewModel?.score(score: .playerA)
        score = tennisScoreViewModel?.score(score: .playerA)
        score = tennisScoreViewModel?.score(score: .playerA)
        XCTAssertEqual(score?.focusPlayer, .playerA)
        XCTAssertEqual(score?.score, "win")
        XCTAssertEqual(score?.status, .win)
    }
    
    func testPlayerBWinsStraight() {
        var score = tennisScoreViewModel?.score(score: .playerB)
        score = tennisScoreViewModel?.score(score: .playerB)
        score = tennisScoreViewModel?.score(score: .playerB)
        score = tennisScoreViewModel?.score(score: .playerB)
        XCTAssertEqual(score?.focusPlayer, .playerB)
        XCTAssertEqual(score?.score, "win")
        XCTAssertEqual(score?.status, .win)
    }
    
}
