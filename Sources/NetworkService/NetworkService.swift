// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

@available(iOS 13.0.0, *)
public final class NetworkService {
    public static let shared = NetworkService()
    
    public init() {}
    
    public func getData<T: Decodable>(fromUrl: String) async throws -> T? {
        if let url = URL(string: fromUrl) {
            var request = URLRequest(url: url)
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decoder = JSONDecoder()
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        }
        
        return nil
    }
}
