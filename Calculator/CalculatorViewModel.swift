//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Beltrami Dias Batista, Thiago on 15/09/22.
//

import Foundation

struct CalculatorViewModel {
    
    var finishedTyping = false
    var valueHasDot = false
    private var intermediateCalculation : (number1: Float, operation: String)?
    
    mutating func calculate(titleLabel: String?, labelMain: String?) -> String {
        
        finishedTyping = true
        valueHasDot = false
        
        let operation = titleLabel
        switch operation {
        case "AC" : return "0"
        case "+/-" : return self.invertNumberSign(labelMainText: labelMain)
        case "%" : return self.converToPercentage(labelMainText: labelMain)
        case "=" : return self.performCalculation(number2: getDisplayValue(labelMainText: labelMain))
        default : intermediateCalculation = (number1: self.getDisplayValue(labelMainText: labelMain), operation: titleLabel ?? "error")
            return labelMain ?? "error"
        }
    }
    
    private func getDisplayValue(labelMainText: String?) -> Float {
        if let value = labelMainText {
            return Float(value) ?? 0
        }
        return 0
    }
    
    private func returnFloatAsString(_ floatValue: Float) -> String {
        return floatValue.clean
    }
    
    private func invertNumberSign(labelMainText: String?) -> String {
        let value = getDisplayValue(labelMainText: labelMainText)
        if value == 0 {
            return labelMainText ?? "0"
        } else {
            return self.returnFloatAsString((value * -1))
        }
    }
    
    private func converToPercentage(labelMainText: String?) -> String {
        ///Quando dividimos o mesmo número várias vezes o Swift apresenta um erro tornando o número uma dízima periódica de valor próximo ao esperado
        ///Multiplicando ele por 100 e dividindo por 10000 na sequência parece corrigir esse erro >> Precisa de mais testes
        let holdToPreserveValue = getDisplayValue(labelMainText: labelMainText) * 100
        return self.returnFloatAsString(holdToPreserveValue / 10000)
    }
    
    private func performCalculation(number2: Float) -> String {
        if let number1 = self.intermediateCalculation?.number1, let operation = self.intermediateCalculation?.operation {
            switch operation {
            case "+" :
                let result = number1 + number2
                return self.returnFloatAsString(result)
            case "-" :
                let result = number1 - number2
                return self.returnFloatAsString(result)
            case "x" :
                let result = number1 * number2
                return self.returnFloatAsString(result)
            case "/" :
                let result = number1 / number2
                return self.returnFloatAsString(result)
            default : return "Error"
            }
            
        } else {
            return "Error"
        }
    }
    
    
}
