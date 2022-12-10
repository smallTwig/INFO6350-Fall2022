//
//  ViewController.swift
//  Weather forecast
//
//  Created by kanra on 11/19/22.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON
import SwiftSpinner

class ViewController: UIViewController, CLLocationManagerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var tbView: UITableView!
    
    var lat:CLLocationDegrees?
    var lng:CLLocationDegrees?
    let locationManager = CLLocationManager()
    var temps = [String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.requestLocation()

    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        lat = location.coordinate.latitude
        lng = location.coordinate.longitude
        print(lat)
        print(lng)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    @IBAction func getCurrentLocation(_ sender: Any) {
        
        var locationStr = "\(self.lat!),\(self.lng!)"

        var url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/weatherdata/forecast?locations="

        url += locationStr

        url += "&aggregateHours=24&unitGroup=us&shortColumnNames=false&contentType=json&key=AYQR6QM5KHFYVPH9M4EXXJUCC"

    AF.request(url).responseJSON { responseData in
        //print(responseData)

        if responseData.error != nil {
            print(responseData.error!)
            return
        }

        let weatherData = JSON(responseData.data as Any)


        let forecastValues =  weatherData["locations"][locationStr]["values"]

        print(forecastValues.count)

        for forecast in forecastValues {

            let forecastJSON = JSON(forecast.1)

            let temp = forecastJSON["temp"].floatValue
            let condition = forecastJSON["conditions"].stringValue
            let str = "temperature = \(temp)℉, \(condition)"
            self.temps.append(str)

            print(forecast)
        }
        self.tbView.reloadData()
            
        }
    }
    
    
    @IBAction func getWeather(_ sender: Any) {
        let city = txtCity.text!;

        var url = "https://weather.visualcrossing.com/VisualCrossingWebServices/rest/services/weatherdata/forecast?locations="

        url += city

        url += "&aggregateHours=24&unitGroup=us&shortColumnNames=false&contentType=json&key=AYQR6QM5KHFYVPH9M4EXXJUCC"

        AF.request(url).responseJSON { responseData in
        //print(responseData)

        if responseData.error != nil {
            print(responseData.error!)
            return
        }

        let weatherData = JSON(responseData.data as Any)

            let forecastValues =  weatherData["locations"][self.txtCity.text!]["values"]

        print(forecastValues.count)

        self.temps = [String]()
        for forecast in forecastValues {
            print(forecast)
            
            let forecastJSON = JSON(forecast.1)
            let temp = forecastJSON["temp"].floatValue
            let condition = forecastJSON["conditions"].stringValue
            let str = "temperature = \(temp)℉, \(condition)"
            self.temps.append(str)
        }
        self.tbView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            temps.count
        }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = temps[indexPath.row]
        return cell
    }
}
    

