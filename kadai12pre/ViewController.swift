//
//  ViewController.swift
//  kadai12pre
//
//  Created by 鎌田剛史 on R 6/06/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var zeinukiTextField: UITextField!
    @IBOutlet weak var zeiritsuTextField: UITextField!

    @IBOutlet weak var zeikomiLabel: UILabel!
        
    let KeyZeiritsu = "zeiritsu"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let string = UserDefaults.standard.string(forKey: KeyZeiritsu) {
            self.zeiritsuTextField.text = string
        }
    }
    
    @IBAction func pressCalcButton(_ sender: Any) {
        let zeinuki = (self.zeinukiTextField.text! as NSString).integerValue
        let zeiritsu = (self.zeiritsuTextField.text! as NSString).floatValue
        
        let zeikomi = Int( Float(zeinuki) * (1.0 + zeiritsu / 100.0) )
        
        self.zeikomiLabel.text = "\(zeikomi)"
    }
    
    @IBAction func changeZeiritsu(_ sender: Any) {
        UserDefaults.standard.set(self.zeiritsuTextField.text,forKey: KeyZeiritsu)
        UserDefaults.standard.synchronize()
    }
   }
