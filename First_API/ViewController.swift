//
//  ViewController.swift
//  First_API
//
//  Created by Abdullah Bajaman on 14/11/2021.
//

import UIKit
class CatResponse : Codable {
//    var info :
    var result : [CatFact] = []
    
}

struct CatFact : Codable {
    var _id: String
    var text: String
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getCats()
    }

    func getCats () {
        // URLComponents
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "cat-fact.herokuapp.com"
        urlComponents.path = "/facts"

        // URLRequest
        var urlRequest = URLRequest(url: urlComponents.url!)
        
        // URLSESSION
        let urlSession = URLSession.shared
        
        // Trigger dataTask method
        let task = urlSession.dataTask(with: urlRequest) { (data: Data?, response: URLResponse?, error: Error?) in
//            print(String(data: data!, encoding: .utf8))
            do {
                let jsomDecoder = JSONDecoder()
                let result = try jsomDecoder.decode([CatFact].self, from: data!)
                print(result.map{$0.text})
            } catch {
                print(error)
            }
            
            
        }
        task.resume()
//        var catUrl = "https://cat-fact.herokuapp.com/facts"
//
//        let
    }

}

