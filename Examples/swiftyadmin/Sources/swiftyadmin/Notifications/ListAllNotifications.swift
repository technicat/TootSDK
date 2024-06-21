import ArgumentParser
import Foundation
import TootSDK

struct ListAllNotifications: AsyncParsableCommand {

    @OptionGroup var auth: AuthOptions
    @Option var types: [NotificationType] = [.mention]
    @Option var excludeTypes: [NotificationType] = []

    mutating func run() async throws {
        let client = TootClient(instanceURL: auth.url, accessToken: auth.token)

        var pagedInfo: PagedInfo? = nil
        var hasMore = true
        let query = TootNotificationParams(excludeTypes: excludeTypes, types: types)
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long

        while hasMore {
            let page = try await client.getNotifications(params: query, pagedInfo)
            print("=== page ===")
            for notification in page.result {
                print(
                    notification.id + ", " + notification.type.rawValue + ", "
                        + dateFormatter.string(from: notification.createdAt))
            }
            hasMore = page.hasPrevious
            pagedInfo = page.previousPage
        }

    }
}

extension NotificationType: ExpressibleByArgument {
    public init?(argument: String) {
        self.init(rawValue: argument)
    }
}
