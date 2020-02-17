//
//  File.swift
//  gateNlight
//
//  Created by Олег Дмитриев on 17.02.2020.
//  Copyright © 2020 Олег Дмитриев. All rights reserved.
//

import UIKit

// Пример входящих данных
var newKey = ""
var newServer = ""

// Функция установки кэша, надо будет запихуть в какой-то класс
func todo(newKey:String, newServer:String){
    UserDefaults.standard.set(newKey, forKey: "keyForApi")
    UserDefaults.standard.set(newServer, forKey: "serverAdderes")
}

// Структура данных в кэше, для удобства вызова
struct memberUser{
    var keyApi:String = UserDefaults.standard.string(forKey: "keyForApi") ?? "errorKey"
    var address:String = UserDefaults.standard.string(forKey: "serverAdderes") ?? "errorServer"
}
var myMember = memberUser()

//Запрос
func letDoIt(command:String){
    //Вибрация
    UINotificationFeedbackGenerator().notificationOccurred(.success)

    //print("https://\(myMember.address)/(\(myMember.keyApi))/\(command)")
    let urlLight = URL(string: "https://\(myMember.address)/\(myMember.keyApi)/\(command)")
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

func checkKey(lable: UILabel){
    if myMember.keyApi == "errorKey" {
         lable.text = "Ключ не установлен"
     } else {
         lable.text = "Ключ принят"
     }
}

enum Commands {
    case gate
    case light
}

var commands:[Commands:String] = [
    Commands.gate:"worcker_gate.php",
    Commands.light:"worcker_light.php"
    ]
