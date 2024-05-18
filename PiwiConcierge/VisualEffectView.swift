//
//  VisualEffectView.swift
//  PiwiConcierge
//
//  Created by Derek Martin on 5/16/24.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: effect)
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = effect
    }
}

struct VisualEffectView_Previews: PreviewProvider {
    static var previews: some View {
        VisualEffectView(effect: UIBlurEffect(style: .systemThinMaterial))
    }
}
