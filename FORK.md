This fork is geared toward supporting [Fedicat](https://fedicat.com), so expect instability and divergence from the [official branch](https://github.com/TootSDK/TootSDK). Not much effort is made to maintain the admin and demo apps. Here's a summary of the changes:

## Platform, Features, and Flavours

- Removed `TootFeature` and `TootSDKFlavour`. Platform determination has to be made at the UI level to expose the appropriate options, anyway, so do all the platform branching outside of TootSDK.
- A `Platform` protocol and an implementing class hierarchy that mirrors the forking relationship among fediverse platform is provided. For example, `Hometown` is a subclass of `Mastodon`, which is a subclass of `MastodonAPI`. `Platform` exposes feature support queries like `supportsProfileFields`.
- The appropriate platform is derived via `instance.platform` but ideally the should also check nodeinfo and instance v2.

## TootClient extensions

- Added TootClient extensions to operate on objects instead of ids, take individual parameters instead of param structs
- An object-oriented interface so you operate on objects instead of IDs, e.g. `client.boost(post)` instead of `client.boostPost(id: post.id)`.
- Predicates like `post.isBoosted` instead of `post.boost ?? false` (not necessarily correct, sometimes a platform will just choose not to supply a value in certain contexts).
- Common operation names on different types, e.g. `client.refresh(post)` and `client.refresh(account)`, `client.follow(tag)` and `client.follow(account)`, `client.delete(post)` and `client.delete(filter)`...
- Simplified arguments, try to accomodate most common cases and avoid having to fill out parameter structs, e.g. call `client.updateProfile()`, `client.updateAccountSettings()`, and `client.updatePostDefaults()` with the relevant individual parameters instead of calling `client.updateCredentials` with a filled-out parameter struct.
- `fave` instead of `favourite` (avoids British vs. American spelling and it's shorter) e.g. `client.fave(post)`, `client.unFave(post)`, and `post.isFaved`.
- An `ISOCode` enum listing the language codes supported by the various platforms instead of passing strings, e.g. `client.getTranslation(of: post, in: .en)`.
- Functions composed of a sequence of queries, e.g. `followAccount(uri:)` calls `lookupAccount` and then `follow(account)`
- Define common interfaces among objects
- Random other conveniences.

## HTTP
- For HTTP requests with no body, set content-type to nil and if no body, content-length to 0 (previously just for sharkey)
- Removed extra setting of content-type to `application/json` (should happen appropriately when query is created)

## Instance

- Retrieve with `getInstance` instead of `getInstanceInfo`

## Post

- Changed `deletePost` to `deletePostAndEdit` (to indicate its returning a Post for editing after the deletion) and add a deletePost with no return value to accomodate those platforms that don't return a Post (friendica, mitra, sharkey, firefox, and very old Mastodon).
- Changed the form type in `publishPost` and `editPost` to `application/json` instead of `multipart/form-data` to accomodate Mitra and Sharkey.
- Moved Pixelfed-specific behavior in `updateCredentials` to a version that takes `PixelfedUpdateCredentialsParams`.
- Added `local` visibility for Pleroma and Akkoma.

## ScheduledPost

- Added `ScheduledPost.Params` so `ScheduledPostParams` can be used solely for requests, no longer need to translate to `ScheduledPostRequest`
- Handle nil/missing `ScheduledPost.mediaAttachments` from Pleroma/Akkoma
- Removed throws for missing date (no longer optional in `ScheduledPostParams`) and scheduled too soon (handle enforcement at the calling level)
- Updating a `ScheduledPost` no longer returns an optional

## PostEdit

- Replaced `poll` property with a simplified PostEdit.Poll struct matching the API spec, i.e. only containing poll option titles. Fixes a decoding error trying to read Poll.id.

## Account

- `avatar` is optional to accomodate Mitra (when user hasn't selected an avatar)
- `header` is optional to accomodate Pixelfed (sometimes stubbed, sometimes nil)
- `postsCount` is optional to accomodate Firefish (nil in boosts)

## Relationship

- `blocking` is optional to accomodate Mitra (now updated to set blocking always to false), but this is consistent with all the other optionals in `Relationship`, anyway.
- Pleroma follow by URI moved to a separate file (also renamed and takes a param struct)
- `followAccountURI` moved to `Extensions` and renamed, along with a convenience function `pleromaLookupAccount`.
- `lookupAccount` moved to `TootClient+Account.swift`

## Reports

- Reporting accounts/posts on Pixelfed is moved to a separate function that takes `PixelfedReportParams`

## Timeline

- Add `direct` timeline for Mitra, Pleroma, and Akkoma

## Notifications

- `TootClient.getNotifications()` takes an optional with `include_types` parameter, corresponding to the ones supported by Pleroma/Akkoma, but just specifying `types` (flavour-specific handling of arguments is removed) seems to work for all platforms that filter (except friendica which only filter using `exclude_types`, but that seems buggy, e.g. doesn't filter out reblog, so better to not filter in that case).

## Cleanup

- Moved HTML rendering code (and SwiftSoup dependency) to the demo where it is used
- Removed unused TootSDKError enums
- Removed obsolete tests
- Remove deprecated code (not trying to support anyone)
- Misc code and comment cleanup
- Decoders should first match the spec, then add optionals as necessary, try to avoid try? or at least comment what error it's covering up
- Add spec links to API functions and entities for convenient reference


