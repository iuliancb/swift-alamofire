//
//  ViewController.swift
//  Question2
//
//  Created by iulian on 2/29/20.
//  Copyright © 2020 ___IULIAN COSTIN BUJNIGA ___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let api = "https://capi.stage.9c9media.com/destinations/tsn_ios/platforms/iPad/contents/69585";
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func makeApiCall(_ sender: UIButton) {
        parseJson(api: api)
        decode(api: api)
    }
    func parseJson(api: String) {
        Question2.request(api, method: .get, successJsonAction: { (json) in
            print(json)
        })
    }
    
    func decode(api: String) {
        Question2.request(api, method: .get, successDataAction: { (data) in
            do {
                let result = try JSONDecoder().decode(Result.self, from: data)
                print("Id = ", result.Id)
                print("Name = ", result.Name)
                print("Desc = ", result.Desc)
            } catch let jsonErr {
                print("Fail to decode json", jsonErr)
            }
        })
    }
}

class Result: Codable {
    var Id: Int = 0
    var Name: String = ""
    var Desc: String = ""
    
}
