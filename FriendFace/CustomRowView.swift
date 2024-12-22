//
//  CustomRowView.swift
//  FriendFace
//
//  Created by Şiyar Palabıyık on 21.12.2024.
//

import SwiftUI

struct CustomRowView: View {
    
    let user : User
        
    var body: some View {
        NavigationStack(){
            ZStack{
                RoundedRectangle(cornerRadius: 20)
                    .stroke(
                        Gradient(colors: [.purple, .indigo, .blue])
                        , lineWidth: 2.5)
                    .fill(.ultraThinMaterial)
                
                HStack{
                    VStack(alignment: .leading){
                        HStack{
                            Text("\(user.name)")
                                .fontWeight(.bold)
                            Text("/")
                            Text("\(user.age) Years")
                                .font(.title2)
                                .fontWeight(.thin)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        Spacer()
                        rowInfo(for: "Company :", to: user.company)
                        rowInfo(for: "Friends Have", to: user.friends.count.formatted())
                        HStack(spacing: 5){
                            Circle()
                                .fill(user.isActive == true ? .green : .red)
                            Text(user.isActive == true ? "Online" : "Offline")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    
                    Image(systemName: "chevron.right")
                        .symbolEffect(.bounce.up.byLayer, options: .repeat(.periodic(delay: 5.0)))
                        .padding(.horizontal)
                        .padding(.horizontal)
                        .font(.largeTitle)
                        .frame(maxHeight: .infinity)
                        .background(
                            Gradient(colors: [.purple, .indigo, .blue])
                        )
                        .foregroundStyle(.white)
                        .clipShape(
                            .rect(topLeadingRadius: 0, bottomLeadingRadius: 0, bottomTrailingRadius: 20, topTrailingRadius: 20, style: .circular)
                        )
                    
                    
                }
                
            }
            .containerRelativeFrame([.vertical, .horizontal]) { length, axis in
                axis == .vertical ? length * 0.1 : length * 0.95
            }
            
        }
    }
    @ViewBuilder func rowInfo(for title : String, to value : String) -> some View{
        HStack{
            Text(title)
                .font(.callout)
                .fontWeight(.bold)
            Text("\(value)")
        }
    }
    
}

#Preview {
    let friends = Friends(id: "A", name: "Nane Molla")
    let sampleUser = User(id: "a", isActive: true, name: "Nane", age: 12, company: "Limon", address: "Yersen", about: "Falan filan çolan", registered: "2222", tags: ["A"], email: "sample@abc.com", friends: [friends])
    CustomRowView(user: sampleUser)
}
