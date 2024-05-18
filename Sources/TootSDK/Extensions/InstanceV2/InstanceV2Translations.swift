extension InstanceV2 {

    public var hasTranslations: Bool {
        configuration?.translation?.enabled ?? false
    }

}
