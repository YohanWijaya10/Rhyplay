//
//  ButtonAnimationModel.swift
//  MacroChallengeGroup4
//
//  Created by Timothyus Kevin Dewanto on 18/10/23.
//

import SwiftUI

struct ButtonAnimationComponent: View {
    @Binding var isHighlightingObject: Bool
    
    var body: some View {
        Button(action: {
            isHighlightingObject.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                withAnimation {
                    isHighlightingObject = false
                }
            }
        }) {
            if isHighlightingObject {
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .animation(Animation.easeInOut(duration: 1.0))
                    .foregroundColor(Color("Lead Scale50"))
                    .alignmentGuide(HorizontalAlignment.center) { a in
                        a[.leading] + (a[.trailing] - a[.leading]) / 2
                    }
                    .alignmentGuide(VerticalAlignment.center) { a in
                        a[.top] + (a[.bottom] - a[.top]) / 2
                    }
            }
        }
    }
}

