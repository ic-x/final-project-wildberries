//
//  ProfileView.swift
//  SkyBargain
//

import SwiftUI
import UI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.brandBackground
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Профиль")
                    .font(.subheading1)
                    .lineSpacing(28)
                    .multilineTextAlignment(.center)
                
                VStack(spacing: 8) {
                    Image(image: .changeAvatar)
                        .resizable()
                        .frame(width: 175, height: 175)
                        .padding(.bottom)
                    
                    Text("John Smith")
                        .font(.heading2)
                }
                .padding(.top, 20)
                
                Spacer()
                
                VStack(spacing: 20) {
                    PrimaryButton(action: {
                    }) {
                        Text("Редактировать профиль")
                    }
                    
                    PrimaryButton(action: {
                    }) {
                        Text("Настройки")
                    }
                    
                    TextButton(action: {
                    }) {
                        Text("Выйти")
                            .foregroundColor(.red)
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .padding(.top, 40)
        }
    }
}

#Preview {
    ProfileView()
}
