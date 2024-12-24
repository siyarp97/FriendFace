//
//  ContentView.swift
//  FriendFace
//
//  Created by Şiyar Palabıyık on 21.12.2024.
//

import Observation
import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) var modelContext
    @Query(sort:\User.company) var storedData : [User]

    @State private var fetching = FetchUser()
    @State private var stored = [User]()
    @State private var detailUser : User?
    
    var body: some View {
        NavigationStack{
            if stored.isEmpty{
                ProgressView()
            } else {
                List {
                    ForEach(stored, id: \.id) { data in
                        Button {
                            detailUser = data
                        }
                        label: {
                            customRow(user: data)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .navigationTitle("Friend Face")
                .scrollContentBackground(.hidden)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button("Get Data", systemImage: "square.and.arrow.down") {
                            
                        }
                    }
                }
                .navigationDestination(item: $detailUser) { user in
                    DetailView(user: user)
                }
            }
        }
        .task {
            if storedData.isEmpty{
                do{
                    let data : [User] = try await fetching.fetchUser(
                        urlString: fetching.urlStr)
                   
                    for user in data{
                        modelContext.insert(user)
                    }
                    stored = data
                } catch{
                    print("Error while loading")
                }

            }
            else{
                stored = storedData
            }
        }
    }

    @ViewBuilder func customRow(user: User) -> some View {
        CustomRowView(user: user)
            .containerRelativeFrame([
                .vertical, .horizontal,
            ]) { length, axis in
                axis == .vertical
                    ? length * 0.87 : length * 0.95
            }
            .foregroundStyle(.black)
    }
}

#Preview {
    ContentView()
}
