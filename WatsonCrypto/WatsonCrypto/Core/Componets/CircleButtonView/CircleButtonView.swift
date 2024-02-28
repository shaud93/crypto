//
//  CircleButtonView.swift
//  WatsonCrypto
//
//  Created by D'Ante Watson on 2/18/24.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName:String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.accentColor)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.backgroundColor)
            )
            .shadow(
                color: Color.theme.accentColor.opacity(0.25),
                radius: 10)
            .padding()
    }
}

#Preview {
    CircleButtonView(iconName: "heart.fill")
        .previewLayout(.sizeThatFits)
}
