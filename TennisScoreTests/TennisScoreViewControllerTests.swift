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
    
}
