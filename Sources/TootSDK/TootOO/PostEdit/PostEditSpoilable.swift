extension PostEdit: Spoilable {

    public var spoiler: String? {
        spoilerText.notBlank
    }
}
