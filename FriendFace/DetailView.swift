//
//  DetailView.swift
//  FriendFace
//
//  Created by Şiyar Palabıyık on 22.12.2024.
//

import SwiftUI

struct DetailView: View {
    let user : User

    
    var body: some View {
        NavigationStack{
            List {
                Section("About"){
                    Text(user.about)
                }
                
                Section("Friends"){
                    ForEach(user.friends, id: \.id){ Text($0.name) }
                }
                Section("Contact") {
                    VStack(alignment: .leading, spacing: 20){
                        Text(user.email)
                            .fontWeight(.bold)
                        Text(user.address)
                            .foregroundStyle(.secondary)
                    }
                    
                }
                
            }
        }
    }
    
}

#Preview {
    let friends = Friends(id: "A", name: "Nane Molla")
    let sampleUser = User(id: "a", isActive: true, name: "Nane", age: 12, company: "Limon", address: "Yersen", about: "Falan filan çolan", registered: "2222", tags: ["A"], email: "sample@abc.com", friends: [friends])
    DetailView(user: sampleUser)
}
