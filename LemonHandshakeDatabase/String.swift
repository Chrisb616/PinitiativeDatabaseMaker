//
//  String.swift
//  LemonHandshakeDatabase
//
//  Created by Christopher Boynton on 12/4/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

extension String {
    var processed: String {
        let words = self.components(separatedBy: " ")
        print("Working on \(self)")
        
        var processedString = ""
        
        for word in words {
            if processedString != "" {
                processedString += " "
            }
            if word != "" {
                var processedWord = word.lowercased().uppercasedFirstLetter()
                
                processedWord = processedWord.handledSymbols
                
                processedString += processedWord.handledException
            }
        }
        
        return processedString
    }
    
    func uppercasedFirstLetter() -> String {
        var selfString = self
        
        print("Dealing with \(self)")
        let letter = String(selfString.remove(at: selfString.startIndex))
        
        return letter.uppercased() + selfString
    }
    
    private var handledException: String {
        if self == "Ps" {
            return "PS"
        } else if self == "Eng" {
            return "Engine"
        } else if self == "Lad" {
            return "Ladder"
        } else if self == "Is" {
            return "IS"
        } else if self == "Lhs" {
            return "LHS"
        } else if self == "Hs" {
            return "HS"
        } else if self == "Jop" {
            return "JOP"
        } else if self == "Plgd" || self == "Playgrnd" {
            return "Playground"
        } else if self == "Af" {
            return "AF"
        } else if self == "&&" {
            return "&"
        } else if self == ".." {
            return "."
        } else if self == "Si" {
            return "SI"
        } else if self == "Bat" {
            return "Battalion"
        } else if self == "Ems" {
            return "EMS"
        } else if self == "Nypd" {
            return "NYPD"
        } else if self == "Nycpd" {
            return "NYCPD"
        } else if self == "Ii" {
            return "II"
        } else if self == "Iii" {
            return "III"
        } else if self == "Iv" {
            return "IV"
        } else if self == "//" {
            return "/"
        } else if self == "Libr" {
            return "Library"
        } else if self == "Centr" || self == "Ctr" {
            return "Center"
        } else if self == "Sro" {
            return "SRO"
        } else if self == "Clinc" {
            return "Clinic"
        } else if self == "Ment" {
            return "Mental"
        } else if self == "Hlth" {
            return "Health"
        } else if self == "D&tc" {
            return "D&TC"
        } else if self == "Dcc" {
            return "Dcc"
        } else if self == "Nypl" {
            return "Nypl"
        } else if self == "Otc" {
            return "Otc"
        } else if self == "Jhs" {
            return "JHS"
        }
        
        return self
    }
    
    private var handledSymbols: String {
        var string = self
        let symbols: [String] = ["/","(","-","&",".",","]
        
        for symbol in symbols {
            string = string.handleSymbol(symbol)
        }
        
        return string
    }
    
    private func handleSymbol(_ symbol: String) -> String {
        let symbolCharacter = Character(symbol)
        
        if self.contains(symbol) {
            var startsWith = false
            var endsWith = false
            
            if self.characters.first == symbolCharacter {
                startsWith = true
            }
            if self.characters.last == symbolCharacter {
                endsWith = true
            }
            let separated = self.components(separatedBy: symbol)
            
            var processedString = ""
            
            for piece in separated {
                if processedString != "" {
                    processedString += symbol
                }
                if piece != "" {
                    var processedPiece = piece.lowercased().uppercasedFirstLetter()
                    
                    processedPiece = processedPiece.handledSymbols
                    
                    processedString += processedPiece.handledException
                }
            }
            
            if startsWith {
                processedString = symbol + processedString
            }
            if endsWith {
                processedString = processedString + symbol
            }
            
            return processedString
            
        } else {
            return self
        }
    }
}

