//
//  ViewController.swift
//  Criba De Erastótenes
//
//  Created by Gerson Montenegro on 6/09/16.
//  Copyright © 2016 Gerson Montenegro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var txtEnd: UITextField!
    @IBOutlet var txtResul: UITextField!

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
            if let valorFinal = Int(self.txtEnd.text!){
                let criba:Primes = Primes()
                let r = criba.StartSieve(startValue, f: valorFinal)
                switch r{
                    case "":
                        Utilities.Alert("Initial value must be less than final")
                        break
                    default:
                        self.txtResul.text = r
                        break
                }
            }else{
                Utilities.Alert("End value must be numeric")
            }
    }
}

