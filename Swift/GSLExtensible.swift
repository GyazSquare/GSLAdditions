//
//  GSLExtensible.swift
//  GSLAdditions
//

public struct GSLExtension<T> {
    // MARK: - Properties

    let target: T

    // MARK: - Initializers

    init(_ target: T) {
        self.target = target
    }
}
