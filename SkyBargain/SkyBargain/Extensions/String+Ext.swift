//
//  String+Ext.swift
//  SkyBargain
//
//  Created by ARMBP on 8/16/24.
//

import Foundation

extension String {
    var dateFromStringConverter: String {
        let format = self.components(separatedBy: " ")
            .dropLast()
            .joined(separator: " ")
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
        guard let date = formatter.date(from: format) else { return "" }
        formatter.dateFormat = "dd.MM.yyyy HH:mm"
        return formatter.string(from: date)
    }
}
