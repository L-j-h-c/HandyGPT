//
//  ContentView.swift
//  HandyGPT Watch App
//
//  Created by Junho Lee on 2023/05/03.
//

import SwiftUI

import Intents

struct Message: Identifiable, Equatable {
    let id = UUID()
    let text: String
    let isSender: Bool
}

struct ChatView: View {
    @State private var message: String = ""
    @State private var messages: [Message] = []
    @State private var isLoading: Bool = false
    private var chatbot = Chatbot()
    
    var body: some View {
        if !messages.isEmpty {
            ScrollView {
                VStack(spacing: 5) {
                    ForEach(messages) { message in
                        HStack {
                            if message.isSender {
                                Spacer()
                            }
                            VStack(
                                alignment: message.isSender
                                ? .trailing : .leading,
                                spacing: 5
                            ) {
                                HStack(alignment: .bottom) {
                                    if message.isSender {
                                        Text(String.currentTime)
                                            .font(.system(size: 10))
                                            .foregroundColor(Color.black.opacity(0.8))
                                    }
                                    Text(message.isSender ? "You✋" : "🤖GPT")
                                        .font(.system(size: 14))
                                        .foregroundColor(Color.black)
                                    if !message.isSender {
                                        Text(String.currentTime)
                                            .font(.system(size: 10))
                                            .foregroundColor(Color.black.opacity(0.8))
                                    }
                                }
                                Text(message.text)
                                    .padding(8)
                                    .background(message.isSender ? Color.blue : Color.black)
                                    .foregroundColor(Color.white)
                                    .cornerRadius(10)
                            }
                            if !message.isSender {
                                Spacer()
                            }
                        }
                    }
                    
                    if isLoading {
                        loadingIndicator
                    }
                    
                    Spacer()
                        .frame(height: 8)
                    
                    senderView
                }
            }
            .applyDefaultBackground()
        } else {
            senderView
                .applyDefaultBackground()
        }
    }
    
    @ViewBuilder
    var senderView: some View {
        HStack {
            TextField("Input", text: $message)
                .textFieldStyle(.plain)
                .disabled(isLoading)
            
            Button(action: {
                sendMessage()
            }) {
                Image(systemName: "paperplane")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            .frame(width: 44)
            .disabled(isLoading)
        }
    }
    
    @ViewBuilder
    var loadingIndicator: some View {
        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white))
    }
    
    private func sendMessage() {
        guard !message.isEmpty else { return }
        
        let userMessage = Message(text: message, isSender: true)
        messages.append(userMessage)
        message = ""
        
        isLoading = true
        
        Task {
            do {
                let content = try await chatbot.sendMessage(userMessage.text)
                self.messages.append(Message(text: content, isSender: false))
            } catch {
                print(error)
            }
            isLoading = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
