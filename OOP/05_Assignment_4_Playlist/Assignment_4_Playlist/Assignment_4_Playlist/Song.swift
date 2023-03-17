import Foundation


struct Song {
    static let ARTIST_NAME_MAX = 25
    static let SONG_TITLE_MAX = 35
    static let STYLE_MAX = 11
    
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
    var description: String {
        var res: String = "| "
        res += self.title + String(repeating: " ", count: Song.SONG_TITLE_MAX - self.title.count) + " | "
        res += self.artist + String(repeating: " ", count: Song.ARTIST_NAME_MAX - self.artist.count) + " | "
        res += self.category.styleFull + String(repeating: " ", count: Song.STYLE_MAX - self.category.styleFull.count) + " | "
        res += String(Double(self.size/100)/10) + " (MB)"
        return res
    }
}
