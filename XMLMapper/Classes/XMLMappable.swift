//
//  XMLMapper.swift
//  Pods
//
//  Created by Giorgos Charitakis on 14/09/2017.
//
//

public protocol XMLBaseMappable {
    func mapping(map: XMLMap)
}

public protocol XMLMappable: XMLBaseMappable {
    init(map: XMLMap)
}

public extension XMLBaseMappable {
    
    /// Initializes object from a XML String
    public init?(XMLString: String) {
        if let obj: Self = XMLMapper().map(XMLString: XMLString) {
            self = obj
        } else {
            return nil
        }
    }
    
    /// Initializes object from a XML Dictionary
    public init?(XML: [String: Any]) {
        if let obj: Self = XMLMapper().map(XML: XML) {
            self = obj
        } else {
            return nil
        }
    }
    
    /// Returns the XML Dictionary for the object
    public func toXML() -> [String: Any] {
        return XMLMapper().toXML(self)
    }
    
    /// Returns the XML String for the object
    public func toXMLString(prettyPrint: Bool = false) -> String? {
        return XMLMapper().toXMLString(self, prettyPrint: prettyPrint)
    }
}

public extension Array where Element: XMLBaseMappable {
    
    /// Initialize Array from a XML String
    public init?(XMLString: String) {
        if let obj: [Element] = XMLMapper().mapArray(XMLString: XMLString) {
            self = obj
        } else {
            return nil
        }
    }
    
    /// Initialize Array from a XML Array
    public init(XMLArray: [[String: Any]]) {
        let obj: [Element] = XMLMapper().mapArray(XMLArray: XMLArray)
        self = obj
    }
    
    /// Returns the XML Array
    public func toXML() -> [[String: Any]] {
        return XMLMapper().toXMLArray(self)
    }
    
    /// Returns the XML String for the object
    public func toXMLString(prettyPrint: Bool = false) -> String? {
        return XMLMapper().toXMLString(self, prettyPrint: prettyPrint)
    }
}

public extension Set where Element: XMLBaseMappable {
    
    /// Initializes a set from a XML String
    public init?(XMLString: String) {
        if let obj: Set<Element> = XMLMapper().mapSet(XMLString: XMLString) {
            self = obj
        } else {
            return nil
        }
    }
    
    /// Initializes a set from XML
    public init?(XMLArray: [[String: Any]]) {
        guard let obj = XMLMapper().mapSet(XMLArray: XMLArray) as Set<Element>? else {
            return nil
        }
        self = obj
    }
    
    /// Returns the XML Set
    public func toXML() -> [[String: Any]] {
        return XMLMapper().toXMLSet(self)
    }
    
    /// Returns the XML String for the object
    public func toXMLString(prettyPrint: Bool = false) -> String? {
        return XMLMapper().toXMLString(self, prettyPrint: prettyPrint)
    }
}
