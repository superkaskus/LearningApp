//
//  ContentModel.swift
//  LearningApp
//
//  Created by Adam Abdul-rahim on 24/11/21.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var modules = [Module]()
    
    var styleData : Data?
    
    init() {
        getLocalData()
    }
    
    func getLocalData() {
        
        // get url to the json file
        let jsonUrl = Bundle.main.url(forResource: "data", withExtension: "json")
        
        do {
            
        // Read the file into a data object
            // Try to decode the json into an array of modules
        let jsonData = try Data(contentsOf: jsonUrl!)
        
        let jsonDecoder = JSONDecoder()
       
            do {
        let modules = try jsonDecoder.decode([Module].self, from: jsonData)
                
                // MARK:- assign parsed module to modules property
                
                self.modules = modules
            }
            catch {
                //log error
                print(error)
            }
        }
        catch {
            //log error
            print("Couldn't parse local data")
        }
        
       // Parse the style data
        
        let styleUrl = Bundle.main.url(forResource: "style", withExtension: "html")
        
        do {
            //read the file into a data object
            
            let styleData = try Data(contentsOf: styleUrl!)
            
            self.styleData = styleData
        }
        catch {
            print(error)
        }
    }
}
