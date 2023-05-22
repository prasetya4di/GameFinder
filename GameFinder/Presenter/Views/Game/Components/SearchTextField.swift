//
//  SearchTextField.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import SwiftUI

struct SearchTextField: View {
    let isDisabled: Bool
    @Binding var text: String
    
    let onSearch: () -> Void
    
    @State private var isEditing = false
    @FocusState private var focusedField: String?
    
    var body: some View {
        HStack {
            TextField("Search ...", text: $text)
                .focused($focusedField, equals: "search")
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                        
                        if isEditing {
                            Button {
                                self.text = ""
                                resetEditing()
                            } label: {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                            }
                        }
                    }
                )
                .onTapGesture {
                    self.isEditing = true
                }
            
            if isEditing {
                Button {
                    onSearch()
                    
                    resetEditing()
                } label: {
                    Text("Search")
                }
                .disabled(isDisabled)
                .transition(.move(edge: .trailing))
            }
        }
    }
    
    private func resetEditing() {
        withAnimation {
            self.focusedField = nil
            self.isEditing = false
        }
    }
}

struct SearchTextField_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextField(
            isDisabled: false, text: .constant("")
        ) {}
    }
}
