//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Jimmy Zhang on 1/7/21.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .padding()
            .clipShape(RoundedRectangle(cornerRadius:10))
            
    }
}

extension View {
    func titleStyle() -> some View {
        self.modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello World")
            .titleStyle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
