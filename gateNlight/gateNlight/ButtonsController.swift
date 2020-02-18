//
//  ButtonsController.swift
//  gateNlight
//
//  Created by Олег Дмитриев on 17.02.2020.
//  Copyright © 2020 Олег Дмитриев. All rights reserved.
//

import UIKit

class ButtonsController: UIViewController {
    @IBAction func gateButton(_ sender: Any) {
        UINotificationFeedbackGenerator().notificationOccurred(.success) //Вибрация
        letDoIt(command: commands[Commands.gate] ?? "")
    }
    
    @IBAction func lightButton(_ sender: Any) {
        UINotificationFeedbackGenerator().notificationOccurred(.success) //Вибрация
        letDoIt(command: commands[Commands.light] ?? "")
    }
    
    //Запрос
    private func letDoIt(command:String){
        var urlLight = URL(string: "https://\(UserDefaults.standard.string(forKey: "serverAdderes") ?? "")/\(UserDefaults.standard.string(forKey: "keyForApi") ?? "")/\(command)")
        guard let requestUrl = urlLight else { fatalError() }
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            // Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to a simple String
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")

            }
            
        }
        task.resume()
    }
    
    private enum Commands {
        case gate
        case light
    }

    private var commands:[Commands:String] = [
        Commands.gate:"worcker_gate.php",
        Commands.light:"worcker_light.php"
        ]
}
