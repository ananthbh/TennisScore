//
//  TennisScoreViewModel.swift
//  TennisScore
//
//  Created by Ananth Bhamidipati on 30/01/2021.
//

import Foundation

struct TennisScoreViewModel {
    
    public func score(score: Player) -> (focusPlayer: Player, status: GameStatus, score: String) {
        return (.playerA, .normal, "Love all!")
    }
}
