//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Şiyar Palabıyık on 21.12.2024.
//

import SwiftUI
import SwiftData

@main
struct FriendFaceApp: App {

    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
