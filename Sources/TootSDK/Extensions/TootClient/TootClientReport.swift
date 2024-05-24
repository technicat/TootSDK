extension TootClient {

    public func report(
        _ account: Account,
        comment: String?,
        forward: Bool?,
        category: ReportCategory,
        posts: [Post] = [],
        rules: [InstanceRule] = []
    ) async throws {
        let params = ReportParams(
            accountId: account.id,
            category: category,
            postIds: posts.map { $0.id },
            comment: comment,
            forward: forward,
            ruleIds: category == .violation ? rules.map { Int($0.id) ?? 0 } : [])
        try await report(params)
    }

    public func reportPixelfed(
        _ account: Account,
        comment: String?,
        category: ReportCategory
    ) async throws {
        let params = ReportParamsPixelfed(
            objectType: .user,
            objectId: account.id,
            type: category,
            msg: comment
        )
        try await report(params)
    }

    public func reportPixelfed(
        _ post: Post,
        comment: String?,
        category: ReportCategory
    ) async throws {
        let params = ReportParamsPixelfed(
            objectType: .post,
            objectId: post.id,
            type: category,
            msg: comment
        )
        try await report(params)
    }
}
