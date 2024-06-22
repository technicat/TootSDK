import Foundation

/// https://www.iana.org/assignments/media-types/media-types.xhtml
public enum MIMEType: String, CaseIterable, Codable, Sendable {
    // image mime types supported by fediverse platformsmastodon for attachments
    // (media_attachment.rb)
    case applicationOgg = "application/ogg"
    case audio3gpp = "audio/3gpp"
    case audioAac = "audio/aac"
    case audioFlac = "audio/flac"
    case audioM4a = "audio/m4a"
    case audioMp3 = "audio/mp3"
    case audioMpeg = "audio/mpeg"
    case audioOgg = "audio/ogg"
    case audioOpus = "audio/opus"
    case audioWave = "audio/wave"
    case audioWav = "audio/wav"
    case audioWebm = "audio/webm"
    case audioXm4a = "audio/x-m4a"
    case audioXwav = "audio/x-wav"
    case audioXpnwav = "audio/x-pn-wav"
    case audioVndwav = "audio/vnd.wav"
    case audioVorbis = "audio/vorbis"
    case imageAces = "image/aces"
    case imageApng = "image/apng"
    case imageAcvi = "image/acvi"
    case imageAvif = "image/avif"
    case imageBmp = "image/bmp"
    case imageCgm = "image/cgm"
    case imageDicomrle = "image/dicom-rle"
    case imageDpx = "image/dpx"
    case imageEmf = "image/emf"
    case imageGif = "image/gif"
    case imageHeic = "image/heic"
    case imageHeif = "image/heif"
    case imageJpeg = "image/jpeg"
    case imagePng = "image/png"
    case imageTiff = "image/tiff"
    case imageWebp = "image/webp"
    case imageXicon = "image/x-icon"
    case videoMp4 = "video/mp4"
    case videoOgg = "video/ogg"
    case videoQuicktime = "video/quicktime"
    case videoWebm = "video/webm"
    case videoXmsasf = "video/x-ms-asf"
}
