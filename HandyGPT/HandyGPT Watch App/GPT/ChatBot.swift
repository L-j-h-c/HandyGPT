//
//  ChatBot.swift
//  HandyGPT Watch App
//
//  Created by Junho Lee on 2023/05/03.
//

import Foundation
import Combine

enum APIError: Error {
    case jsonParsingError
    case invalidRequest
    case networkFailed
    case unknown
}

final
class Chatbot {
    private let apiKey: String
    
    init() {
        self.apiKey = Config.API
    }
    
    func sendMessage(_ message: String) async throws -> String {
        var request: URLRequest
        do {
            request = try makeURLRequest(with: message)
        } catch {
            throw APIError.invalidRequest
        }
        
        let (data, _) = try await URLSession.shared.data(for: request)
        
        do {
            guard let response = try JSONSerialization.jsonObject(
                with: data,
                options: []
            ) as? [String: Any] else {
                throw APIError.networkFailed
            }
            
            guard let choices = response["choices"] as? [[String: Any]],
                  let choice = choices.first,
                  let message = choice["message"] as? [String: String],
                  let content = message["content"] else {
                throw APIError.jsonParsingError
            }
            
            return content
        } catch {
            throw error
        }
    }
    
    private func makeURLRequest(with message: String) throws -> URLRequest {
        let url = URL(string: "https://api.openai.com/v1/chat/completions")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "model": "gpt-3.5-turbo",
            "messages": [
                [
                    "role": "user",
                    "content": "\(message)"
                ]
            ]
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        } catch {
            throw error
        }
        
        return request
    }
}
