//
//  PlayerDataController.swift
//  PlaySathi
//
//  Created by ARYAN SINGHAL on 27/02/25.
//

import Foundation
class PlayerDataController{
    var userProfiles: [Profile] = []
    
    static let shared = PlayerDataController()
    
    private init() {
    }
    
    func loadUserProfiles()async ->Profile? {
        let user = await PlayerTableManager.shared.fetchCurrentUser()
        return user
    }
    
    func getUsers(completion:@escaping([Profile]) -> Void) async {
        let players = await PlayerTableManager.shared.fetchUsers()
        completion(players)
    }
    func insertUser(newUser: Profile) async {
        await PlayerTableManager.shared.insertUser(user: newUser)
    }
}
