//
//  TennisScoreViewModel.swift
//  TennisScore
//
//  Created by Ananth Bhamidipati on 30/01/2021.
//

import Foundation

struct TennisScoreViewModel {
    
    public func score(for player
                        : Player) -> (focusPlayer: Player?, status: GameStatus, score: String) {
        return (.none, .ongoing, "Love all!")
    }
}
