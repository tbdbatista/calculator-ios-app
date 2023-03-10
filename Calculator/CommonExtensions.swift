//
//  CommonExtensions.swift
//  Calculator
//
//  Created by Beltrami Dias Batista, Thiago on 31/08/22.
//

import Foundation

//MARK: - Float extension
extension Float {
    var clean: String {
       return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
