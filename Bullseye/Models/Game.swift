//
//  Game.swift
//  Bullseye
//
//  Created by Ryan Bettenhausen on 3/1/22.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(sliderValue: Int) -> Int {
        let diff = abs(target - sliderValue)
        let bonus = getBonus(difference: diff)
        
        return 100 - diff + bonus
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
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
