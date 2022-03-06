//
//  ContentView.swift
//  Bullseye
//
//  Created by Ryan Bettenhausen on 2/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(.all)
            VStack {
                InstructionsView(game: $game)
                SliderView(sliderValue: $sliderValue)
                    .padding()
                Button(action: {
                    alertIsVisible = true
                }) {
                    Text("Hit me".uppercased())
                        .bold()
                        .font(.title3)
                }
                .padding(20.0)
                .background(ZStack {
                    Color("ButtonColor")
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                })
                .foregroundColor(Color.white)
                .cornerRadius(21.0)
                .alert("Hello there!", isPresented: $alertIsVisible){
                    Button("Awesome!"){}
                } message: {
                    let roundedValue = Int (sliderValue.rounded())
                    Text("The slider's value is \(roundedValue).\n" + "You scored \(game.points(sliderValue: roundedValue)) points this round.")
                }
            }
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    var body: some View{
        VStack {
            InstructionsViews(text: "🎯🎯🎯\nPut the bullsye as close as you can to")
                .padding(.leading, 30.0)
                .padding(.trailing, 30.0)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    var body: some View {
        HStack {
            SliderLabelTextView(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelTextView(text: "100")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
