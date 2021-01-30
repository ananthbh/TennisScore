//
//  TennisScoreViewModel.swift
//  TennisScore
//
//  Created by Ananth Bhamidipati on 30/01/2021.
//

import Foundation

struct TennisScoreViewModel {
    
    private var playerAScore: Int = 0
    private var playerBScore: Int = 0
    
    //MARK: - Public methods
    
    public mutating func score(for player: Player) -> (focusPlayer: Player?, status: GameStatus, score: String) {
        self.addScore(player: player)
        return (getFocusPlayer(), getStatus(), getScore())
    }
    
    
    //MARK: - Private methods
    
    private mutating func addScore(player: Player) {
        if player == .playerA {
            playerAScore += 1
        } else {
            playerBScore += 1
        }
    }
    
    private func getFocusPlayer() -> Player? {
        if playerAScore == playerBScore {
            return .none
        } else if playerAScore > playerBScore {
            return .playerA
        } else {
            return .playerB
        }
    }
    
    private func getStatus() -> GameStatus {
        if checkForWin() {
            return .win
        }
        
        if checkDeuce() {
            return .deuce
        }
        
        if checkAdvantage() {
            return .advantage
        }
        
        return .ongoing
        
    }
    
    private func getScore() -> String {
        guard getStatus() == .ongoing else { return getSpecialScores() }
        if (playerAScore == playerBScore) {
            return getScoreStringIfEqual()
        } else {
            let playerA = calculateScore(score: playerAScore)
            let playerB = calculateScore(score: playerBScore)
            return  playerA + " - " + playerB
        }
    }
    
    //MARK: - Private methods: Game scenarios
    
    private func checkForWin() -> Bool {
        let playerAWinScenario = playerBScore >= 4 && playerBScore >= playerAScore + 2
        let playerBWinScenario = playerAScore >= 4 && playerAScore >= playerBScore + 2
        if (playerAWinScenario) || (playerBWinScenario) {
            return true
        }
        return false
    }
    
    private func checkDeuce() -> Bool {
        return playerAScore >= 3 && playerBScore == playerAScore
    }
    
    private func checkAdvantage() -> Bool {
        let playerAAdvantageScenario = playerBScore >= 4 && playerBScore == playerAScore + 1
        let playerBAdvantageScenario = playerAScore >= 4 && playerAScore == playerBScore + 1
        if playerAAdvantageScenario || playerBAdvantageScenario {
            return true
        }
        return false
    }
    
    //MARK: - Private methods: Helpers
    
    private func getPlayerName(player: Player?) -> String {
        if let player = player {
            return player == .playerA ? "Player A" : "Player B"
        }
        return "??"
    }
    
    private func calculateScore(score: Int) -> String {
        switch score {
        case 0:
            return "Love"
        case 1:
            return "15"
        case 2:
            return "30"
        case 3:
            return "40"
        default:
            return "??"
        }
    }
    
    private func getScoreStringIfEqual() -> String {
        switch (playerAScore, playerBScore) {
        case (0,0):
            return "Love All!"
        case (1,1):
            return "15 All!"
        case (2,2):
            return "30 All!"
        default:
            return "??"
        }
    }
    
    private func getSpecialScores() -> String {
        switch getStatus() {
        case .deuce:
            return "Deuce!"
        case .win:
            return "\(getPlayerName(player: getFocusPlayer())) Win!"
        case .advantage:
            return "\(getPlayerName(player: getFocusPlayer())) Advantage!"
        default:
            return "??"
        }
    }
}
