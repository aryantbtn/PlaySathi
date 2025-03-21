//
//  SupabaseAuthanticationManager.swift
//  PlaySathi
//
//  Created by ARYAN SINGHAL on 27/02/25.
//

import Foundation
import Supabase

struct SupabaseAuthanticationManager {
    static let shared = SupabaseAuthanticationManager()
    
    private var client : SupabaseClient
    
    private let supabaseURL = URL(string: "https://fmswrejyfrkdgeuvpngs.supabase.co")!
    
    private let supabaseKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZtc3dyZWp5ZnJrZGdldXZwbmdzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDAyMjIxMTQsImV4cCI6MjA1NTc5ODExNH0.JgN637CHvz1pqVibEYOeL8R10UDaM3BAa_SVWsmebTc"
    
    private init(){
        client = SupabaseClient(supabaseURL: supabaseURL, supabaseKey: supabaseKey)
    }

    func signUp(email: String, password: String, completion: @escaping (Result<AuthResponse,Error>)->Void) {
            Task {
                do {
                    let authResponse = try await client.auth.signUp(email: email, password: password)
                            
                    // Directly access user ID
                    let userId = authResponse.user.id
                            
                } catch {
                    completion(.failure(error))
                }
            }
        }
    
        func signIn(email: String, password: String, completion: @escaping (Result<Session,Error>)->Void) {
            Task {
                do {
                    let session = try await client.auth.signIn(email: email, password: password)
                    completion(.success(session))
                } catch {
                    completion(.failure(error))
                }
            }
        }
    
        func signOut(){
            Task{
                do {
                    try await client.auth.signOut()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    
        func getClient() -> SupabaseClient {
            return SupabaseAuthanticationManager.shared.client
        }
    
        func getUserId()->UUID? {
            return client.auth.currentUser?.id
        }
    
}
