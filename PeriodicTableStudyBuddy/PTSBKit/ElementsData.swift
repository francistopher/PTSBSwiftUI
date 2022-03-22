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
    
    // this class was used to produce the data below, altered the order to map the table correctly
    private var theRealData:[[String:String]] = [["Name": "Hydrogen", "AtomicNumber": "1", "Symbol": "H"], ["Symbol": "He", "AtomicNumber": "2", "Name": "Helium"], ["Symbol": "Li", "Name": "Lithium", "AtomicNumber": "3"], ["Symbol": "Be", "AtomicNumber": "4", "Name": "Beryllium"], ["Symbol": "B", "Name": "Boron", "AtomicNumber": "5"], ["Name": "Carbon", "AtomicNumber": "6", "Symbol": "C"], ["Symbol": "N", "Name": "Nitrogen", "AtomicNumber": "7"], ["AtomicNumber": "8", "Symbol": "O", "Name": "Oxygen"], ["Name": "Fluorine", "AtomicNumber": "9", "Symbol": "F"], ["AtomicNumber": "10", "Symbol": "Ne", "Name": "Neon"], ["AtomicNumber": "11", "Symbol": "Na", "Name": "Sodium"], ["AtomicNumber": "12", "Symbol": "Mg", "Name": "Magnesium"], ["Symbol": "Al", "Name": "Aluminium", "AtomicNumber": "13"], ["Name": "Silicon", "AtomicNumber": "14", "Symbol": "Si"], ["Name": "Phosphorus", "Symbol": "P", "AtomicNumber": "15"], ["Symbol": "S", "Name": "Sulfur", "AtomicNumber": "16"], ["AtomicNumber": "17", "Symbol": "Cl", "Name": "Chlorine"], ["Symbol": "Ar", "Name": "Argon", "AtomicNumber": "18"], ["Name": "Potassium", "Symbol": "K", "AtomicNumber": "19"], ["Name": "Calcium", "AtomicNumber": "20", "Symbol": "Ca"], ["Symbol": "Sc", "AtomicNumber": "21", "Name": "Scandium"], ["AtomicNumber": "22", "Symbol": "Ti", "Name": "Titanium"], ["Name": "Vanadium", "AtomicNumber": "23", "Symbol": "V"], ["Symbol": "Cr", "AtomicNumber": "24", "Name": "Chromium"], ["Symbol": "Mn", "AtomicNumber": "25", "Name": "Manganese"], ["AtomicNumber": "26", "Name": "Iron", "Symbol": "Fe"], ["Symbol": "Co", "Name": "Cobalt", "AtomicNumber": "27"], ["Symbol": "Ni", "Name": "Nickel", "AtomicNumber": "28"], ["Name": "Copper", "Symbol": "Cu", "AtomicNumber": "29"], ["Name": "Zinc", "AtomicNumber": "30", "Symbol": "Zn"], ["Symbol": "Ga", "AtomicNumber": "31", "Name": "Gallium"], ["Symbol": "Ge", "Name": "Germanium", "AtomicNumber": "32"], ["Name": "Arsenic", "Symbol": "As", "AtomicNumber": "33"], ["AtomicNumber": "34", "Name": "Selenium", "Symbol": "Se"], ["AtomicNumber": "35", "Symbol": "Br", "Name": "Bromine"], ["Symbol": "Kr", "AtomicNumber": "36", "Name": "Krypton"], ["Name": "Rubidium", "Symbol": "Rb", "AtomicNumber": "37"], ["Name": "Strontium", "Symbol": "Sr", "AtomicNumber": "38"], ["Name": "Yttrium", "AtomicNumber": "39", "Symbol": "Y"], ["Name": "Zirconium", "Symbol": "Zr", "AtomicNumber": "40"], ["AtomicNumber": "41", "Name": "Niobium", "Symbol": "Nb"], ["AtomicNumber": "42", "Symbol": "Mo", "Name": "Molybdenum"], ["Name": "Technetium", "AtomicNumber": "43", "Symbol": "Tc"], ["AtomicNumber": "44", "Name": "Ruthenium", "Symbol": "Ru"], ["AtomicNumber": "45", "Symbol": "Rh", "Name": "Rhodium"], ["AtomicNumber": "46", "Symbol": "Pd", "Name": "Palladium"], ["Symbol": "Ag", "Name": "Silver", "AtomicNumber": "47"], ["Symbol": "Cd", "AtomicNumber": "48", "Name": "Cadmium"], ["Symbol": "In", "Name": "Indium", "AtomicNumber": "49"], ["AtomicNumber": "50", "Name": "Tin", "Symbol": "Sn"], ["Name": "Antimony", "AtomicNumber": "51", "Symbol": "Sb"], ["Name": "Tellurium", "Symbol": "Te", "AtomicNumber": "52"], ["AtomicNumber": "53", "Symbol": "I", "Name": "Iodine"], ["Symbol": "Xe", "Name": "Xenon", "AtomicNumber": "54"], ["Symbol": "Cs", "AtomicNumber": "55", "Name": "Caesium"], ["AtomicNumber": "56", "Symbol": "Ba", "Name": "Barium"], ["AtomicNumber": "57", "Symbol": "La", "Name": "Lanthanum"], ["Symbol": "Hf", "AtomicNumber": "72", "Name": "Hafnium"], ["AtomicNumber": "73", "Symbol": "Ta", "Name": "Tantalum"], ["Name": "Tungsten", "AtomicNumber": "74", "Symbol": "W"], ["AtomicNumber": "75", "Symbol": "Re", "Name": "Rhenium"], ["AtomicNumber": "76", "Name": "Osmium", "Symbol": "Os"], ["Name": "Iridium", "Symbol": "Ir", "AtomicNumber": "77"], ["AtomicNumber": "78", "Symbol": "Pt", "Name": "Platinum"], ["AtomicNumber": "79", "Symbol": "Au", "Name": "Gold"], ["AtomicNumber": "80", "Symbol": "Hg", "Name": "Mercury"], ["Symbol": "Tl", "Name": "Thallium", "AtomicNumber": "81"], ["AtomicNumber": "82", "Symbol": "Pb", "Name": "Lead"], ["Symbol": "Bi", "AtomicNumber": "83", "Name": "Bismuth"], ["Name": "Polonium", "Symbol": "Po", "AtomicNumber": "84"], ["Symbol": "At", "Name": "Astatine", "AtomicNumber": "85"], ["Symbol": "Rn", "AtomicNumber": "86", "Name": "Radon"], ["Name": "Francium", "AtomicNumber": "87", "Symbol": "Fr"], ["Name": "Radium", "AtomicNumber": "88", "Symbol": "Ra"], ["Name": "Actinium", "AtomicNumber": "89", "Symbol": "Ac"], ["AtomicNumber": "104", "Name": "Rutherfordium", "Symbol": "Rf"], ["Name": "Dubnium", "AtomicNumber": "105", "Symbol": "Db"], ["Symbol": "Sg", "Name": "Seaborgium", "AtomicNumber": "106"], ["AtomicNumber": "107", "Symbol": "Bh", "Name": "Bohrium"], ["Name": "Hassium", "AtomicNumber": "108", "Symbol": "Hs"], ["AtomicNumber": "109", "Symbol": "Mt", "Name": "Meitnerium"], ["AtomicNumber": "110", "Symbol": "Ds", "Name": "Darmstadtium"], ["AtomicNumber": "111", "Name": "Roentgenium", "Symbol": "Rg"], ["Name": "Copernicium", "AtomicNumber": "112", "Symbol": "Cn"], ["AtomicNumber": "113", "Name": "Nihonium", "Symbol": "Nh"], ["Symbol": "Fl", "AtomicNumber": "114", "Name": "Flerovium"], ["AtomicNumber": "115", "Symbol": "Mc", "Name": "Moscovium"], ["AtomicNumber": "116", "Symbol": "Lv", "Name": "Livermorium"], ["Name": "Tennessine", "AtomicNumber": "117", "Symbol": "Ts"], ["AtomicNumber": "118", "Symbol": "Og", "Name": "Oganesson"], ["Name": "Cerium", "Symbol": "Ce", "AtomicNumber": "58"], ["Name": "Praseodymium", "Symbol": "Pr", "AtomicNumber": "59"], ["Name": "Neodymium", "AtomicNumber": "60", "Symbol": "Nd"], ["Symbol": "Pm", "AtomicNumber": "61", "Name": "Promethium"], ["AtomicNumber": "62", "Symbol": "Sm", "Name": "Samarium"], ["Symbol": "Eu", "Name": "Europium", "AtomicNumber": "63"], ["AtomicNumber": "64", "Symbol": "Gd", "Name": "Gadolinium"], ["Name": "Terbium", "AtomicNumber": "65", "Symbol": "Tb"], ["Symbol": "Dy", "AtomicNumber": "66", "Name": "Dysprosium"], ["Name": "Holmium", "Symbol": "Ho", "AtomicNumber": "67"], ["AtomicNumber": "68", "Symbol": "Er", "Name": "Erbium"], ["Name": "Thulium", "AtomicNumber": "69", "Symbol": "Tm"], ["AtomicNumber": "70", "Symbol": "Yb", "Name": "Ytterbium"], ["Symbol": "Lu", "AtomicNumber": "71", "Name": "Lutetium"], ["Name": "Thorium", "AtomicNumber": "90", "Symbol": "Th"], ["Name": "Protactinium", "Symbol": "Pa", "AtomicNumber": "91"], ["AtomicNumber": "92", "Name": "Uranium", "Symbol": "U"], ["Name": "Neptunium", "AtomicNumber": "93", "Symbol": "Np"], ["Symbol": "Pu", "Name": "Plutonium", "AtomicNumber": "94"], ["AtomicNumber": "95", "Name": "Americium", "Symbol": "Am"], ["Name": "Curium", "Symbol": "Cm", "AtomicNumber": "96"], ["Name": "Berkelium", "AtomicNumber": "97", "Symbol": "Bk"], ["Symbol": "Cf", "Name": "Californium", "AtomicNumber": "98"], ["Name": "Einsteinium", "AtomicNumber": "99", "Symbol": "Es"], ["Symbol": "Fm", "Name": "Fermium", "AtomicNumber": "100"], ["Symbol": "Md", "AtomicNumber": "101", "Name": "Mendelevium"], ["Symbol": "No", "Name": "Nobelium", "AtomicNumber": "102"], ["Name": "Lawrencium", "Symbol": "Lr", "AtomicNumber": "103"],
    ]
    
    private var regexElementsData:String?
    public var elementsData:[[String:String]]?
    private var elementIndex:Int = 0
    
    private init() {
        self.regexElementsData = "(?<=(>))(.|\n)*?(?<=(<))"
        self.setElementsData()
    }
    
    public func getTheRealData() -> [[String:String]] {
        return self.theRealData
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
            //print(self.elementsData!) // used to initialize theRealData
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
            } else if (index == 6) {
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
