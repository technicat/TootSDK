/// https://docs.akkoma.dev/stable/development/API/differences_in_mastoapi_responses/
open class Akkoma: Pleroma {

    open override var name: String { "Akkoma" }
    
    // limits
    
    /// timelines
    open override func getLimit(for timeline: Timeline) -> Int {
        switch timeline {
        case .bubble: return 40 // todo - check this number
        default: return super.getLimit(for: timeline)
        }
    }
    
    // lists

    // all the two-letter codes
    // todo - check version 2023.02
    open override var languages: [ISOCode] {
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
}
