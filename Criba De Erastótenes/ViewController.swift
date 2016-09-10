//
//  ViewController.swift
//  Criba De Erastótenes
//
//  Created by Gerson Montenegro on 6/09/16.
//  Copyright © 2016 Gerson Montenegro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txtFin: UITextField!
    @IBOutlet var txtResultado: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }

    @IBAction func clicIniciarCalculo(sender: UIButton) {
        let startValue = 2
            if let valorFinal = Int(self.txtFin.text!){
                let criba:Primes = Primes()
                criba.DefineTxtResult(txtResultado)
                let r = criba.StartSieve(startValue, f: valorFinal)
                switch r{
                    case 0:
                        //tudo bem
                        break
                    case 1:
                        Utilities.Alert("El valor inicial debe ser menor al final")
                        break
                    default:
                        break
                }
            }else{
                Utilities.Alert("Debe ingresar un valor numérico de fin")
            }
    }
}

