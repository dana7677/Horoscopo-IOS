//
//  Horoscope.swift
//  Horoscopo
//
//  Created by Tardes on 12/12/24.
//

import Foundation
import UIKit

enum TypeSearch {
    case daily, weekly, monthly
}

struct Horoscope{
    
    let id:String
    let name:String
    let icon:UIImage
    let dates:String
    


    static func getAll()->[Horoscope]
    {
        
        let list = [
            Horoscope(id:"aries",name:String(localized: "Aries"),icon: UIImage(named: "horoscope-icons/aries")!,dates:String(localized: "March 21 to April 19")),
            Horoscope(id:"taurus",name:String(localized: "Taurus"),icon: UIImage(named: "horoscope-icons/taurus")!,dates:String(localized: "April 20 to May 20")),
            Horoscope(id:"geminis",name:String(localized: "Geminis"),icon: UIImage(named: "horoscope-icons/geminis")!,dates:String(localized: "May 21 to June 20")),
            Horoscope(id:"cancer",name:String(localized: "Cancer"),icon: UIImage(named: "horoscope-icons/cancer")!,dates:String(localized: "June 21 to July 22")),
            Horoscope(id:"leo",name:String(localized: "Leo"),icon: UIImage(named: "horoscope-icons/leo")!,dates:String(localized: "July 23 to August 22")),
            Horoscope(id:"virgo",name:String(localized: "Virgo"),icon: UIImage(named: "horoscope-icons/virgo")!,dates:String(localized: "August 23 to September 22")),
            Horoscope(id:"libra",name:String(localized: "Libra"),icon: UIImage(named: "horoscope-icons/libra")!,dates:String(localized: "September 23 to October 22")),
            Horoscope(id:"scorpio",name:String(localized: "Scorpio"),icon: UIImage(named: "horoscope-icons/scorpio")!,dates:String(localized: "October 23 to November 21")),
            Horoscope(id:"sagitarius",name:String(localized: "Sagitarius"),icon: UIImage(named: "horoscope-icons/sagitarius")!,dates:String(localized: "November 22 to December 21")),
            Horoscope(id:"capricorn",name:String(localized: "Capricorn"),icon: UIImage(named: "horoscope-icons/capricorn")!,dates:String(localized: "December 22 to January 19")),
            Horoscope(id:"aquarius",name:String(localized: "Aquarius"),icon: UIImage(named: "horoscope-icons/aquarius")!,dates:String(localized: "January 20 to February 18")),
            Horoscope(id:"pisces",name:String(localized: "Pisces"),icon: UIImage(named: "horoscope-icons/pisces")!,dates:String(localized: "February 19 to March 20"))
       ]
        
        return list
    }
    
    static func getFiltered(_ searchText: String)->[Horoscope]
    {
        var filteredDataString=[String]()
        var filteredDataCompleteString=[String]()
        var filteredData=[Horoscope]()
        let list = [
            Horoscope(id:"aries",name:String(localized: "Aries"),icon: UIImage(named: "horoscope-icons/aries")!,dates:String(localized: "March 21 to April 19")),
            Horoscope(id:"taurus",name:String(localized: "Taurus"),icon: UIImage(named: "horoscope-icons/taurus")!,dates:String(localized: "April 20 to May 20")),
            Horoscope(id:"geminis",name:String(localized: "Geminis"),icon: UIImage(named: "horoscope-icons/geminis")!,dates:String(localized: "May 21 to June 20")),
            Horoscope(id:"cancer",name:String(localized: "Cancer"),icon: UIImage(named: "horoscope-icons/cancer")!,dates:String(localized: "June 21 to July 22")),
            Horoscope(id:"leo",name:String(localized: "Leo"),icon: UIImage(named: "horoscope-icons/leo")!,dates:String(localized: "July 23 to August 22")),
            Horoscope(id:"virgo",name:String(localized: "Virgo"),icon: UIImage(named: "horoscope-icons/virgo")!,dates:String(localized: "August 23 to September 22")),
            Horoscope(id:"libra",name:String(localized: "Libra"),icon: UIImage(named: "horoscope-icons/libra")!,dates:String(localized: "September 23 to October 22")),
            Horoscope(id:"scorpio",name:String(localized: "Scorpio"),icon: UIImage(named: "horoscope-icons/scorpio")!,dates:String(localized: "October 23 to November 21")),
            Horoscope(id:"sagitarius",name:String(localized: "Sagitarius"),icon: UIImage(named: "horoscope-icons/sagitarius")!,dates:String(localized: "November 22 to December 21")),
            Horoscope(id:"capricorn",name:String(localized: "Capricorn"),icon: UIImage(named: "horoscope-icons/capricorn")!,dates:String(localized: "December 22 to January 19")),
            Horoscope(id:"aquarius",name:String(localized: "Aquarius"),icon: UIImage(named: "horoscope-icons/aquarius")!,dates:String(localized: "January 20 to February 18")),
            Horoscope(id:"pisces",name:String(localized: "Pisces"),icon: UIImage(named: "horoscope-icons/pisces")!,dates:String(localized: "February 19 to March 20"))
       ]
        
        if searchText != ""{
            for x in list
            {
                filteredDataString.append(x.id)
            }
            
            filteredDataCompleteString = filteredDataString.filter({$0.lowercased().uppercased().prefix(searchText.count) ==
                searchText.lowercased().uppercased()})
            for x in list {
                
                for a in filteredDataCompleteString{
                    
                    if(x.id == a)
                    {
                        filteredData.append(x)
                    }
                }
                
            }
            return filteredData
        }
        
        return list
    }
    
    //Funcion Call Api
    static func getHoroscopeLuck(horoscopeId: String, search: TypeSearch) async throws -> String {
           var result: String
            
            let url = getUrlHoroscope(horoscopeId, search)
           
           //let url = URL(string: "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=\(horoscopeId)&day=TODAY")
           
            //Verify Url not false
           guard let url = url else {
               throw RuntimeError("No url provided")
           }
            //Recogida en una variable Tupla del valor de la llamada, (Data,Response)
           let (data, _) = try await URLSession.shared.data(from: url)
           
            //Verificando el json se puede convertir.
           guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
               throw RuntimeError("JSON parse exception")
           }
            //Extrayendo el valor de data como un string.
           let jsonData = json["data"] as? [String: String]
           
           result = jsonData?["horoscope_data"] ?? ""
           
           return result
       }
    
    static func getUrlHoroscope(_ horoscopeId: String,_ search: TypeSearch)->URL?{
        
                var url = URL(string: "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=\(horoscopeId)&day=TODAY")
                switch search {
                case .daily:
                    url=URL(string: "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/daily?sign=\(horoscopeId)&day=TODAY")
                    return url
                case .weekly:
                    url=URL(string: "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/weekly?sign=\(horoscopeId)&day=TODAY")
                    return url
                case .monthly:
                    url=URL(string: "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/monthly?sign=\(horoscopeId)&day=TODAY")
                    return url
                }
            
        }
    
    struct RuntimeError: Error {
            let description: String

            init(_ description: String) {
                self.description = description
            }
        }
}
