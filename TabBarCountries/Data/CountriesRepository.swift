import Foundation

class CountriesRepository: CountriesRepositoryProtocol {
    
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func fetchCountries() async throws -> [Country] {
        try await networkService.fetch(endpoint: Endpoint<[CountryDTO]>.countries).map { $0.toDomain }
    }
}
