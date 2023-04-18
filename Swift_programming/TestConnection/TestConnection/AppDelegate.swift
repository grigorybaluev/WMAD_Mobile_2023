////
////  AppDelegate.swift
////  TestConnection
////
////  Created by MacBook on 14.04.2023.
////
//
//import UIKit
//
//@main
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//
//
//  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//    // Override point for customization after application launch.
//    return true
//  }
//
//  // MARK: UISceneSession Lifecycle
//
//  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//  }
//
//  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//  }
//
//
//}
//


//enum PieceType: String {
//    case pawn = "♟"
//    case rook = "♜"
//    case knight = "♞"
//    case bishop = "♝"
//    case queen = "♛"
//    case king = "♚"
//}
//
//enum PieceColor: String {
//    case white = "\u{001B}[0;37m"
//    case black = "\u{001B}[0;30m"
//}
//
//class Piece {
//    var type: PieceType
//    var color: PieceColor
//    
//    init(type: PieceType, color: PieceColor) {
//        self.type = type
//        self.color = color
//    }
//}
//
//class Board {
//    var pieces = [[Piece]]()
//    
//  init() {
//    // White pieces
//    let rookWhite = Piece(type: .rook, color: .white)
//    let knightWhite = Piece(type: .knight, color: .white)
//    let bishopWhite = Piece(type: .bishop, color: .white)
//    let queenWhite = Piece(type: .queen, color: .white)
//    let kingWhite = Piece(type: .king, color: .white)
//    let bishopWhite2 = Piece(type: .bishop, color: .white)
//    let knightWhite2 = Piece(type: .knight, color: .white)
//    let rookWhite2 = Piece(type: .rook, color: .white)
//    let pawnWhite = Piece(type: .pawn, color: .white)
//    let pawnWhite2 = Piece(type: .pawn, color: .white)
//    let pawnWhite3 = Piece(type: .pawn, color: .white)
//    let pawnWhite4 = Piece(type: .pawn, color: .white)
//    let pawnWhite5 = Piece(type: .pawn, color: .white)
//    let pawnWhite6 = Piece(type: .pawn, color: .white)
//    let pawnWhite7 = Piece(type: .pawn, color: .white)
//    let pawnWhite8 = Piece(type: .pawn, color: .white)
//    
//    // Black pieces
//    let rookBlack = Piece(type: .rook, color: .black)
//    let knightBlack = Piece(type: .knight, color: .black)
//    let bishopBlack = Piece(type: .bishop, color: .black)
//    let queenBlack = Piece(type: .queen, color: .black)
//    let kingBlack = Piece(type: .king, color: .black)
//    let bishopBlack2 = Piece(type: .bishop, color: .black)
//    let knightBlack2 = Piece(type: .knight, color: .black)
//    let rookBlack2 = Piece(type: .rook, color: .black)
//    let pawnBlack = Piece(type: .pawn, color: .black)
//    let pawnBlack2 = Piece(type: .pawn, color: .black)
//    let pawnBlack3 = Piece(type: .pawn, color: .black)
//    let pawnBlack4 = Piece(type: .pawn, color: .black)
//    let pawnBlack5 = Piece(type: .pawn, color: .black)
//    let pawnBlack6 = Piece(type: .pawn, color: .black)
//    let pawnBlack7 = Piece(type: .pawn, color: .black)
//    let pawnBlack8 = Piece(type: .pawn, color: .black)
//    
//    let row1 = [rookWhite, knightWhite, bishopWhite, queenWhite, kingWhite, bishopWhite2, knightWhite2, rookWhite2]
//    let row2 = [pawnWhite, pawnWhite2, pawnWhite3, pawnWhite4, pawnWhite5, pawnWhite6, pawnWhite7, pawnWhite8]
//    let row3 = Array(repeating: Piece(type: .pawn, color: .black), count: 8)
//    let row4 = Array(repeating: Piece(type: .pawn, color: .black), count: 8)
//    let row5 = Array(repeating: Piece(type: .pawn, color: .black), count: 8)
//    let row6 = Array(repeating: Piece(type: .pawn, color: .black), count: 8)
//    let row7 = [pawnBlack, pawnBlack2, pawnBlack3, pawnBlack4, pawnBlack5, pawnBlack6, pawnBlack7, pawnBlack8]
//    let row8 = [rookBlack, knightBlack, bishopBlack, queenBlack, kingBlack, bishopBlack2, knightBlack2, rookBlack2]
//    
//    pieces.append(row1)
//    pieces.append(row2)
//    pieces.append(row3)
//    pieces.append(row4)
//    pieces.append(row5)
//    pieces.append(row6)
//    pieces.append(row7)
//    pieces.append(row8)
//    }
//
//    func printBoard() {
//        for i in 0..<pieces.count {
//            print("\n")
//            for j in 0..<pieces[i].count {
//                let piece = pieces[i][j]
//                switch piece.color {
//                case .white:
//                    print("\(piece.type.rawValue)", terminator:" ")
//                case .black:
//                    print("\(piece.color.rawValue)\(piece.type.rawValue)", terminator:" ")
//                }
//            }
//        }
//        print("\n")
//    }
//
//    }
//
//    let board = Board()
//    board.printBoard()
