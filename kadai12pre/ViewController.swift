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

    let keyZeiritsu = "zeiritsu"

    override func viewDidLoad() {
        super.viewDidLoad()

        if let string = UserDefaults.standard.string(forKey: keyZeiritsu) {
            self.zeiritsuTextField.text = string
        }
    }

    @IBAction func pressCalcButton(_ sender: Any) {
        let zeinuki = Int(zeinukiTextField.text ?? "") ?? 0
        let zeiritsu = Float(zeiritsuTextField.text ?? "") ?? 0

        let zeikomi = Int( Float(zeinuki) * (1.0 + zeiritsu / 100.0) )

        self.zeikomiLabel.text = "\(zeikomi)"
    }

    @IBAction func changeZeiritsu(_ sender: Any) {
        UserDefaults.standard.set(self.zeiritsuTextField.text, forKey: keyZeiritsu)
        UserDefaults.standard.synchronize()
    }
}
