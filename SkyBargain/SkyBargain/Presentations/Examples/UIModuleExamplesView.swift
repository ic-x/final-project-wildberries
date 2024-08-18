//
//  UIModuleExamplesView.swift
//  SkyBargain
//

import SwiftUI
import UI

struct UIModuleExamplesView: View {
    @State private var isDisabled: Bool = true
    @State private var searchText: String = ""
    @State private var isLiked = false
    
    var body: some View {
        ScrollView{
            Text("Hello, World!")
                .font(.heading1)
                .fadeIn()
            
            
            VStack {
                Text("brandBackground")
                    .foregroundStyle(Color.brandBackground)
                Text("safe")
                    .foregroundStyle(Color.safe)
            }
            
            
            PrimaryButton(action: {
                print("Button was clicked!")
            }) {
                Text("Click Me")
            }
            .disabled(isDisabled)
            
            
            TextButton(action: {
                print("Button was clicked!!!")
            }) {
                Text("Click Me Please")
            }
            .padding()
            
            
            TextButton(action: {
                print("Button was clicked!!!")
            }) {
                Text("Click Me Please")
            }
            .disabled(isDisabled)
            .padding()
            
            
            Text("Custom Font Example")
                .font(.body2)
            Text("Custom Font Example")
                .font(.body1)
            
            
            VStack(spacing: 20) {
                Text("Hello, World!")
                    .font(.largeTitle)
                    .slideAndScale()
                
                PrimaryButton(action: {
                    print("Button Clicked")
                }) {
                    Text("Click Me")
                }
                .slideAndScale(offset: 100)
            }
            .padding()
            
            
            CustomTextField(text: .constant(""), placeholder: "some text...") {}
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding()
            
            
            CustomTextField(text: .constant(""), placeholder: "Enter your name") {
                Text("Name:")
                    .font(.body1)
            }
            .padding()
            
            
            SearchTextField(text: $searchText, placeholder: "Поиск")
                .padding()
            
            LikeButton(isLiked: $isLiked) {
                print("Liked status changed to: \(isLiked)")
            }
            .padding()
        }
    }
}

#Preview {
    UIModuleExamplesView()
}
