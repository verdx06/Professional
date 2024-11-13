//
//  Supabase.swift
//  Prof
//
//  Created by Виталий Багаутдинов on 30.10.2024.
//

import Foundation
import Supabase


class SupabaseModel {
    
    static let instance = SupabaseModel()
    
    let supabase = SupabaseClient(supabaseURL: URL(string: "https://dljdurmutecfbodtwbbh.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRsamR1cm11dGVjZmJvZHR3YmJoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzAyMjk3ODMsImV4cCI6MjA0NTgwNTc4M30.APWn_NEGLMQBqsU6mdAf6GQje75AprSVXHuLaRHBHME")
    
    func singUp(email: String, name: String, password: String, phone: String) async throws {
            try await supabase.auth.signUp(email: email, password: password)
            
            let user = try await supabase.auth.session.user
            
            let newUser = UserModel(
                id: user.id,
                balance: 0,
                name: name,
                phone_number: phone,
                created_at: .now
            )
            
            try await supabase.from("users").insert(newUser).execute()
            
            try await supabase.auth.signOut()
    }
    
    func signIn(email: String, password: String) async throws {
        
            try await supabase.auth.signIn(email: email, password: password)

    }
    
    func resetPasword(email: String) async throws {
        try await supabase.auth.resetPasswordForEmail(email)
    }
    
    func verifyOTP(email: String, token: String) async throws{
        
        try await supabase.auth.verifyOTP(
         email: email,
         token: token,
         type: .recovery
       )
        
    }
    
    func updatepaswword(password: String) async throws {
        
        try await supabase.auth.update(user: UserAttributes(password: password))
        
    }
    
    func downloadMyAvatar() async throws -> Data {
        let user = try await supabase.auth.session.user
        
        let data = try await supabase.storage.from("Photo").download(path: "photo/\(user.id).jpg")
        
        return data
    }
    
    func uploadMyAvatar(data: Data) async throws {
        let user = try await supabase.auth.session.user
        
        try await supabase.storage.from("Photo").upload("photo\(user.id)", data: data)
    }
    
    
    
}
