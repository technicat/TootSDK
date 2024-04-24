Differences from the parent repo

## Platform

- Added Platform as a replacement for TootFeature and (eventually/potentially) TootSDKFlavour
- Removed TootFeature
- Removed flavour checks (let callers do the checking) and flavour-specific lists (provided in Platform)

## TootClient

- Added TootClient extensions to operate on objects instead of ids, take invidual parameters instead of param structs
- TootClient.connect() returns the retrieved instance

## HTTP
- For HTTP requests with no body, set content-type to nil and if no body, content-length to 0 (previously just for sharkey)
- Removed extra setting of content-type to application/json (should happen appropriately when query is created)

## ScheduledPost

- Added ScheduledPost.Params so ScheduledPostParams can be used solely for requests, no longer need to translate to ScheduledPostRequest
- Handle nil/missing ScheduledPost.mediaAttachments from Pleroma/Akkoma
- Removed throws for missing date (no longer optional in ScheduledPostParams) and scheduled too soon (handle enforcement at the calling level)
- Updating a ScheduledPost no longer returns an optional

## Misc

- Moved HTML rendering code (and SwiftSoup dependency) to the demo where it is used
- Various TootSDK extensions with convenience accessors, e.g. Post.isBoosted
- Remove unused TootSDKError enums


