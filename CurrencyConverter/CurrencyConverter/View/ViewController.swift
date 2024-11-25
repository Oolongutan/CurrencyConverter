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
        
    @IBOutlet weak var ErrorLabel: UILabel!
    
    @IBOutlet weak var ConvertOutlet: UIButton!
    
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
    
    //action for typing in amount to check for Int and to set amount
    @IBAction func TextChanged(_ sender: UITextField) {
        do {
            convertAmount = try converterLogic.setConversionAmount(EnteredAmount.text!)
            ConvertOutlet.isEnabled = true
            ErrorLabel.isHidden = true
        } catch {
            print(error)
            ErrorLabel.isHidden = false
            ConvertOutlet.isEnabled = false
        }
    }
    
    @IBAction func KorunaSwitch(_ sender: UISwitch) {
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

