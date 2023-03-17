//
//  Song.swift
//  Assignment4
//
//  Created by Derrick Park on 2023-03-03.
//

import Foundation


struct Song {
    let ARTIST_NAME_MAX = 25
    let SONG_TITLE_MAX = 35
    let STYLE_MAX = 11
    
    enum Style: String {
        case pop = "p"
        case rock = "r"
        case alternative = "a"
        case rnb = "b"
        case hiphop = "h"
        case classical = "c"

        var styleFull: String {
            switch self {
            case .pop:
                return "Pop"
            case .rock:
                return "Rock"
            case .alternative:
                return "Alternative"
            case .rnb:
                return "R'n'B"
            case .hiphop:
                return "Hiphop"
            case .classical:
                return "Classical"
            }
        }
    }
    // title of the song
    private(set) var title: String
    // artist of the song
    private(set) var artist: String
    // category of the song
    private(set) var category: Style
    // file size, stored in kilobytes
    private(set) var size: Int
    
    init(title: String, artist: String, category: Style, size: Int) {
        self.title = title
        self.artist = artist
        self.category = category
        self.size = size
    }
    
    mutating func setSong(title: String, artist: String, category: Style, size: Int) {
        self.title = title
        self.artist = artist
        self.category = category
        self.size = size
    }
}

extension Song: CustomStringConvertible {
    // Size should be printed in Megabytes (use 1000 kilobytes = 1 MB for this calculation), to 1 decimal place.
    // The category abbreviations used should be: Pop, Rock, Alt, Cls, HH, RnB
    // Example:
    // | Title                               | Artist                   | Style       | Size (MB)
    
    var description: String {
        var res: String = "| "
        res += self.title + String(repeating: " ", count: SONG_TITLE_MAX - self.title.count) + " | "
        res += self.artist + String(repeating: " ", count: ARTIST_NAME_MAX - self.artist.count) + " | "
        res += self.category.styleFull + String(repeating: " ", count: STYLE_MAX - self.category.styleFull.count) + " | "
//        res += String(format: "%2d", Float(self.size)/1000) + " (MB)"
        res += String(Double(self.size/100)/10) + " (MB)"
        return res
    }
    
//    func addSpaces(num: Int) -> String {
//        return ""
//    }
}
