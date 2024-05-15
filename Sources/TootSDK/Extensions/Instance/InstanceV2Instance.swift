extension InstanceV2: Instance {
    public var header: String? {
        thumbnail?.url
    }

    public var streaming: String? {
        configuration?.urls?.streaming
    }

}
