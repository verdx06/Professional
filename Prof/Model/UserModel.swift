//
//  UserModel.swift
//  Prof
//
//  Created by Виталий Багаутдинов on 30.10.2024.
//

import Foundation

struct UserModel: Codable {
    let id: UUID
    let balance: Float
    let name: String
    let phone_number: String
    let created_at: Date
}
