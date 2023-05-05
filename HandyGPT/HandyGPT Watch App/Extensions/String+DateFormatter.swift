//
//  String+DateFormatter.swift
//  HandyGPT Watch App
//
//  Created by Junho Lee on 2023/05/06.
//

import Foundation

extension String {
    static var currentTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: Date())
    }
}
