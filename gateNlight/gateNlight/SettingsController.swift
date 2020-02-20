//
//  SettingsControllerViewController.swift
//  gateNlight
//
//  Created by Олег Дмитриев on 18.02.2020.
//  Copyright © 2020 Олег Дмитриев. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    @IBOutlet weak var keyTextField: UITextField!
    @IBOutlet weak var serverTextField: UITextField!
    
    @IBAction func saveSettingsButton(_ sender: Any) {
        var saveKey = keyTextField.text
        var saveServer = serverTextField.text
        self.todo(newKey: saveKey ?? "", newServer: saveServer ?? "")
    }
    
    private func todo(newKey:String, newServer:String){
        UserDefaults.standard.set(newKey, forKey: "keyForApi")
        UserDefaults.standard.set(newServer, forKey: "serverAdderes")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyTextField.text = UserDefaults.standard.string(forKey: "keyForApi") ?? ""
        serverTextField.text = UserDefaults.standard.string(forKey: "serverAdderes") ?? ""
    }

}
