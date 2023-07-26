//
//  GoidonQuizViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/07/14.
//

import UIKit

class GoidonQuizViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var greenView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleShadowLabel: UILabel!
    @IBOutlet var chapterLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var meaningLabel: UILabel!
    @IBOutlet var checkmarkImageView: UIImageView!
    @IBOutlet var goodjobLabel: UILabel!
    @IBOutlet var relearnImageView: UIImageView!
    @IBOutlet var kotaeLabel: UILabel!
    @IBOutlet var yomiganaLabel: UILabel!
    
    var currentArray: [[String: String]] = []
    var index = 0
    
    var CHAPTER: Int = 0
    var GOIDON1: Int = 0
    
    var goidon1L1aarray = [
        ["hiragana":"れべる","kanji":"レベル","meaning":"level"],
        ["hiragana":"せつめい","kanji":"説明する","meaning":"to explain"],
        ["hiragana":"ちから","kanji":"力","meaning":"force; power"],
        ["hiragana":"りょく","kanji":"–力","meaning":"force of..."],
        ["hiragana":"かんがえる","kanji":"考える","meaning":"to think"],
        ["hiragana":"たとえば","kanji":"例えば","meaning":"for example"],
        ["hiragana":"くらべる","kanji":"比べる","meaning":"to compare"],
        ["hiragana":"てん","kanji":"点","meaning":"point"],
        ["hiragana":"かんけい","kanji":"関係する","meaning":"to relate"],
        ["hiragana":"げんじつ","kanji":"現実","meaning":"reality"],
        ["hiragana":"てき","kanji":"–的","meaning":"-ish; -wise"]
    ]
    var goidon1L1barray = [
        ["hiragana":"ほか","kanji":"他","meaning":"other"],
        ["hiragana":"づけ","kanji":"–付け","meaning":"dated; as of; effective"],
        ["hiragana":"せいかつ","kanji":"生活する","meaning":"to live; make a living"],
        ["hiragana":"しゃかい","kanji":"社会","meaning":"society"],
        ["hiragana":"でんし","kanji":"電子","meaning":"electronic"],
        ["hiragana":"かする","kanji":"–化する","meaning":"-ize"],
        ["hiragana":"はじめ","kanji":"初め","meaning":"beginning"],
        ["hiragana":"いちする","kanji":"位置する","meaning":"to position"],
        ["hiragana":"ほとんど","kanji":"ほとんど","meaning":"almost"],
        ["hiragana":"こんぴゅーたー","kanji":"コンピューター","meaning":"computer"]
    ]
    var goidon1L1carray = [
        ["hiragana":"じてん","kanji":"時点","meaning":"point in time"],
        ["hiragana":"おこなう","kanji":"行う","meaning":"to perform"],
        ["hiragana":"けんとうする","kanji":"検討する","meaning":"to consider; to study; to examine"],
        ["hiragana":"とくていする","kanji":"特定する","meaning":"to specify"],
        ["hiragana":"ひっしゃ","kanji":"筆者","meaning":"author"],
        ["hiragana":"ため","kanji":"ため","meaning":"for the sake of"],
        ["hiragana":"こうい","kanji":"行為","meaning":"action"],
        ["hiragana":"とくに","kanji":"特に","meaning":"especially"],
        ["hiragana":"もくてき","kanji":"目的","meaning":"purpose"],
        ["hiragana":"うんどうする","kanji":"運動する","meaning":"to exercise"]
    ]
    var goidon1L2aarray = [
        ["hiragana":"こうぎ","kanji":"講義","meaning":"to give a lecture"],
        ["hiragana":"ひじょう","kanji":"非常","meaning":"emergency"],
        ["hiragana":"とくべつ","kanji":"特別","meaning":"special"],
        ["hiragana":"ちゅうもく","kanji":"注目","meaning":"to pay attention; to focus on"],
        ["hiragana":"いいかえる","kanji":"言い換える","meaning":"to rephrase"],
        ["hiragana":"じゅうぶん","kanji":"十分","meaning":"sufficient"],
        ["hiragana":"わける","kanji":"分ける","meaning":"to divide"],
        ["hiragana":"かつどう","kanji":"活動","meaning":"activity"],
        ["hiragana":"とりくみ","kanji":"取り組み","meaning":"initiative"],
        ["hiragana":"こうけんする","kanji":"貢献する","meaning":"to contribute"]
    ]
    
    var goidon1L2barray = [
        ["hiragana":"こんご","kanji":"今後","meaning":"future"],
        ["hiragana":"だんたい","kanji":"団体","meaning":"organization"],
        ["hiragana":"あらわす","kanji":"表す","meaning":"to indicate"],
        ["hiragana":"いか","kanji":"以下","meaning":"below; under; less than"],
        ["hiragana":"いっぽう","kanji":"一方","meaning":"on the other hand"],
        ["hiragana":"いじょう","kanji":"以上","meaning":"above; over; more than"],
        ["hiragana":"あきらか","kanji":"明らか","meaning":"evident; clear; obvious"],
        ["hiragana":"こうちくする","kanji":"構築する","meaning":"to construct"],
        ["hiragana":"ひつよう","kanji":"必要","meaning":"necessary"],
        ["hiragana":"ちぇっくする","kanji":"チェックする","meaning":"to check"]
    ]
    
    var goidon1L2carray = [
        ["hiragana":"ぼうだい","kanji":"膨大","meaning":"enormous"],
        ["hiragana":"あるいは","kanji":"あるいは","meaning":"or"],
        ["hiragana":"ほうほう","kanji":"方法","meaning":"method"],
        ["hiragana":"しすてむ","kanji":"システム","meaning":"system"],
        ["hiragana":"りょう","kanji":"量","meaning":"quantity"],
        ["hiragana":"ある","kanji":"ある","meaning":"to exist"],
        ["hiragana":"もちいる","kanji":"用いる","meaning":"to use"],
        ["hiragana":"おおく","kanji":"多く","meaning":"galore; a great deal"],
        ["hiragana":"たいりょう","kanji":"大量","meaning":"large amount"],
        ["hiragana":"しょうひする","kanji":"消費する","meaning":"to consume"]
    ]
    
    var goidon1L3aarray = [
        ["hiragana":"しょうかいする","kanji":"紹介する","meaning":"to introduce"],
        ["hiragana":"かんしする","kanji":"監視する","meaning":"to monitor"],
        ["hiragana":"せんたー","kanji":"センター","meaning":"center"],
        ["hiragana":"やくわり","kanji":"役割","meaning":"role"],
        ["hiragana":"おもに","kanji":"主に","meaning":"mainly"],
        ["hiragana":"さまざま","kanji":"様々","meaning":"various"],
        ["hiragana":"まとめる","kanji":"まとめる","meaning":"to summarize"],
        ["hiragana":"かい","kanji":"会","meaning":"meeting"],
        ["hiragana":"むける","kanji":"向ける","meaning":"to direct"],
        ["hiragana":"ていあん","kanji":"提案","meaning":"proposal"]
    ]
    
    var goidon1L3barray = [
        ["hiragana":"じょうきょう","kanji":"状況","meaning":"situation"],
        ["hiragana":"ぎもん","kanji":"疑問","meaning":"question"],
        ["hiragana":"かいいん","kanji":"会員","meaning":"member; the membership"],
        ["hiragana":"じゅんびする","kanji":"準備する","meaning":"to prepare"],
        ["hiragana":"はってんする","kanji":"発展する","meaning":"to develop"],
        ["hiragana":"こみゅにけーしょんする","kanji":"コミュニケーションする","meaning":"to communicate"],
        ["hiragana":"つながる","kanji":"つながる","meaning":"to connect"],
        ["hiragana":"ちり","kanji":"地理","meaning":"geography"],
        ["hiragana":"じゆう","kanji":"自由","meaning":"freedom"],
        ["hiragana":"みとめる","kanji":"認める","meaning":"to acknowledge; to admit; to allow"]
    ]
    
    var goidon1L3carray = [
        ["hiragana":"けいかく","kanji":"計画","meaning":"to plan"],
        ["hiragana":"すすめる","kanji":"進める","meaning":"to proceed"],
        ["hiragana":"すべて","kanji":"全て","meaning":"all"],
        ["hiragana":"けいけんする","kanji":"経験する","meaning":"to experience"],
        ["hiragana":"きゅうそく","kanji":"急速","meaning":"rapid"],
        ["hiragana":"ゆうこう","kanji":"有効","meaning":"effective"],
        ["hiragana":"せいふ","kanji":"政府","meaning":"government"],
        ["hiragana":"おぎなう","kanji":"補う","meaning":"to supplement"],
        ["hiragana":"どうよう","kanji":"同様","meaning":"similar"],
        ["hiragana":"せい","kanji":"-性","meaning":"-ity; -ness"]
    ]
    
    var goidon1L4aarray = [
        ["hiragana":"しゅるい","kanji":"種類","meaning":"type"],
        ["hiragana":"せいぶつ","kanji":"生物","meaning":"organism"],
        ["hiragana":"ことなる","kanji":"異なる","meaning":"different"],
        ["hiragana":"はったつする","kanji":"発達する","meaning":"to develop"],
        ["hiragana":"ゆうり","kanji":"有利","meaning":"advantageous"],
        ["hiragana":"のべる","kanji":"述べる","meaning":"to state"],
        ["hiragana":"もとづく","kanji":"基づく","meaning":"to be based on"],
        ["hiragana":"ぶつり","kanji":"物理","meaning":"physics"],
        ["hiragana":"がく","kanji":"-学","meaning":"-ology"],
        ["hiragana":"でーた","kanji":"データ","meaning":"data"]
    ]
    
    var goidon1L4barray = [
        ["hiragana":"にちじょう","kanji":"日常","meaning":"everyday; ordinary; regular"],
        ["hiragana":"たいけい","kanji":"体系","meaning":"system"],
        ["hiragana":"かがく","kanji":"科学","meaning":"science"],
        ["hiragana":"きょうそうする","kanji":"競争する","meaning":"to compete"],
        ["hiragana":"とくちょう","kanji":"特徴","meaning":"characteristic"],
        ["hiragana":"とむ","kanji":"富む","meaning":"to abound"],
        ["hiragana":"ふくめる","kanji":"含める","meaning":"to include"],
        ["hiragana":"いめーじする","kanji":"イメージする","meaning":"to imagine; to picture"],
        ["hiragana":"けっか","kanji":"結果","meaning":"result"],
        ["hiragana":"ぎじゅつ","kanji":"技術","meaning":"technology"]
    ]
    
    var goidon1L4carray = [
        ["hiragana":"かたち","kanji":"形","meaning":"form"],
        ["hiragana":"かぎる","kanji":"限る","meaning":"to limit"],
        ["hiragana":"ようい","kanji":"容易","meaning":"easy"],
        ["hiragana":"だいひょうする","kanji":"代表する","meaning":"to represent"],
        ["hiragana":"ちーむ","kanji":"チーム","meaning":"team"],
        ["hiragana":"きょくたん","kanji":"極端","meaning":"extreme"],
        ["hiragana":"ぜんたい","kanji":"全体","meaning":"whole"],
        ["hiragana":"ぜんごする","kanji":"前後する","meaning":"go back and forth; give or take"],
        ["hiragana":"いどうする","kanji":"移動する","meaning":"to move"],
        ["hiragana":"すう","kanji":"-数","meaning":"number of..."]
    ]
    
    var goidon1L5aarray = [
        ["hiragana":"はいけい","kanji":"背景","meaning":"background"],
        ["hiragana":"ひかり","kanji":"光","meaning":"light"],
        ["hiragana":"はんしゃする","kanji":"反射する","meaning":"to reflect"],
        ["hiragana":"めんせき","kanji":"面積","meaning":"area"],
        ["hiragana":"ひとしい","kanji":"等しい","meaning":"equal"],
        ["hiragana":"しゅだん","kanji":"手段","meaning":"means"],
        ["hiragana":"しょうがい","kanji":"障害","meaning":"obstacle"],
        ["hiragana":"とりあげる","kanji":"取り上げる","meaning":"to address"],
        ["hiragana":"まず","kanji":"まず","meaning":"first of all"],
        ["hiragana":"とうめい","kanji":"透明","meaning":"transparent"]
    ]
    
    var goidon1L5barray = [
        ["hiragana":"ぶんるいする","kanji":"分類する","meaning":"to classify"],
        ["hiragana":"いこう","kanji":"以降","meaning":"from now on"],
        ["hiragana":"わりあい","kanji":"割合","meaning":"proportion"],
        ["hiragana":"かてごりー","kanji":"カテゴリー","meaning":"category"],
        ["hiragana":"あてはまる","kanji":"当てはまる","meaning":"to be applicable; to fulfill; to apply"],
        ["hiragana":"ぜんしゃ","kanji":"前者","meaning":"former"],
        ["hiragana":"きゅうしゅうする","kanji":"吸収する","meaning":"to absorb"],
        ["hiragana":"こうしゃ","kanji":"後者","meaning":"latter"],
        ["hiragana":"かんぜん","kanji":"完全","meaning":"complete"],
        ["hiragana":"ず","kanji":"図","meaning":"figure"]
    ]
    
    var goidon1L5carray = [
        ["hiragana":"ひょう","kanji":"表","meaning":"table; chart"],
        ["hiragana":"てきする","kanji":"適する","meaning":"to suit"],
        ["hiragana":"らいふ","kanji":"ライフ","meaning":"life"],
        ["hiragana":"しき","kanji":"式","meaning":"equation; formula; ceremony"],
        ["hiragana":"ちゅうし","kanji":"中止","meaning":"to cancel"],
        ["hiragana":"あいであ","kanji":"アイデア","meaning":"idea"],
        ["hiragana":"すうがく","kanji":"数学","meaning":"mathematics"],
        ["hiragana":"しけんする","kanji":"試験する","meaning":"to examine; to test"],
        ["hiragana":"たんい","kanji":"単位","meaning":"unit"],
        ["hiragana":"あたい","kanji":"値","meaning":"value"],
        ["hiragana":"ち","kanji":"-値","meaning":"value of..."]
    ]
    
    var goidon1L6aarray = [
        
        ["hiragana":"じんこう","kanji":"人口","meaning":"population"],
        ["hiragana":"とうけい","kanji":"統計","meaning":"statistics"],
        ["hiragana":"はっぴょうする","kanji":"発表する","meaning":"to present"],
        ["hiragana":"もっとも","kanji":"最も","meaning":"most"],
        ["hiragana":"やく","kanji":"約","meaning":"approximately"],
        ["hiragana":"ばい","kanji":"-倍","meaning":"-times"],
        ["hiragana":"ほうこくする","kanji":"報告する","meaning":"to report"],
        ["hiragana":"かかわる","kanji":"関わる","meaning":"to be involved"],
        ["hiragana":"きけん","kanji":"危険","meaning":"danger"],
        ["hiragana":"さぎょうする","kanji":"作業する","meaning":"to work"]
    ]
    
    var goidon1L6barray = [
        ["hiragana":"つく","kanji":"就く","meaning":"to take (seat, position, course, etc.)"],
        ["hiragana":"はんすう","kanji":"半数","meaning":"half"],
        ["hiragana":"かんする","kanji":"関する","meaning":"related to"],
        ["hiragana":"けいさんする","kanji":"計算する","meaning":"to calculate"],
        ["hiragana":"さーびすする","kanji":"サービスする","meaning":"to serve"],
        ["hiragana":"ぎょう","kanji":"-業","meaning":"-industry"],
        ["hiragana":"めでぃあ","kanji":"メディア","meaning":"media"],
        ["hiragana":"ちいき","kanji":"地域","meaning":"region"],
        ["hiragana":"える","kanji":"得る","meaning":"to obtain"],
        ["hiragana":"でじたる","kanji":"デジタル","meaning":"digital"]
    ]
    
    var goidon1L6carray = [
        ["hiragana":"しょりする","kanji":"処理する","meaning":"to process"],
        ["hiragana":"ほうりつ","kanji":"法律","meaning":"law"],
        ["hiragana":"こうぎょう","kanji":"工業","meaning":"industrial"],
        ["hiragana":"さんぎょう","kanji":"産業","meaning":"industry"],
        ["hiragana":"ちょうき","kanji":"長期","meaning":"long-term"],
        ["hiragana":"けいたい","kanji":"形態","meaning":"form"],
        ["hiragana":"すいていする","kanji":"推定する","meaning":"to estimate"],
        ["hiragana":"だい","kanji":"-代","meaning":"-generation; cost of...; fee of..."],
        ["hiragana":"じゅん","kanji":"順","meaning":"order; turn"],
        ["hiragana":"あたり","kanji":"-当たり","meaning":"per capita"]
    ]
    
    var goidon1L7aarray = [
        ["hiragana":"しぜん","kanji":"自然","meaning":"nature"],
        ["hiragana":"がっぺいする","kanji":"合併する","meaning":"to merge"],
        ["hiragana":"じたい","kanji":"自体","meaning":"itself"],
        ["hiragana":"かち","kanji":"価値","meaning":"value"],
        ["hiragana":"あんぜん","kanji":"安全","meaning":"safety"],
        ["hiragana":"でんとう","kanji":"伝統","meaning":"tradition"],
        ["hiragana":"しげきする","kanji":"刺激する","meaning":"to stimulate"],
        ["hiragana":"もでる","kanji":"モデル","meaning":"model"],
        ["hiragana":"どうさ","kanji":"動作","meaning":"action"],
        ["hiragana":"さくせいする","kanji":"作成する","meaning":"to create"]
    ]
    
    var goidon1L7barray = [
        ["hiragana":"はたらき","kanji":"働き","meaning":"function"],
        ["hiragana":"みっせつ","kanji":"密接","meaning":"close"],
        ["hiragana":"じょうたい","kanji":"状態","meaning":"state"],
        ["hiragana":"えいきょうする","kanji":"影響する","meaning":"influence"],
        ["hiragana":"あんていする","kanji":"安定する","meaning":"to stabilize"],
        ["hiragana":"ほしょうする","kanji":"保障する","meaning":"to guarantee"],
        ["hiragana":"しょく","kanji":"職","meaning":"occupation"],
        ["hiragana":"げんだい","kanji":"現代","meaning":"modern"],
        ["hiragana":"もとめる","kanji":"求める","meaning":"to seek"],
        ["hiragana":"じょうほう","kanji":"情報","meaning":"information"]
    ]
    
    var goidon1L7carray = [
        ["hiragana":"どうこう","kanji":"動向","meaning":"trend"],
        ["hiragana":"さいしん","kanji":"最新","meaning":"latest"],
        ["hiragana":"とし","kanji":"都市","meaning":"city; urban"],
        ["hiragana":"せいさんする","kanji":"生産する","meaning":"to produce"],
        ["hiragana":"いわば","kanji":"言わば","meaning":"so to speak"],
        ["hiragana":"どくじ","kanji":"独自","meaning":"unique"],
        ["hiragana":"びじゅつ","kanji":"美術","meaning":"fine arts"],
        ["hiragana":"しゅうだん","kanji":"集団","meaning":"group"],
        ["hiragana":"すくりーん","kanji":"スクリーン","meaning":"screen"],
        ["hiragana":"かいほう","kanji":"開放(する)","meaning":"to open; to open up"]
    ]
    
    var goidon1L8aarray = [
        ["hiragana":"たいしょう","kanji":"対象","meaning":"subject; target"],
        ["hiragana":"いしきする","kanji":"意識する","meaning":"to be conscious; to be aware of"],
        ["hiragana":"およぶ","kanji":"及ぶ","meaning":"to reach; to be a match (for)"],
        ["hiragana":"ようそ","kanji":"要素","meaning":"element"],
        ["hiragana":"ついきゅうする","kanji":"追求する","meaning":"to pursue"],
        ["hiragana":"ていきょうする","kanji":"提供する","meaning":"to provide"],
        ["hiragana":"とうにゅうする","kanji":"投入する","meaning":"to input; to put in; to throw in"],
        ["hiragana":"うみだす","kanji":"生み出す","meaning":"to generate"],
        ["hiragana":"むじゅんする","kanji":"矛盾する","meaning":"to contradict"],
        ["hiragana":"じょうけん","kanji":"条件","meaning":"condition"]
    ]
    
    var goidon1L8barray = [
        ["hiragana":"いじする","kanji":"維持する","meaning":"to maintain"],
        ["hiragana":"どうじ","kanji":"同時","meaning":"simultaneous; same time"],
        ["hiragana":"てっていする","kanji":"徹底する","meaning":"thorough"],
        ["hiragana":"りょうほう","kanji":"両方","meaning":"both"],
        ["hiragana":"ぜんぱん","kanji":"全般","meaning":"general"],
        ["hiragana":"ながれ","kanji":"流れ","meaning":"flow; stream"],
        ["hiragana":"じゅんじょ","kanji":"順序","meaning":"order; sequence"],
        ["hiragana":"えがく","kanji":"描く","meaning":"to depict"],
        ["hiragana":"そなえる","kanji":"備える","meaning":"to possess; to equip; to prepare for"],
        ["hiragana":"ぶんや","kanji":"分野","meaning":"field; division"]
    ]
    
    var goidon1L8carray = [
        ["hiragana":"よみとる","kanji":"読み取る","meaning":"to read (a calibration, a tape, etc.)"],
        ["hiragana":"きょうゆうする","kanji":"共有する","meaning":"to share"],
        ["hiragana":"ちゃんねる","kanji":"チャンネル","meaning":"channel"],
        ["hiragana":"すてーじ","kanji":"ステージ","meaning":"stage"],
        ["hiragana":"きょうかんする","kanji":"共感する","meaning":"to empathize"],
        ["hiragana":"しゅりゅう","kanji":"主流","meaning":"mainstream"],
        ["hiragana":"とくしょく","kanji":"特色","meaning":"characteristic; feature"],
        ["hiragana":"くわえる","kanji":"加える","meaning":"to add"],
        ["hiragana":"ほうこう","kanji":"方向","meaning":"direction"],
        ["hiragana":"そざいする","kanji":"存在する","meaning":"to exist"]
    ]
    
    var goidon1L9aarray = [
        ["hiragana":"ちゅうおう","kanji":"中央","meaning":"central"],
        ["hiragana":"こうどうする","kanji":"行動する","meaning":"to take action; to behave"],
        ["hiragana":"しゅうごうする","kanji":"集合する","meaning":"to gather"],
        ["hiragana":"おのおの","kanji":"おのおの","meaning":"each"],
        ["hiragana":"せんたくする","kanji":"選択する","meaning":"to make a choice"],
        ["hiragana":"したがう","kanji":"従う","meaning":"to obey"],
        ["hiragana":"きほん","kanji":"基本","meaning":"basic"],
        ["hiragana":"ちょくせつ","kanji":"直接","meaning":"direct"],
        ["hiragana":"つまり","kanji":"つまり","meaning":"in other words; that is"],
        ["hiragana":"わーく","kanji":"ワーク","meaning":"work; exercise book"]
    ]
    
    var goidon1L9barray = [
        ["hiragana":"かんさつする","kanji":"観察する","meaning":"to observe"],
        ["hiragana":"せいかく","kanji":"正確","meaning":"accurate"],
        ["hiragana":"きろくする","kanji":"記録する","meaning":"to record"],
        ["hiragana":"つくりだす","kanji":"作り出す","meaning":"to create"],
        ["hiragana":"あたえる","kanji":"与える","meaning":"to give (esp. to someone of lower status)"],
        ["hiragana":"およぼす","kanji":"及ぼす","meaning":"to exert"],
        ["hiragana":"ちょうさする","kanji":"調査する","meaning":"to investigate"],
        ["hiragana":"たんどく","kanji":"単独","meaning":"single; sole; individual"],
        ["hiragana":"ふくすう","kanji":"複数","meaning":"multiple"],
        ["hiragana":"してん","kanji":"視点","meaning":"perspective; point of view"]
    ]
    
    var goidon1L9carray = [
        ["hiragana":"たいしょうする","kanji":"対照する","meaning":"to contrast"],
        ["hiragana":"じんけん","kanji":"人権","meaning":"human rights"],
        ["hiragana":"たいする","kanji":"対する","meaning":"to face; to observe; be in response to"],
        ["hiragana":"たいむ","kanji":"タイム","meaning":"time"],
        ["hiragana":"さい","kanji":"際","meaning":"occasion; at the time of..."],
        ["hiragana":"みらい","kanji":"未来","meaning":"future"],
        ["hiragana":"めいかく","kanji":"明確","meaning":"clear; distinct"],
        ["hiragana":"いいん","kanji":"委員","meaning":"committee member"],
        ["hiragana":"しゅよう","kanji":"主要","meaning":"major"],
        ["hiragana":"かんせつ","kanji":"間接","meaning":"indirect"]
    ]
    
    var goidon1L10aarray = [
        ["hiragana":"ぞくする","kanji":"属する","meaning":"to belong"],
        ["hiragana":"しょう","kanji":"章","meaning":"chapter"],
        ["hiragana":"そうご","kanji":"相互","meaning":"mutual"],
        ["hiragana":"けつろんする","kanji":"結論する","meaning":"to conclude"],
        ["hiragana":"たんに","kanji":"単に","meaning":"simply"],
        ["hiragana":"こうりゅうする","kanji":"交流する","meaning":"to interact"],
        ["hiragana":"じぎょう","kanji":"事業","meaning":"business"],
        ["hiragana":"たよう","kanji":"多様","meaning":"diverse"],
        ["hiragana":"せっする","kanji":"接する","meaning":"to interact with"],
        ["hiragana":"しょうじる","kanji":"生じる","meaning":"to occur"]
    ]
    
    var goidon1L10barray = [
        ["hiragana":"すむーず","kanji":"スムーズ","meaning":"smooth"],
        ["hiragana":"じっけんする","kanji":"実験する","meaning":"to experiment"],
        ["hiragana":"ぱたーん","kanji":"パターン","meaning":"pattern"],
        ["hiragana":"ぜんこく","kanji":"全国","meaning":"nationwide"],
        ["hiragana":"こえる","kanji":"超える","meaning":"to surpass"],
        ["hiragana":"こころみ","kanji":"試み","meaning":"attempt"],
        ["hiragana":"しゃ","kanji":"-者","meaning":"-person; -er"],
        ["hiragana":"せいど","kanji":"制度","meaning":"system"],
        ["hiragana":"てきようする","kanji":"適用する","meaning":"to apply"],
        ["hiragana":"はんい","kanji":"範囲","meaning":"scope"]
    ]
    
    var goidon1L10carray = [
        ["hiragana":"せいげんする","kanji":"制限する","meaning":"to limit"],
        ["hiragana":"しょざいする","kanji":"所在する","meaning":"to be located"],
        ["hiragana":"かんりする","kanji":"管理する","meaning":"to manage"],
        ["hiragana":"しゅくしょうする","kanji":"縮小する","meaning":"to reduce; to shrink"],
        ["hiragana":"こくど","kanji":"国土","meaning":"territory"],
        ["hiragana":"のぞく","kanji":"除く","meaning":"to exclude"],
        ["hiragana":"けいかする","kanji":"経過する","meaning":"to progress"],
        ["hiragana":"さいようする","kanji":"採用する","meaning":"to adopt"],
        ["hiragana":"だんかい","kanji":"段階","meaning":"stage; phase"],
        ["hiragana":"あうと","kanji":"アウト","meaning":"out"]
    ]
    
    var goidon1L11aarray = [
        ["hiragana":"りゆう","kanji":"理由","meaning":"reason"],
        ["hiragana":"やりとりする","kanji":"やりとりする","meaning":"to exchange"],
        ["hiragana":"はんのうする","kanji":"反応する","meaning":"to react"],
        ["hiragana":"てきせつ","kanji":"適切","meaning":"appropriate"],
        ["hiragana":"こんとろーるする","kanji":"コントロールする","meaning":"to control"],
        ["hiragana":"あやまり","kanji":"誤り","meaning":"error; mistake"],
        ["hiragana":"たんじゅん","kanji":"単純","meaning":"simple"],
        ["hiragana":"あらた","kanji":"新た","meaning":"new"],
        ["hiragana":"かばー","kanji":"カバーする","meaning":"to cover"],
        ["hiragana":"とうじしゃ","kanji":"当事者","meaning":"stakeholder"]
    ]
    
    var goidon1L11barray = [
        ["hiragana":"そしき","kanji":"組織","meaning":"organization"],
        ["hiragana":"ちゅうかん","kanji":"中間","meaning":"intermediate; interim; middle"],
        ["hiragana":"ていちゃくする","kanji":"定着する","meaning":"to establish; to take hold; to take root"],
        ["hiragana":"ふくざつ","kanji":"複雑","meaning":"complex; complicated"],
        ["hiragana":"かいしする","kanji":"開始する","meaning":"to begin"],
        ["hiragana":"うったえる","kanji":"訴える","meaning":"to appeal"],
        ["hiragana":"ごうけいする","kanji":"合計する","meaning":"to total"],
        ["hiragana":"ついかする","kanji":"追加する","meaning":"to add"],
        ["hiragana":"さいど","kanji":"サイド","meaning":"side"],
        ["hiragana":"こうていする","kanji":"肯定する","meaning":"to affirm"]
    ]
    
    var goidon1L11carray = [
        ["hiragana":"こうもく","kanji":"項目","meaning":"item"],
        ["hiragana":"とりこむ","kanji":"取り込む","meaning":"to incorporate"],
        ["hiragana":"じゅうだい","kanji":"重大","meaning":"serious; significant"],
        ["hiragana":"じゅんかんする","kanji":"循環する","meaning":"to cycle"],
        ["hiragana":"むげん","kanji":"無限","meaning":"infinite"],
        ["hiragana":"こくさい","kanji":"国際","meaning":"international"],
        ["hiragana":"ぎろんする","kanji":"議論する","meaning":"to argue; to discuss"],
        ["hiragana":"あつかう","kanji":"扱う","meaning":"to handle"],
        ["hiragana":"てきせい","kanji":"適正","meaning":"suitability"],
        ["hiragana":"しゅうせいする","kanji":"修正する","meaning":"to modify"]
    ]
    
    var goidon1L12aarray = [
        ["hiragana":"ふかけつ","kanji":"不可欠","meaning":"essential"],
        ["hiragana":"しようする","kanji":"使用する","meaning":"to use"],
        ["hiragana":"ていど","kanji":"程度","meaning":"degree; amount"],
        ["hiragana":"のぞましい","kanji":"望ましい","meaning":"desirable"],
        ["hiragana":"つうじょう","kanji":"通常","meaning":"usually; normally"],
        ["hiragana":"いっしゅ","kanji":"一種","meaning":"a kind of"],
        ["hiragana":"ふくむ","kanji":"含む","meaning":"to include"],
        ["hiragana":"ふく","kanji":"副-","meaning":"sub-; vice-"],
        ["hiragana":"さようする","kanji":"作用する","meaning":"to have an effect; to function"],
        ["hiragana":"ちゅういする","kanji":"注意する","meaning":"to pay attention; to be cautious; to warn"]
    ]
    
    var goidon1L12barray = [
        ["hiragana":"ほうしん","kanji":"方針","meaning":"policy"],
        ["hiragana":"かくだいする","kanji":"拡大する","meaning":"to expand"],
        ["hiragana":"じっしする","kanji":"実施する","meaning":"to implement; carry out"],
        ["hiragana":"すなわち","kanji":"すなわち","meaning":"namely; i.e."],
        ["hiragana":"ぐたい","kanji":"具体","meaning":"concrete"],
        ["hiragana":"しょうてん","kanji":"焦点","meaning":"focus"],
        ["hiragana":"ぷらすする","kanji":"プラスする","meaning":"to add"],
        ["hiragana":"まいなすする","kanji":"マイナスする","meaning":"to subtract"],
        ["hiragana":"ぷろぐらむ","kanji":"プログラム","meaning":"program"],
        ["hiragana":"せきにん","kanji":"責任","meaning":"responsibility"]
    ]
    
    var goidon1L12carray = [
        ["hiragana":"ひていする","kanji":"否定する","meaning":"to negate"],
        ["hiragana":"おうようする","kanji":"応用する","meaning":"to apply; to make use of"],
        ["hiragana":"せいしつ","kanji":"性質","meaning":"nature; property; disposition"],
        ["hiragana":"かがく","kanji":"化学","meaning":"chemistry"],
        ["hiragana":"ばあい","kanji":"場合","meaning":"case; situation"],
        ["hiragana":"とくゆう","kanji":"特有","meaning":"specific"],
        ["hiragana":"せいめい","kanji":"生命","meaning":"life"],
        ["hiragana":"もたらす","kanji":"もたらす","meaning":"to bring about"],
        ["hiragana":"きょうかい","kanji":"境界","meaning":"boundary"],
        ["hiragana":"かくりつ","kanji":"確率","meaning":"probability"]
    ]
    
    var goidon1L13aarray = [
        ["hiragana":"しりょう","kanji":"資料","meaning":"reference material"],
        ["hiragana":"ぶんけん","kanji":"文献","meaning":"literature; document; books (reference)"],
        ["hiragana":"いわゆる","kanji":"いわゆる","meaning":"so-called"],
        ["hiragana":"いんようする","kanji":"引用する","meaning":"to cite"],
        ["hiragana":"ぽいんと","kanji":"ポイント","meaning":"point"],
        ["hiragana":"きそく","kanji":"規則","meaning":"rule"],
        ["hiragana":"せんげんする","kanji":"宣言する","meaning":"to declare"],
        ["hiragana":"へいきんする","kanji":"平均する","meaning":"to average"],
        ["hiragana":"もくひょう","kanji":"目標","meaning":"goal; target; objective"],
        ["hiragana":"かかげる","kanji":"掲げる","meaning":"to set"]
    ]
    
    var goidon1L13barray = [
        ["hiragana":"はっそうする","kanji":"発想する","meaning":"to conceive"],
        ["hiragana":"すうち","kanji":"数値","meaning":"numerical value"],
        ["hiragana":"げんみつ","kanji":"厳密","meaning":"rigorous; strict"],
        ["hiragana":"ぶんせきする","kanji":"分析する","meaning":"to analyze"],
        ["hiragana":"てーま","kanji":"テーマ","meaning":"theme"],
        ["hiragana":"こうせいする","kanji":"構成する","meaning":"to structure; to compose; to make up"],
        ["hiragana":"はんえいする","kanji":"反映する","meaning":"to reflect"],
        ["hiragana":"くぶんする","kanji":"区分する","meaning":"to classify"],
        ["hiragana":"おうじる","kanji":"応じる","meaning":"to correspond"],
        ["hiragana":"どういつ","kanji":"同一","meaning":"identical"]
    ]
    
    var goidon1L13carray = [
        ["hiragana":"ふきゅうする","kanji":"普及する","meaning":"to popularize; to spread"],
        ["hiragana":"なす","kanji":"なす","meaning":"to constitute; to make; to perform"],
        ["hiragana":"へる","kanji":"経る","meaning":"to undergo"],
        ["hiragana":"てきとう","kanji":"適当","meaning":"appropriate"],
        ["hiragana":"かいけつする","kanji":"解決する","meaning":"to resolve"],
        ["hiragana":"けいぞくする","kanji":"継続する","meaning":"to continue"],
        ["hiragana":"あぷろーち","kanji":"アプローチ","meaning":"approach"],
        ["hiragana":"とくしゅ","kanji":"特殊","meaning":"special; unique; peculiar"],
        ["hiragana":"みちびく","kanji":"導く","meaning":"to lead"],
        ["hiragana":"ぞうだいする","kanji":"増大する","meaning":"to increase; to grow"]
    ]
    
    var goidon1L14aarray = [
        ["hiragana":"えんちょうする","kanji":"延長する","meaning":"to extend"],
        ["hiragana":"かのう","kanji":"可能","meaning":"possible"],
        ["hiragana":"たんき","kanji":"短期","meaning":"short-term"],
        ["hiragana":"りかいする","kanji":"理解する","meaning":"to understand"],
        ["hiragana":"かっぱつ","kanji":"活発","meaning":"active"],
        ["hiragana":"ひかくする","kanji":"比較する","meaning":"to compare"],
        ["hiragana":"ねんど","kanji":"年度","meaning":"fiscal year"],
        ["hiragana":"せいりする","kanji":"整理する","meaning":"to organize"],
        ["hiragana":"てんけい","kanji":"典型","meaning":"typical"],
        ["hiragana":"いっちする","kanji":"一致する","meaning":"to coincide; to match"]
    ]
    
    var goidon1L14barray = [
        ["hiragana":"いちぶ","kanji":"一部","meaning":"part"],
        ["hiragana":"るい","kanji":"類","meaning":"category"],
        ["hiragana":"しょうにんする","kanji":"承認する","meaning":"to approve"],
        ["hiragana":"み","kanji":"未-","meaning":"un-"],
        ["hiragana":"すぐれる","kanji":"優れる","meaning":"to excel"],
        ["hiragana":"しつ","kanji":"質","meaning":"quality"],
        ["hiragana":"こんきょ","kanji":"根拠","meaning":"basis"],
        ["hiragana":"しめす","kanji":"示す","meaning":"to indicate"],
        ["hiragana":"じつよう","kanji":"実用","meaning":"practical"],
        ["hiragana":"ひょうかする","kanji":"評価する","meaning":"to evaluate"]
    ]
    
    var goidon1L14carray = [
        ["hiragana":"かんしん","kanji":"関心","meaning":"interest"],
        ["hiragana":"けんぜん","kanji":"健全","meaning":"healthy; sound"],
        ["hiragana":"たもつ","kanji":"保つ","meaning":"to maintain; to keep"],
        ["hiragana":"おーぷんする","kanji":"オープンする","meaning":"to open"],
        ["hiragana":"してきする","kanji":"指摘する","meaning":"to point out"],
        ["hiragana":"しんらいする","kanji":"信頼する","meaning":"to trust"],
        ["hiragana":"とらえる","kanji":"捉える","meaning":"to grasp"],
        ["hiragana":"せいぞんする","kanji":"生存する","meaning":"survival"],
        ["hiragana":"きんねん","kanji":"近年","meaning":"in recent years"],
        ["hiragana":"こうど","kanji":"高度","meaning":"advanced"]
    ]
    
    var goidon1L15aarray = [
        ["hiragana":"こうぞう","kanji":"構造","meaning":"structure"],
        ["hiragana":"けんきゅうする","kanji":"研究する","meaning":"to research"],
        ["hiragana":"いっぱん","kanji":"一般","meaning":"general"],
        ["hiragana":"しげん","kanji":"資源","meaning":"resources"],
        ["hiragana":"じゅうよう","kanji":"重要","meaning":"important"],
        ["hiragana":"しゅうへん","kanji":"周辺","meaning":"surrounding; in the vicinity of"],
        ["hiragana":"かんきょう","kanji":"環境","meaning":"environment"],
        ["hiragana":"おせんする","kanji":"汚染する","meaning":"to pollute"],
        ["hiragana":"かいはつする","kanji":"開発する","meaning":"to develop"],
        ["hiragana":"ゆるやか","kanji":"ゆるやか","meaning":"gradual"]
    ]
    
    var goidon1L15barray = [
        ["hiragana":"げんざい","kanji":"現在","meaning":"current"],
        ["hiragana":"はんだんする","kanji":"判断する","meaning":"to make a judgment"],
        ["hiragana":"きばん","kanji":"基盤","meaning":"foundation"],
        ["hiragana":"ただし","kanji":"ただし","meaning":"however"],
        ["hiragana":"げん","kanji":"-源","meaning":"source of ..."],
        ["hiragana":"へんかする","kanji":"変化する","meaning":"to change"],
        ["hiragana":"こうか","kanji":"効果","meaning":"effect"],
        ["hiragana":"きたいする","kanji":"期待する","meaning":"to expect"],
        ["hiragana":"きのうする","kanji":"機能する","meaning":"to function"],
        ["hiragana":"しんぽする","kanji":"進歩する","meaning":"to progress"]
    ]
    
    var goidon1L15carray = [
        ["hiragana":"すいじゅん","kanji":"水準","meaning":"level"],
        ["hiragana":"つうじる","kanji":"通じる","meaning":"to be understood; to communicate"],
        ["hiragana":"こうりょする","kanji":"考慮する","meaning":"to consider"],
        ["hiragana":"ろんそう","kanji":"論争","meaning":"controversy; dispute"],
        ["hiragana":"らいん","kanji":"ライン","meaning":"line"],
        ["hiragana":"はかる","kanji":"測る","meaning":"to measure"],
        ["hiragana":"そくしんする","kanji":"促進する","meaning":"to promote"],
        ["hiragana":"きゅうげき","kanji":"急激","meaning":"rapid; radical"],
        ["hiragana":"みいだす","kanji":"見いだす","meaning":"to discover; to find out"],
        ["hiragana":"ぷろせす","kanji":"プロセス","meaning":"process"]
    ]
    
    var goidon1L16aarray = [
        ["hiragana":"そうとうする","kanji":"相当する","meaning":"to correspond; equivalent"],
        ["hiragana":"さす","kanji":"指す","meaning":"to refer to; to point"],
        ["hiragana":"しどうする","kanji":"指導する","meaning":"to guide"],
        ["hiragana":"すたっふ","kanji":"スタッフ","meaning":"staff"],
        ["hiragana":"きょうかする","kanji":"強化する","meaning":"to strengthen"],
        ["hiragana":"くべつする","kanji":"区別する","meaning":"to differentiate; to distinguish"],
        ["hiragana":"けんちょ","kanji":"顕著","meaning":"remarkable; outstanding"],
        ["hiragana":"きょうりょくする","kanji":"協力する","meaning":"to cooperate"],
        ["hiragana":"さらに","kanji":"さらに","meaning":"furthermore"],
        ["hiragana":"かんれんする","kanji":"関連する","meaning":"to be related"]
    ]
    
    var goidon1L16barray = [
        ["hiragana":"きかん","kanji":"機関","meaning":"institution"],
        ["hiragana":"げんしょう","kanji":"現象","meaning":"phenomenon"],
        ["hiragana":"もと","kanji":"基","meaning":"foundation; base"],
        ["hiragana":"すてっぷ","kanji":"ステップ","meaning":"step"],
        ["hiragana":"いがい","kanji":"以外","meaning":"except; other than"],
        ["hiragana":"きょうきゅうする","kanji":"供給する","meaning":"to supply"],
        ["hiragana":"かた","kanji":"型","meaning":"type; mold"],
        ["hiragana":"せいぞうする","kanji":"製造する","meaning":"to manufacture"],
        ["hiragana":"てい","kanji":"低","meaning":"low"],
        ["hiragana":"しょうりゃくする","kanji":"省略する","meaning":"to omit"]
    ]
    
    var goidon1L16carray = [
        ["hiragana":"せつび","kanji":"設備","meaning":"facility; equipment"],
        ["hiragana":"しんちょう","kanji":"慎重","meaning":"careful; prudent"],
        ["hiragana":"ようする","kanji":"要する","meaning":"to require"],
        ["hiragana":"るーる","kanji":"ルール","meaning":"rule"],
        ["hiragana":"していする","kanji":"指定する","meaning":"to designate"],
        ["hiragana":"かいしゅうする","kanji":"回収する","meaning":"to collect"],
        ["hiragana":"しんき","kanji":"新規","meaning":"new"],
        ["hiragana":"かかる","kanji":"係る","meaning":"to be concerned; pertaining to"],
        ["hiragana":"ほう","kanji":"法","meaning":"law"],
        ["hiragana":"ほうてき","kanji":"法的","meaning":"legal"]
    ]
    
    var goidon1L17aarray = [
        ["hiragana":"かてい","kanji":"過程","meaning":"process"],
        ["hiragana":"せつ","kanji":"節","meaning":"clause; section"],
        ["hiragana":"しじする","kanji":"指示する","meaning":"to instruct; to direct"],
        ["hiragana":"ろんじる","kanji":"論じる","meaning":"to discuss"],
        ["hiragana":"とじょう","kanji":"途上","meaning":"in progress"],
        ["hiragana":"しえんする","kanji":"支援する","meaning":"to support"],
        ["hiragana":"じっさい","kanji":"実際","meaning":"actual"],
        ["hiragana":"こうじょうする","kanji":"向上する","meaning":"to improve"],
        ["hiragana":"きそ","kanji":"基礎","meaning":"foundation"],
        ["hiragana":"さいてき","kanji":"最適","meaning":"optimal"]
    ]
    
    var goidon1L17barray = [
        ["hiragana":"しばしば","kanji":"しばしば","meaning":"often"],
        ["hiragana":"ささえる","kanji":"支える","meaning":"to support"],
        ["hiragana":"ぞうかする","kanji":"増加する","meaning":"to increase"],
        ["hiragana":"けいこう","kanji":"傾向","meaning":"trend; tendency"],
        ["hiragana":"そくめん","kanji":"側面","meaning":"aspect"],
        ["hiragana":"さい","kanji":"際して","meaning":"on occasion; in case"],
        ["hiragana":"こうへい","kanji":"公平","meaning":"fair"],
        ["hiragana":"なお","kanji":"なお","meaning":"furthermore"],
        ["hiragana":"けんり","kanji":"権利","meaning":"right"],
        ["hiragana":"へんどうする","kanji":"変動する","meaning":"to fluctuate"]
    ]
    
    var goidon1L17carray = [
        ["hiragana":"じゅよう","kanji":"需要","meaning":"demand"],
        ["hiragana":"ちゅうしん","kanji":"中心","meaning":"center"],
        ["hiragana":"せっきょく","kanji":"積極","meaning":"positive"],
        ["hiragana":"ぎゃく","kanji":"逆","meaning":"reverse"],
        ["hiragana":"めざす","kanji":"目指す","meaning":"to aim; have an eye on"],
        ["hiragana":"しんにゅうする","kanji":"侵入する","meaning":"to invade"],
        ["hiragana":"ふぞくする","kanji":"付属する","meaning":"to accompany; to be included"],
        ["hiragana":"もーど","kanji":"モード","meaning":"mode"],
        ["hiragana":"そうさする","kanji":"操作する","meaning":"to operate"],
        ["hiragana":"ひよう","kanji":"費用","meaning":"cost"]
    ]
    
    var goidon1L18aarray = [
        ["hiragana":"とげる","kanji":"遂げる","meaning":"to accomplish"],
        ["hiragana":"せいちょうする","kanji":"成長する","meaning":"to grow"],
        ["hiragana":"やしろ","kanji":"社","meaning":"company"],
        ["hiragana":"それぞれ","kanji":"それぞれ","meaning":"each"],
        ["hiragana":"いってい","kanji":"一定","meaning":"certain"],
        ["hiragana":"のうりょく","kanji":"能力","meaning":"ability"],
        ["hiragana":"こじん","kanji":"個人","meaning":"individual"],
        ["hiragana":"さ","kanji":"差","meaning":"difference"],
        ["hiragana":"せいじょう","kanji":"正常","meaning":"normal"],
        ["hiragana":"はっせいする","kanji":"発生する","meaning":"to occur"]
    ]
    
    var goidon1L18barray = [
        ["hiragana":"きき","kanji":"機器","meaning":"equipment"],
        ["hiragana":"せんもん","kanji":"専門","meaning":"specialty"],
        ["hiragana":"こうにゅうする","kanji":"購入する","meaning":"to purchase"],
        ["hiragana":"いこうする","kanji":"移行する","meaning":"to transition"],
        ["hiragana":"ていぎする","kanji":"定義する","meaning":"to define"],
        ["hiragana":"そう","kanji":"沿う","meaning":"to follow"],
        ["hiragana":"てんかんする","kanji":"転換する","meaning":"to transform"],
        ["hiragana":"いぎ","kanji":"意義","meaning":"significance"],
        ["hiragana":"りろん","kanji":"理論","meaning":"theory"],
        ["hiragana":"しゅほう","kanji":"手法","meaning":"method"]
    ]
    
    var goidon1L18carray = [
        ["hiragana":"はたす","kanji":"果たす","meaning":"to fulfill"],
        ["hiragana":"かだい","kanji":"課題","meaning":"challenge; task; problem"],
        ["hiragana":"りょうしゃ","kanji":"両者","meaning":"both"],
        ["hiragana":"きょうつうする","kanji":"共通する","meaning":"to have in common"],
        ["hiragana":"こゆう","kanji":"固有","meaning":"inherent; unique"],
        ["hiragana":"あげる","kanji":"挙げる","meaning":"to mention; to name"],
        ["hiragana":"にんしきする","kanji":"認識する","meaning":"to recognize"],
        ["hiragana":"かくりつする","kanji":"確率する","meaning":"to calculate probability"],
        ["hiragana":"ぜんてい","kanji":"前提","meaning":"assumption"],
        ["hiragana":"しょうすう","kanji":"少数","meaning":"minority; few"]
    ]
    
    var goidon1L19aarray = [
        ["hiragana":"しょうさい","kanji":"詳細","meaning":"detail"],
        ["hiragana":"あたかも","kanji":"あたかも","meaning":"as if"],
        ["hiragana":"かせつ","kanji":"仮説","meaning":"hypothesis"],
        ["hiragana":"こうさつする","kanji":"考察する","meaning":"to speculate; to consider"],
        ["hiragana":"ぶぶん","kanji":"部分","meaning":"part"],
        ["hiragana":"てがかり","kanji":"手がかり","meaning":"clue"],
        ["hiragana":"けつごうする","kanji":"結合する","meaning":"to combine"],
        ["hiragana":"こうりつ","kanji":"効率","meaning":"efficiency"],
        ["hiragana":"いちれん","kanji":"一連","meaning":"series"],
        ["hiragana":"とうしょ","kanji":"当初","meaning":"initially; at the beginning"]
    ]
    
    var goidon1L19barray = [
        ["hiragana":"しめる","kanji":"占める","meaning":"to occupy; to account for"],
        ["hiragana":"おおはば","kanji":"大幅","meaning":"large scale; significant; full size"],
        ["hiragana":"てんかいする","kanji":"展開する","meaning":"to expand; to unfold"],
        ["hiragana":"とくせい","kanji":"特性","meaning":"characteristics"],
        ["hiragana":"はっきする","kanji":"発揮する","meaning":"to demonstrate"],
        ["hiragana":"とりいれる","kanji":"取り入れる","meaning":"to incorporate"],
        ["hiragana":"あん","kanji":"案","meaning":"proposal"],
        ["hiragana":"どうにゅうする","kanji":"導入する","meaning":"to introduce; to take in"],
        ["hiragana":"りようする","kanji":"利用する","meaning":"to utilize; to use"],
        ["hiragana":"いとする","kanji":"意図する","meaning":"to intend"]
    ]
    
    var goidon1L19carray = [
        ["hiragana":"よういん","kanji":"要因","meaning":"factor"],
        ["hiragana":"れんぞくする","kanji":"連続する","meaning":"continuous"],
        ["hiragana":"かくちょうする","kanji":"拡張する","meaning":"to expand"],
        ["hiragana":"せっていする","kanji":"設定する","meaning":"to establish; to set; to configure"],
        ["hiragana":"がいねん","kanji":"概念","meaning":"concept"],
        ["hiragana":"かつようする","kanji":"活用する","meaning":"to utilize"],
        ["hiragana":"しこうする","kanji":"思考する","meaning":"to think"],
        ["hiragana":"めん","kanji":"面","meaning":"aspect"],
        ["hiragana":"げんり","kanji":"原理","meaning":"principle"],
        ["hiragana":"ほんしつ","kanji":"本質","meaning":"essence"]
    ]
    
    var goidon1L20aarray = [
        ["hiragana":"ぶんぷする","kanji":"分布する","meaning":"to distribute"],
        ["hiragana":"しょうとつする","kanji":"衝突する","meaning":"to conflict; to collide"],
        ["hiragana":"きわめて","kanji":"極めて","meaning":"extremely"],
        ["hiragana":"ようきゅうする","kanji":"要求する","meaning":"to demand"],
        ["hiragana":"かくにんする","kanji":"確認する","meaning":"to confirm"],
        ["hiragana":"かんてん","kanji":"観点","meaning":"perspective"],
        ["hiragana":"みなおし","kanji":"見直し","meaning":"review"],
        ["hiragana":"し","kanji":"–視","meaning":"-visual; -view"],
        ["hiragana":"がいぶ","kanji":"外部","meaning":"external"],
        ["hiragana":"こんなん","kanji":"困難","meaning":"difficult"]
    ]
    
    var goidon1L20barray = [
        ["hiragana":"じれい","kanji":"事例","meaning":"case"],
        ["hiragana":"いちじるしい","kanji":"著しい","meaning":"remarkable"],
        ["hiragana":"げんじょう","kanji":"現状","meaning":"current situation"],
        ["hiragana":"たかまる","kanji":"高まる","meaning":"to increase"],
        ["hiragana":"けっていする","kanji":"決定する","meaning":"to make a decision"],
        ["hiragana":"せいりつする","kanji":"成立する","meaning":"to establish; to form"],
        ["hiragana":"ともなう","kanji":"伴う","meaning":"to accompany"],
        ["hiragana":"るいじする","kanji":"類似する","meaning":"to resemble"],
        ["hiragana":"かくしゅ","kanji":"各種","meaning":"various"],
        ["hiragana":"きていする","kanji":"規定する","meaning":"to regulate"]
    ]
    
    var goidon1L20carray = [
        ["hiragana":"みたす","kanji":"満たす","meaning":"to fulfill"],
        ["hiragana":"きんだい","kanji":"近代","meaning":"modern; present day"],
        ["hiragana":"こてん","kanji":"古典","meaning":"classical; classic"],
        ["hiragana":"かいめいする","kanji":"解明する","meaning":"to clarify"],
        ["hiragana":"ちょさく","kanji":"著作","meaning":"work (written)"],
        ["hiragana":"だとう","kanji":"妥当","meaning":"valid"],
        ["hiragana":"せいせいする","kanji":"生成する","meaning":"to generate"],
        ["hiragana":"ていじする","kanji":"提示する","meaning":"to present"],
        ["hiragana":"ふくごうする","kanji":"複合する","meaning":"to compound"],
        ["hiragana":"そうたい","kanji":"相対","meaning":"relative"]
    ]
    
    var currentQuestionIndex: Int = 0
    var shuffledQuestions: [[String:String]] = []
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressView.transform = CGAffineTransformMakeScale(1.0, 2.0)
        progressView.layer.cornerRadius = 5
        progressView.clipsToBounds = true
        
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
        yomiganaLabel.isHidden = true
        
        if let goidon1 = UserDefaults.standard.object(forKey: "GOIDON1") as? Int,
           let chapter = UserDefaults.standard.object(forKey: "CHAPTER") as? Int {
            GOIDON1 = goidon1
            CHAPTER = chapter
        }
        
        if GOIDON1 == 0 && CHAPTER == 0 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
            chapterLabel.text = "1〜10"
            shuffledQuestions = shuffleArray(goidon1L1aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 0 && CHAPTER == 1 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
            chapterLabel.text = "11〜20"
            shuffledQuestions = shuffleArray(goidon1L1barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 0 && CHAPTER == 2 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
            chapterLabel.text = "21〜30"
            shuffledQuestions = shuffleArray(goidon1L1carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 1 && CHAPTER == 0 {
            titleLabel.text = "Lesson 2"
            titleShadowLabel.text = "Lesson 2"
            chapterLabel.text = "31〜40"
            shuffledQuestions = shuffleArray(goidon1L2aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 1 && CHAPTER == 1 {
            titleLabel.text = "Lesson 2"
            titleShadowLabel.text = "Lesson 2"
            chapterLabel.text = "41〜50"
            shuffledQuestions = shuffleArray(goidon1L2barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 1 && CHAPTER == 2 {
            titleLabel.text = "Lesson 2"
            titleShadowLabel.text = "Lesson 2"
            chapterLabel.text = "51〜60"
            shuffledQuestions = shuffleArray(goidon1L2carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 2 && CHAPTER == 0 {
            titleLabel.text = "Lesson 3"
            titleShadowLabel.text = "Lesson 3"
            chapterLabel.text = "61〜70"
            shuffledQuestions = shuffleArray(goidon1L3aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 2 && CHAPTER == 1 {
            titleLabel.text = "Lesson 3"
            titleShadowLabel.text = "Lesson 3"
            chapterLabel.text = "71〜80"
            shuffledQuestions = shuffleArray(goidon1L3barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 2 && CHAPTER == 2 {
            titleLabel.text = "Lesson 3"
            titleShadowLabel.text = "Lesson 3"
            chapterLabel.text = "81〜90"
            shuffledQuestions = shuffleArray(goidon1L3carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 3 && CHAPTER == 0 {
            titleLabel.text = "Lesson 4"
            titleShadowLabel.text = "Lesson 4"
            chapterLabel.text = "91〜100"
            shuffledQuestions = shuffleArray(goidon1L4aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 3 && CHAPTER == 1 {
            titleLabel.text = "Lesson 4"
            titleShadowLabel.text = "Lesson 4"
            chapterLabel.text = "101〜110"
            shuffledQuestions = shuffleArray(goidon1L4barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 3 && CHAPTER == 2 {
            titleLabel.text = "Lesson 4"
            titleShadowLabel.text = "Lesson 4"
            chapterLabel.text = "111〜120"
            shuffledQuestions = shuffleArray(goidon1L4carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 4 && CHAPTER == 0 {
            titleLabel.text = "Lesson 5"
            titleShadowLabel.text = "Lesson 5"
            chapterLabel.text = "121〜130"
            shuffledQuestions = shuffleArray(goidon1L5aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 4 && CHAPTER == 1 {
            titleLabel.text = "Lesson 5"
            titleShadowLabel.text = "Lesson 5"
            chapterLabel.text = "131〜140"
            shuffledQuestions = shuffleArray(goidon1L5barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 4 && CHAPTER == 2 {
            titleLabel.text = "Lesson 5"
            titleShadowLabel.text = "Lesson 5"
            chapterLabel.text = "141〜150"
            shuffledQuestions = shuffleArray(goidon1L5carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 5 && CHAPTER == 0 {
            titleLabel.text = "Lesson 6"
            titleShadowLabel.text = "Lesson 6"
            chapterLabel.text = "151〜160"
            shuffledQuestions = shuffleArray(goidon1L6aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 5 && CHAPTER == 1 {
            titleLabel.text = "Lesson 6"
            titleShadowLabel.text = "Lesson 6"
            chapterLabel.text = "161〜170"
            shuffledQuestions = shuffleArray(goidon1L6barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 5 && CHAPTER == 2 {
            titleLabel.text = "Lesson 6"
            titleShadowLabel.text = "Lesson 6"
            chapterLabel.text = "171〜180"
            shuffledQuestions = shuffleArray(goidon1L6carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 6 && CHAPTER == 0 {
            titleLabel.text = "Lesson 7"
            titleShadowLabel.text = "Lesson 7"
            chapterLabel.text = "181〜190"
            shuffledQuestions = shuffleArray(goidon1L7aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 6 && CHAPTER == 1 {
            titleLabel.text = "Lesson 7"
            titleShadowLabel.text = "Lesson 7"
            chapterLabel.text = "191〜200"
            shuffledQuestions = shuffleArray(goidon1L7barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 6 && CHAPTER == 2 {
            titleLabel.text = "Lesson 7"
            titleShadowLabel.text = "Lesson 7"
            chapterLabel.text = "201〜210"
            shuffledQuestions = shuffleArray(goidon1L7carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 7 && CHAPTER == 0 {
            titleLabel.text = "Lesson 8"
            titleShadowLabel.text = "Lesson 8"
            chapterLabel.text = "211〜220"
            shuffledQuestions = shuffleArray(goidon1L8aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 7 && CHAPTER == 1 {
            titleLabel.text = "Lesson 8"
            titleShadowLabel.text = "Lesson 8"
            chapterLabel.text = "221〜230"
            shuffledQuestions = shuffleArray(goidon1L8barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 7 && CHAPTER == 2 {
            titleLabel.text = "Lesson 8"
            titleShadowLabel.text = "Lesson 8"
            chapterLabel.text = "231〜240"
            shuffledQuestions = shuffleArray(goidon1L8carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 8 && CHAPTER == 0 {
            titleLabel.text = "Lesson 9"
            titleShadowLabel.text = "Lesson 9"
            chapterLabel.text = "241〜250"
            shuffledQuestions = shuffleArray(goidon1L9aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 8 && CHAPTER == 1 {
            titleLabel.text = "Lesson 9"
            titleShadowLabel.text = "Lesson 9"
            chapterLabel.text = "251〜260"
            shuffledQuestions = shuffleArray(goidon1L9barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 8 && CHAPTER == 2 {
            titleLabel.text = "Lesson 9"
            titleShadowLabel.text = "Lesson 9"
            chapterLabel.text = "261〜270"
            shuffledQuestions = shuffleArray(goidon1L9carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 9 && CHAPTER == 0 {
            titleLabel.text = "Lesson 10"
            titleShadowLabel.text = "Lesson 10"
            chapterLabel.text = "271〜280"
            shuffledQuestions = shuffleArray(goidon1L10aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 9 && CHAPTER == 1 {
            titleLabel.text = "Lesson 10"
            titleShadowLabel.text = "Lesson 10"
            chapterLabel.text = "281〜290"
            shuffledQuestions = shuffleArray(goidon1L10barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 9 && CHAPTER == 2 {
            titleLabel.text = "Lesson 10"
            titleShadowLabel.text = "Lesson 10"
            chapterLabel.text = "291〜300"
            shuffledQuestions = shuffleArray(goidon1L10carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 10 && CHAPTER == 0 {
            titleLabel.text = "Lesson 11"
            titleShadowLabel.text = "Lesson 11"
            chapterLabel.text = "301〜310"
            shuffledQuestions = shuffleArray(goidon1L11aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 10 && CHAPTER == 1 {
            titleLabel.text = "Lesson 11"
            titleShadowLabel.text = "Lesson 11"
            chapterLabel.text = "311〜320"
            shuffledQuestions = shuffleArray(goidon1L11barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 10 && CHAPTER == 2 {
            titleLabel.text = "Lesson 11"
            titleShadowLabel.text = "Lesson 11"
            chapterLabel.text = "321〜330"
            shuffledQuestions = shuffleArray(goidon1L11carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 11 && CHAPTER == 0 {
            titleLabel.text = "Lesson 12"
            titleShadowLabel.text = "Lesson 12"
            chapterLabel.text = "331〜340"
            shuffledQuestions = shuffleArray(goidon1L12aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 11 && CHAPTER == 1 {
            titleLabel.text = "Lesson 12"
            titleShadowLabel.text = "Lesson 12"
            chapterLabel.text = "341〜350"
            shuffledQuestions = shuffleArray(goidon1L12barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 11 && CHAPTER == 2 {
            titleLabel.text = "Lesson 12"
            titleShadowLabel.text = "Lesson 12"
            chapterLabel.text = "351〜360"
            shuffledQuestions = shuffleArray(goidon1L12carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 12 && CHAPTER == 0 {
            titleLabel.text = "Lesson 13"
            titleShadowLabel.text = "Lesson 13"
            chapterLabel.text = "361〜370"
            shuffledQuestions = shuffleArray(goidon1L13aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 12 && CHAPTER == 1 {
            titleLabel.text = "Lesson 13"
            titleShadowLabel.text = "Lesson 13"
            chapterLabel.text = "371〜380"
            shuffledQuestions = shuffleArray(goidon1L13barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 12 && CHAPTER == 2 {
            titleLabel.text = "Lesson 13"
            titleShadowLabel.text = "Lesson 13"
            chapterLabel.text = "381〜390"
            shuffledQuestions = shuffleArray(goidon1L13carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 13 && CHAPTER == 0 {
            titleLabel.text = "Lesson 14"
            titleShadowLabel.text = "Lesson 14"
            chapterLabel.text = "391〜400"
            shuffledQuestions = shuffleArray(goidon1L14aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 13 && CHAPTER == 1 {
            titleLabel.text = "Lesson 14"
            titleShadowLabel.text = "Lesson 14"
            chapterLabel.text = "401〜410"
            shuffledQuestions = shuffleArray(goidon1L14barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 13 && CHAPTER == 2 {
            titleLabel.text = "Lesson 14"
            titleShadowLabel.text = "Lesson 14"
            chapterLabel.text = "411〜420"
            shuffledQuestions = shuffleArray(goidon1L14carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 14 && CHAPTER == 0 {
            titleLabel.text = "Lesson 15"
            titleShadowLabel.text = "Lesson 15"
            chapterLabel.text = "421〜430"
            shuffledQuestions = shuffleArray(goidon1L15aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 14 && CHAPTER == 1 {
            titleLabel.text = "Lesson 15"
            titleShadowLabel.text = "Lesson 15"
            chapterLabel.text = "431〜440"
            shuffledQuestions = shuffleArray(goidon1L15barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 14 && CHAPTER == 2 {
            titleLabel.text = "Lesson 15"
            titleShadowLabel.text = "Lesson 15"
            chapterLabel.text = "441〜450"
            shuffledQuestions = shuffleArray(goidon1L15carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 15 && CHAPTER == 0 {
            titleLabel.text = "Lesson 16"
            titleShadowLabel.text = "Lesson 16"
            chapterLabel.text = "451〜460"
            shuffledQuestions = shuffleArray(goidon1L16aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 15 && CHAPTER == 1 {
            titleLabel.text = "Lesson 16"
            titleShadowLabel.text = "Lesson 16"
            chapterLabel.text = "461〜470"
            shuffledQuestions = shuffleArray(goidon1L16barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 15 && CHAPTER == 2 {
            titleLabel.text = "Lesson 16"
            titleShadowLabel.text = "Lesson 16"
            chapterLabel.text = "471〜480"
            shuffledQuestions = shuffleArray(goidon1L16carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 16 && CHAPTER == 0 {
            titleLabel.text = "Lesson 17"
            titleShadowLabel.text = "Lesson 17"
            chapterLabel.text = "481〜490"
            shuffledQuestions = shuffleArray(goidon1L17aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 16 && CHAPTER == 1 {
            titleLabel.text = "Lesson 17"
            titleShadowLabel.text = "Lesson 17"
            chapterLabel.text = "491〜500"
            shuffledQuestions = shuffleArray(goidon1L17barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 16 && CHAPTER == 2 {
            titleLabel.text = "Lesson 17"
            titleShadowLabel.text = "Lesson 17"
            chapterLabel.text = "501〜510"
            shuffledQuestions = shuffleArray(goidon1L17carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 17 && CHAPTER == 0 {
            titleLabel.text = "Lesson 18"
            titleShadowLabel.text = "Lesson 18"
            chapterLabel.text = "511〜520"
            shuffledQuestions = shuffleArray(goidon1L18aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 17 && CHAPTER == 1 {
            titleLabel.text = "Lesson 18"
            titleShadowLabel.text = "Lesson 18"
            chapterLabel.text = "521〜530"
            shuffledQuestions = shuffleArray(goidon1L18barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 17 && CHAPTER == 2 {
            titleLabel.text = "Lesson 18"
            titleShadowLabel.text = "Lesson 18"
            chapterLabel.text = "531〜540"
            shuffledQuestions = shuffleArray(goidon1L18carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 18 && CHAPTER == 0 {
            titleLabel.text = "Lesson 19"
            titleShadowLabel.text = "Lesson 19"
            chapterLabel.text = "541〜550"
            shuffledQuestions = shuffleArray(goidon1L19aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 18 && CHAPTER == 1 {
            titleLabel.text = "Lesson 19"
            titleShadowLabel.text = "Lesson 19"
            chapterLabel.text = "551〜560"
            shuffledQuestions = shuffleArray(goidon1L19barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 18 && CHAPTER == 2 {
            titleLabel.text = "Lesson 19"
            titleShadowLabel.text = "Lesson 19"
            chapterLabel.text = "561〜570"
            shuffledQuestions = shuffleArray(goidon1L19carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 19 && CHAPTER == 0 {
            titleLabel.text = "Lesson 20"
            titleShadowLabel.text = "Lesson 20"
            chapterLabel.text = "571〜580"
            shuffledQuestions = shuffleArray(goidon1L20aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 19 && CHAPTER == 1 {
            titleLabel.text = "Lesson 20"
            titleShadowLabel.text = "Lesson 20"
            chapterLabel.text = "581〜590"
            shuffledQuestions = shuffleArray(goidon1L20barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GOIDON1 == 19 && CHAPTER == 2 {
            titleLabel.text = "Lesson 20"
            titleShadowLabel.text = "Lesson 20"
            chapterLabel.text = "591〜600"
            shuffledQuestions = shuffleArray(goidon1L20carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
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
        
        if GOIDON1 == 0 && CHAPTER == 0 {
            currentQuestionArray = goidon1L1aarray
        } else if GOIDON1 == 0 && CHAPTER == 1 {
            currentQuestionArray = goidon1L1barray
        } else if GOIDON1 == 0 && CHAPTER == 2 {
            currentQuestionArray = goidon1L1carray
        } else if GOIDON1 == 1 && CHAPTER == 0 {
            currentQuestionArray = goidon1L2aarray
        } else if GOIDON1 == 1 && CHAPTER == 1 {
            currentQuestionArray = goidon1L2barray
        } else if GOIDON1 == 1 && CHAPTER == 2 {
            currentQuestionArray = goidon1L2carray
        } else if GOIDON1 == 2 && CHAPTER == 0 {
            currentQuestionArray = goidon1L3aarray
        } else if GOIDON1 == 2 && CHAPTER == 1 {
            currentQuestionArray = goidon1L3barray
        } else if GOIDON1 == 2 && CHAPTER == 2 {
            currentQuestionArray = goidon1L3carray
        } else if GOIDON1 == 3 && CHAPTER == 0 {
            currentQuestionArray = goidon1L4aarray
        } else if GOIDON1 == 3 && CHAPTER == 1 {
            currentQuestionArray = goidon1L4barray
        } else if GOIDON1 == 3 && CHAPTER == 2 {
            currentQuestionArray = goidon1L4carray
        } else if GOIDON1 == 4 && CHAPTER == 0 {
            currentQuestionArray = goidon1L5aarray
        } else if GOIDON1 == 4 && CHAPTER == 1 {
            currentQuestionArray = goidon1L5barray
        } else if GOIDON1 == 4 && CHAPTER == 2 {
            currentQuestionArray = goidon1L5carray
        } else if GOIDON1 == 5 && CHAPTER == 0 {
            currentQuestionArray = goidon1L6aarray
        } else if GOIDON1 == 5 && CHAPTER == 1 {
            currentQuestionArray = goidon1L6barray
        } else if GOIDON1 == 5 && CHAPTER == 2 {
            currentQuestionArray = goidon1L6carray
        } else if GOIDON1 == 6 && CHAPTER == 0 {
            currentQuestionArray = goidon1L7aarray
        } else if GOIDON1 == 6 && CHAPTER == 1 {
            currentQuestionArray = goidon1L7barray
        } else if GOIDON1 == 6 && CHAPTER == 2 {
            currentQuestionArray = goidon1L7carray
        } else if GOIDON1 == 7 && CHAPTER == 0 {
            currentQuestionArray = goidon1L8aarray
        } else if GOIDON1 == 7 && CHAPTER == 1 {
            currentQuestionArray = goidon1L8barray
        } else if GOIDON1 == 7 && CHAPTER == 2 {
            currentQuestionArray = goidon1L8carray
        } else if GOIDON1 == 8 && CHAPTER == 0 {
            currentQuestionArray = goidon1L9aarray
        } else if GOIDON1 == 8 && CHAPTER == 1 {
            currentQuestionArray = goidon1L9barray
        } else if GOIDON1 == 8 && CHAPTER == 2 {
            currentQuestionArray = goidon1L9carray
        } else if GOIDON1 == 9 && CHAPTER == 0 {
            currentQuestionArray = goidon1L10aarray
        } else if GOIDON1 == 9 && CHAPTER == 1 {
            currentQuestionArray = goidon1L10barray
        } else if GOIDON1 == 9 && CHAPTER == 2 {
            currentQuestionArray = goidon1L10carray
        } else if GOIDON1 == 10 && CHAPTER == 0 {
            currentQuestionArray = goidon1L11aarray
        } else if GOIDON1 == 10 && CHAPTER == 1 {
            currentQuestionArray = goidon1L11barray
        } else if GOIDON1 == 10 && CHAPTER == 2 {
            currentQuestionArray = goidon1L11carray
        } else if GOIDON1 == 11 && CHAPTER == 0 {
            currentQuestionArray = goidon1L12aarray
        } else if GOIDON1 == 11 && CHAPTER == 1 {
            currentQuestionArray = goidon1L12barray
        } else if GOIDON1 == 11 && CHAPTER == 2 {
            currentQuestionArray = goidon1L12carray
        } else if GOIDON1 == 12 && CHAPTER == 0 {
            currentQuestionArray = goidon1L13aarray
        } else if GOIDON1 == 12 && CHAPTER == 1 {
            currentQuestionArray = goidon1L13barray
        } else if GOIDON1 == 12 && CHAPTER == 2 {
            currentQuestionArray = goidon1L13carray
        } else if GOIDON1 == 13 && CHAPTER == 0 {
            currentQuestionArray = goidon1L14aarray
        } else if GOIDON1 == 13 && CHAPTER == 1 {
            currentQuestionArray = goidon1L14barray
        } else if GOIDON1 == 13 && CHAPTER == 2 {
            currentQuestionArray = goidon1L14carray
        } else if GOIDON1 == 14 && CHAPTER == 0 {
            currentQuestionArray = goidon1L15aarray
        } else if GOIDON1 == 14 && CHAPTER == 1 {
            currentQuestionArray = goidon1L15barray
        } else if GOIDON1 == 14 && CHAPTER == 2 {
            currentQuestionArray = goidon1L15carray
        } else if GOIDON1 == 15 && CHAPTER == 0 {
            currentQuestionArray = goidon1L16aarray
        } else if GOIDON1 == 15 && CHAPTER == 1 {
            currentQuestionArray = goidon1L16barray
        } else if GOIDON1 == 15 && CHAPTER == 2 {
            currentQuestionArray = goidon1L16carray
        } else if GOIDON1 == 16 && CHAPTER == 0 {
            currentQuestionArray = goidon1L17aarray
        } else if GOIDON1 == 16 && CHAPTER == 1 {
            currentQuestionArray = goidon1L17barray
        } else if GOIDON1 == 16 && CHAPTER == 2 {
            currentQuestionArray = goidon1L17carray
        } else if GOIDON1 == 17 && CHAPTER == 0 {
            currentQuestionArray = goidon1L18aarray
        } else if GOIDON1 == 17 && CHAPTER == 1 {
            currentQuestionArray = goidon1L18barray
        } else if GOIDON1 == 17 && CHAPTER == 2 {
            currentQuestionArray = goidon1L18carray
        } else if GOIDON1 == 18 && CHAPTER == 0 {
            currentQuestionArray = goidon1L19aarray
        } else if GOIDON1 == 18 && CHAPTER == 1 {
            currentQuestionArray = goidon1L19barray
        } else if GOIDON1 == 18 && CHAPTER == 2 {
            currentQuestionArray = goidon1L19carray
        } else if GOIDON1 == 19 && CHAPTER == 0 {
            currentQuestionArray = goidon1L20aarray
        } else if GOIDON1 == 19 && CHAPTER == 1 {
            currentQuestionArray = goidon1L20barray
        } else if GOIDON1 == 19 && CHAPTER == 2 {
            currentQuestionArray = goidon1L20carray
        } else {
            return
        }
        
        let currentQuestion = shuffledQuestions[currentQuestionIndex]
        
        let shuffledAnswer = currentQuestion["kanji"]
        let shuffledHiragana = currentQuestion["hiragana"]
        
        if answer == shuffledAnswer {
            // 正解の場合の処理
            checkmarkImageView.isHidden = false
            goodjobLabel.isHidden = false
            
            if currentQuestionIndex < shuffledQuestions.count - 1 {
                currentQuestionIndex += 1
                let nextQuestion = shuffledQuestions[currentQuestionIndex]
                meaningLabel.text = nextQuestion["meaning"]
                
                textField.text = ""
                
                // 正解の場合にprogressViewを進める
                updateProgressView()
            } else {
                // 不正解の場合の処理
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let finishViewController = storyboard.instantiateViewController(withIdentifier: "FinishViewController") as! FinishViewController
                    self.navigationController?.pushViewController(finishViewController, animated: true)
                }
                return
            }
        } else {
            relearnImageView.isHidden = false
            kotaeLabel.isHidden = false
            yomiganaLabel.isHidden = false
            kotaeLabel.text = shuffledAnswer
            yomiganaLabel.text = shuffledHiragana
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.checkmarkImageView.isHidden = true
            self.goodjobLabel.isHidden = true
            self.relearnImageView.isHidden = true
            self.kotaeLabel.isHidden = true
            self.yomiganaLabel.isHidden = true
        }
    }
    
    func updateProgressView() {
        // currentArrayの要素数を取得
        let numberOfItemsInCurrentArray = shuffledQuestions.count

        // 現在の進捗を計算（0% ～ 100%）
        let currentProgress = Float(currentQuestionIndex) / Float(numberOfItemsInCurrentArray)
        
        // Set progress to 1.0 if on the last element
        if currentQuestionIndex == shuffledQuestions.count - 1 {
            progressView.setProgress(1.0, animated: true)
        } else {
            progressView.setProgress(currentProgress, animated: true)
        }
    }
    
}
