//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Jimmy Zhang on 1/7/21.
//

import SwiftUI

struct ContentView: View {
    @State private var move = "Paper"
    @State private var win = false
    @State private var score = 0
    
    func newRound() {
        move = moves[Int.random(in: 0...2)]
        win = Bool.random()
    }
    
    let moves = ["Rock", "Paper", "Scissors"]
    
    var body: some View {
        NavigationView {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 15) {
                Text("My Move: \(move)")
                Text("You have to: \(win ? "Win" : "Lose")")
                
                Button(moves[0]) {
                    if(win && self.move == "Scissors" || !win && self.move == "Paper"  ) {
                        self.score += 1
                    } else {
                        self.score -= 1
                    }
                    self.newRound()
                }
                
                Button(moves[1]) {
                    if(win && self.move == "Rock" || !win && self.move == "Scissors"  ) {
                        self.score += 1
                    } else {
                        self.score -= 1
                    }
                    self.newRound()
                }
                
                Button(moves[2]) {
                    if(win && self.move == "Paper" || !win && self.move == "Rock"  ) {
                        self.score += 1
                    } else {
                        self.score -= 1
                    }
                    self.newRound()
                }
                
                Text("Score: \(score)")
            }
            .navigationBarTitle(Text("Rock, Paper, Scissors"), displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
