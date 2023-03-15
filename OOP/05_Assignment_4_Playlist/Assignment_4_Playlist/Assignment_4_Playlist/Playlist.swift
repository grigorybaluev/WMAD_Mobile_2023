//
//  Playlist.swift
//  Assignment4
//
//  Created by Derrick Park on 2023-03-03.
//

import Foundation

struct Playlist {
    private(set) var songs: [Song] = []
    
    func inputNewSongData() -> (String, String, Song.Style, Int) {
        print("Enter a new song's title:")
        let t = String(readLine()!)
        print("Enter a new song's artist:")
        let a = String(readLine()!)
        print("Enter a new song's category (P: Pop, R: Rock, A: Alternative, B: RnB, H: Hiphop, C: Classical):")
        let c = String(readLine()!)
        let _c: Song.Style
        switch c.lowercased() {
        case "p":
            _c = Song.Style.pop
        case "r":
            _c = Song.Style.rock
        case "a":
            _c = Song.Style.alternative
        case "b":
            _c = Song.Style.rnb
        case "h":
            _c = Song.Style.hiphop
        case "c":
            _c = Song.Style.classical
        default:
            _c = Song.Style.classical
            print("wtf?")
        }
        print("Enter a new song's size:")
        let s = Int(readLine()!)!
        return (t, a, _c, s)
    }
    
    mutating func addSong() {
        let (t, a, c, s) = inputNewSongData()
        let newSong: Song = Song(title: t, artist: a, category: c, size: s)
        songs.append(newSong)
    }
    
}
