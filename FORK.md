## Platform

- Added Platform as a replacement for TootFeature and (eventually/potentially) TootSDKFlavour

## TootClient

- Added TootClient extensions to operate on objects instead of ids
- TootClient.connect() returns the retrieved instance
- For HTTP requests with no body, set content-type to nil and if no body, content-length to 0 (previously just for sharkey)
- Removed extra setting of content-type to application/json (should happen appropriately when query is created)
- Removed unsupported flavour checks (handle this at the calling level via Platform)

## ScheduledPost

- Added ScheduledPost.Params so ScheduledPostParams can be used solely for requests, no longer need to translate to ScheduledPostRequest
- Handle nil/missing ScheduledPost.mediaAttachments from Pleroma/Akkoma
- Removed throws for missing date (no longer optional in ScheduledPostParams) and scheduled too soon (handle enforcement at the calling level)

## Notifications

- Removed flavour-specific notification types (now in Platform)

## Misc

- Moved HTML rendering code (and SwiftSoup dependency) to the demo where it is used
- Various TootSDK extensions with convenience accessors, e.g. Post.isBoosted


