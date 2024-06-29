/// https://github.com/friendica/friendica/blob/2024.06-rc/doc/API-Mastodon.md
open class Friendica: MastoAPI {

    open override var name: String { "Friendica" }

    open override var supportsPostDeleteAndEdit: Bool { false }
    open override var supportsFeaturedTags: Bool { false }
    // open override var supportsFollowTag: Bool { true }
    open override var supportsMuteNotifications: Bool { false }
    open override var supportsInstanceActivity: Bool { false }
    open override var supportsInstanceV2: Bool { true}
    // does not support voting on polls
    open override var supportsPollVote: Bool { false }
    open override var supportsProfileFields: Bool { false }
    open override var supportsScheduleUpdate: Bool { false }
    open override var supportsUpdateAccount: Bool { false }

    // lists
    // all the two-letter codes
    open override var languages: ISOCodes {
        [
            .aa, .ab, .ae, .af, .ak, .am, .an, .ar, .as, .av, .ay, .az,
            .ba, .be, .bg, .bh, .bi, .bm, .bn, .bo, .br, .bs,
            .ca, .ce, .ch, .co, .cr, .cs, .cu, .cv, .cy,
            .da, .de, .dv, .dz,
            .ee, .el, .en, .eo, .es, .et, .eu,
            .fa, .fi, .ff, .fj, .fo, .fr, .fy,
            .ga, .gd, .gl, .gn, .gu, .gv,
            .ha, .he, .hi, .ho, .hr, .hu, .ht, .hy, .hz,
            .ia, .id, .ie, .ig, .ii, .ik, .io, .is, .it, .iu,
            .ja, .jv,
            .ka, .kg, .ki, .kj, .kk, .kl, .km, .kn, .ko, .kr, .ks, .ku, .kv, .kw, .ky,
            .la, .lb, .lg, .li, .ln, .lo, .lt, .lu, .lv,
            .mg, .mh, .mi, .mk, .ml, .mn, .mr, .ms, .mt, .my,
            .na, .nb, .nd, .ne, .ng, .nl, .nn, .no, .nr, .nv, .ny,
            .oc, .oj, .om, .or, .os,
            .pa, .pi, .pl, .ps, .pt,
            .qu,
            .rm, .rn, .ro, .ru, .rw,
            .sa, .sc, .sd, .se, .sg, .si, .sk, .sl, .sm, .sn, .so, .sq, .sr, .ss, .st, .su, .sv, .sw,
            .ta, .te, .tg, .th, .ti, .tl, .tk, .tn, .to, .tr, .ts, .tt, .tw, .ty,
            .ug, .uk, .ur, .uz,
            .ve, .vi, .vo,
            .wa, .wo,
            .xh,
            .yi, .yo,
            .za, .zh, .zu,
        ]
    }

    open override var notificationTypes: NotificationTypes {
        // setting this to empty (unsupported)
        // because excluded_types doesn't properly exclude reblogs
        return [
            // .follow, .mention, .repost, .favourite, .poll, .followRequest, .post, .update,
        ]
    }

    // limits
    // domain blocking not supported
    open override var blockedDomainsLimit: Int { 0 }
    // tag following supported
    open override var followedTagsPageLimit: Int { 200 }  // check this

    open override func getLimit(for timeline: Timeline, _ auth: Bool) -> Int {
        switch timeline {
        case .bookmarks: return 40  // todo - check this
        default: return super.getLimit(for: timeline, auth)
        }
    }

}
