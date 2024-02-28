//
//  Double.swift
//  WatsonCrypto
//
//  Created by D'Ante Watson on 2/20/24.
//

import Foundation

extension Double {
    
    /// Converts a Double into a Currency with 2 - 6 Decimal Places
    /// ```
    /// convert 1234.56 to $1,234.56
    /// convert 12.3456 to $12.3456
    /// convert 0.123456 to $0.123456
    /// ```
    
    private var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale = .current -> default value
        //formatter.currencyCode = "usd" -> change currency
        //formatter.currencySymbol = "$" - > change Symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        return formatter
    }
    
    /// Converts a Double into a Currency as a String with 2 - 6 Decimal Places
    /// ```
    /// convert 1234.56 to "$1,234.56"
    /// convert 12.3456 to "$12.3456"
    /// convert 0.123456 to "$0.123456"
    /// ```
    
    func asCurrencyWith6Decimals() -> String{
        let number = NSNumber(value: self)
        return currencyFormatter.string(from: number) ?? "0.00"
    }
    
    /// Converts a Double into a Currency with 2 - 2 Decimal Places
    /// ```
    /// convert 1234.56 to $1,234.56
    /// convert 12.3456 to $12.34
    /// convert 0.123456 to $0.12
    /// ```
    
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        //formatter.locale = .current -> default value
        //formatter.currencyCode = "usd" -> change currency
        //formatter.currencySymbol = "$" - > change Symbol
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        return formatter
    }
    
    /// Converts a Double into a Currency as a String with 2 - 2 Decimal Places
    /// ```
    /// convert 1234.56 to "$1,234.56"
    /// convert 12.3456 to "$12.34"
    /// convert 0.123456 to "$0.12"
    /// ```
    
    func asCurrencyWith2Decimals() -> String{
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "0.00"
    }
    
    /// Converts a Double into a String repretation
    /// ```
    /// convert 1.23456 to "$1.23"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    /// Converts a Double into a String repretation with percent symbol
    /// ```
    /// convert 1.23456 to "$1.23%"
    /// ```
    func asPercentageString() -> String {
        return asNumberString() + "%"
    }
    
}
