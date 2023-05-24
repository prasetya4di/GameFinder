//
//  ToastModifier.swift
//  GameFinder
//
//  Created by Prasetya on 24/05/23.
//

import Foundation
import SwiftUI

struct ToastView<Content: View>: View {
    @Binding var isPresented: Bool
    let content: () -> Content
    let duration: Double
    
    var body: some View {
        if isPresented {
            VStack {
                Spacer()
                content()
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .opacity(isPresented ? 1.0 : 0.0)
                    .animation(.easeInOut, value: isPresented)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    withAnimation {
                        isPresented = false
                    }
                }
            }
        } else {
            EmptyView()
        }
    }
}

extension View {
    func toast<Content: View>(
        isPresented: Binding<Bool>,
        duration: Double = 2.0,
        content: @escaping () -> Content
    ) -> some View {
        self.overlay(
            ToastView(
                isPresented: isPresented,
                content: content,
                duration: duration
            )
        )
    }
}
