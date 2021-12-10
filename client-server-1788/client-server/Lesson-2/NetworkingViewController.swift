//
//  NetworkingViewController.swift
//  client-server-1788
//
//  Created by Artur Igberdin on 10.12.2021.
//

import UIKit
import Alamofire

class NetworkingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //simpleRequest()
        
        simpleRequestAlamofire()
    }
    
    func simpleRequestAlamofire() {

        //1 шаг - Конструируем URL
        var urlConstructor = URLComponents()
        // устанавливаем схему
        urlConstructor.scheme = "http"
        // устанавливаем хост
        urlConstructor.host = "samples.openweathermap.org"
        // путь
        urlConstructor.path = "/data/2.5/forecast"
        // параметры для запроса
        urlConstructor.queryItems = [
            URLQueryItem(name: "q", value: "München,DE"),
            URLQueryItem(name: "appid", value: "b1b15e88fa797225412429c1c50c122a1")
        ]
        
        
        AF.request("http://samples.openweathermap.org/data/2.5/forecast", method: .post).responseJSON { response in
            print(response.request)
            print(response.value)
            
        }

    }
    
    func simpleRequest() {
        
        //1 шаг - Конструируем URL
        var urlConstructor = URLComponents()
        // устанавливаем схему
        urlConstructor.scheme = "http"
        // устанавливаем хост
        urlConstructor.host = "samples.openweathermap.org"
        // путь
        urlConstructor.path = "/data/2.5/forecast"
        // параметры для запроса
        urlConstructor.queryItems = [
            URLQueryItem(name: "q", value: "München,DE"),
            URLQueryItem(name: "appid", value: "b1b15e88fa797225412429c1c50c122a1")
        ]

        //guard let url = URL(string: "http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88fa797225412429c1c50c122a1") else { return }
        
        guard let url = urlConstructor.url else { return }
        
        //Конструктор запроса
        var request = URLRequest(url: url)
        // указываем метод
        request.httpMethod = "POST"
        
        //2 шаг - Настроить сессию ()
        
        let defaultConfigation = URLSessionConfiguration.default //cache,credentials,cookies - singleton
        
        let session = URLSession(configuration: defaultConfigation)
        
        //3 шаг - отправить запрос
        session.dataTask(with: request) { data, response, error in
            
            //data - бинарник (полезные данные)
            //response - status code
            //error - ошибка
     
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print(json)
                
            } catch  {
                print(error)
            }
        }.resume()
    }

}
