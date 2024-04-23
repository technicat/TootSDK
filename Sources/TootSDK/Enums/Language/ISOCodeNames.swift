// Locale.current.localizedString(forLanguageCode) doesn't work for everything
extension ISOCode {

    public static var names: [ISOCode: String] = [
        .aa: "Afar",
        .ab: "Abkhazian",
        .ak: "Akan",
        .ae: "Avestan",
        .af: "Afrikaans",
        .am: "Amharic",
        .an: "Aragonese",
        .ar: "Arabic",
        .as: "Assamese",
        .av: "Avaric",
        .ay: "Aymara",
        .az: "Azerbaijani",
        .ba: "Bashkir",
        .be: "Belarussian",
        .bg: "Bulgarian",
        .bh: "Bihari",
        .bi: "Bislama",
        .bm: "Bambara",
        .bn: "Bengali",
        .bo: "Tibetan",
        .br: "Breton",
        .bs: "Bosnian",
        .ca: "Catalan",
        .ce: "Chechen",
        .ch: "Chamorro",
        .co: "Corsican",
        .cr: "Cree",
        .cs: "Czech",
        .cu: "Church Slavonic",
        .cv: "Chuvash",
        .cy: "Welsh",
        .da: "Danish",
        .de: "German",
        .dv: "Divehi",
        .dz: "Dhonkha",
        .ee: "Ewe",
        .en: "English",
        .eo: "Esperanto",
        .el: "Greek",
        .es: "Spanish",
        .et: "Estonian",
        .eu: "Basque",
        .fa: "Persian",
        .ff: "Fulah",
        .fi: "Finnish",
        .fj: "Fijian",
        .fo: "Faroese",
        .fr: "French",
        .fy: "Western Frisian",
        .ga: "Irish",
        .gd: "Gaelic",
        .gl: "Galician",
        .gn: "Guarani",
        .gu: "Gujarati",
        .gv: "Manx",
        .ha: "Hausa",
        .he: "Hebrew",
        .hi: "Hindi",
        .ho: "Hiri Moto",
        .hr: "Croation",
        .ht: "Haitian",
        .hu: "Hungarian",
        .hy: "Armenian",
        .hz: "Herero",
        .ia: "Interlingua",
        .id: "Indonesian",
        .ie: "Interlingue",
        .ig: "Igbo",
        .ii: "Sichuan Yi",
        .io: "Ido",
        .ik: "Inupkiak",
        .is: "Icelandic",
        .it: "Italian",
        .iu: "Inuktitut",
        .ja: "Japanese",
        .jv: "Javanese",
        .ka: "Georgian",
        .kg: "Kongo",
        .ki: "Kikuyu",
        .kk: "Kazakh",
        .kj: "Kuanyama",
        .kl: "Kalallisut",
        .km: "Central Khmer",
        .kn: "Kannada",
        .ko: "Korean",
        .kr: "Kanuri",
        .ks: "Kashmiri",
        .ku: "Kurdish",
        .kv: "Komi",
        .kw: "Cornish",
        .ky: "Kirghiz",
        .la: "Latin",
        .lb: "Luxembourgish",
        .lg: "Ganda",
        .li: "Limburgan",
        .ln: "Lingala",
        .lo: "Lao",
        .lt: "Lithuanian",
        .lu: "Luba-Katanga",
        .lv: "Latvian",
        .mg: "Malagasy",
        .mh: "Marshallese",
        .mk: "Macedonian",
        .mi: "Maori",
        .ml: "Malayalam",
        .mn: "Mongolese",
        .mr: "Marathi",
        .ms: "Malay",
        .mt: "Maltese",
        .my: "Burmese",
        .na: "Naurese",
        .nb: "Norwegian Bokmål",
        .nd: "North Ndebele",
        .ne: "Nepali",
        .ng: "Ndonga",
        .nl: "Dutch",
        .nn: "Norwegian Nyorsk",
        .no: "Norwegian",
        .nr: "South Ndebele",
        .nv: "Navajo",
        .ny: "Chichewa",
        .oc: "Occitan",
        .oj: "Ojibwa",
        .om: "Oromo",
        .or: "Orija",
        .os: "Ossetian",
        .pa: "Punjabi",
        .pi: "Pali",
        .pl: "Polish",
        .ps: "Pashto",
        .pt: "Portuguese",
        .qu: "Quecha",
        .rm: "Romansch",
        .rn: "Rundi",
        .ro: "Romanian",
        .ru: "Russian",
        .rw: "Kinyarwanda",
        .sa: "Sanskrit",
        .sc: "Sardinian",
        .sd: "Sindhi",
        .se: "Northern Sami",
        .sg: "Sango",
        .si: "Sinhala",
        .sk: "Slovak",
        .sl: "Slovenian",
        .sm: "Samoan",
        .sn: "Shona",
        .so: "Somali",
        .sq: "Albanian",
        .sr: "Serbian",
        .ss: "Swati",
        .st: "Southern Soho",
        .su: "Sundanese",
        .sv: "Swedish",
        .sw: "Swahili",
        .ta: "Tamil",
        .te: "Telugu",
        .tg: "Tajik",
        .th: "Thai",
        .ti: "Tigrinya",
        .tl: "Tagalog",
        .tk: "Turkmen",
        .tn: "Tswana",
        .to: "Tonga",
        .tr: "Turkish",
        .ts: "Tsonga",
        .tt: "Tatar",
        .ty: "Tahitian",
        .tw: "Twi",
        .ug: "Uighur",
        .uk: "Ukrainian",
        .ur: "Urdu",
        .uz: "Uzbek",
        .ve: "Venda",
        .vi: "Vietnamese",
        .vo: "Volapük",
        .wa: "Walloon",
        .wo: "Wolof",
        .xh: "Xhosa",
        .yi: "Yiddish",
        .yo: "Yoruba",
        .za: "Zhuan",
        .zh: "Chinese",
        .zu: "Zulu",
        .ast: "Asturian",
        .chr: "Cherokee",
        .ckb: "Sorani (Kurdish)",
        .cnr: "Montenegrin",
        .jbo: "Lojban",
        .kab: "Kabyle",
        .kmr: "Kurmanji (Kurdish)",
        .ldn: "Láadan",
        .lfn: "Lingua Franca Nova",
        .moh: "Mohawk",
        .nds: "Low German",
        .pdc: "Pennsylvania Dutch",
        .sco: "Scots",
        .sma: "Southern Sami",
        .smj: "Lule Sami",
        .szl: "Silesian",
        .tai: "Tai",
        .tok: "Toki Pona",
        .vai: "Vai",
        .xal: "Kalmyk",
        .zba: "Balaibalan",
        .zgh: "Standard Moroccan Tamazight",
        .zhCN: "Chinese (China)",
        .zhHK: "Chinese (Hong Kong)",
        .zhTW: "Chinese (Taiwan)",
        .zhYUE: "Cantonese",
        .und: "unknown",
    ]
}
