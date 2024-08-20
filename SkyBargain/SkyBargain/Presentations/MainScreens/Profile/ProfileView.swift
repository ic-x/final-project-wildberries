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
            
            VStack() {
                Text("Профиль")
                    .font(.boldSubheading1)
                    .padding(.bottom, 22)
                
                VStack(spacing: 8) {
                    Image(image: .changeAvatar)
                        .resizable()
                        .frame(width: 175, height: 175)
                        .padding(.bottom, 30)
                    
                    Text("Иван Иванов")
                        .font(.heading2)
                }
                .padding(.vertical, 35)
                
                Spacer()
                
                VStack(spacing: 25) {
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
            .padding([.horizontal, .top])
        }
    }
}

#Preview {
    ProfileView()
}
