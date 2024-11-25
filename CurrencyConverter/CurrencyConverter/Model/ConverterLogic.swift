//
//  ConverterLogic.swift
//  CurrencyConverter
//
//  Created by Matt Erdahl on 11/24/24.
//

import Foundation

struct ConverterLogic {
    
    var convertAmount: Int = 0
    var koruna: Int = 0
    var egPound: Int = 0
    var arFlorin: Int = 0
    var kroner: Int = 0
    var korunaSwitch = true
    var egyptSwitch = true
    var arubanSwitch = true
    var kronerSwitch = true
    
    mutating func setConversionAmount(_ amount: String) -> Int {
        convertAmount = Int(amount)!
        return convertAmount
    }
    
    mutating func setKoruna(_ switchValue: Bool) -> Bool {
        if switchValue {
            korunaSwitch = true
        }
        else {
            korunaSwitch = false
        }
        return korunaSwitch
    }
    
    mutating func calcKoruna() -> Int {
        koruna = Int(Float(convertAmount) * 24.3435)
        return koruna
    }
    
    mutating func setEgypt(_ switchValue: Bool) {
        if switchValue {
            egyptSwitch = true
            egPound = Int(Float(convertAmount) * 49.6894)
        }
        else {
            egyptSwitch = false
        }
    }
    
    mutating func setAruban(_ switchValue: Bool) {
        if switchValue {
            arubanSwitch = true
            arFlorin = Int(Float(convertAmount) * 1.8125)
        }
        else {
            arubanSwitch = false
        }
    }
    
    mutating func setKroner(_ switchValue: Bool) {
        if switchValue {
            kronerSwitch = true
            kroner = Int(Float(convertAmount) * 11.0789)
        }
        else {
            kronerSwitch = false
        }
    }
}
