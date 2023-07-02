//
//  ContentView.swift
//  chessgame
//
//  Created by Analyst  on 7/2/23.
//
import SwiftUI
import CoreData

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(0..<8) { row in
                HStack {
                    ForEach(0..<8) { col in
                        ChessSquareView(row: row, col: col)
                    }
                }
            }
        }
    }
}

struct ChessSquareView: View {
    let row: Int
    let col: Int

    var chessPieceImage: Image? {
        // Determine the chess piece image based on the row and col indices
        if let chessPiece = ChessBoard.defaultBoard[row][col] {
            return Image(chessPiece.imageName)
        } else {
            return nil
        }
    }

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor((row + col) % 2 == 0 ? .white : .gray)
                .frame(width: 40, height: 40) // Adjust size as needed

            chessPieceImage?
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32) // Adjust size as needed
        }
    }
}

struct ChessPiece {
    let imageName: String
}

struct ChessBoard {
    static let defaultBoard: [[ChessPiece?]] = [
        // Replace with your own arrangement of chess pieces
        [ChessPiece(imageName: "rook"), ChessPiece(imageName: "knight"), ChessPiece(imageName: "bishop"), ChessPiece(imageName: "queen"), ChessPiece(imageName: "king"), ChessPiece(imageName: "bishop"), ChessPiece(imageName: "knight"), ChessPiece(imageName: "rook")],
        [ChessPiece(imageName: "pawn"), ChessPiece(imageName: "pawn"), ChessPiece(imageName: "pawn"), ChessPiece(imageName: "pawn"), ChessPiece(imageName: "pawn"), ChessPiece(imageName: "pawn"), ChessPiece(imageName: "pawn"), ChessPiece(imageName: "pawn")],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [nil, nil, nil, nil, nil, nil, nil, nil],
        [ChessPiece(imageName: "pawn"), ChessPiece(imageName: "pawn"), ChessPiece(imageName: "pawn"), ChessPiece(imageName: "pawn"), ChessPiece(imageName: "pawn"), ChessPiece(imageName: "pawn"), ChessPiece(imageName: "pawn"), ChessPiece(imageName: "pawn")],
        [ChessPiece(imageName: "rook"), ChessPiece(imageName: "knight"), ChessPiece(imageName: "bishop"), ChessPiece(imageName: "queen"), ChessPiece(imageName: "king"), ChessPiece(imageName: "bishop"), ChessPiece(imageName: "knight"), ChessPiece(imageName: "rook")]
    ]
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
