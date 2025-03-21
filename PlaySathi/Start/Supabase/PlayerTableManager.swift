//
//  PlayerTableManager.swift
//  PlaySathi
//
//  Created by ARYAN SINGHAL on 27/02/25.
//

import Foundation
import Helpers
import PostgREST
class PlayerTableManager {
    static let shared = PlayerTableManager()
    
    private let client = SupabaseAuthanticationManager.shared.getClient()
    
    private init() {}
    
    func fetchCurrentUser() async -> Profile? {
            do {
                // First check if we have a session
                guard let session = try? await client.auth.session else {
                    print("No active session found")
                    return nil
                }
                
                // Get user ID from the session
                let userId = session.user.id
                
                let players: [Profile] = try await client
                    .from("Player")
                    .select()
                    .eq("id", value: userId)
                    .execute()
                    .value
                
                return players.first
            } catch {
                print("Error fetching player - \(error.localizedDescription)")
                return nil
            }
        }

    
    func fetchUsers() async -> [Profile] {
           do {
               // First check if we have a session
               guard let session = try? await client.auth.session else {
                   print("No active session found")
                   return []
               }
               let currentUserId = session.user.id
               
               // Fix the response handling
               let response: PostgrestResponse<[Profile]> = try await client
                   .from("Player")
                   .select()
                   .neq("id", value: currentUserId)
                   .execute()
               
               let players = response.value
               print("Successfully fetched \(players.count) players")
               return players
               
           } catch let error as PostgrestError {
               print("Supabase error: \(error.message)")
               return []
           } catch {
               print("Unexpected error: \(error)")
               return []
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
