//
//  ViewController.swift
//  Alcool ou gasolina
//
//  Created by Agricio Dias on 01/03/18.
//  Copyright © 2018 Agricio Dias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultadoLegenda: UILabel!
    @IBOutlet weak var precoAlcoolCampo: UITextField!
    @IBOutlet weak var precoGasolianCampo: UITextField!
    
    @IBAction func calcularCombustivel(_ sender: Any) {
    
        if let precoAlcool = precoAlcoolCampo.text{
            if let precoGasolina = precoGasolianCampo.text{
                let validaCampos = self.validarCampos(precoAlcool:precoAlcool, precoGasolina: precoGasolina)
                
                  if validaCampos == true{
                        calcularMelhorPreco (precoAlcool:precoAlcool, precoGasolina: precoGasolina)
                   
                       }
                  }
           }
    }
    
    func validarCampos(precoAlcool: String, precoGasolina: String) -> Bool{
        var camposValidados = true
        
        
        if precoAlcool.isEmpty && precoGasolina.isEmpty {
            camposValidados = false
            resultadoLegenda.text = "Digite os dois preços para calcular!"
            
        }else if precoAlcool.isEmpty {
              camposValidados = false
              resultadoLegenda.text = "Digite preço do Alcool!"
           }else if precoGasolina.isEmpty {
                    resultadoLegenda.text = "Digite preço do Gasolina!"
                    camposValidados = false
          }
        
        return camposValidados
    }
 
    func calcularMelhorPreco (precoAlcool:String, precoGasolina: String){
    
        
        if let valorAlcool = Double(precoAlcool){
            if let valorGasolina = Double(precoGasolina){
                   let resultadoPreco = valorAlcool / valorGasolina
                     if resultadoPreco >= 0.7{
                          self.resultadoLegenda.text = "Melhor utilizar Gasolina"
                      }else{
                         self.resultadoLegenda.text = "Melhor utilizar Alcool"
                        }
                  }else{
                    self.resultadoLegenda.text = "Erro valor inadequado"
                    }
                 }else{
                    self.resultadoLegenda.text = "Erro valor inadequado"
             }
        }
    
    
    
    override func viewDidLoad() {
         super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

