//
//  GameDetailRepository.swift
//  GameFinder
//
//  Created by Prasetya on 23/05/23.
//

import Foundation

protocol GameDetailRepository {
    func fetchDetail(_ id: Int) async throws -> GameDetail
    
    func getDetail(_ id: Int) throws -> GameDetail?
    
    func addDetail(_ detail: GameDetail)
}
