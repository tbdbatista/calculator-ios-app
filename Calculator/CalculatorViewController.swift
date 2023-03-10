//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Beltrami Dias Batista, Thiago on 30/08/22.
//

import UIKit

class CalculatorViewController: UIViewController {

    //MARK: - Outlets, variables and constants
    @IBOutlet weak var labelMain: UILabel!
    
    private var finishedTyping : Bool = true
    private var valueHasDot : Bool = false
    
    private var viewModel = CalculatorViewModel()
    
    //MARK: - View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - IBActions
    @IBAction func tapCalculateButton(_ sender: UIButton) {
        
        self.labelMain.text = self.viewModel.calculate(titleLabel: sender.titleLabel?.text, labelMain: labelMain.text)
        self.finishedTyping = viewModel.finishedTyping
        self.valueHasDot = viewModel.valueHasDot
        
    }
    
    @IBAction func tapNumberButton(_ sender: UIButton) {
        
        /// quando o botão "." (ponto) é acionado, verifica se ele pode ser adicionado ou não, caso o número no display já tenha um ponto decimal
        if sender.titleLabel?.text == "." {
            if valueHasDot {
                return
            }
            valueHasDot = true
        }
        /// verifica se o usuário está iniciando um novo número ou acrescentando mais dígitos ao seu número
        if finishedTyping {
            /// verifica se o primeiro botão apertado é o "." (ponto), para acrescentar um "0" antes do ponto decimal
            if sender.titleLabel?.text == "."{
                labelMain.text = "0."
            } else {
                labelMain.text = sender.titleLabel?.text
            }
            finishedTyping = false
        } else {
            labelMain.text?.append((sender.titleLabel?.text)!)
        }
    }
    
}
