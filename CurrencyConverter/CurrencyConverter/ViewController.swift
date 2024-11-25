//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Matt Erdahl on 11/24/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var EnteredAmount: UITextField!
    
    @IBOutlet weak var KorunaButton: UISwitch!
    
    @IBOutlet weak var EgyptButton: UISwitch!
    
    @IBOutlet weak var ArubanButton: UISwitch!
    
    @IBOutlet weak var KronerButton: UISwitch!
        
    var convertAmount: Int = 0
    var koruna: Int = 0
    var egPound: Int = 0
    var arFlorin: Int = 0
    var kroner: Int = 0
    var korunaSwitch = false
    var egyptSwitch = false
    var arubanSwitch = false
    var kronerSwitch = false
    var converterLogic = ConverterLogic()
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //create action for typing in amount to check for Int and to set amount
    /* I'm getting an error again so I can't create an action for entering an amount. My hope is that I can come back to this when I'm not getting an error. In case I'm not allowed to fix this, I'm hoping for partial credit by showing what I would do.
    @IBAction func [enter text] {
      if converterLogic.isInt(EnteredAmount.text!) {
        convertAmount = converterLogic.setConversionAmount(EnteredAmount.text!)
        ConvertButton.enabled = true
        } else {
        [label that isn't there yet].isHidden = false
        ConvertButton.enabled = false
        }
     }*/
    
    
    @IBAction func KorunaSwitch(_ sender: UISwitch) {
        convertAmount = converterLogic.setConversionAmount(EnteredAmount.text!) //this would move to the above func
        korunaSwitch = converterLogic.setKoruna(sender.isOn)
        koruna = converterLogic.calcKoruna()
    }
    
    @IBAction func EgyptSwitch(_ sender: UISwitch) {
        converterLogic.setEgypt(sender.isOn)
        egyptSwitch = converterLogic.egyptSwitch
        egPound = converterLogic.egPound
    }
    
    @IBAction func ArubanSwitch(_ sender: UISwitch) {
        converterLogic.setAruban(sender.isOn)
        arubanSwitch = converterLogic.arubanSwitch
        arFlorin = converterLogic.arFlorin
    }
    
    @IBAction func KronerSwitch(_ sender: UISwitch) {
        converterLogic.setKroner(sender.isOn)
        kronerSwitch = converterLogic.kronerSwitch
        kroner = converterLogic.kroner
    }
    
    @IBAction func ConvertButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "toConvertedAmounts", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "toConvertedAmounts" {
            let navigation = segue.destination as! ConvertedAmountsView
            navigation.convertAmount = convertAmount
            navigation.korunaSwitch = korunaSwitch
            navigation.koruna = koruna
            navigation.egyptSwitch = egyptSwitch
            navigation.egPound = egPound
            navigation.arubanSwitch = arubanSwitch
            navigation.arFlorin = arFlorin
            navigation.kronerSwitch = kronerSwitch
            navigation.kroner = kroner
        }
    }
}

