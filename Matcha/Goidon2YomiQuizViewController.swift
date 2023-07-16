//
//  Goidon2YomiQuizViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/07/14.
//

import UIKit

class Goidon2YomiQuizViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var greenView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleShadowLabel: UILabel!
    @IBOutlet var chapterLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var kanjiLabel: UILabel!
    @IBOutlet var checkmarkImageView: UIImageView!
    @IBOutlet var goodjobLabel: UILabel!
    @IBOutlet var relearnImageView: UIImageView!
    @IBOutlet var kotaeLabel: UILabel!
    
    var CHAPTER: Int = 0
    var GOIDON2: Int = 0
    
    //語彙ドン！vol.2
    var goidon2L1aarray = [
        ["hiragana":"がくしゅうする","kanji":"学習する","meaning":"to learn; to study"],
        ["hiragana":"わくぐみ","kanji":"枠組み","meaning":"framework; structure"],
        ["hiragana":"とうごう","kanji":"統合","meaning":"integration; consolidation"],
        ["hiragana":"じじつ","kanji":"事実","meaning":"fact"],
        ["hiragana":"しんり","kanji":"心理","meaning":"psychology; mental"],
        ["hiragana":"ろん","kanji":"論","meaning":"theory; argument"],
        ["hiragana":"はっけんする","kanji":"発見する","meaning":"to discover; to find"],
        ["hiragana":"ないぶ","kanji":"内部","meaning":"internal; inside"],
        ["hiragana":"きょうどう","kanji":"共同","meaning":"joint; collaborative"],
        ["hiragana":"ろんぶん","kanji":"論文","meaning":"research paper; academic article"]
    ]
    var goidon2L1barray = [
        ["hiragana":"しっかん","kanji":"疾患","meaning":"disease; disorder"],
        ["hiragana":"いんが","kanji":"因果","meaning":"cause and effect; causal"],
        ["hiragana":"きげん","kanji":"起源","meaning":"origin; source"],
        ["hiragana":"ぜん","kanji":"全–","meaning":"whole; entire"],
        ["hiragana":"たい","kanji":"–対／対–","meaning":"versus; against"],
        ["hiragana":"ゆうする","kanji":"有する","meaning":"to have; to possess"],
        ["hiragana":"めかにずむ","kanji":"メカニズム","meaning":"mechanism; process"],
        ["hiragana":"たいおうする","kanji":"対応する","meaning":"to correspond; to respond to"],
        ["hiragana":"じょきょする","kanji":"除去する","meaning":"to remove; to eliminate"],
        ["hiragana":"そうていする","kanji":"想定する","meaning":"to assume; to suppose"]
    ]
    var goidon2L1carray = [
        ["hiragana":"かかわり","kanji":"関わり","meaning":"relation; involvement"],
        ["hiragana":"さんかする","kanji":"参加する","meaning":"to participate; to join"],
        ["hiragana":"しゅっぱんする","kanji":"出版する","meaning":"to publish"],
        ["hiragana":"たいけんする","kanji":"体験する","meaning":"to experience; to undergo"],
        ["hiragana":"とおす","kanji":"通す","meaning":"to go through; to pass"],
        ["hiragana":"たんとうする","kanji":"担当する","meaning":"to be in charge of; to take responsibility for"],
        ["hiragana":"じゅうしする","kanji":"重視する","meaning":"to emphasize; to prioritize"],
        ["hiragana":"きかん","kanji":"期間","meaning":"period; duration"],
        ["hiragana":"じつげんする","kanji":"実現する","meaning":"to achieve; to realize"],
        ["hiragana":"せいか","kanji":"成果","meaning":"result; outcome"],
        ["hiragana":"かかわり","kanji":"関わり","meaning":"relation; involvement"]
    ]
    var goidon2L2aarray = [
        ["hiragana": "こべつ", "kanji": "個別", "meaning": "individual; specific"],
        ["hiragana": "こうかんする", "kanji": "交換する", "meaning": "to exchange; to swap"],
        ["hiragana": "かしょ", "kanji": "箇所", "meaning": "place; location; spot"],
        ["hiragana": "ないし", "kanji": "ないし", "meaning": "or; alternatively"],
        ["hiragana": "さいしゅう", "kanji": "最終", "meaning": "final; ultimate"],
        ["hiragana": "ぞう", "kanji": "像", "meaning": "image; figure"],
        ["hiragana": "ほごする", "kanji": "保護する", "meaning": "to protect; to safeguard"],
        ["hiragana": "りねん", "kanji": "理念", "meaning": "ideology; principle"],
        ["hiragana": "たいせい", "kanji": "体制", "meaning": "system; structure"],
        ["hiragana": "びょうどう", "kanji": "平等", "meaning": "equality; equal"]
    ]
    
    var goidon2L2barray = [
        ["hiragana":"げんかい","kanji":"限界","meaning":"limit; boundary"],
        ["hiragana":"はいじょする","kanji":"排除する","meaning":"to exclude; to eliminate"],
        ["hiragana":"たいさく","kanji":"対策","meaning":"countermeasure; precaution"],
        ["hiragana":"けんせつする","kanji":"建設する","meaning":"to build; to construct"],
        ["hiragana":"へんこうする","kanji":"変更する","meaning":"to change; to modify"],
        ["hiragana":"じゅうみん","kanji":"住民","meaning":"resident; citizen; inhabitants"],
        ["hiragana":"ほぞんする","kanji":"保存する","meaning":"to preserve; to save"],
        ["hiragana":"けいしき","kanji":"形式","meaning":"form; format"],
        ["hiragana":"ゆうせんする","kanji":"優先する","meaning":"to prioritize; to give priority to"],
        ["hiragana":"じっしつ","kanji":"実質","meaning":"substance; essence"]
    ]
    
    var goidon2L2carray = [
        ["hiragana":"さだめる","kanji":"定める","meaning":"to establish; to determine"],
        ["hiragana":"きじゅん","kanji":"基準","meaning":"standard; criterion"],
        ["hiragana":"たっする","kanji":"達する","meaning":"to reach; to achieve"],
        ["hiragana":"さい–","kanji":"再–","meaning":"re-; again"],
        ["hiragana":"おきかえる","kanji":"置き換える","meaning":"to replace; to substitute"],
        ["hiragana":"こくふくする","kanji":"克服する","meaning":"to overcome; to conquer"],
        ["hiragana":"じっこうする","kanji":"実行する","meaning":"to execute; to implement"],
        ["hiragana":"こう","kanji":"項","meaning":"item; term"],
        ["hiragana":"けいせいする","kanji":"形成する","meaning":"to form; to shape"],
        ["hiragana":"かいしゃくする","kanji":"解釈する","meaning":"to interpret; to understand"]
    ]
    
    var goidon2L3aarray = [
        ["hiragana":"さんしょうする","kanji":"参照する","meaning":"to refer to; to consult"],
        ["hiragana":"ぶんしょ","kanji":"文書","meaning":"document; written material"],
        ["hiragana":"みなす","kanji":"見なす","meaning":"to consider; to regard as"],
        ["hiragana":"きじゅつする","kanji":"記述する","meaning":"to describe; to write about"],
        ["hiragana":"かく–","kanji":"各–","meaning":"each; respective"],
        ["hiragana":"ひ–","kanji":"被–","meaning":"subject to; affected by"],
        ["hiragana":"すうじ","kanji":"数字","meaning":"number; numeral"],
        ["hiragana":"しょき","kanji":"初期","meaning":"initial; early"],
        ["hiragana":"および","kanji":"および","meaning":"and; as well as"],
        ["hiragana":"しゅうにゅう","kanji":"収入","meaning":"income; earnings"]
    ]
    
    var goidon2L3barray = [
        ["hiragana":"かてい","kanji":"仮定","meaning":"assumption; hypothesis"],
            ["hiragana":"かけい","kanji":"家計","meaning":"household economy; family finances"],
            ["hiragana":"きんしする","kanji":"禁止する","meaning":"to prohibit; to forbid"],
            ["hiragana":"ほうじん","kanji":"法人","meaning":"corporation; legal entity"],
            ["hiragana":"めいん","kanji":"メイン","meaning":"main; primary"],
            ["hiragana":"ぎょうむ","kanji":"業務","meaning":"business; work"],
            ["hiragana":"かいせつする","kanji":"解説する","meaning":"to explain; to comment on"],
            ["hiragana":"めいりょう","kanji":"明瞭","meaning":"clear; distinct"],
            ["hiragana":"ちょうせいする","kanji":"調整する","meaning":"to adjust; to regulate"],
            ["hiragana":"さいせいする","kanji":"再生する","meaning":"to reproduce; to regenerate"]
    ]
    
    var goidon2L3carray = [
        ["hiragana":"りてん","kanji":"利点","meaning":"advantage; benefit"],
            ["hiragana":"つうしんする","kanji":"通信する","meaning":"to communicate; to correspond"],
            ["hiragana":"せいびする","kanji":"整備する","meaning":"to maintain; to service"],
            ["hiragana":"しゅうりょうする","kanji":"終了する","meaning":"to end; to finish"],
            ["hiragana":"せいきゅうする","kanji":"請求する","meaning":"to request payment; to invoice"],
            ["hiragana":"そうごうする","kanji":"総合する","meaning":"to integrate; to consolidate"],
            ["hiragana":"たい","kanji":"対","meaning":"versus; against"],
            ["hiragana":"さだまる","kanji":"定まる","meaning":"to be determined; to be fixed"],
            ["hiragana":"きゃっかん","kanji":"客観","meaning":"objective; impartial"],
            ["hiragana":"いご","kanji":"以後","meaning":"from now on; hereafter"]
    ]
    
    var goidon2L4aarray = [
        ["hiragana": "ちく", "kanji": "地区", "meaning": "district; neighborhood"],
            ["hiragana": "うんえいする", "kanji": "運営する", "meaning": "to operate; to manage"],
            ["hiragana": "きょうかい", "kanji": "協会", "meaning": "association; society"],
            ["hiragana": "さつえいする", "kanji": "撮影する", "meaning": "to photograph; to film"],
            ["hiragana": "てきおうする", "kanji": "適応する", "meaning": "to adapt; to adjust"],
            ["hiragana": "しゅかん", "kanji": "主観", "meaning": "subjective; subjectivity"],
            ["hiragana": "しゅちょうする", "kanji": "主張する", "meaning": "to assert; to claim"],
            ["hiragana": "かく", "kanji": "核", "meaning": "nucleus; core"],
            ["hiragana": "じこ", "kanji": "自己", "meaning": "self; oneself"],
            ["hiragana": "そうぞうする", "kanji": "創造する", "meaning": "to create; to innovate"]
    ]
    
    var goidon2L4barray = [
        ["hiragana":"たしゃ","kanji":"他者","meaning":"others; other people"],
            ["hiragana":"けい","kanji":"–系","meaning":"-based; -related"],
            ["hiragana":"げんていする","kanji":"限定する","meaning":"to limit; to restrict"],
            ["hiragana":"きょうちょうする","kanji":"強調する","meaning":"to emphasize; to highlight"],
            ["hiragana":"たかめる","kanji":"高める","meaning":"to enhance; to increase"],
            ["hiragana":"うながす","kanji":"促す","meaning":"to encourage; to prompt"],
            ["hiragana":"しょぶんする","kanji":"処分する","meaning":"to dispose of; to handle"],
            ["hiragana":"そこなう","kanji":"損なう","meaning":"to damage; to impair"],
            ["hiragana":"そちする","kanji":"措置する","meaning":"to take measures; to implement actions"],
            ["hiragana":"ていしゅつする","kanji":"提出する","meaning":"to submit; to hand in"]
    ]
    
    var goidon2L4carray = [
        ["hiragana":"しょくいん","kanji":"職員","meaning":"staff; personnel"],
            ["hiragana":"こんらんする","kanji":"混乱する","meaning":"to confuse; to be in chaos"],
            ["hiragana":"とういつする","kanji":"統一する","meaning":"to unify; to integrate"],
            ["hiragana":"じっせんする","kanji":"実践する","meaning":"to practice; to implement"],
            ["hiragana":"にんちする","kanji":"認知する","meaning":"to recognize; to acknowledge"],
            ["hiragana":"しょ–","kanji":"諸–","meaning":"various; multiple"],
            ["hiragana":"ちつじょ","kanji":"秩序","meaning":"order; discipline"],
            ["hiragana":"しんこうする","kanji":"進行する","meaning":"to progress; to advance"],
            ["hiragana":"かいきゅう","kanji":"階級","meaning":"class; rank"],
            ["hiragana":"みんかん","kanji":"民間","meaning":"private; civilian"]
    ]
    
    var goidon2L5aarray = [
        ["hiragana":"きごう","kanji":"記号","meaning":"symbol; character"],
            ["hiragana":"くみあわせ","kanji":"組み合わせ","meaning":"combination; permutation"],
            ["hiragana":"へんかんする","kanji":"変換する","meaning":"to convert; to transform"],
            ["hiragana":"ぐろーばる","kanji":"グローバル","meaning":"global; worldwide"],
            ["hiragana":"こうてき","kanji":"公的","meaning":"public; official"],
            ["hiragana":"けいさいする","kanji":"掲載する","meaning":"to publish; to post"],
            ["hiragana":"はば","kanji":"幅","meaning":"width; range"],
            ["hiragana":"とうがい","kanji":"当該","meaning":"relevant; respective"],
            ["hiragana":"きせいする","kanji":"規制する","meaning":"to regulate; to control"],
            ["hiragana":"あらかじめ","kanji":"予め","meaning":"in advance; beforehand"]
    ]
    
    var goidon2L5barray = [
        ["hiragana":"ふくし","kanji":"福祉","meaning":"welfare; well-being"],
            ["hiragana":"かこうする","kanji":"加工する","meaning":"to process; to manipulate"],
            ["hiragana":"そうち","kanji":"装置","meaning":"device; apparatus"],
            ["hiragana":"じこう","kanji":"事項","meaning":"matter; item"],
            ["hiragana":"どういする","kanji":"同意する","meaning":"to agree; to consent"],
            ["hiragana":"げん–","kanji":"現–","meaning":"present; current"],
            ["hiragana":"げんそく","kanji":"原則","meaning":"principle; fundamental rule"],
            ["hiragana":"じゅうじつする","kanji":"充実する","meaning":"to enrich; to enhance"],
            ["hiragana":"すいしんする","kanji":"推進する","meaning":"to promote; to drive forward"],
            ["hiragana":"かくとくする","kanji":"獲得する","meaning":"to acquire; to obtain"]
    ]
    
    var goidon2L5carray = [
        ["hiragana":"かぞえる","kanji":"数える","meaning":"to count; to enumerate"],
        ["hiragana":"そう–","kanji":"総–","meaning":"total; overall"],
        ["hiragana":"じかくする","kanji":"自覚する","meaning":"to be aware; to have self-awareness"],
        ["hiragana":"ごうり","kanji":"合理","meaning":"rational; reasonable"],
        ["hiragana":"ほうしき","kanji":"方式","meaning":"method; approach"],
        ["hiragana":"しゅつげんする","kanji":"出現する","meaning":"to appear; to emerge"],
        ["hiragana":"しきべつする","kanji":"識別する","meaning":"to identify; to recognize"],
        ["hiragana":"ほうめん","kanji":"方面","meaning":"direction; aspect"],
        ["hiragana":"せつりつする","kanji":"設立する","meaning":"to establish; to found"],
        ["hiragana":"かんねんする","kanji":"観念する","meaning":"to conceive; to conceptualize"]
    ]
    
    var goidon2L6aarray = [
        ["hiragana":"しんりん","kanji":"森林","meaning":"forest; woodlands"],
        ["hiragana":"うけとめる","kanji":"受け止める","meaning":"to accept; to receive"],
        ["hiragana":"きこう","kanji":"気候","meaning":"climate; weather"],
        ["hiragana":"ぜんじゅつする","kanji":"前述する","meaning":"to mention earlier; to aforementioned"],
        ["hiragana":"りつ","kanji":"率／–率","meaning":"rate; ratio"],
        ["hiragana":"しょくぶつ","kanji":"植物","meaning":"plant; vegetation"],
        ["hiragana":"しゅ","kanji":"種／–種","meaning":"species; kind"],
        ["hiragana":"しんさする","kanji":"審査する","meaning":"to examine; to review"],
        ["hiragana":"えきたい","kanji":"液体","meaning":"liquid"],
        ["hiragana":"ひょうじゅん","kanji":"標準","meaning":"standard; norm"]
    ]
    
    var goidon2L6barray = [
        ["hiragana":"えんじょする","kanji":"援助する","meaning":"to assist; to support"],
        ["hiragana":"ようせいする","kanji":"要請する","meaning":"to request; to appeal for"],
        ["hiragana":"ここ","kanji":"個々","meaning":"individual; each"],
        ["hiragana":"たいしょする","kanji":"対処する","meaning":"to address; to deal with"],
        ["hiragana":"さいけん","kanji":"債権","meaning":"debt; claim"],
        ["hiragana":"せっしょくする","kanji":"接触する","meaning":"to contact; to make contact"],
        ["hiragana":"いかなる","kanji":"いかなる","meaning":"any; whatever"],
        ["hiragana":"じったい","kanji":"実態","meaning":"reality; actual situation"],
        ["hiragana":"できあがる","kanji":"出来上がる","meaning":"to be completed; to be finished"],
        ["hiragana":"ていしする","kanji":"停止する","meaning":"to stop; to cease"]
    ]
    
    var goidon2L6carray = [
        ["hiragana":"とく","kanji":"説く","meaning":"to explain; to advocate"],
        ["hiragana":"ほうそく","kanji":"法則","meaning":"law; principle"],
        ["hiragana":"けん","kanji":"–圏","meaning":"-sphere; -zone"],
        ["hiragana":"ぶんりする","kanji":"分離する","meaning":"to separate; to isolate"],
        ["hiragana":"いぞんする","kanji":"依存する","meaning":"to depend; to rely on"],
        ["hiragana":"ゆうき","kanji":"有機","meaning":"organic"],
        ["hiragana":"とどまる","kanji":"留まる","meaning":"to remain; to stay"],
        ["hiragana":"かくていする","kanji":"確定する","meaning":"to determine; to ascertain"],
        ["hiragana":"ようしき","kanji":"様式","meaning":"style; form"],
        ["hiragana":"こころみる","kanji":"試みる","meaning":"to attempt; to try"]
    ]
    
    var goidon2L7aarray = [
        ["hiragana":"こうがい","kanji":"公害","meaning":"pollution; environmental pollution"],
        ["hiragana":"さいばん","kanji":"裁判","meaning":"trial; lawsuit"],
        ["hiragana":"はかいする","kanji":"破壊する","meaning":"to destroy; to demolish"],
        ["hiragana":"そしょう","kanji":"訴訟","meaning":"litigation; lawsuit"],
        ["hiragana":"ほぜんする","kanji":"保全する","meaning":"to preserve; to conserve"],
        ["hiragana":"けねんする","kanji":"懸念する","meaning":"to be concerned; to worry"],
        ["hiragana":"はんけつする","kanji":"判決する","meaning":"to judge; to make a ruling"],
        ["hiragana":"たいせん","kanji":"大戦","meaning":"great war; major conflict"],
        ["hiragana":"こえる","kanji":"越える","meaning":"to surpass; to exceed"],
        ["hiragana":"こうえんする","kanji":"講演する","meaning":"to give a lecture; to deliver a speech"]
    ]
    
    var goidon2L7barray = [
        ["hiragana":"せいりょくてき","kanji":"精力的","meaning":"energetic; vigorous"],
        ["hiragana":"せんしん","kanji":"先進","meaning":"advanced; progressive"],
        ["hiragana":"かつ","kanji":"かつ","meaning":"and; as well as"],
        ["hiragana":"どう","kanji":"同–","meaning":"same; identical"],
        ["hiragana":"せっちする","kanji":"設置する","meaning":"to establish; to set up"],
        ["hiragana":"かいぜんする","kanji":"改善する","meaning":"to improve; to enhance"],
        ["hiragana":"にゅうしゅする","kanji":"入手する","meaning":"to obtain; to acquire"],
        ["hiragana":"きそん","kanji":"既存","meaning":"existing; pre-existing"],
        ["hiragana":"きはん","kanji":"規範","meaning":"norm; standard"],
        ["hiragana":"りんり","kanji":"倫理","meaning":"ethics; morality"]
    ]
    
    var goidon2L7carray = [
        ["hiragana":"りょういき","kanji":"領域","meaning":"domain; field"],
        ["hiragana":"かんわする","kanji":"緩和する","meaning":"to mitigate; to alleviate"],
        ["hiragana":"すけーる","kanji":"スケール","meaning":"scale; magnitude"],
        ["hiragana":"ぶんかつする","kanji":"分割する","meaning":"to divide; to split"],
        ["hiragana":"ち","kanji":"知","meaning":"knowledge; information"],
        ["hiragana":"き","kanji":"–期","meaning":"period; phase"],
        ["hiragana":"ていきする","kanji":"提起する","meaning":"to raise; to bring up"],
        ["hiragana":"ちょうわする","kanji":"調和する","meaning":"to harmonize; to reconcile"],
        ["hiragana":"ごういする","kanji":"合意する","meaning":"to agree; to reach a consensus"],
        ["hiragana":"かいさいする","kanji":"開催する","meaning":"to hold; to host"]
    ]
    
    var goidon2L8aarray = [
        ["hiragana":"かぎり","kanji":"限り","meaning":"as long as; to the extent of"],
        ["hiragana":"そんしつ","kanji":"損失","meaning":"loss; damage"],
        ["hiragana":"きこう","kanji":"機構","meaning":"organization; institution"],
        ["hiragana":"めんじょする","kanji":"免除する","meaning":"to exempt; to waive"],
        ["hiragana":"しや","kanji":"視野","meaning":"perspective; field of vision"],
        ["hiragana":"ぎかい","kanji":"議会","meaning":"parliament; legislature"],
        ["hiragana":"きんきゅう","kanji":"緊急","meaning":"urgent; emergency"],
        ["hiragana":"かいしょうする","kanji":"解消する","meaning":"to resolve; to dissolve"],
        ["hiragana":"えいぞう","kanji":"映像","meaning":"image; footage"],
        ["hiragana":"はんする","kanji":"反する","meaning":"to go against; to contradict"]
    ]
    
    var goidon2L8barray = [
        ["hiragana":"じゅうらい","kanji":"従来","meaning":"traditional; conventional"],
        ["hiragana":"ふよう","kanji":"不要","meaning":"unnecessary; not needed"],
        ["hiragana":"きょうりょく","kanji":"強力","meaning":"powerful; strong"],
        ["hiragana":"し","kanji":"–誌","meaning":"-magazine; -journal"],
        ["hiragana":"むね","kanji":"旨","meaning":"purpose; intention"],
        ["hiragana":"たいしゅう","kanji":"大衆","meaning":"public; masses"],
        ["hiragana":"しじする","kanji":"支持する","meaning":"to support; to endorse"],
        ["hiragana":"とりわけ","kanji":"とりわけ","meaning":"especially; particularly"],
        ["hiragana":"じんかく","kanji":"人格","meaning":"personality; character"],
        ["hiragana":"そういする","kanji":"相違する","meaning":"to differ; to vary"]
    ]
    
    var goidon2L8carray = [
        ["hiragana":"とうたつする","kanji":"到達する","meaning":"to reach; to achieve"],
        ["hiragana":"かい","kanji":"–界","meaning":"-field; -sphere"],
        ["hiragana":"はいちする","kanji":"配置する","meaning":"to arrange; to allocate"],
        ["hiragana":"せいとう","kanji":"正当","meaning":"legitimate; justifiable"],
        ["hiragana":"こうたいする","kanji":"交代する","meaning":"to alternate; to take turns"],
        ["hiragana":"ほじょする","kanji":"補助する","meaning":"to assist; to support"],
        ["hiragana":"ぎむ","kanji":"義務","meaning":"obligation; duty"],
        ["hiragana":"ゆらいする","kanji":"由来する","meaning":"to originate; to derive"],
        ["hiragana":"もしくは","kanji":"もしくは","meaning":"or; alternatively"],
        ["hiragana":"こうよう","kanji":"効用","meaning":"utility; usefulness"]
    ]
    
    var goidon2L9aarray = [
        ["hiragana":"せい","kanji":"正／正–","meaning":"positive; correct"],
        ["hiragana":"じげん","kanji":"次元","meaning":"dimension; aspect"],
        ["hiragana":"ひきおこす","kanji":"引き起こす","meaning":"to cause; to bring about"],
        ["hiragana":"ふせぐ","kanji":"防ぐ","meaning":"to prevent; to protect"],
        ["hiragana":"さく","kanji":"策／–策","meaning":"measure; strategy"],
        ["hiragana":"こうじる","kanji":"講じる","meaning":"to take; to implement"],
        ["hiragana":"よそくする","kanji":"予測する","meaning":"to predict; to forecast"],
        ["hiragana":"せいぎょする","kanji":"制御する","meaning":"to control; to regulate"],
        ["hiragana":"しこうする","kanji":"志向する","meaning":"to aspire; to aim for"],
        ["hiragana":"ろんぎする","kanji":"論議する","meaning":"to discuss; to debate"]
    ]
    
    var goidon2L9barray = [
        ["hiragana":"しょぞくする","kanji":"所属する","meaning":"to belong; to be affiliated with"],
        ["hiragana":"じょうき","kanji":"上記","meaning":"above-mentioned; aforementioned"],
        ["hiragana":"ぜんめん","kanji":"全面","meaning":"all aspects; comprehensive"],
        ["hiragana":"しゅたい","kanji":"主体","meaning":"main body; subject"],
        ["hiragana":"あくしょん","kanji":"アクション","meaning":"action; activity"],
        ["hiragana":"さゆうする","kanji":"左右する","meaning":"to influence; to sway"],
        ["hiragana":"はつめいする","kanji":"発明する","meaning":"to invent; to create"],
        ["hiragana":"こうそうする","kanji":"構想する","meaning":"to conceive; to envision"],
        ["hiragana":"たすう","kanji":"多数","meaning":"majority; large number"],
        ["hiragana":"ふるく","kanji":"古く","meaning":"old; ancient"]
    ]
    
    var goidon2L9carray = [
        ["hiragana":"へん","kanji":"–編","meaning":"volume; edition"],
        ["hiragana":"がくしゃ","kanji":"学者","meaning":"scholar; academic"],
        ["hiragana":"しゅうしゅうする","kanji":"収集する","meaning":"to collect; to gather"],
        ["hiragana":"きゅうふする","kanji":"給付する","meaning":"to provide; to grant"],
        ["hiragana":"せたい","kanji":"世帯","meaning":"household; family"],
        ["hiragana":"ぶんさんする","kanji":"分散する","meaning":"to disperse; to scatter"],
        ["hiragana":"つうちする","kanji":"通知する","meaning":"to notify; to inform"],
        ["hiragana":"うんようする","kanji":"運用する","meaning":"to operate; to manage"],
        ["hiragana":"にゅうりょくする","kanji":"入力する","meaning":"to input; to enter"],
        ["hiragana":"しくみ","kanji":"仕組み","meaning":"mechanism; system"]
    ]
    
    var goidon2L10aarray = [
        ["hiragana":"しょうめつする","kanji":"消滅する","meaning":"to disappear; to vanish"],
        ["hiragana":"せつ","kanji":"説","meaning":"theory; explanation"],
        ["hiragana":"よそうする","kanji":"予想する","meaning":"to predict; to anticipate"],
        ["hiragana":"にんていする","kanji":"認定する","meaning":"to certify; to recognize"],
        ["hiragana":"つとめる","kanji":"努める","meaning":"to strive; to make efforts"],
        ["hiragana":"せいていする","kanji":"制定する","meaning":"to establish; to enact"],
        ["hiragana":"ちかくする","kanji":"知覚する","meaning":"to perceive; to sense"],
        ["hiragana":"でんたつする","kanji":"伝達する","meaning":"to transmit; to convey"],
        ["hiragana":"むすびつく","kanji":"結びつく","meaning":"to be connected; to be associated"],
        ["hiragana":"おうとうする","kanji":"応答する","meaning":"to respond; to reply"]
    ]
    
    var goidon2L10barray = [
        ["hiragana":"い","kanji":"異–","meaning":"different; other"],
        ["hiragana":"こんごうする","kanji":"混合する","meaning":"to mix; to blend"],
        ["hiragana":"へんせいする","kanji":"編成する","meaning":"to organize; to form"],
        ["hiragana":"ぶもん","kanji":"部門","meaning":"department; division"],
        ["hiragana":"ゆうりょく","kanji":"有力","meaning":"influential; powerful"],
        ["hiragana":"そうほう","kanji":"双方","meaning":"both sides; both parties"],
        ["hiragana":"がいとうする","kanji":"該当する","meaning":"to correspond; to be applicable"],
        ["hiragana":"きょじゅうする","kanji":"居住する","meaning":"to reside; to live"],
        ["hiragana":"かじょう","kanji":"過剰","meaning":"excessive; surplus"],
        ["hiragana":"よくせいする","kanji":"抑制する","meaning":"to suppress; to restrain"]
    ]
    
    var goidon2L10carray = [
        ["hiragana":"ほうしゅう","kanji":"報酬","meaning":"reward; compensation"],
        ["hiragana":"ぶんれつする","kanji":"分裂する","meaning":"to split; to divide"],
        ["hiragana":"ほどこす","kanji":"施す","meaning":"to apply; to implement"],
        ["hiragana":"なづける","kanji":"名付ける","meaning":"to name; to give a name"],
        ["hiragana":"せいさくする","kanji":"製作する","meaning":"to produce; to manufacture"],
        ["hiragana":"きんぞく","kanji":"金属","meaning":"metal"],
        ["hiragana":"とっきょ","kanji":"特許","meaning":"patent"],
        ["hiragana":"じゃっかん","kanji":"若干","meaning":"some; a few"],
        ["hiragana":"ふかい","kanji":"不快","meaning":"unpleasant; uncomfortable"],
        ["hiragana":"もっぱら","kanji":"専ら","meaning":"exclusively; solely"]
    ]
    
    var goidon2L11aarray = [
        ["hiragana":"じぞくする","kanji":"持続する","meaning":"to sustain; to continue"],
        ["hiragana":"ひろがり","kanji":"広がり","meaning":"spread; expansion"],
        ["hiragana":"ちい","kanji":"地位","meaning":"position; status"],
        ["hiragana":"ぱねる","kanji":"パネル","meaning":"panel; board"],
        ["hiragana":"しょう","kanji":"–省／省–","meaning":"ministry; department"],
        ["hiragana":"ただちに","kanji":"直ちに","meaning":"immediately; promptly"],
        ["hiragana":"じゅうじする","kanji":"従事する","meaning":"to engage in; to be involved in"],
        ["hiragana":"げんしょうする","kanji":"減少する","meaning":"to decrease; to reduce"],
        ["hiragana":"そう","kanji":"層","meaning":"layer; stratum"],
        ["hiragana":"みまん","kanji":"未満","meaning":"less than; below"]
    ]
    
    var goidon2L11barray = [
        ["hiragana":"ひりつ","kanji":"比率","meaning":"ratio; proportion"],
        ["hiragana":"しこうする","kanji":"施行する","meaning":"to enforce; to implement"],
        ["hiragana":"かっせい","kanji":"活性","meaning":"activity; liveliness"],
        ["hiragana":"きぼ","kanji":"規模","meaning":"scale; size"],
        ["hiragana":"しょうぎょう","kanji":"商業","meaning":"commerce; business"],
        ["hiragana":"ほしゅ","kanji":"保守","meaning":"conservation; maintenance"],
        ["hiragana":"いき","kanji":"域／–域","meaning":"area; region"],
        ["hiragana":"はんろんする","kanji":"反論する","meaning":"to counter; to argue against"],
        ["hiragana":"こうきょう","kanji":"公共","meaning":"public; communal"],
        ["hiragana":"ひ","kanji":"非／非–","meaning":"non-; not"]
    ]
    
    var goidon2L11carray = [
        ["hiragana":"ふまえる","kanji":"踏まえる","meaning":"to base on; to take into account"],
        ["hiragana":"かいそう","kanji":"階層","meaning":"hierarchy; social class"],
        ["hiragana":"れんぽう","kanji":"連邦","meaning":"federation; federal"],
        ["hiragana":"あやまる","kanji":"誤る","meaning":"to make a mistake; to err"],
        ["hiragana":"かんよする","kanji":"関与","meaning":"involvement; participation"],
        ["hiragana":"せいき","kanji":"正規","meaning":"regular; formal"],
        ["hiragana":"はいぶんする","kanji":"配分する","meaning":"to allocate; to distribute"],
        ["hiragana":"そくていする","kanji":"測定する","meaning":"to measure; to gauge"],
        ["hiragana":"ことがら","kanji":"事柄","meaning":"matter; affair"],
        ["hiragana":"しんてんする","kanji":"進展する","meaning":"to progress; to advance"]
    ]
    
    var goidon2L12aarray = [
        ["hiragana":"ぐん","kanji":"群／–群","meaning":"group; cluster"],
        ["hiragana":"とぼしい","kanji":"乏しい","meaning":"scarce; limited"],
        ["hiragana":"むすびつける","kanji":"結びつける","meaning":"to connect; to link"],
        ["hiragana":"かける","kanji":"欠ける","meaning":"to lack; to be missing"],
        ["hiragana":"よち","kanji":"余地","meaning":"room; space; margin"],
        ["hiragana":"ろんり","kanji":"論理","meaning":"logic; reasoning"],
        ["hiragana":"つながり","kanji":"つながり","meaning":"connection; link"],
        ["hiragana":"ようやくする","kanji":"要約する","meaning":"to summarize; to abstract"],
        ["hiragana":"しゅだい","kanji":"主題","meaning":"subject; topic"],
        ["hiragana":"ようご","kanji":"用語","meaning":"terminology; terms"]
    ]
    
    var goidon2L12barray = [
        ["hiragana":"しんとうする","kanji":"浸透する","meaning":"to permeate; to penetrate"],
        ["hiragana":"たほう","kanji":"他方","meaning":"on the other hand; alternatively"],
        ["hiragana":"そうしつする","kanji":"喪失する","meaning":"to lose; to forfeit"],
        ["hiragana":"かいひする","kanji":"回避する","meaning":"to avoid; to evade"],
        ["hiragana":"ぼうとう","kanji":"冒頭","meaning":"beginning; opening"],
        ["hiragana":"ぜんけいする","kanji":"前傾する","meaning":"to incline forward; to lean forward"],
        ["hiragana":"ちょくせん","kanji":"直線","meaning":"straight line"],
        ["hiragana":"しさする","kanji":"示唆する","meaning":"to suggest; to imply"],
        ["hiragana":"けいひ","kanji":"経費","meaning":"expenses; costs"],
        ["hiragana":"ふせい","kanji":"不正","meaning":"dishonest; unlawful"]
    ]
    
    var goidon2L12carray = [
        ["hiragana":"ひ","kanji":"比","meaning":"ratio; proportion"],
        ["hiragana":"いたくする","kanji":"委託する","meaning":"to entrust; to delegate"],
        ["hiragana":"こうしんする","kanji":"更新する","meaning":"to renew; to update"],
        ["hiragana":"かいたいする","kanji":"解体する","meaning":"to dismantle; to disassemble"],
        ["hiragana":"そうせつする","kanji":"創設する","meaning":"to establish; to found"],
        ["hiragana":"ひょうめいする","kanji":"表明する","meaning":"to declare; to announce"],
        ["hiragana":"きょうてい","kanji":"協定","meaning":"agreement; treaty"],
        ["hiragana":"もと・す","kanji":"素","meaning":"basic; fundamental"],
        ["hiragana":"ししょう","kanji":"指針","meaning":"guideline; directive"],
        ["hiragana":"ようりょう","kanji":"要領","meaning":"knack; skill; method"]
    ]
    
    var goidon2L13aarray = [
        ["hiragana":"しゅうかくする","kanji":"収穫する","meaning":"to harvest; to reap"],
        ["hiragana":"やくだつする","kanji":"役立つ","meaning":"to be useful; to be beneficial"],
        ["hiragana":"くみあわせる","kanji":"組み合わせる","meaning":"to combine; to integrate"],
        ["hiragana":"せいやくする","kanji":"制約する","meaning":"to constrain; to restrict"],
        ["hiragana":"かくど","kanji":"角度","meaning":"angle; perspective"],
        ["hiragana":"おうだんする","kanji":"横断する","meaning":"to cross; to traverse"],
        ["hiragana":"ほじする","kanji":"保持する","meaning":"to hold; to maintain"],
        ["hiragana":"とう","kanji":"当／当–","meaning":"current; present"],
        ["hiragana":"かす","kanji":"課す","meaning":"to impose; to levy"],
        ["hiragana":"かんせいする","kanji":"完成する","meaning":"to complete; to finish"]
    ]
    
    var goidon2L13barray = [
        ["hiragana":"ちょくめんする","kanji":"直面する","meaning":"to face; to confront"],
        ["hiragana":"けっせいする","kanji":"結成する","meaning":"to form; to establish"],
        ["hiragana":"ぎょうせい","kanji":"行政","meaning":"administration; government"],
        ["hiragana":"きゅうさいする","kanji":"救済する","meaning":"to relieve; to assist"],
        ["hiragana":"ちくせきする","kanji":"蓄積する","meaning":"to accumulate; to build up"],
        ["hiragana":"ぴーく","kanji":"ピーク","meaning":"peak; summit"],
        ["hiragana":"ほけん","kanji":"保健","meaning":"health; hygiene"],
        ["hiragana":"しょちする","kanji":"処置する","meaning":"to take measures; to handle"],
        ["hiragana":"はんていする","kanji":"判定する","meaning":"to determine; to judge"],
        ["hiragana":"ちゅうしょう","kanji":"抽象","meaning":"abstract; abstraction"]
    ]
    
    var goidon2L13carray = [
        ["hiragana":"しんかする","kanji":"進化する","meaning":"to evolve; to develop"],
        ["hiragana":"こていする","kanji":"固定する","meaning":"to fix; to secure"],
        ["hiragana":"けんげん","kanji":"権限","meaning":"authority; power"],
        ["hiragana":"じゅうなん","kanji":"柔軟","meaning":"flexible; adaptable"],
        ["hiragana":"けいしょうする","kanji":"継承する","meaning":"to inherit; to succeed"],
        ["hiragana":"りがい","kanji":"利害","meaning":"interests; benefits"],
        ["hiragana":"じく","kanji":"軸","meaning":"axis; central point"],
        ["hiragana":"ふかする","kanji":"付加する","meaning":"to add; to append"],
        ["hiragana":"しんぎする","kanji":"審議する","meaning":"to deliberate; to discuss"],
        ["hiragana":"ようけん","kanji":"要件","meaning":"requirement; prerequisite"]
    ]
    
    var goidon2L14aarray = [
        ["hiragana":"こうしする","kanji":"行使する","meaning":"to exercise; to practice"],
        ["hiragana":"ひんしつ","kanji":"品質","meaning":"quality"],
        ["hiragana":"ほかんする","kanji":"保管する","meaning":"to store; to keep"],
        ["hiragana":"すいへい","kanji":"水平","meaning":"level; horizontal"],
        ["hiragana":"しゅうえき","kanji":"収益","meaning":"earnings; revenue"],
        ["hiragana":"てんじる","kanji":"転じる","meaning":"to turn; to shift"],
        ["hiragana":"けた／–けた","kanji":"桁／–桁","meaning":"digit; order of magnitude"],
        ["hiragana":"あんけーと","kanji":"アンケート","meaning":"survey; questionnaire"],
        ["hiragana":"はあくする","kanji":"把握する","meaning":"to grasp; to understand"],
        ["hiragana":"けんしょうする","kanji":"検証する","meaning":"to verify; to validate"]
    ]
    
    var goidon2L14barray = [
        ["hiragana":"しょめいする","kanji":"署名する","meaning":"to sign (a document)"],
        ["hiragana":"ぎょうせき","kanji":"業績","meaning":"performance; achievement"],
        ["hiragana":"しんねん","kanji":"信念","meaning":"belief; conviction"],
        ["hiragana":"へんかくする","kanji":"変革する","meaning":"to transform; to revolutionize"],
        ["hiragana":"ちょしょ","kanji":"著書","meaning":"publication; authored book"],
        ["hiragana":"ぶんたんする","kanji":"分担する","meaning":"to share; to divide (responsibilities)"],
        ["hiragana":"けい–","kanji":"計–","meaning":"calculation; measurement"],
        ["hiragana":"いちらん","kanji":"一覧","meaning":"list; inventory"],
        ["hiragana":"かんかく","kanji":"間隔","meaning":"interval; spacing"],
        ["hiragana":"かんりょうする","kanji":"完了する","meaning":"to complete; to finish"]
    ]
    
    var goidon2L14carray = [
        ["hiragana":"ふっこうする","kanji":"復興する","meaning":"to recover; to rebuild"],
        ["hiragana":"くいき","kanji":"区域","meaning":"area; region"],
        ["hiragana":"れんけいする","kanji":"連携する","meaning":"to collaborate; to cooperate"],
        ["hiragana":"きりかえる","kanji":"切り替える","meaning":"to switch; to change"],
        ["hiragana":"じょうりゅう","kanji":"上流","meaning":"upstream; upper stream"],
        ["hiragana":"しふとする","kanji":"シフトする","meaning":"to shift; to change"],
        ["hiragana":"ないめん","kanji":"内面","meaning":"inner self; inner aspect"],
        ["hiragana":"ひれいする","kanji":"比例する","meaning":"to be proportional; to correspond"],
        ["hiragana":"ぶんみゃく","kanji":"文脈","meaning":"context; framework"],
        ["hiragana":"さい","kanji":"差異","meaning":"difference; discrepancy"]
    ]
    
    var goidon2L15aarray = [
        ["hiragana":"ほんしょ","kanji":"本書","meaning":"this book; this publication"],
        ["hiragana":"はいりょする","kanji":"配慮する","meaning":"to consider; to take into account"],
        ["hiragana":"てじゅん","kanji":"手順","meaning":"procedure; process"],
        ["hiragana":"くふうする","kanji":"工夫する","meaning":"to devise; to come up with"],
        ["hiragana":"けいき","kanji":"契機","meaning":"opportunity; occasion"],
        ["hiragana":"げんきゅうする","kanji":"言及する","meaning":"to mention; to refer to"],
        ["hiragana":"か","kanji":"可","meaning":"possible; permissible"],
        ["hiragana":"しゅさいする","kanji":"主催する","meaning":"to organize; to host"],
        ["hiragana":"–ざい","kanji":"–材","meaning":"material; resources"],
        ["hiragana":"どくりつする","kanji":"独立する","meaning":"to be independent; to stand alone"]
    ]
    
    var goidon2L15barray = [
        ["hiragana":"かいせつする","kanji":"開設する","meaning":"to open; to establish"],
        ["hiragana":"ぼりゅーむ","kanji":"ボリューム","meaning":"volume; size"],
        ["hiragana":"こうしゅう","kanji":"公衆","meaning":"public; general public"],
        ["hiragana":"けいとう","kanji":"系統","meaning":"system; hierarchy"],
        ["hiragana":"しせつ","kanji":"施設","meaning":"facility; institution"],
        ["hiragana":"かくほする","kanji":"確保する","meaning":"to secure; to ensure"],
        ["hiragana":"ついで","kanji":"次いで","meaning":"next; subsequently"],
        ["hiragana":"うむ","kanji":"有無","meaning":"presence or absence; existence or non-existence"],
        ["hiragana":"そんぞくする","kanji":"存続する","meaning":"to continue; to persist"],
        ["hiragana":"くうかん","kanji":"空間","meaning":"space; area"]
    ]
    
    var goidon2L15carray = [
        ["hiragana":"ぶんぱいする","kanji":"分配する","meaning":"to distribute; to allocate"],
        ["hiragana":"そうにゅうする","kanji":"挿入する","meaning":"to insert; to put in"],
        ["hiragana":"えいせい","kanji":"衛生","meaning":"hygiene; sanitation"],
        ["hiragana":"かいりょうする","kanji":"改良する","meaning":"to improve; to enhance"],
        ["hiragana":"このましい","kanji":"好ましい","meaning":"preferable; desirable"],
        ["hiragana":"つよめる","kanji":"強める","meaning":"to strengthen; to enhance"],
        ["hiragana":"けつじょする","kanji":"欠如する","meaning":"to lack; to be deficient in"],
        ["hiragana":"もうける","kanji":"設ける","meaning":"to establish; to set up"],
        ["hiragana":"よっきゅうする","kanji":"欲求する","meaning":"to desire; to crave"],
        ["hiragana":"せいじゅくする","kanji":"成熟する","meaning":"to mature; to become ripe"]
    ]
    
    var goidon2L16aarray = [
        ["hiragana":"だいする","kanji":"題する","meaning":"to title; to label"],
        ["hiragana":"じったい","kanji":"実体","meaning":"entity; substance"],
        ["hiragana":"しゅじゅ","kanji":"種々","meaning":"various; diverse"],
        ["hiragana":"しひょう","kanji":"指標","meaning":"indicator; index"],
        ["hiragana":"みずから","kanji":"自ら","meaning":"oneself; personally"],
        ["hiragana":"しゅどうする","kanji":"主導する","meaning":"to lead; to take the lead"],
        ["hiragana":"りっぽう","kanji":"立法","meaning":"legislation; lawmaking"],
        ["hiragana":"ないがい","kanji":"内外","meaning":"domestic and foreign; internal and external"],
        ["hiragana":"けん","kanji":"–権","meaning":"right; authority"],
        ["hiragana":"こっかい","kanji":"国会","meaning":"parliament; congress"]
    ]
    
    var goidon2L16barray = [
        ["hiragana":"げんこう","kanji":"現行","meaning":"current; existing"],
        ["hiragana":"てんぼう","kanji":"展望","meaning":"outlook; perspective"],
        ["hiragana":"あらゆる","kanji":"あらゆる","meaning":"every; all"],
        ["hiragana":"おびやかす","kanji":"脅かす","meaning":"to threaten; to jeopardize"],
        ["hiragana":"しょうれいする","kanji":"奨励する","meaning":"to encourage; to promote"],
        ["hiragana":"ならび","kanji":"並び","meaning":"along with; together with"],
        ["hiragana":"たいぐう","kanji":"待遇","meaning":"treatment; reception"],
        ["hiragana":"すいいする","kanji":"推移する","meaning":"to transition; to change"],
        ["hiragana":"ふぃーるど","kanji":"フィールド","meaning":"field; domain"],
        ["hiragana":"はかる","kanji":"図る","meaning":"to aim; to strive for"]
    ]
    
    var goidon2L16carray = [
        ["hiragana":"いっかん","kanji":"一環","meaning":"part; component; link"],
        ["hiragana":"ぼうしする","kanji":"防止する","meaning":"to prevent; to inhibit"],
        ["hiragana":"れいがい","kanji":"例外","meaning":"exception"],
        ["hiragana":"こうせい","kanji":"公正","meaning":"fair; just"],
        ["hiragana":"ふきょう","kanji":"不況","meaning":"recession; economic downturn"],
        ["hiragana":"せんい","kanji":"繊維","meaning":"fiber; textile"],
        ["hiragana":"ちょうたつする","kanji":"調達する","meaning":"to procure; to obtain"],
        ["hiragana":"ぎれい","kanji":"儀礼","meaning":"ceremony; ritual"],
        ["hiragana":"こうそくする","kanji":"拘束する","meaning":"to restrain; to restrict"],
        ["hiragana":"たみ","kanji":"民","meaning":"people; citizen"],
        ["hiragana":"みん","kanji":"–民","meaning":"people of..."]
    ]
    
    var goidon2L17aarray = [
        ["hiragana":"うわまわる","kanji":"上回る","meaning":"to surpass; to exceed"],
        ["hiragana":"ゆうい","kanji":"優位","meaning":"superiority; advantage"],
        ["hiragana":"ごうせいする","kanji":"合成する","meaning":"to synthesize; to combine"],
        ["hiragana":"かんしょうする","kanji":"干渉する","meaning":"to interfere; to intervene"],
        ["hiragana":"しかく","kanji":"視覚","meaning":"vision; sight"],
        ["hiragana":"つけくわえる","kanji":"付け加える","meaning":"to add; to append"],
        ["hiragana":"えんぜつする","kanji":"演説する","meaning":"to give a speech; to deliver a lecture"],
        ["hiragana":"たいわする","kanji":"対話する","meaning":"to have a conversation; to engage in a dialogue"],
        ["hiragana":"ふかめる","kanji":"深める","meaning":"to deepen; to enhance"],
        ["hiragana":"くりかえし","kanji":"繰り返し","meaning":"repeatedly; repeatedly"]
    ]
    
    var goidon2L17barray = [
        ["hiragana":"だいしょう","kanji":"大小","meaning":"size; magnitude"],
        ["hiragana":"くみこむ","kanji":"組み込み","meaning":"embedded; integrated"],
        ["hiragana":"きりはなす","kanji":"切り離す","meaning":"to detach; to separate"],
        ["hiragana":"になう","kanji":"担う","meaning":"to bear; to shoulder"],
        ["hiragana":"せだい","kanji":"世代","meaning":"generation; age group"],
        ["hiragana":"まねじめんと","kanji":"マネジメント","meaning":"management"],
        ["hiragana":"とりまく","kanji":"取り巻く","meaning":"to surround; to encircle"],
        ["hiragana":"じつじょう","kanji":"実情","meaning":"actual situation; reality"],
        ["hiragana":"そくする","kanji":"即する","meaning":"to respond immediately; to act promptly"],
        ["hiragana":"はしら","kanji":"柱","meaning":"pillar; column"]
    ]
    
    var goidon2L17carray = [
        ["hiragana":"かいぞうする","kanji":"改造する","meaning":"to modify; to transform"],
        ["hiragana":"げんりょう","kanji":"原料","meaning":"raw material; ingredient"],
        ["hiragana":"いっきょ","kanji":"一挙","meaning":"all at once; in one go"],
        ["hiragana":"たんぽする","kanji":"担保する","meaning":"to guarantee; to secure"],
        ["hiragana":"じゃく","kanji":"弱／弱–／–弱","meaning":"weak; weakness; or less"],
        ["hiragana":"しゅうふくする","kanji":"修復する","meaning":"to repair; to restore"],
        ["hiragana":"けっかん","kanji":"欠陥","meaning":"defect; flaw"],
        ["hiragana":"ほっそくする","kanji":"発足する","meaning":"to establish; to start"],
        ["hiragana":"ししゅつする","kanji":"支出する","meaning":"to spend; to expend"],
        ["hiragana":"ざい","kanji":"財","meaning":"wealth; assets"]
    ]
    
    var goidon2L18aarray = [
        ["hiragana":"しゅうろくする","kanji":"収録する","meaning":"to include; to record"],
        ["hiragana":"あっぱくする","kanji":"圧迫する","meaning":"to pressure; to oppress"],
        ["hiragana":"じしん","kanji":"自身","meaning":"oneself; self"],
        ["hiragana":"こんてい","kanji":"根底","meaning":"foundation; basis"],
        ["hiragana":"きょぜつする","kanji":"拒絶する","meaning":"to reject; to refuse"],
        ["hiragana":"ばくぜんと","kanji":"漠然と","meaning":"vaguely; vaguely"],
        ["hiragana":"かいする","kanji":"解する","meaning":"to understand; to interpret"],
        ["hiragana":"きょく","kanji":"極","meaning":"extreme; utmost"],
        ["hiragana":"せんざいする","kanji":"潜在する","meaning":"to exist; to be latent"],
        ["hiragana":"めいはく","kanji":"明白","meaning":"clear; evident"]
    ]
    
    var goidon2L18barray = [
        ["hiragana":"けいしゃする","kanji":"傾斜する","meaning":"to incline; to lean"],
        ["hiragana":"じぜん","kanji":"事前","meaning":"beforehand; in advance"],
        ["hiragana":"てんけんする","kanji":"点検する","meaning":"to inspect; to examine"],
        ["hiragana":"せいさく","kanji":"政策","meaning":"policy; strategy"],
        ["hiragana":"とりあつかう","kanji":"取り扱う","meaning":"to handle; to deal with"],
        ["hiragana":"よきする","kanji":"予期する","meaning":"to anticipate; to expect"],
        ["hiragana":"いたる","kanji":"至る","meaning":"to reach; to come to"],
        ["hiragana":"すいそくする","kanji":"推測する","meaning":"to speculate; to guess"],
        ["hiragana":"しゅし","kanji":"趣旨","meaning":"gist; main point"],
        ["hiragana":"さんぷる","kanji":"サンプル","meaning":"sample"]
    ]
    
    var goidon2L18carray = [
        ["hiragana":"じゅうてん","kanji":"重点","meaning":"emphasis; priority"],
        ["hiragana":"にんい","kanji":"任意","meaning":"optional; voluntary"],
        ["hiragana":"ふり","kanji":"不利","meaning":"disadvantage; unfavorable"],
        ["hiragana":"ようぼう","kanji":"要望","meaning":"request; demand"],
        ["hiragana":"ひやく","kanji":"飛躍する","meaning":"to leap; to jump"],
        ["hiragana":"せいたい","kanji":"生態","meaning":"ecology; ecosystem"],
        ["hiragana":"あんい","kanji":"安易","meaning":"easy; casual"],
        ["hiragana":"ゆうごうする","kanji":"融合する","meaning":"to merge; to integrate"],
        ["hiragana":"かくしん","kanji":"革新","meaning":"innovation; revolution"],
        ["hiragana":"か","kanji":"過–","meaning":"excessive; over-"]
    ]
    
    var goidon2L19aarray = [
        ["hiragana":"かいする","kanji":"介する","meaning":"to mediate; to intervene"],
        ["hiragana":"とうらいする","kanji":"到来する","meaning":"to arrive; to come"],
        ["hiragana":"みうける","kanji":"見受ける","meaning":"to observe; to perceive"],
        ["hiragana":"がいよう","kanji":"概要","meaning":"overview; summary"],
        ["hiragana":"みち","kanji":"未知","meaning":"unknown; unfamiliar"],
        ["hiragana":"きょう","kanji":"強／強–／–強","meaning":"strong; strength; or more"],
        ["hiragana":"ちゅうすう","kanji":"中枢","meaning":"central; core"],
        ["hiragana":"とくい","kanji":"特異","meaning":"unique; peculiar"],
        ["hiragana":"こたい","kanji":"個体","meaning":"individual; organism"],
        ["hiragana":"なりたつ","kanji":"成り立つ","meaning":"to consist; to be composed"]
    ]
    
    var goidon2L19barray = [
        ["hiragana":"かんげん","kanji":"還元","meaning":"reduction; return"],
        ["hiragana":"げんてん","kanji":"原点","meaning":"origin; starting point"],
        ["hiragana":"じゅんい","kanji":"順位","meaning":"ranking; position"],
        ["hiragana":"いっかんする","kanji":"一貫する","meaning":"to be consistent; to be coherent"],
        ["hiragana":"かく","kanji":"欠く","meaning":"to lack; to be without"],
        ["hiragana":"はつげんする","kanji":"発言する","meaning":"to speak; to make a statement"],
        ["hiragana":"ねんとう","kanji":"念頭","meaning":"mind; thought"],
        ["hiragana":"ひんど","kanji":"頻度","meaning":"frequency; occurrence"],
        ["hiragana":"きょうくん","kanji":"教訓","meaning":"lesson; moral"],
        ["hiragana":"じんそく","kanji":"迅速","meaning":"swift; rapid"]
    ]
    
    var goidon2L19carray = [
        ["hiragana":"きょくせん","kanji":"曲線","meaning":"curve; curved line"],
        ["hiragana":"たーげっと","kanji":"ターゲット","meaning":"target"],
        ["hiragana":"にせ","kanji":"偽","meaning":"false; fake"],
        ["hiragana":"しょうめいする","kanji":"証明する","meaning":"to prove; to demonstrate"],
        ["hiragana":"じっしょうする","kanji":"実証する","meaning":"to validate; to empirically prove"],
        ["hiragana":"つみあげる","kanji":"積み上げる","meaning":"to stack up; to accumulate"],
        ["hiragana":"さまたげる","kanji":"妨げる","meaning":"to hinder; to obstruct"],
        ["hiragana":"しょうだくする","kanji":"承諾する","meaning":"to accept; to approve"],
        ["hiragana":"ふする","kanji":"付する","meaning":"to be associated; to be connected"],
        ["hiragana":"けんていする","kanji":"検定する","meaning":"to test; to verify"]
    ]
    
    var goidon2L20aarray = [
        ["hiragana":"がぞう","kanji":"画像","meaning":"image; picture"],
        ["hiragana":"てんぷする","kanji":"添付する","meaning":"to attach; to enclose"],
        ["hiragana":"いっかつする","kanji":"一括する","meaning":"to batch; to consolidate"],
        ["hiragana":"ひょうじする","kanji":"表示する","meaning":"to display; to show"],
        ["hiragana":"ちょうせつする","kanji":"調節する","meaning":"to adjust; to regulate"],
        ["hiragana":"せつだんする","kanji":"切断する","meaning":"to cut off; to disconnect"],
        ["hiragana":"へんけいする","kanji":"変形する","meaning":"to transform; to deform"],
        ["hiragana":"きょうぞんする","kanji":"共存する","meaning":"to coexist; to exist together"],
        ["hiragana":"はん","kanji":"反","meaning":"anti-; against"],
        ["hiragana":"そうしょうする","kanji":"総称する","meaning":"to generalize; to classify"]
    ]
    
    var goidon2L20barray = [
        ["hiragana":"めいじする","kanji":"明示する","meaning":"to indicate; to make explicit"],
        ["hiragana":"おおがた","kanji":"大型","meaning":"large-scale; large-sized"],
        ["hiragana":"ていかする","kanji":"低下する","meaning":"to decrease; to decline"],
        ["hiragana":"かっとうする","kanji":"葛藤する","meaning":"to conflict; to struggle"],
        ["hiragana":"きんこうする","kanji":"均衡する","meaning":"to balance; to maintain equilibrium"],
        ["hiragana":"けいげんする","kanji":"軽減する","meaning":"to reduce; to alleviate"],
        ["hiragana":"かくさ","kanji":"格差","meaning":"disparity; inequality"],
        ["hiragana":"ひんこん","kanji":"貧困","meaning":"poverty"],
        ["hiragana":"じょうしょうする","kanji":"上昇する","meaning":"to rise; to ascend"],
        ["hiragana":"じき","kanji":"時期","meaning":"period; time frame"]
    ]
    
    var goidon2L20carray = [
        ["hiragana":"こう","kanji":"高–","meaning":"high; elevated"],
        ["hiragana":"だか","kanji":"–高","meaning":"the amount of..."],
        ["hiragana":"じりつする","kanji":"自律する","meaning":"to be self-governing; to be autonomous"],
        ["hiragana":"ひっす","kanji":"必須","meaning":"essential; necessary"],
        ["hiragana":"おこたる","kanji":"怠る","meaning":"to neglect; to slack off"],
        ["hiragana":"もさくする","kanji":"模索する","meaning":"to search; to explore"],
        ["hiragana":"せんめい","kanji":"鮮明","meaning":"clear; distinct"],
        ["hiragana":"すたんだーど","kanji":"スタンダード","meaning":"standard; typical"],
        ["hiragana":"はいきする","kanji":"廃棄する","meaning":"to discard; to dispose of"],
        ["hiragana":"たいひする","kanji":"対比する","meaning":"to contrast; to compare"],
        ["hiragana":"つうかする","kanji":"通過する","meaning":"to pass through; to go through"]
    ]
    
    var goidon2thesisarray = [
        ["hiragana":"こんてい","kanji":"根底","meaning":"foundation; basis"],
        ["hiragana":"じぜん","kanji":"事前","meaning":"beforehand; in advance"],
        ["hiragana":"せいさく","kanji":"政策","meaning":"policy; strategy"],
        ["hiragana":"しゅし","kanji":"趣旨","meaning":"gist; main point"],
        ["hiragana":"かくしん","kanji":"革新","meaning":"innovation; revolution"],
        ["hiragana":"がいよう","kanji":"概要","meaning":"overview; summary"],
        ["hiragana":"ちゅうすう","kanji":"中枢","meaning":"central; core"],
        ["hiragana":"げんてん","kanji":"原点","meaning":"origin; starting point"],
        ["hiragana":"きょうくん","kanji":"教訓","meaning":"lesson; moral"],
        ["hiragana":"じんそく","kanji":"迅速","meaning":"swift; rapid"],
        ["hiragana":"かくさ","kanji":"格差","meaning":"disparity; inequality"],
        ["hiragana":"ひんこん","kanji":"貧困","meaning":"poverty"],
        ["hiragana":"てんけんする","kanji":"点検する","meaning":"to inspect; to examine"],
        ["hiragana":"しょうれいする","kanji":"奨励する","meaning":"to encourage; to promote"],
        ["hiragana":"こうそくする","kanji":"拘束する","meaning":"to restrain; to restrict"],
        ["hiragana":"ごうせいする","kanji":"合成する","meaning":"to synthesize; to combine"],
        ["hiragana":"かんしょうする","kanji":"干渉する","meaning":"to interfere; to intervene"],
        ["hiragana":"ひれいする","kanji":"比例する","meaning":"to be proportional; to correspond"],
        ["hiragana":"あっぱくする","kanji":"圧迫する","meaning":"to pressure; to oppress"],
        ["hiragana":"きょぜつする","kanji":"拒絶する","meaning":"to reject; to refuse"],
        ["hiragana":"すいそくする","kanji":"推測する","meaning":"to speculate; to guess"],
        ["hiragana":"しょうだくする","kanji":"承諾する","meaning":"to accept; to approve"],
        ["hiragana":"きょうぞんする","kanji":"共存する","meaning":"to coexist; to exist together"],
        ["hiragana":"おこたる","kanji":"怠る","meaning":"to neglect; to slack off"],
        ["hiragana":"もさくする","kanji":"模索する","meaning":"to search; to explore"]
    ]

    var currentQuestionIndex: Int = 0
    var shuffledQuestions: [[String:String]] = []
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        // 下側の二つの角を角丸にする
        greenView.layer.cornerRadius = 25
        greenView.clipsToBounds = true
        greenView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        
        textField.delegate = self
        
        // 初期状態で非表示に設定する
        checkmarkImageView.isHidden = true
        goodjobLabel.isHidden = true
        relearnImageView.isHidden = true
        kotaeLabel.isHidden = true
        
        if let goidon2 = UserDefaults.standard.object(forKey: "GOIDON2") as? Int,
           let chapter = UserDefaults.standard.object(forKey: "CHAPTER") as? Int {
            GOIDON2 = goidon2
            CHAPTER = chapter
        }
        
        if GOIDON2 == 0 && CHAPTER == 0 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
            chapterLabel.text = "601〜610"
            shuffledQuestions = shuffleArray(goidon2L1aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 0 && CHAPTER == 1 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
            chapterLabel.text = "611〜620"
            shuffledQuestions = shuffleArray(goidon2L1barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 0 && CHAPTER == 2 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
            chapterLabel.text = "621〜630"
            shuffledQuestions = shuffleArray(goidon2L1carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 1 && CHAPTER == 0 {
            titleLabel.text = "Lesson 2"
            titleShadowLabel.text = "Lesson 2"
            chapterLabel.text = "631〜640"
            shuffledQuestions = shuffleArray(goidon2L2aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 1 && CHAPTER == 1 {
            titleLabel.text = "Lesson 2"
            titleShadowLabel.text = "Lesson 2"
            chapterLabel.text = "641〜650"
            shuffledQuestions = shuffleArray(goidon2L2barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 1 && CHAPTER == 2 {
            titleLabel.text = "Lesson 2"
            titleShadowLabel.text = "Lesson 2"
            chapterLabel.text = "651〜660"
            shuffledQuestions = shuffleArray(goidon2L2carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 2 && CHAPTER == 0 {
            titleLabel.text = "Lesson 3"
            titleShadowLabel.text = "Lesson 3"
            chapterLabel.text = "661〜670"
            shuffledQuestions = shuffleArray(goidon2L3aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 2 && CHAPTER == 1 {
            titleLabel.text = "Lesson 3"
            titleShadowLabel.text = "Lesson 3"
            chapterLabel.text = "671〜680"
            shuffledQuestions = shuffleArray(goidon2L3barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 2 && CHAPTER == 2 {
            titleLabel.text = "Lesson 3"
            titleShadowLabel.text = "Lesson 3"
            chapterLabel.text = "681〜690"
            shuffledQuestions = shuffleArray(goidon2L3carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 3 && CHAPTER == 0 {
            titleLabel.text = "Lesson 4"
            titleShadowLabel.text = "Lesson 4"
            chapterLabel.text = "691〜700"
            shuffledQuestions = shuffleArray(goidon2L4aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 3 && CHAPTER == 1 {
            titleLabel.text = "Lesson 4"
            titleShadowLabel.text = "Lesson 4"
            chapterLabel.text = "701〜710"
            shuffledQuestions = shuffleArray(goidon2L4barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 3 && CHAPTER == 2 {
            titleLabel.text = "Lesson 4"
            titleShadowLabel.text = "Lesson 4"
            chapterLabel.text = "711〜720"
            shuffledQuestions = shuffleArray(goidon2L4carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 4 && CHAPTER == 0 {
            titleLabel.text = "Lesson 5"
            titleShadowLabel.text = "Lesson 5"
            chapterLabel.text = "721〜730"
            shuffledQuestions = shuffleArray(goidon2L5aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 4 && CHAPTER == 1 {
            titleLabel.text = "Lesson 5"
            titleShadowLabel.text = "Lesson 5"
            chapterLabel.text = "731〜740"
            shuffledQuestions = shuffleArray(goidon2L5barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 4 && CHAPTER == 2 {
            titleLabel.text = "Lesson 5"
            titleShadowLabel.text = "Lesson 5"
            chapterLabel.text = "741〜750"
            shuffledQuestions = shuffleArray(goidon2L5carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 5 && CHAPTER == 0 {
            titleLabel.text = "Lesson 6"
            titleShadowLabel.text = "Lesson 6"
            chapterLabel.text = "751〜760"
            shuffledQuestions = shuffleArray(goidon2L6aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 5 && CHAPTER == 1 {
            titleLabel.text = "Lesson 6"
            titleShadowLabel.text = "Lesson 6"
            chapterLabel.text = "761〜770"
            shuffledQuestions = shuffleArray(goidon2L6barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 5 && CHAPTER == 2 {
            titleLabel.text = "Lesson 6"
            titleShadowLabel.text = "Lesson 6"
            chapterLabel.text = "771〜780"
            shuffledQuestions = shuffleArray(goidon2L6carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 6 && CHAPTER == 0 {
            titleLabel.text = "Lesson 7"
            titleShadowLabel.text = "Lesson 7"
            chapterLabel.text = "781〜790"
            shuffledQuestions = shuffleArray(goidon2L7aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 6 && CHAPTER == 1 {
            titleLabel.text = "Lesson 7"
            titleShadowLabel.text = "Lesson 7"
            chapterLabel.text = "791〜800"
            shuffledQuestions = shuffleArray(goidon2L7barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 6 && CHAPTER == 2 {
            titleLabel.text = "Lesson 7"
            titleShadowLabel.text = "Lesson 7"
            chapterLabel.text = "801〜810"
            shuffledQuestions = shuffleArray(goidon2L7carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 7 && CHAPTER == 0 {
            titleLabel.text = "Lesson 8"
            titleShadowLabel.text = "Lesson 8"
            chapterLabel.text = "811〜820"
            shuffledQuestions = shuffleArray(goidon2L8aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 7 && CHAPTER == 1 {
            titleLabel.text = "Lesson 8"
            titleShadowLabel.text = "Lesson 8"
            chapterLabel.text = "821〜830"
            shuffledQuestions = shuffleArray(goidon2L8barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 7 && CHAPTER == 2 {
            titleLabel.text = "Lesson 8"
            titleShadowLabel.text = "Lesson 8"
            chapterLabel.text = "831〜840"
            shuffledQuestions = shuffleArray(goidon2L8carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 8 && CHAPTER == 0 {
            titleLabel.text = "Lesson 9"
            titleShadowLabel.text = "Lesson 9"
            chapterLabel.text = "841〜850"
            shuffledQuestions = shuffleArray(goidon2L9aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 8 && CHAPTER == 1 {
            titleLabel.text = "Lesson 9"
            titleShadowLabel.text = "Lesson 9"
            chapterLabel.text = "851〜860"
            shuffledQuestions = shuffleArray(goidon2L9barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 8 && CHAPTER == 2 {
            titleLabel.text = "Lesson 9"
            titleShadowLabel.text = "Lesson 9"
            chapterLabel.text = "861〜870"
            shuffledQuestions = shuffleArray(goidon2L9carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 9 && CHAPTER == 0 {
            titleLabel.text = "Lesson 10"
            titleShadowLabel.text = "Lesson 10"
            chapterLabel.text = "871〜880"
            shuffledQuestions = shuffleArray(goidon2L10aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 9 && CHAPTER == 1 {
            titleLabel.text = "Lesson 10"
            titleShadowLabel.text = "Lesson 10"
            chapterLabel.text = "881〜890"
            shuffledQuestions = shuffleArray(goidon2L10barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 9 && CHAPTER == 2 {
            titleLabel.text = "Lesson 10"
            titleShadowLabel.text = "Lesson 10"
            chapterLabel.text = "891〜900"
            shuffledQuestions = shuffleArray(goidon2L10carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 10 && CHAPTER == 0 {
            titleLabel.text = "Lesson 11"
            titleShadowLabel.text = "Lesson 11"
            chapterLabel.text = "901〜910"
            shuffledQuestions = shuffleArray(goidon2L11aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 10 && CHAPTER == 1 {
            titleLabel.text = "Lesson 11"
            titleShadowLabel.text = "Lesson 11"
            chapterLabel.text = "911〜920"
            shuffledQuestions = shuffleArray(goidon2L11barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 10 && CHAPTER == 2 {
            titleLabel.text = "Lesson 11"
            titleShadowLabel.text = "Lesson 11"
            chapterLabel.text = "921〜930"
            shuffledQuestions = shuffleArray(goidon2L11carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 11 && CHAPTER == 0 {
            titleLabel.text = "Lesson 12"
            titleShadowLabel.text = "Lesson 12"
            chapterLabel.text = "931〜940"
            shuffledQuestions = shuffleArray(goidon2L12aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 11 && CHAPTER == 1 {
            titleLabel.text = "Lesson 12"
            titleShadowLabel.text = "Lesson 12"
            chapterLabel.text = "941〜950"
            shuffledQuestions = shuffleArray(goidon2L12barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 11 && CHAPTER == 2 {
            titleLabel.text = "Lesson 12"
            titleShadowLabel.text = "Lesson 12"
            chapterLabel.text = "951〜960"
            shuffledQuestions = shuffleArray(goidon2L12carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 12 && CHAPTER == 0 {
            titleLabel.text = "Lesson 13"
            titleShadowLabel.text = "Lesson 13"
            chapterLabel.text = "961〜970"
            shuffledQuestions = shuffleArray(goidon2L13aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 12 && CHAPTER == 1 {
            titleLabel.text = "Lesson 13"
            titleShadowLabel.text = "Lesson 13"
            chapterLabel.text = "971〜980"
            shuffledQuestions = shuffleArray(goidon2L13barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 12 && CHAPTER == 2 {
            titleLabel.text = "Lesson 13"
            titleShadowLabel.text = "Lesson 13"
            chapterLabel.text = "981〜990"
            shuffledQuestions = shuffleArray(goidon2L13carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 13 && CHAPTER == 0 {
            titleLabel.text = "Lesson 14"
            titleShadowLabel.text = "Lesson 14"
            chapterLabel.text = "991〜1000"
            shuffledQuestions = shuffleArray(goidon2L14aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 13 && CHAPTER == 1 {
            titleLabel.text = "Lesson 14"
            titleShadowLabel.text = "Lesson 14"
            chapterLabel.text = "1001〜1010"
            shuffledQuestions = shuffleArray(goidon2L14barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 13 && CHAPTER == 2 {
            titleLabel.text = "Lesson 14"
            titleShadowLabel.text = "Lesson 14"
            chapterLabel.text = "1011〜1020"
            shuffledQuestions = shuffleArray(goidon2L14carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 14 && CHAPTER == 0 {
            titleLabel.text = "Lesson 15"
            titleShadowLabel.text = "Lesson 15"
            chapterLabel.text = "1021〜1030"
            shuffledQuestions = shuffleArray(goidon2L15aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 14 && CHAPTER == 1 {
            titleLabel.text = "Lesson 15"
            titleShadowLabel.text = "Lesson 15"
            chapterLabel.text = "1031〜1040"
            shuffledQuestions = shuffleArray(goidon2L15barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 14 && CHAPTER == 2 {
            titleLabel.text = "Lesson 15"
            titleShadowLabel.text = "Lesson 15"
            chapterLabel.text = "1041〜1050"
            shuffledQuestions = shuffleArray(goidon2L15carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 15 && CHAPTER == 0 {
            titleLabel.text = "Lesson 16"
            titleShadowLabel.text = "Lesson 16"
            chapterLabel.text = "1051〜1060"
            shuffledQuestions = shuffleArray(goidon2L16aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 15 && CHAPTER == 1 {
            titleLabel.text = "Lesson 16"
            titleShadowLabel.text = "Lesson 16"
            chapterLabel.text = "1061〜1070"
            shuffledQuestions = shuffleArray(goidon2L16barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 15 && CHAPTER == 2 {
            titleLabel.text = "Lesson 16"
            titleShadowLabel.text = "Lesson 16"
            chapterLabel.text = "1071〜1080"
            shuffledQuestions = shuffleArray(goidon2L16carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 16 && CHAPTER == 0 {
            titleLabel.text = "Lesson 17"
            titleShadowLabel.text = "Lesson 17"
            chapterLabel.text = "1081〜1090"
            shuffledQuestions = shuffleArray(goidon2L17aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 16 && CHAPTER == 1 {
            titleLabel.text = "Lesson 17"
            titleShadowLabel.text = "Lesson 17"
            chapterLabel.text = "1091〜1100"
            shuffledQuestions = shuffleArray(goidon2L17barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 16 && CHAPTER == 2 {
            titleLabel.text = "Lesson 17"
            titleShadowLabel.text = "Lesson 17"
            chapterLabel.text = "1101〜1110"
            shuffledQuestions = shuffleArray(goidon2L17carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 17 && CHAPTER == 0 {
            titleLabel.text = "Lesson 18"
            titleShadowLabel.text = "Lesson 18"
            chapterLabel.text = "1111〜1120"
            shuffledQuestions = shuffleArray(goidon2L18aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 17 && CHAPTER == 1 {
            titleLabel.text = "Lesson 18"
            titleShadowLabel.text = "Lesson 18"
            chapterLabel.text = "1121〜1130"
            shuffledQuestions = shuffleArray(goidon2L18barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 17 && CHAPTER == 2 {
            titleLabel.text = "Lesson 18"
            titleShadowLabel.text = "Lesson 18"
            chapterLabel.text = "1131〜1140"
            shuffledQuestions = shuffleArray(goidon2L18carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 18 && CHAPTER == 0 {
            titleLabel.text = "Lesson 19"
            titleShadowLabel.text = "Lesson 19"
            chapterLabel.text = "1141〜1150"
            shuffledQuestions = shuffleArray(goidon2L19aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 18 && CHAPTER == 1 {
            titleLabel.text = "Lesson 19"
            titleShadowLabel.text = "Lesson 19"
            chapterLabel.text = "1151〜1160"
            shuffledQuestions = shuffleArray(goidon2L19barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 18 && CHAPTER == 2 {
            titleLabel.text = "Lesson 19"
            titleShadowLabel.text = "Lesson 19"
            chapterLabel.text = "1161〜1170"
            shuffledQuestions = shuffleArray(goidon2L19carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 19 && CHAPTER == 0 {
            titleLabel.text = "Lesson 20"
            titleShadowLabel.text = "Lesson 20"
            chapterLabel.text = "1171〜1180"
            shuffledQuestions = shuffleArray(goidon2L20aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 19 && CHAPTER == 1 {
            titleLabel.text = "Lesson 20"
            titleShadowLabel.text = "Lesson 20"
            chapterLabel.text = "1181〜1190"
            shuffledQuestions = shuffleArray(goidon2L20barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 19 && CHAPTER == 2 {
            titleLabel.text = "Lesson 20"
            titleShadowLabel.text = "Lesson 20"
            chapterLabel.text = "1191〜1200"
            shuffledQuestions = shuffleArray(goidon2L20carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if GOIDON2 == 20 && CHAPTER == 0 {
            titleLabel.text = "For My Thesis"
            titleShadowLabel.text = "For My Thesis"
            chapterLabel.text = "1〜25"
            shuffledQuestions = shuffleArray(goidon2thesisarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        }
    }
    
    // 問題の配列をランダムにシャッフルする関数
    func shuffleArray(_ array: [[String:String]]) -> [[String:String]] {
        var newArray = array
        for i in 0..<newArray.count {
            let randomIndex = Int.random(in: i..<newArray.count)
            let temp = newArray[i]
            newArray[i] = newArray[randomIndex]
            newArray[randomIndex] = temp
        }
        return newArray
    }
    
    @IBAction func tapCheckButton() {
        
        guard let answer = textField.text else { return }
        
        let currentQuestionArray: [Dictionary<String, String>]
        
        if GOIDON2 == 0 && CHAPTER == 0 {
            currentQuestionArray = goidon2L1aarray
        } else if GOIDON2 == 0 && CHAPTER == 1 {
            currentQuestionArray = goidon2L1barray
        } else if GOIDON2 == 0 && CHAPTER == 2 {
            currentQuestionArray = goidon2L1carray
        } else if GOIDON2 == 1 && CHAPTER == 0 {
            currentQuestionArray = goidon2L2aarray
        } else if GOIDON2 == 1 && CHAPTER == 1 {
            currentQuestionArray = goidon2L2barray
        } else if GOIDON2 == 1 && CHAPTER == 2 {
            currentQuestionArray = goidon2L2carray
        } else if GOIDON2 == 2 && CHAPTER == 0 {
            currentQuestionArray = goidon2L3aarray
        } else if GOIDON2 == 2 && CHAPTER == 1 {
            currentQuestionArray = goidon2L3barray
        } else if GOIDON2 == 2 && CHAPTER == 2 {
            currentQuestionArray = goidon2L3carray
        } else if GOIDON2 == 3 && CHAPTER == 0 {
            currentQuestionArray = goidon2L4aarray
        } else if GOIDON2 == 3 && CHAPTER == 1 {
            currentQuestionArray = goidon2L4barray
        } else if GOIDON2 == 3 && CHAPTER == 2 {
            currentQuestionArray = goidon2L4carray
        } else if GOIDON2 == 4 && CHAPTER == 0 {
            currentQuestionArray = goidon2L5aarray
        } else if GOIDON2 == 4 && CHAPTER == 1 {
            currentQuestionArray = goidon2L5barray
        } else if GOIDON2 == 4 && CHAPTER == 2 {
            currentQuestionArray = goidon2L5carray
        } else if GOIDON2 == 5 && CHAPTER == 0 {
            currentQuestionArray = goidon2L6aarray
        } else if GOIDON2 == 5 && CHAPTER == 1 {
            currentQuestionArray = goidon2L6barray
        } else if GOIDON2 == 5 && CHAPTER == 2 {
            currentQuestionArray = goidon2L6carray
        } else if GOIDON2 == 6 && CHAPTER == 0 {
            currentQuestionArray = goidon2L7aarray
        } else if GOIDON2 == 6 && CHAPTER == 1 {
            currentQuestionArray = goidon2L7barray
        } else if GOIDON2 == 6 && CHAPTER == 2 {
            currentQuestionArray = goidon2L7carray
        } else if GOIDON2 == 7 && CHAPTER == 0 {
            currentQuestionArray = goidon2L8aarray
        } else if GOIDON2 == 7 && CHAPTER == 1 {
            currentQuestionArray = goidon2L8barray
        } else if GOIDON2 == 7 && CHAPTER == 2 {
            currentQuestionArray = goidon2L8carray
        } else if GOIDON2 == 8 && CHAPTER == 0 {
            currentQuestionArray = goidon2L9aarray
        } else if GOIDON2 == 8 && CHAPTER == 1 {
            currentQuestionArray = goidon2L9barray
        } else if GOIDON2 == 8 && CHAPTER == 2 {
            currentQuestionArray = goidon2L9carray
        } else if GOIDON2 == 9 && CHAPTER == 0 {
            currentQuestionArray = goidon2L10aarray
        } else if GOIDON2 == 9 && CHAPTER == 1 {
            currentQuestionArray = goidon2L10barray
        } else if GOIDON2 == 9 && CHAPTER == 2 {
            currentQuestionArray = goidon2L10carray
        } else if GOIDON2 == 10 && CHAPTER == 0 {
            currentQuestionArray = goidon2L11aarray
        } else if GOIDON2 == 10 && CHAPTER == 1 {
            currentQuestionArray = goidon2L11barray
        } else if GOIDON2 == 10 && CHAPTER == 2 {
            currentQuestionArray = goidon2L11carray
        } else if GOIDON2 == 11 && CHAPTER == 0 {
            currentQuestionArray = goidon2L12aarray
        } else if GOIDON2 == 11 && CHAPTER == 1 {
            currentQuestionArray = goidon2L12barray
        } else if GOIDON2 == 11 && CHAPTER == 2 {
            currentQuestionArray = goidon2L12carray
        } else if GOIDON2 == 12 && CHAPTER == 0 {
            currentQuestionArray = goidon2L13aarray
        } else if GOIDON2 == 12 && CHAPTER == 1 {
            currentQuestionArray = goidon2L13barray
        } else if GOIDON2 == 12 && CHAPTER == 2 {
            currentQuestionArray = goidon2L13carray
        } else if GOIDON2 == 13 && CHAPTER == 0 {
            currentQuestionArray = goidon2L14aarray
        } else if GOIDON2 == 13 && CHAPTER == 1 {
            currentQuestionArray = goidon2L14barray
        } else if GOIDON2 == 13 && CHAPTER == 2 {
            currentQuestionArray = goidon2L14carray
        } else if GOIDON2 == 14 && CHAPTER == 0 {
            currentQuestionArray = goidon2L15aarray
        } else if GOIDON2 == 14 && CHAPTER == 1 {
            currentQuestionArray = goidon2L15barray
        } else if GOIDON2 == 14 && CHAPTER == 2 {
            currentQuestionArray = goidon2L15carray
        } else if GOIDON2 == 15 && CHAPTER == 0 {
            currentQuestionArray = goidon2L16aarray
        } else if GOIDON2 == 15 && CHAPTER == 1 {
            currentQuestionArray = goidon2L16barray
        } else if GOIDON2 == 15 && CHAPTER == 2 {
            currentQuestionArray = goidon2L16carray
        } else if GOIDON2 == 16 && CHAPTER == 0 {
            currentQuestionArray = goidon2L17aarray
        } else if GOIDON2 == 16 && CHAPTER == 1 {
            currentQuestionArray = goidon2L17barray
        } else if GOIDON2 == 16 && CHAPTER == 2 {
            currentQuestionArray = goidon2L17carray
        } else if GOIDON2 == 17 && CHAPTER == 0 {
            currentQuestionArray = goidon2L18aarray
        } else if GOIDON2 == 17 && CHAPTER == 1 {
            currentQuestionArray = goidon2L18barray
        } else if GOIDON2 == 17 && CHAPTER == 2 {
            currentQuestionArray = goidon2L18carray
        } else if GOIDON2 == 18 && CHAPTER == 0 {
            currentQuestionArray = goidon2L19aarray
        } else if GOIDON2 == 18 && CHAPTER == 1 {
            currentQuestionArray = goidon2L19barray
        } else if GOIDON2 == 18 && CHAPTER == 2 {
            currentQuestionArray = goidon2L19carray
        } else if GOIDON2 == 19 && CHAPTER == 0 {
            currentQuestionArray = goidon2L20aarray
        } else if GOIDON2 == 19 && CHAPTER == 1 {
            currentQuestionArray = goidon2L20barray
        } else if GOIDON2 == 19 && CHAPTER == 2 {
            currentQuestionArray = goidon2L20carray
        } else if GOIDON2 == 20 && CHAPTER == 0 {
            currentQuestionArray = goidon2thesisarray
        } else {
            return
        }
    
        let currentQuestion = shuffledQuestions[currentQuestionIndex]
        let shuffledAnswer = currentQuestion["hiragana"]
        
        if answer == shuffledAnswer {
            // 正解の場合の処理
            checkmarkImageView.isHidden = false
            goodjobLabel.isHidden = false
            
            if currentQuestionIndex < shuffledQuestions.count - 1 {
                currentQuestionIndex += 1
                let nextQuestion = shuffledQuestions[currentQuestionIndex]
                kanjiLabel.text = nextQuestion["kanji"]
                
                textField.text = ""
            } else {
                // 不正解の場合の処理
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let goidon2QuizViewController = storyboard.instantiateViewController(withIdentifier: "Goidon2QuizViewController") as! Goidon2QuizViewController
                    self.navigationController?.pushViewController(goidon2QuizViewController, animated: true)
                }
                return
            }
        } else {
            relearnImageView.isHidden = false
            kotaeLabel.isHidden = false
            kotaeLabel.text = shuffledAnswer
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.checkmarkImageView.isHidden = true
            self.goodjobLabel.isHidden = true
            self.relearnImageView.isHidden = true
            self.kotaeLabel.isHidden = true
        }
    }
    
}
