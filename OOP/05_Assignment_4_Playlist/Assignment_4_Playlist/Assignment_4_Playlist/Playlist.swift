//
//  Playlist.swift
//  Assignment4
//
//  Created by Derrick Park on 2023-03-03.
//

import Foundation

struct Playlist {
    let ARTIST_NAME_MAX = 20
    let SONG_TITLE_MAX = 35
    
    private(set) var songs: [Song] = []
    
    func validArtistInput() -> String {
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
    
    func validTitleInput() -> String {
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
        let t = validTitleInput()
        let a = validArtistInput()
        let c = validStyleInput()
        let s = validSizeInput()
        return (t, a, c, s)
    }
    
    mutating func addSong() {
        let (t, a, c, s) = inputNewSongData()
        let newSong: Song = Song(title: t, artist: a, category: c, size: s)
        songs.append(newSong)
    }
}
