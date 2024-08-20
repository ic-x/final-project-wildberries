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
            
            Group {
                
                Text("Привет мир!")
                    .font(.heading1)
                    .fadeIn()
                
                
                VStack {
                    Text("brandBackground")
                        .foregroundStyle(Color.brandBackground)
                    Text("safe")
                        .foregroundStyle(Color.safe)
                }
                
                
                PrimaryButton(action: {
                    print("Кнопка нажата!")
                }) {
                    Text("Нажми на меня")
                }
                .disabled(isDisabled)
                
                
                TextButton(action: {
                    print("Кнопка была нажата!!!")
                }) {
                    Text("Нажми на меня, пожалуйста")
                }
                .padding()
                
                
                TextButton(action: {
                    print("Кнопка была нажата!!!")
                }) {
                    Text("Нажми на меня, пожалуйста")
                }
                .disabled(isDisabled)
                .padding()
                
                
                Text("Пример пользовательского шрифта")
                    .font(.body2)
                Text("Пример пользовательского шрифта")
                    .font(.body1)
                
            }
            
            VStack(spacing: 20) {
                Text("Привет мир!")
                    .font(.largeTitle)
                
                PrimaryButton(action: {
                    print("Кнопка нажата")
                }) {
                    Text("Нажми на меня")
                }
            }
            .slideAndScale(offset: 100)
            .padding()
            
            
            CustomTextField(text: .constant(""), placeholder: "какой-то текст...") {}
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .padding()
            
            
            CustomTextField(text: .constant(""), placeholder: "Введите ваше имя") {
                Text("Имя:")
                    .font(.body1)
            }
            .padding()
            
            
            SearchTextField(text: $searchText, placeholder: "Поиск")
                .padding()
            
            LikeButton(isLiked: $isLiked) {
                print("Статус лайка изменился на: \(isLiked)")
            }
            .padding()
        }
    }
}

#Preview {
    UIModuleExamplesView()
}
