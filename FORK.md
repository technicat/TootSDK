This fork is geared toward supporting Fedicat, so expect instability and divergence from the [official branch](https://github.com/TootSDK/TootSDK). These are the changes:

## Platform

- `instance.platform` returns a Platform descriptor with feature support queries like `platform.supportsAnnouncements` based on the detected Mastodon API version. This avoids having to query `TootClient.flavour` and `TootClient.supportsFeature`, and new platforms can be added without modifying TootFeature lists. The descriptors have inheritance hierarchies that mirror forking relationships, e.g. `Hometown` is a subclass of `Mastodon`. Ideally the platform determination should also check nodeinfo and instance v2.
- Removed TootFeature
- Remove flavour checks within TootClient (in progress). Idea is to let callers do the checking and provide platform-specific alternative calls and additional enums where appropriate.

## TootClient extensions

- Added TootClient extensions to operate on objects instead of ids, take individual parameters instead of param structs
- An object-oriented interface so you operate on objects instead of IDs, e.g. `client.boost(post)` instead of `client.boostPost(id: post.id)`.
- Predicates like `post.isBoosted` instead of `post.boost ?? false` (not necessarily correct, sometimes a platform will just choose not to supply a value in certain contexts).
- Common operation names on different types, e.g. `client.refresh(post)` and `client.refresh(account)`, `client.follow(tag)` and `client.follow(account)`, `client.delete(post)` and `client.delete(filter)`...
- Simplified arguments, try to accomodate most common cases and avoid having to fill out parameter structs, e.g. call `client.updateProfile()`, `client.updateAccountSettings()`, and `client.updatePostDefaults()` with the relevant individual parameters instead of calling `client.updateCredentials` with a filled-out parameter struct.
- `fave` instead of `favourite` (avoids British vs. American spelling and it's shorter) e.g. `client.fave(post)`, `client.unFave(post)`, and `post.isFaved`.
- An `ISOCode` enum listing the language codes supported by the various platforms instead of passing strings, e.g. `client.getTranslation(of: post, in: .en)`.
- `client.getInstance()` is a more precise name than `client.getInstanceInfo()` and it ensures that `client.flavour` is updated.
- Define common interfaces among objects
- Random other conveniences.

## HTTP
- For HTTP requests with no body, set content-type to nil and if no body, content-length to 0 (previously just for sharkey)
- Removed extra setting of content-type to application/json (should happen appropriately when query is created)

## Post

- Change deletePost to deletePostAndEdit (to indicate its returning a Post for editing after the deletion) and add a deletePost with no return value to accomodate those platforms that don't return a Post (friendica, mitra, sharkey, firefox, and very old Mastodon).
- Change the form type in publishPost and editPost to application/json instead of multipart/form-data to accomodate Mitra and Sharkey.

## ScheduledPost

- Added ScheduledPost.Params so ScheduledPostParams can be used solely for requests, no longer need to translate to ScheduledPostRequest
- Handle nil/missing ScheduledPost.mediaAttachments from Pleroma/Akkoma
- Removed throws for missing date (no longer optional in ScheduledPostParams) and scheduled too soon (handle enforcement at the calling level)
- Updating a ScheduledPost no longer returns an optional

## PostEdit

- Replaced poll property with a simplified PostEdit.Poll struct matching the API spec, i.e. only containing poll option titles. Fixes a decoding error trying to read Poll.id.

## Timeline

- Add direct timeline for Mitra

## Cleanup

- Moved HTML rendering code (and SwiftSoup dependency) to the demo where it is used
- Remove unused TootSDKError enums


