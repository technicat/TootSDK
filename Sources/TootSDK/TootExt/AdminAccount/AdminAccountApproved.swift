extension AdminAccount {
    
    public var isApproved: Bool {
        approved ?? false
    }
    
    public var isConfirmed: Bool {
        confirmed ?? false
    }
}
