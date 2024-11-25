//
//  ConvertedAmountsView.swift
//  CurrencyConverter
//
//  Created by Matt Erdahl on 11/24/24.
//

import UIKit

class ConvertedAmountsView: UIViewController {
    
    @IBOutlet weak var USDamount: UILabel!
    
    @IBOutlet weak var KorunaAmount: UILabel!
    
    @IBOutlet weak var EgyptAmount: UILabel!
    
    @IBOutlet weak var ArubanAmount: UILabel!
    
    @IBOutlet weak var KronerAmount: UILabel!
    
    var convertAmount: Int = 0
    var koruna: Int = 0
    var egPound: Int = 0
    var arFlorin: Int = 0
    var kroner: Int = 0
    var korunaSwitch = true
    var egyptSwitch = true
    var arubanSwitch = true
    var kronerSwitch = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        USDamount.text = "Amount in USD: $\(convertAmount)"
        
        if !korunaSwitch {
            KorunaAmount.isHidden = true
        } else {
            KorunaAmount.text = "Amount in Czech Koruna: \(koruna)"
        }
        
        if !egyptSwitch {
            EgyptAmount.isHidden = true
        } else {
            EgyptAmount.text = "Amount in Egyptian Pounds: \(egPound)"
        }
        
        if !arubanSwitch {
            ArubanAmount.isHidden = true
        } else {
            ArubanAmount.text = "Amount in Aruban Florins: \(arFlorin)"
        }
        
        if !kronerSwitch {
            KronerAmount.isHidden = true
        } else {
            KronerAmount.text = "Amount in Norwegian Kroner: \(kroner)"
        }

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
