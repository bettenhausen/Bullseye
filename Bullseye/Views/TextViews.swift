//
//  TextViews.swift
//  Bullseye
//
//  Created by Ryan Bettenhausen on 3/6/22.
//

import SwiftUI

struct InstructionsViews: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Color("TextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .fontWeight(.black)
            .kerning(-1.0)
            .foregroundColor(Color("TextColor"))
    }
}

struct SliderLabelTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .foregroundColor(Color("TextColor"))
            .frame(width: 35.0)
    }
}

struct LabelText: View {
    var title: String
    
    var body: some View {
        Text(title)
            .bold()
            .font(.caption)
            .foregroundColor(Color("TextColor"))
            .kerning(1.5)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionsViews(text: "Instructions")
            BigNumberText(text: "999")
            SliderLabelTextView(text: "1")
            LabelText(title: "SCORE")
        }
    }
}
