//
//  ContentView.swift
//  FriendFace
//
//  Created by Şiyar Palabıyık on 21.12.2024.
//

import Observation
import SwiftUI

struct ContentView: View {

    @State private var fetching = FetchUser()
    @State private var stored = [User]()

    @State private var detailUser : User?

    var body: some View {
        NavigationStack{
            if stored.isEmpty{
                ProgressView()
            } else {
                List {
                    ForEach(stored, id: \.id) { user in
                        Button {
                            detailUser = user
                        }
                        label: {
                            customRow(user: user)
                        }
                        
                        
                        
                    }
                    .listRowSeparator(.hidden)
                }
                .navigationTitle("Friend Face")
                .scrollContentBackground(.hidden)
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button("Get Data", systemImage: "square.and.arrow.down") {
                            Task {
                                let data: [User] = try await fetching.fetchUser(
                                    urlString: fetching.urlStr)
                                stored = data
                            }
                        }
                    }
                }
                .navigationDestination(item: $detailUser) { user in
                    DetailView(user: user)
                }
            }
        }
        .task {
            do{
                let data: [User] = try await fetching.fetchUser(
                    urlString: fetching.urlStr)
                stored = data
            } catch{
                print("Error while loading")
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
