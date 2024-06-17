import Foundation

extension Tag {

    public var hasHistory: Bool {
        guard let history else {
            return false
        }
        return !history.isEmpty
    }

    public var uses: Int {
        guard let history else {
            return 0
        }
        return history.reduce(
            0,
            { x, y in
                x + y.uses
            })
    }

    public var accounts: Int {
        guard let history else {
            return 0
        }
        return history.reduce(
            0,
            { x, y in
                x + y.accounts
            })
    }
}
