//
//  Game.swift
//  Bullseye
//
//  Created by Ryan Bettenhausen on 3/1/22.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        if loadTestData {
            leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 200, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 50, date: Date()))
            leaderboardEntries.append(LeaderboardEntry(score: 20, date: Date()))
        }
    }
    
    func points(sliderValue: Int) -> Int {
        let diff = abs(target - sliderValue)
        let bonus = getBonus(difference: diff)
        
        return 100 - diff + bonus
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        updateLeaderboard(points: points)
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
    
    mutating func updateLeaderboard(points: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
    }
    
    private func getBonus(difference: Int) -> Int {
        if difference == 0 {
            return 100
        }
        else if difference <= 2 {
            return 50
        }
        else {
            return 0
        }
    }
}
