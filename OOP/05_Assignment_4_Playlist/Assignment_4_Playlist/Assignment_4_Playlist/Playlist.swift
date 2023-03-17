//
//  Playlist.swift
//  Assignment4
//
//  Created by Derrick Park on 2023-03-03.
//

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
    
    func validTitleInputExistingSong() -> String {
        var title: String?
        while title == nil {
            print("Enter a new song's title:")
            let t = String(readLine()!)
            if self.songs.map({ $0.title }).contains(t) {
                title = t
            } else {
                print("No such title: '\(t)' in the list")
            }
        }
        return title!
    }
    
    func validStyleInput() -> Song.Style {
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
        let c = validStyleInput()
        let s = validSizeInput()
        return (t, a, c, s)
    }
    
    mutating func addSong() {
        let (t, a, c, s) = inputNewSongData()
        songs.append(Song(title: t, artist: a, category: c, size: s))
    }
    
    
    
    mutating func deleteSong() {
        let t = validTitleInputExistingSong()
        for (index, item) in self.songs.enumerated() {
            if item.title == t {
                self.songs.remove(at: index)
            }
        }
    }
    
    func showPlaylist() {
        print("---------------------------------------------------------------------------------------------")
        print("| Title                               | Artist                    | Style       | Size (MB)  ")
        print("---------------------------------------------------------------------------------------------")
        for song in self.songs {
            print(song)
        }
        print("---------------------------------------------------------------------------------------------")
    }
    
    mutating func menu() {
        var runMenu = true
        while runMenu {
            printMenu()
            if let i = getMenuCaseByShortValue(String(readLine()!).lowercased()) {
                print(i.long + "!")
                switch i {
                case .addSong:
                    self.addSong()
                case .findSong:
                    print()
                case .deleteSong:
                    self.deleteSong()
                case .showPlaylist:
                    self.showPlaylist()
                case .categorySummary:
                    print()
                case .playlistSize:
                    print()
                case .showMenu:
                    print()
                case .exit:
                    print("check")
                    runMenu = false
                }
            } else {
                print("Invalid command. Please re-enter:")
            }
        }
    }
    
    func printMenu() {
        for menuCase in Menu.allCases {
            print(menuCase.short.uppercased(), terminator: ": ")
            print(menuCase.long)
        }
        
    }
}
