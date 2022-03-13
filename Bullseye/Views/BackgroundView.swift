//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Ryan Bettenhausen on 3/11/22.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    
    var body: some View {
        VStack {
            TopView(game: $game)
            Spacer()
            BottomView(game: $game)
        }
        .padding()
        .background(
            RingsView()
        )
    }
}

struct TopView: View {
    @Binding var game: Game
    @State private var leadershipboardIsShowing = false
    
    var body: some View {
        HStack {
            Button(action: {
                game.restart()
            }){
                RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            }
            Spacer()
            Button(action: {
                leadershipboardIsShowing = true
            }){
                RoundedImageViewFilled(systemName: "list.dash")
            }
            .sheet(isPresented: $leadershipboardIsShowing, onDismiss: {}, content: {LeaderboardView(leaderboardIsShowing: $leadershipboardIsShowing)})
            
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            NumberView(title: "SCORE", text: String(game.score))
            Spacer()
            NumberView(title: "ROUND", text: String(game.round))
        }
    }
}

struct RingsView: View {
    
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            ForEach(1..<6) {ring in
                let size = CGFloat(ring * 100)
                let opacity = colorScheme == .dark ? 0.1 : 0.3
                Circle()
                    .stroke(lineWidth: 20.0)
                    .fill(RadialGradient(
                        colors: [
                            (Color("RingColor").opacity(opacity * 0.8)),
                            (Color("RingColor").opacity(0))],
                        center: .center,
                        startRadius: CGFloat(100),
                        endRadius: CGFloat(300)) )
                    .frame(width: size, height: size)
            }
        }
    }
}

struct NumberView: View {
    var title: String
    var text: String
    
    var body: some View {
        VStack {
            LabelText(title: title)
            RoundRectTextView(text: text)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(game: .constant(Game()))
    }
}
