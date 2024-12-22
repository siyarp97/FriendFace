//
//  FetchUser.swift
//  FriendFace
//
//  Created by Şiyar Palabıyık on 21.12.2024.
//

import Foundation
import Observation

@Observable class FetchUser{
    
    let urlStr = "https://www.hackingwithswift.com/samples/friendface.json"
    
    func fetchUser<T: Codable>(urlString: String) async throws -> T {
        // URL oluşturma
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL) // Geçersiz URL hatası
        }
        
        do {
            // Veriyi indir
            let (data, _) = try await URLSession.shared.data(from: url)
            // JSON'u decode et
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            // Eğer hata alırsak bu hatayı dışarı fırlat
            throw error
        }
    }
    
}
