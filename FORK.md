This fork is geared toward supporting [Fedicat](https://fedicat.com) and changes daily, so expect instability and divergence from the [official branch](https://github.com/TootSDK/TootSDK). Not much effort is made to maintain the admin and demo apps. Here's a summary of the changes:

## Platform

A protocol, for use at the app level to check feature support. Should be self-contained (could be a separate package) and is optional. TootClient should be can be used with an alternate platform/feature-checking package or none.

- Implements a class hierarchy that mirrors the forking relationship among fediverse platform is provided. For example, `Hometown` is a subclass of `Mastodon`, which is a subclass of `MastodonAPI`. `Platform` exposes feature support queries like `supportsProfileFields`.

- The appropriate platform can be derived via `instance.platform` (either InstanceV1 or InstanceV2) and probably eventually `nodeinfo`.

## TootExt

A layer of TootClient extensions that provides a more convenient interface to the app, also could be a separate package.


- Operates on TootSDK objects instead of ids (e.g. `client.boost(post)` instead of `client.boostPost(id: post.id)`) and takes individual parameters instead of param structs.

- Enums, like `ISOCode` enum listing the language codes supported by the various platforms, instead of passing strings, e.g. `client.getTranslation(of: post, in: .en)`.

- Protocols that specify common interfaces among TootSDK objects, e.g. `InstanceV1` and `InstanceV2` implement `Instance`.

## TootSDK

### Account

- `avatar` is optional to accomodate Mitra (when user hasn't selected an avatar)
- `header` is optional to accomodate Pixelfed (sometimes stubbed, sometimes nil)
- `postsCount` is optional to accomodate Firefish (nil in boosts)

### Admin Functions

In-progress

### Instance

- Retrieve with `getInstance` instead of `getInstanceInfo`
- Add `InstanceV2` (and `getInstanceV2`)
- Rename `Instance` to `InstanceV1`
` Define `Instance` as a protocol featuring the commonality between `InstanceV1` and `InstanceV2`
- Moved `Configuration` up so it  an be shared among the two instance versions
- `InstanceRule` text is not optional

### Notifications

- `TootClient.getNotifications()` takes an optional with `include_types` parameter, corresponding to the ones supported by Pleroma/Akkoma, but just specifying `types` (flavour-specific handling of arguments is removed) seems to work for all platforms that filter (except friendica which only filter using `exclude_types`, but that seems buggy, e.g. doesn't filter out reblog, so better to not filter in that case).
- Added Mitra notification types

### Post

- Changed `deletePost` to `deletePostAndEdit` (to indicate its returning a Post for editing after the deletion) and add a deletePost with no return value to accomodate those platforms that don't return a Post (friendica, mitra, sharkey, firefox, and very old Mastodon).
- Changed the form type in `publishPost` and `editPost` to `application/json` instead of `multipart/form-data` to accomodate Mitra and Sharkey.
- Moved Pixelfed-specific behavior in `updateCredentials` to a version that takes `PixelfedUpdateCredentialsParams`.
- Added `local` visibility for Pleroma and Akkoma.
- Added `mutualsOnly` visibility for GotoSocial.

### PostEdit

- Replaced `poll` property with a simplified PostEdit.Poll struct matching the API spec, i.e. only containing poll option titles. Fixes a decoding error trying to read Poll.id.

### Preferences

- Added `TootClient.getPreferences()`

### ScheduledPost

- Added `ScheduledPost.Params` so `ScheduledPostParams` can be used solely for requests, no longer need to translate to `ScheduledPostRequest`
- Handle nil/missing `ScheduledPost.mediaAttachments` from Pleroma/Akkoma
- Removed throws for missing date (no longer optional in `ScheduledPostParams`) and scheduled too soon (handle enforcement at the calling level)
- Updating a `ScheduledPost` no longer returns an optional

### Relationship

- `blocking` is optional to accomodate Mitra (now updated to set blocking always to false), but this is consistent with all the other optionals in `Relationship`, anyway.
- Pleroma follow by URI moved to a separate file (also renamed and takes a param struct)
- `followAccountURI` moved to `Extensions` and renamed, along with a convenience function `pleromaLookupAccount`.
- `lookupAccount` moved to `TootClient+Account.swift`

### Report

- Reporting accounts/posts on Pixelfed is moved to a separate function that takes `PixelfedReportParams`
- Filled in remaining `Report` fields added with Mastodon 4.0

### Timeline

- Add `direct` timeline for Mitra, Pleroma, and Akkoma

### TootSDKFeature/Flavour

- Removed. Use Platform or something else nothing.

### HTTP
- For HTTP requests with no body, set content-type to nil and if no body, content-length to 0 (previously just for sharkey)
- Removed extra setting of content-type to `application/json` (should happen appropriately when query is created)

## Project

General cleanup and reorg

### Tests (not tests)
- Added instance and translation decoder tests
- Removed obsolete tests


### Code

- Moved HTML rendering code (and SwiftSoup dependency) to the demo where it is used
- Removed unused TootSDKError enums
- Remove deprecated code (not trying to support anyone)
- Misc code and comment cleanup
- Decoders should first match the spec, then add optionals as necessary, try to avoid try? or at least comment what error it's covering up
- Add spec links to API functions and entities for convenient reference
- Tempted to remove public inits for JSON entities (would remove a big chunk of code) but I do have a Post copy in fedicat so guess I'll leave it alone
- Move nested enums up to top level
- Rename `status` to `post`


