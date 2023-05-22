//
//  PublisherExtension.swift
//  GameFinder
//
//  Created by Prasetya on 22/05/23.
//

import Combine
import Foundation

func createPublisher<T>(execute: @escaping () async throws -> T) -> AnyPublisher<T, Error> {
    Deferred {
        Future { promise in
            Task {
                do {
                    let result = try await execute()
                    promise(.success(result))
                } catch {
                    promise(.failure(error))
                }
            }
        }
    }
    .eraseToAnyPublisher()
}
