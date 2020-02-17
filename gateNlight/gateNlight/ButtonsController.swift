//
//  ButtonsController.swift
//  gateNlight
//
//  Created by Олег Дмитриев on 17.02.2020.
//  Copyright © 2020 Олег Дмитриев. All rights reserved.
//

import UIKit

class ButtonsController: UIViewController {

    @IBOutlet weak var keyTest: UILabel!
    
    @IBAction func gateButton(_ sender: Any) {
        letDoIt(command: commands[Commands.gate] ?? "")
    }
    
    @IBAction func lightButton(_ sender: Any) {
        letDoIt(command: commands[Commands.light] ?? "")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        checkKey(lable: keyTest)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todo(newKey:newKey,newServer:newServer)
    }

}
