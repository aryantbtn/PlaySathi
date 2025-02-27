//
//  PlayerTableManager.swift
//  PlaySathi
//
//  Created by ARYAN SINGHAL on 27/02/25.
//

import Foundation
class PlayerTableManager {
    static let shared = PlayerTableManager()
    
    private let client = SupabaseAuthanticationManager.shared.getClient()
    
    private init() {}
    
    func fetchUsers() async->Profile? {
        do {
            let players:[Profile] = try await client
                .from("Player")
                .select()
                .eq("id", value: "60382788-e34e-43e3-8d42-5a9353352009")
                .execute()
                .value
            print(players)
            return players.first
        } catch {
            print("Error fetching player - \(error.localizedDescription)")
            return nil
        }
    }
    
    func insertUser(user:Profile) async{
        do{
            try await client.from("Player").insert(user).execute()
        } catch {
            print("Error inserting new user to Player table in supabase\(error.localizedDescription)")
        }
    }
}
