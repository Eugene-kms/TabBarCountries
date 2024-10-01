import Foundation

extension Endpoint {
    static var countries: Endpoint<[CountryDTO]> {
        Endpoint<[CountryDTO]>(pain: "v3.1/all")
    }
}
