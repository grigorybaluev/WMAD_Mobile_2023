import Foundation

struct Playlist {
    let ARTIST_NAME_MAX = 25
    let SONG_TITLE_MAX = 35
    
    private(set) var songs: [Song]
    
    init(_ songs: [Song] = []) {
        self.songs = songs
        self.menu()
    }
    
    enum Menu: CaseIterable {
        case addSong
        case findSong
        case deleteSong
        case showPlaylist
        case categorySummary
        case playlistSize
        case showMenu
        case exit

        var long: String {
            switch self {
            case .addSong: return "Add a song to the playlist"
            case .findSong: return "Find a song on the playlist"
            case .deleteSong: return "Delete a song from the playlist"
            case .showPlaylist: return "Show the entire playlist"
            case .categorySummary: return "Category summary"
            case .playlistSize: return "Show playlist size"
            case .showMenu: return "Show this menu"
            case .exit: return "Exit the program"
            }
        }
        var short: String {
            switch self {
            case .addSong: return "a"
            case .findSong: return "f"
            case .deleteSong: return "d"
            case .showPlaylist: return "s"
            case .categorySummary: return "c"
            case .playlistSize: return "z"
            case .showMenu: return "m"
            case .exit: return "x"
            }
        }
    }
    
    func getMenuCaseByShortValue(_ shortValue: String) -> Menu? {
        switch shortValue {
        case "a": return Menu.addSong
        case "f": return Menu.findSong
        case "d": return Menu.deleteSong
        case "s": return Menu.showPlaylist
        case "c": return Menu.categorySummary
        case "z": return Menu.playlistSize
        case "m": return Menu.showMenu
        case "x": return Menu.exit
        default: return nil
        }
    }
    
    func validArtistInputNewSong() -> String {
        var artist: String?
        while artist == nil {
            print("Enter a new song's artist:")
            let a = String(readLine()!)
            if 0 < a.count && a.count < ARTIST_NAME_MAX {
                artist = a
            } else {
                print("Artist name should be max \(ARTIST_NAME_MAX) characters. Please re-enter:")
            }
        }
        return artist!
    }
    
    func validTitleInputNewSong() -> String {
        var title: String?
        while title == nil {
            print("Enter a new song's title:")
            let t = String(readLine()!)
            if 0 < t.count && t.count < SONG_TITLE_MAX {
                title = t
            } else {
                print("Artist name should be max \(SONG_TITLE_MAX) characters. Please re-enter:")
            }
        }
        return title!
    }
    
    func validTitleInputExistingSong() -> String? {
        var title: String?
        while title == nil {
            print("Enter a new song's title or enter !showPlaylist to see all songs:")
            let t = String(readLine()!)
            if self.songs.map({ $0.title }).contains(t) {
                title = t
            } else if t == "!showPlaylist" {
                self.showPlaylist()
            } else if t == "" {
                return nil
            } else {
                print("No such title: '\(t)' in the list")
            }
        }
        return title!
    }
    
    func validStyleInputNewSong() -> Song.Style {
        var category: Song.Style?
        while category == nil {
            print("Enter a new song's category (P: Pop, R: Rock, A: Alternative, B: RnB, H: Hiphop, C: Classical):")
            if let c = Song.Style(rawValue: String(readLine()!).lowercased()) {
                category = c
            } else {
                print("Invalid category. Please re-enter:")
            }
        }
        return category!
    }
    
    func validStyleInputExistingSong() -> Song.Style {
        var category: Song.Style?
        while category == nil {
            print("Enter a new song's category (P: Pop, R: Rock, A: Alternative, B: RnB, H: Hiphop, C: Classical):")
            if let c = Song.Style(rawValue: String(readLine()!).lowercased()) {
                category = c
            } else {
                print("Invalid category. Please re-enter:")
            }
        }
        return category!
    }
    
    func validSizeInput() -> Int {
        var size: Int?
        while size == nil {
            print("Enter a new song's size:")
            if let s = Int(readLine()!) {
                if s > 0 {
                    size = s
                } else {
                    print("Invalid input - size should be more than 0. Please re-enter:")
                }
            } else {
                print("Invalid input - size should be number. Please re-enter:")
            }
        }
        return size!
    }
    
    func inputNewSongData() -> (String, String, Song.Style, Int) {
        let t = validTitleInputNewSong()
        let a = validArtistInputNewSong()
        let c = validStyleInputNewSong()
        let s = validSizeInput()
        return (t, a, c, s)
    }
    
    mutating func addSong() {
        let (t, a, c, s) = inputNewSongData()
        songs.append(Song(title: t, artist: a, category: c, size: s))
    }
    
    mutating func findSong() {
        print("Enter your search Keyword:")
        let q = String(readLine()!)
        let pattern = ".*" + q + ".*"
        var res = ["title": [], "artist": []]
        
        for song in self.songs {
            if let _ = song.title.range(of: pattern, options: .regularExpression) {
                res["title"]!.append(song)
            }
            if let _ = song.artist.range(of: pattern, options: .regularExpression) {
                res["artist"]!.append(song)
            }
        }
        
        print("=== Matched Titles ===")
        for s in res["title"]! {
            print(s)
        }
        print("=== \(res["title"]!.count) matches ===")
        
        print("=== Matched Artists ===")
        for s in res["artist"]! {
            print(s)
        }
        print("=== \(res["artist"]!.count) matches ===")
    }
    
    mutating func deleteSong() {
        if let t = validTitleInputExistingSong() {
            for (index, item) in self.songs.enumerated() {
                if item.title == t {
                    self.songs.remove(at: index)
                    return
                }
            }
        } else {
            return
        }
    }
    
    func showPlaylist(_ category: Song.Style? = nil) {
        print("---------------------------------------------------------------------------------------------")
        print("| Title                               | Artist                    | Style       | Size (MB)  ")
        print("---------------------------------------------------------------------------------------------")
        
        if category == nil {
            for song in self.songs {
                print(song)
            }
            print("---------------------------------------------------------------------------------------------")
            print("Total: \(self.songs.count) songs in the playlist.")
            self.playlistSize()
        } else {
            for song in self.songs.filter( {$0.category == category} ) {
                print(song)
            }
            print("---------------------------------------------------------------------------------------------")
            print("Total: \(self.songs.count) songs of \(category!.styleFull) category in the playlist.")
            self.playlistSize(category)
        }
    }
    
    func playlistSize(_ category: Song.Style? = nil) {
        if category == nil {
            print("Total size: \(self.songs.map({ $0.size }).reduce(0, {$0 + $1})) KB")
        } else {
            print("Total size: \(self.songs.filter( {$0.category == category} ).map({ $0.size }).reduce(0, {$0 + $1})) KB")
        }
    }
    
    func showMenu() {
        for menuCase in Menu.allCases {
            print(menuCase.short.uppercased(), terminator: ": ")
            print(menuCase.long)
        }
    }
    
    mutating func menu() {
        var runMenu = true
        while runMenu {
            showMenu()
            if let i = getMenuCaseByShortValue(String(readLine()!).lowercased()) {
                print(i.long + "!")
                switch i {
                case .addSong:
                    self.addSong()
                case .findSong:
                    self.findSong()
                case .deleteSong:
                    self.deleteSong()
                case .showPlaylist:
                    self.showPlaylist()
                case .categorySummary:
                    let category = validStyleInputExistingSong()
                    self.showPlaylist(category)
                case .playlistSize:
                    self.playlistSize()
                case .showMenu:
                    continue
                case .exit:
                    runMenu = false
                }
            } else {
                print("Invalid command. Please re-enter:")
            }
        }
    }
}
