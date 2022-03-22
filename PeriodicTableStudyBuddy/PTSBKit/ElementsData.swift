//
//  ElementsData.swift
//  PeriodicTableStudyBuddy
//
//  Created by Christopher Francisco on 3/21/22.
//

import Foundation
import CoreData

class ElementsData {
    
    static let shared:ElementsData = ElementsData()
    
    private var regexElementsData:String?
    private var elementsData:[[String:String]]?
    
    private init() {
        self.regexElementsData = "(?<=(>))(.|\n)*?(?<=(<))"
        self.setElementsData()
    }
    
    public func getElementsData() -> [[String:String]] {
        return self.elementsData!
    }
    
    private func setElementsData() {
        let url:String = "https://en.wikipedia.org/wiki/List_of_chemical_elements"
        let urlObject:URL = URL(string: url)!
        let taskSession:URLSessionDataTask = URLSession.shared.dataTask(with:urlObject) { (data, response, error) in
            guard let data = data else {
                print("DATA ALLOCATION HAS PRODUCED AN ERROR")
                return
            }
            guard let htmlString = String(data: data, encoding: .utf8) else {
                print("STRING ALLOCATION HAS PRODUCED AN ERROR")
                return
            }
            self.elementsData = self.getElementsData(htmlString: htmlString) // change this
            for data in self.elementsData! {
                print(data["AtomicNumber"]!, data["Symbol"]!, data["Name"]!)
                print("\n")
            }
        }
        taskSession.resume()
    }
    
    private func getElementsData(htmlString:String) -> [[String:String]] {
        let regexElements:String = "<(tr class=\"anchor\")(.|\n)*?(tr)>"
        let elementsHtml:[String] = getMatchesArray(regex: regexElements, text: htmlString)
        let elementsData:[[String:String]] = buildElementsData(elementHtmls: elementsHtml)
        return elementsData
    }
    
    private func buildElementsData(elementHtmls:[String]) -> [[String:String]] {
        var elementsData:[[String:String]] = []
        for elementHtml in elementHtmls {
            elementsData.append(self.getElementData(elementHtml: elementHtml))
        }
        return elementsData
    }
    
    private func getElementData(elementHtml:String) -> [String:String] {
        let elementData:[String] = getMatchesArray(regex: self.regexElementsData!, text: elementHtml)
        var elementDict:[String:String] = [:]
        for index in 0..<elementData.count {
            if (index == 1) {
                elementDict["AtomicNumber"] = elementData[index].replacingOccurrences(of: "\n<", with: "")
            } else if (index == 3) {
                elementDict["Symbol"] = elementData[index].replacingOccurrences(of: "\n<", with: "")
            } else if (index == 4) {
                elementDict["Name"] = elementData[index].replacingOccurrences(of: "<", with: "")
            }
            // get atomic mass, they vary in data number
        }
        return elementDict
    }
    
    private func getMatchesArray(regex:String, text:String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: regex)
            let results = regex.matches(in:text, range: NSRange(text.startIndex..., in:text))
            return results.map {
                String(text[Range($0.range, in:text)!])
            }
        } catch let error {
            print("ERROR PRODUCED: \(error.localizedDescription)")
            return []
        }
    }
}
