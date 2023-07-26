//
//  Genki1YomiQuizViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/07/25.
//

import UIKit

class Genki1YomiQuizViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var greenView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleShadowLabel: UILabel!
    @IBOutlet var chapterLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet var cardButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var kanjiLabel: UILabel!
    @IBOutlet var meaningLabel: UILabel!
    @IBOutlet var checkmarkImageView: UIImageView!
    @IBOutlet var goodjobLabel: UILabel!
    @IBOutlet var relearnImageView: UIImageView!
    @IBOutlet var kotaeLabel: UILabel!
    
    var currentArray: [[String: String]] = []
    var index = 0
    
    var CHAPTER: Int = 0
    var GENKI1: Int = 0
    
    var genki1L1aarray = [
        ["hiragana":"あの","kanji":"あの","meaning":"that; those; the"],
        ["hiragana":"いま","kanji":"今","meaning":"now"],
        ["hiragana":"えいご","kanji":"英語","meaning":"English (language)"],
        ["hiragana":"ええ","kanji":"ええ","meaning":"yes"],
        ["hiragana":"がくせい","kanji":"学生","meaning":"student (esp. a university student)"],
        ["hiragana":"ご","kanji":"語","meaning":"word, speech, language"],
        ["hiragana":"こうこう","kanji":"高校","meaning":"senior high school"],
        ["hiragana":"ごご","kanji":"午後","meaning":"p.m."],
        ["hiragana":"ごぜん","kanji":"午前","meaning":"a.m."],
        ["hiragana":"さい","kanji":"歳","meaning":"-years-old"]
    ]
    
    var genki1L1barray = [
        ["hiragana":"–さん","kanji":"–さん","meaning":"Ms./Mr. (after a person's name (or position, etc.))"],
        ["hiragana":"じ","kanji":"–時","meaning":"o'clock"],
        ["hiragana":"じん","kanji":"–人","meaning":"-ian (e.g. Italian) (indicates nationality, race, origin, etc.)"],
        ["hiragana":"せんせい","kanji":"先生","meaning":"teacher"],
        ["hiragana":"せんもん","kanji":"専門","meaning":"speciality"],
        ["hiragana":"だいがく","kanji":"大学","meaning":"university"],
        ["hiragana":"でんわ","kanji":"電話","meaning":"phone call; telephone (device); phone"],
        ["hiragana":"ともだち","kanji":"友達","meaning":"friend"],
        ["hiragana":"なまえ","kanji":"名前","meaning":"name"],
        ["hiragana":"なに","kanji":"何","meaning":"what"]
    ]
    
    var genki1L1carray = [
        ["hiragana":"にほん","kanji":"日本","meaning":"Japan"],
        ["hiragana":"ねんせい","kanji":"–年生","meaning":"student in ... year"],
        ["hiragana":"はい","kanji":"はい","meaning":"half"],
        ["hiragana":"はん","kanji":"半","meaning":"half"],
        ["hiragana":"ばんごう","kanji":"番号","meaning":"number"],
        ["hiragana":"りゅうがくせい","kanji":"留学生","meaning":"international student"],
        ["hiragana":"わたし","kanji":"私","meaning":"I (slightly formal or feminine)"],
        ["hiragana":"あめりか","kanji":"アメリカ","meaning":"America"],
        ["hiragana":"いぎりす","kanji":"イギリス","meaning":"Great Britain"],
        ["hiragana":"おーすとらりあ","kanji":"オーストラリア","meaning":"Australia"]
    ]
    
    var genki1L1darray = [
        ["hiragana":"かんこく","kanji":"韓国","meaning":"South Korea"],
        ["hiragana":"すうぇーでん","kanji":"スウェーデン","meaning":"Sweden"],
        ["hiragana":"ちゅうごく","kanji":"中国","meaning":"China"],
        ["hiragana":"かがく","kanji":"科学","meaning":"science"],
        ["hiragana":"あじあ","kanji":"アジア","meaning":"Asia"],
        ["hiragana":"けんきゅう","kanji":"研究","meaning":"study; research; investigation"],
        ["hiragana":"けいざい","kanji":"経済","meaning":"economics"],
        ["hiragana":"こくさいかんけい","kanji":"国際関係","meaning":"international relations"],
        ["hiragana":"こんぴゅーたー","kanji":"コンピューター","meaning":"computer"],
        ["hiragana":"じんるいがく","kanji":"人類学","meaning":"anthropology"]
    ]
    
    var genki1L1earray = [
        ["hiragana":"せいじ","kanji":"政治","meaning":"politics"],
        ["hiragana":"びじねす","kanji":"ビジネス","meaning":"business"],
        ["hiragana":"ぶんがく","kanji":"文学","meaning":"literature"],
        ["hiragana":"れきし","kanji":"歴史","meaning":"history"],
        ["hiragana":"しごと","kanji":"仕事","meaning":"work; job; occupation"],
        ["hiragana":"いしゃ","kanji":"医者","meaning":"(medical) doctor"],
        ["hiragana":"かいしゃいん","kanji":"会社員","meaning":"company employee"],
        ["hiragana":"こうこうせい","kanji":"高校生","meaning":"senior high school student"],
        ["hiragana":"しゅふ","kanji":"主婦","meaning":"housewife"],
        ["hiragana":"だいがくいんせい","kanji":"大学院生","meaning":"graduate student"]
    ]
    
    var genki1L1farray = [
        ["hiragana":"だいがくせい","kanji":"大学生","meaning":"university student; college student"],
        ["hiragana":"べんごし","kanji":"弁護士","meaning":"lawyer"],
        ["hiragana":"おかあさん","kanji":"お母さん","meaning":"mother"],
        ["hiragana":"おとうさん","kanji":"お父さん","meaning":"father"],
        ["hiragana":"おねえさん","kanji":"お姉さん","meaning":"elder sister"],
        ["hiragana":"おにいさん","kanji":"お兄さん","meaning":"older brother"],
        ["hiragana":"いもうと","kanji":"妹","meaning":"younger sister"],
        ["hiragana":"おとうと","kanji":"弟","meaning":"younger brother"]
    ]
    
    var genki1L2aarray = [
        ["hiragana":"おいしい","kanji":"美味しい","meaning":"delicious"],
        ["hiragana":"さかな","kanji":"魚","meaning":"fish"],
        ["hiragana":"にく","kanji":"肉","meaning":"meat"],
        ["hiragana":"めにゅー","kanji":"メニュー","meaning":"menu"],
        ["hiragana":"やさい","kanji":"野菜","meaning":"vegetable"],
        ["hiragana":"えんぴつ","kanji":"鉛筆","meaning":"pencil"],
        ["hiragana":"かさ","kanji":"傘","meaning":"umbrella"],
        ["hiragana":"かばん","kanji":"鞄","meaning":"bag"],
        ["hiragana":"くつ","kanji":"靴","meaning":"shoes"],
        ["hiragana":"さいふ","kanji":"財布","meaning":"wallet"]
    ]
    
    var genki1L2barray = [
        ["hiragana":"じーんず","kanji":"ジーンズ","meaning":"jeans"],
        ["hiragana":"じしょ","kanji":"辞書","meaning":"dictionary"],
        ["hiragana":"じてんしゃ","kanji":"自転車","meaning":"bicycle"],
        ["hiragana":"しんぶん","kanji":"新聞","meaning":"newspaper"],
        ["hiragana":"てーぷ","kanji":"テープ","meaning":"tape"],
        ["hiragana":"とけい","kanji":"時計","meaning":"clock; watch"],
        ["hiragana":"とれーなー","kanji":"トレーナー","meaning":"sweatshirt"],
        ["hiragana":"のーと","kanji":"ノート","meaning":"notebook"],
        ["hiragana":"ぺん","kanji":"ペン","meaning":"pen"],
        ["hiragana":"ぼうし","kanji":"帽子","meaning":"hat"]
    ]
    
    var genki1L2carray = [
        ["hiragana":"ほん","kanji":"本","meaning":"book"],
        ["hiragana":"おてあらい","kanji":"お手洗い","meaning":"restroom"],
        ["hiragana":"きっさてん","kanji":"喫茶店","meaning":"coffee shop; tearoom; coffeehouse; cafe"],
        ["hiragana":"ぎんこう","kanji":"銀行","meaning":"bank"],
        ["hiragana":"としょかん","kanji":"図書館","meaning":"library"],
        ["hiragana":"ゆうびんきょく","kanji":"郵便局","meaning":"post office"],
        ["hiragana":"あめりか","kanji":"アメリカ","meaning":"America"],
        ["hiragana":"いぎりす","kanji":"イギリス","meaning":"Great Britain"],
        ["hiragana":"かんこく","kanji":"韓国","meaning":"South Korea"],
        ["hiragana":"ちゅうごく","kanji":"中国","meaning":"China"]
    ]
    
    var genki1L2darray = [
        ["hiragana":"けいざい","kanji":"経済","meaning":"economics"],
        ["hiragana":"こんぴゅーたー","kanji":"コンピューター","meaning":"computer"],
        ["hiragana":"びじねす","kanji":"ビジネス","meaning":"business"],
        ["hiragana":"れきし","kanji":"歴史","meaning":"history"],
        ["hiragana":"おかあさん","kanji":"お母さん","meaning":"mother"],
        ["hiragana":"おとうさん","kanji":"お父さん","meaning":"father"],
        ["hiragana":"いくら","kanji":"幾ら","meaning":"how much"],
        ["hiragana":"えん","kanji":"円","meaning":"yen (Japanese monetary unit)"],
        ["hiragana":"たかい","kanji":"高い","meaning":"expensive"],
        ["hiragana":"いらっしゃいませ","kanji":"いらっしゃいませ","meaning":"welcome (used in shops, restaurants, etc.)"]
    ]
    
    var genki1L2earray = [
        ["hiragana":"おねがいします","kanji":"お願いします","meaning":"please"],
        ["hiragana":"ください","kanji":"下さい","meaning":"please (give me)"],
        ["hiragana":"じゃあ","kanji":"じゃあ","meaning":"then; well"],
        ["hiragana":"どうぞ","kanji":"どうぞ","meaning":"please; kindly; I beg of you; here you are"],
        ["hiragana":"どうも","kanji":"どうも","meaning":"thank you; thanks"]
    ]
    
    var genki1L3aarray = [
        ["hiragana":"えいが","kanji":"映画","meaning":"movie"],
        ["hiragana":"おんがく","kanji":"音楽","meaning":"music"],
        ["hiragana":"ざっし","kanji":"雑誌","meaning":"magazine"],
        ["hiragana":"すぽーつ","kanji":"スポーツ","meaning":"sports"],
        ["hiragana":"でーと","kanji":"デート","meaning":"date (with someone)"],
        ["hiragana":"てにす","kanji":"テニス","meaning":"tennis"],
        ["hiragana":"てれび","kanji":"テレビ","meaning":"TV"],
        ["hiragana":"びでお","kanji":"ビデオ","meaning":"video"],
        ["hiragana":"あさごはん","kanji":"朝御飯","meaning":"breakfast"],
        ["hiragana":"おさけ","kanji":"お酒","meaning":"alcohol; sake"]
    ]
    
    var genki1L3barray = [
        ["hiragana":"おちゃ","kanji":"お茶","meaning":"tea"],
        ["hiragana":"こーひー","kanji":"コーヒー","meaning":"coffee"],
        ["hiragana":"ばんごはん","kanji":"晩御飯","meaning":"dinner"],
        ["hiragana":"はんばーがー","kanji":"ハンバーガー","meaning":"hamburger (on a bun)"],
        ["hiragana":"ひるごはん","kanji":"昼御飯","meaning":"lunch"],
        ["hiragana":"みず","kanji":"水","meaning":"water (esp. cool, fresh water, e.g. drinking water)"],
        ["hiragana":"いえ","kanji":"家","meaning":"house; residence"],
        ["hiragana":"うち","kanji":"家","meaning":"house; one's home"],
        ["hiragana":"がっこう","kanji":"学校","meaning":"school"],
        ["hiragana":"あさ","kanji":"朝","meaning":"morning"]
    ]
    
    var genki1L3carray = [
        ["hiragana":"あした","kanji":"明日","meaning":"tomorrow"],
        ["hiragana":"いつ","kanji":"いつ","meaning":"when"],
        ["hiragana":"きょう","kanji":"今日","meaning":"today"],
        ["hiragana":"こんばん","kanji":"今晩","meaning":"tonight"],
        ["hiragana":"しゅうまつ","kanji":"週末","meaning":"weekend"],
        ["hiragana":"どようび","kanji":"土曜日","meaning":"Saturday"],
        ["hiragana":"にちようび","kanji":"日曜日","meaning":"Sunday"],
        ["hiragana":"まいにち","kanji":"毎日","meaning":"every day"],
        ["hiragana":"まいばん","kanji":"毎晩","meaning":"every night"],
        ["hiragana":"いく","kanji":"行く","meaning":"to go"]
    ]
    
    var genki1L3darray = [
        ["hiragana":"かえる","kanji":"帰る","meaning":"to return; to go back"],
        ["hiragana":"きく","kanji":"聞く","meaning":"to hear; to listen (e.g. to music)"],
        ["hiragana":"のむ","kanji":"飲む","meaning":"to drink"],
        ["hiragana":"はなす","kanji":"話す","meaning":"to speak"],
        ["hiragana":"よむ","kanji":"読む","meaning":"to read"],
        ["hiragana":"おきる","kanji":"起きる","meaning":"to get up"],
        ["hiragana":"たべる","kanji":"食べる","meaning":"to eat"],
        ["hiragana":"ねる","kanji":"寝る","meaning":"to sleep (lying down)"],
        ["hiragana":"みる","kanji":"見る","meaning":"to see; to look; to watch"],
        ["hiragana":"くる","kanji":"来る","meaning":"to come (spatially or temporally)"]
    ]
    
    var genki1L3earray = [
        ["hiragana":"べんきょう","kanji":"勉強","meaning":"study"],
        ["hiragana":"はやい","kanji":"早い","meaning":"early (in the day, etc.)"],
        ["hiragana":"ぜんぜん","kanji":"全然","meaning":"(not) at all (with neg. sentence)"],
        ["hiragana":"たいてい","kanji":"大抵","meaning":"usually"],
        ["hiragana":"ときどき","kanji":"時々","meaning":"sometimes"],
        ["hiragana":"そうですね","kanji":"そうですね","meaning":"that's so, isn't it"],
        ["hiragana":"でも","kanji":"でも","meaning":"but"]
    ]
    
    var genki1L4aarray = [
        ["hiragana":"あるばいと","kanji":"アルバイト","meaning":"part-time job"],
        ["hiragana":"かいもの","kanji":"買い物","meaning":"shopping"],
        ["hiragana":"くらす","kanji":"クラス","meaning":"class"],
        ["hiragana":"いぬ","kanji":"犬","meaning":"dog"],
        ["hiragana":"おみやげ","kanji":"お土産","meaning":"local specialty or souvenir bought as a gift while travelling"],
        ["hiragana":"こども","kanji":"子供","meaning":"child"],
        ["hiragana":"ごはん","kanji":"御飯","meaning":"cooked rice; meal"],
        ["hiragana":"しゃしん","kanji":"写真","meaning":"photograph"],
        ["hiragana":"つくえ","kanji":"机","meaning":"desk; table"],
        ["hiragana":"てがみ","kanji":"手紙","meaning":"letter"]
    ]
    
    var genki1L4barray = [
        ["hiragana":"ねこ","kanji":"猫","meaning":"cat"],
        ["hiragana":"ぱん","kanji":"パン","meaning":"bread"],
        ["hiragana":"ひと","kanji":"人","meaning":"person"],
        ["hiragana":"おてら","kanji":"お寺","meaning":"temple"],
        ["hiragana":"こうえん","kanji":"公園","meaning":"(public) park"],
        ["hiragana":"すーぱー","kanji":"スーパー","meaning":"supermarket"],
        ["hiragana":"でぱーと","kanji":"デパート","meaning":"department store"],
        ["hiragana":"ばすてい","kanji":"バス停","meaning":"bus stop"],
        ["hiragana":"びょういん","kanji":"病院","meaning":"hospital"],
        ["hiragana":"ほてる","kanji":"ホテル","meaning":"hotel"]
    ]
    
    var genki1L4carray = [
        ["hiragana":"ほんや","kanji":"本屋","meaning":"bookstore"],
        ["hiragana":"まち","kanji":"町","meaning":"town, village, block, street"],
        ["hiragana":"れすとらん","kanji":"レストラン","meaning":"restaurant (esp. Western-style)"],
        ["hiragana":"きのう","kanji":"昨日","meaning":"yesterday"],
        ["hiragana":"さっき","kanji":"さっき","meaning":"some time ago"],
        ["hiragana":"じかん","kanji":"時間","meaning":"time; hour; period"],
        ["hiragana":"いちじかん","kanji":"一時間","meaning":"one hour"],
        ["hiragana":"せんしゅう","kanji":"先週","meaning":"last week"],
        ["hiragana":"とき","kanji":"時","meaning":"time, hour"],
        ["hiragana":"げつようび","kanji":"月曜日","meaning":"Monday"]
    ]
    
    var genki1L4darray = [
        ["hiragana":"かようび","kanji":"火曜日","meaning":"Tuesday"],
        ["hiragana":"すいようび","kanji":"水曜日","meaning":"Wednesday"],
        ["hiragana":"もくようび","kanji":"木曜日","meaning":"Thursday"],
        ["hiragana":"きんようび","kanji":"金曜日","meaning":"Friday"],
        ["hiragana":"あう","kanji":"会う","meaning":"to meet; to encounter; to see"],
        ["hiragana":"かう","kanji":"買う","meaning":"to buy"],
        ["hiragana":"かく","kanji":"書く","meaning":"to write"],
        ["hiragana":"とる","kanji":"撮る","meaning":"to take (a photo)"],
        ["hiragana":"まつ","kanji":"待つ","meaning":"to wait"],
        ["hiragana":"わかる","kanji":"分かる","meaning":"to understand"]
    ]
    
    var genki1L4earray = [
        ["hiragana":"ぐらい","kanji":"ぐらい","meaning":"approximately; about"],
        ["hiragana":"だから","kanji":"だから","meaning":"so; therefore"],
        ["hiragana":"たくさん","kanji":"沢山","meaning":"a lot; many"],
        ["hiragana":"と","kanji":"と","meaning":"with"],
        ["hiragana":"どうして","kanji":"どうして","meaning":"why"],
        ["hiragana":"ひとりで","kanji":"一人で","meaning":"alone; by oneself; on one's own"],
        ["hiragana":"もしもし","kanji":"もしもし","meaning":"hello (e.g. on phone)"],
        ["hiragana":"みぎ","kanji":"右","meaning":"right"],
        ["hiragana":"ひだり","kanji":"左","meaning":"left"],
        ["hiragana":"まえ","kanji":"前","meaning":"in front; before"]
    ]
    
    var genki1L4farray = [
        ["hiragana":"うしろ","kanji":"うしろ","meaning":"back; behind; rear"],
        ["hiragana":"なか","kanji":"中","meaning":"inside"],
        ["hiragana":"うえ","kanji":"上","meaning":"above; on top; one's elder (referring to a sibling)"]
    ]
    
    var genki1L5aarray = [
        ["hiragana":"うみ","kanji":"海","meaning":"sea; ocean"],
        ["hiragana":"きって","kanji":"切手","meaning":"stamp (postage)"],
        ["hiragana":"きっぷ","kanji":"切符","meaning":"ticket (for transportation)"],
        ["hiragana":"さーふぃん","kanji":"サーフィン","meaning":"surfing"],
        ["hiragana":"しゅくだい","kanji":"宿題","meaning":"homework"],
        ["hiragana":"たべもの","kanji":"食べ物","meaning":"food"],
        ["hiragana":"たんじょうび","kanji":"誕生日","meaning":"birthday"],
        ["hiragana":"てすと","kanji":"テスト","meaning":"test"],
        ["hiragana":"てんき","kanji":"天気","meaning":"weather"],
        ["hiragana":"のみもの","kanji":"飲み物","meaning":"drink"]
    ]
    
    var genki1L5barray = [
        ["hiragana":"はがき","kanji":"葉書","meaning":"postcard"],
        ["hiragana":"ばす","kanji":"バス","meaning":"bus"],
        ["hiragana":"ひこうき","kanji":"飛行機","meaning":"airplane"],
        ["hiragana":"へや","kanji":"部屋","meaning":"room; chamber"],
        ["hiragana":"ぼく","kanji":"僕","meaning":"me, I (male)"],
        ["hiragana":"やすみ","kanji":"休み","meaning":"rest; recess; vacation; holiday; absence"],
        ["hiragana":"りょこう","kanji":"旅行","meaning":"travel; trip; journey; excursion; tour"],
        ["hiragana":"あたらしい","kanji":"新しい","meaning":"new; fresh; recent; latest"],
        ["hiragana":"あつい","kanji":"暑い","meaning":"hot; warm; sultry; heated"],
        ["hiragana":"あつい","kanji":"熱い","meaning":"hot (thing)"]
    ]
    
    var genki1L5carray = [
        ["hiragana":"いそがしい","kanji":"忙しい","meaning":"busy"],
        ["hiragana":"おおきい","kanji":"大きい","meaning":"big; large; great"],
        ["hiragana":"おもしろい","kanji":"面白い","meaning":"interesting; amusing; funny; comical"],
        ["hiragana":"こわい","kanji":"怖い","meaning":"scary; frightening; eerie; dreadful"],
        ["hiragana":"さむい","kanji":"寒い","meaning":"cold (e.g. weather)"],
        ["hiragana":"たのしい","kanji":"楽しい","meaning":"enjoyable; fun; pleasant; happy; delightful"],
        ["hiragana":"ちいさい","kanji":"小さい","meaning":"small"],
        ["hiragana":"ふるい","kanji":"古い","meaning":"old (of things, not people)"],
        ["hiragana":"むずかしい","kanji":"難しい","meaning":"difficult"],
        ["hiragana":"やさしい","kanji":"易しい","meaning":"easy"]
    ]
    
    var genki1L5darray = [
        ["hiragana":"やすい","kanji":"安い","meaning":"cheap; inexpensive"],
        ["hiragana":"きらい","kanji":"嫌い","meaning":"disliked"],
        ["hiragana":"げんき","kanji":"元気","meaning":"energetic; healthy"],
        ["hiragana":"しずか","kanji":"静か","meaning":"quiet"],
        ["hiragana":"すき","kanji":"好き","meaning":"liked; favorite; in love (with)"],
        ["hiragana":"だいきらい","kanji":"大嫌い","meaning":"detestable; abhorrent; loathsome"],
        ["hiragana":"だいすき","kanji":"大好き","meaning":"loveable; very likeable; like very much"],
        ["hiragana":"にぎやか","kanji":"賑やか","meaning":"bustling; busy; lively"],
        ["hiragana":"はんさむ","kanji":"ハンサム","meaning":"handsome"],
        ["hiragana":"ひま","kanji":"暇","meaning":"spare time, rest, leisure, time"]
    ]
    
    var genki1L5earray = [
        ["hiragana":"およぐ","kanji":"泳ぐ","meaning":"to swim"],
        ["hiragana":"きく","kanji":"聞く","meaning":"to hear; to listen; to ask; to enquire; to query"],
        ["hiragana":"のる","kanji":"乗る","meaning":"to get in; to board"],
        ["hiragana":"でかける","kanji":"出かける","meaning":"to go out (e.g. on an excursion or outing)"],
        ["hiragana":"いっしょに","kanji":"一緒に","meaning":"together (with)"],
        ["hiragana":"それから","kanji":"それから","meaning":"and then"],
        ["hiragana":"だいじょうぶ","kanji":"大丈夫","meaning":"all right; okay"],
        ["hiragana":"どんな","kanji":"どんな","meaning":"what kind of"],
        ["hiragana":"まい","kanji":"枚","meaning":"counter for flat objects (e.g. sheets of paper)"],
        ["hiragana":"まで","kanji":"まで","meaning":"until (a time); as far as"]
    ]
    
    var genki1L6aarray = [
        ["hiragana":"おかね","kanji":"お金","meaning":"money"],
        ["hiragana":"おばあさん","kanji":"おばあさん","meaning":"grandmother; old woman; female senior citizen"],
        ["hiragana":"おふろ","kanji":"お風呂","meaning":"bath"],
        ["hiragana":"かんじ","kanji":"漢字","meaning":"kanji; Chinese characters"],
        ["hiragana":"きょうかしょ","kanji":"教科書","meaning":"textbook"],
        ["hiragana":"こんしゅう","kanji":"今週","meaning":"this week"],
        ["hiragana":"つぎ","kanji":"次","meaning":"next"],
        ["hiragana":"てれびげーむ","kanji":"テレビゲーム","meaning":"video game"],
        ["hiragana":"でんき","kanji":"電気","meaning":"electricity"],
        ["hiragana":"でんしゃ","kanji":"電車","meaning":"train"]
    ]
    
    var genki1L6barray = [
        ["hiragana":"にもつ","kanji":"荷物","meaning":"baggage"],
        ["hiragana":"ぺーじ","kanji":"ページ","meaning":"page"],
        ["hiragana":"まど","kanji":"窓","meaning":"window"],
        ["hiragana":"よる","kanji":"夜","meaning":"night"],
        ["hiragana":"らいしゅう","kanji":"来週","meaning":"next week"],
        ["hiragana":"らいねん","kanji":"来年","meaning":"next year"],
        ["hiragana":"たいへん","kanji":"大変","meaning":"very; greatly; terribly; serious; difficult; hard"],
        ["hiragana":"あそぶ","kanji":"遊ぶ","meaning":"to play (games, sports); to meet up (with friends); to hang out"],
        ["hiragana":"いそぐ","kanji":"急ぐ","meaning":"to hurry"],
        ["hiragana":"おふろにはいる","kanji":"お風呂に入る","meaning":"to take a bath"]
    ]
    
    var genki1L6carray = [
        ["hiragana":"かえす","kanji":"返す","meaning":"to return (something)"],
        ["hiragana":"けす","kanji":"消す","meaning":"to erase; to turn off (power)"],
        ["hiragana":"しぬ","kanji":"死ぬ","meaning":"to die"],
        ["hiragana":"すわる","kanji":"座る","meaning":"to sit"],
        ["hiragana":"たつ","kanji":"立つ","meaning":"to stand up"],
        ["hiragana":"たばこ","kanji":"タバコ","meaning":"tabacco"],
        ["hiragana":"すう","kanji":"吸う","meaning":"to smoke; to breathe in; to inhale"],
        ["hiragana":"つかう","kanji":"使う","meaning":"to use (a thing, method, etc.)"],
        ["hiragana":"てつだう","kanji":"手伝う","meaning":"to help; to assist; to aid"],
        ["hiragana":"はいる","kanji":"入る","meaning":"to enter; to go into"]
    ]
    
    var genki1L6darray = [
        ["hiragana":"もつ","kanji":"持つ","meaning":"to hold (in one's hand); to possess; to have; to own"],
        ["hiragana":"やすむ","kanji":"休む","meaning":"to be absent; to rest; to take a break"],
        ["hiragana":"あける","kanji":"開ける","meaning":"to open (e.g. doors)"],
        ["hiragana":"おしえる","kanji":"教える","meaning":"to teach; to instruct"],
        ["hiragana":"おりる","kanji":"降りる","meaning":"to descend; to get off"],
        ["hiragana":"かりる","kanji":"借りる","meaning":"to borrow"],
        ["hiragana":"しめる","kanji":"閉める","meaning":"to close"],
        ["hiragana":"つける","kanji":"点ける","meaning":"to turn on; to be lit"],
        ["hiragana":"でんわをかける","kanji":"電話をかける","meaning":"to make a phone call"],
        ["hiragana":"わすれる","kanji":"忘れる","meaning":"to forget"]
    ]
    
    var genki1L6earray = [
        ["hiragana":"つれてくる","kanji":"連れてくる","meaning":"to bring someone along"],
        ["hiragana":"もってくる","kanji":"持ってくる","meaning":"to bring"],
        ["hiragana":"あとで","kanji":"後で","meaning":"afterwards"],
        ["hiragana":"おそく","kanji":"遅く","meaning":"late"],
        ["hiragana":"から","kanji":"から","meaning":"because (follows verbs, adjectives)"],
        ["hiragana":"けっこう","kanji":"結構","meaning":"fine (in the sense of 'I'm fine'); no thank you; quite; fairly"],
        ["hiragana":"ほんとう","kanji":"本当","meaning":"truth; reality; actuality; fact"],
        ["hiragana":"ゆっくり","kanji":"ゆっくり","meaning":"slowly"]
    ]
    
    var genki1L7aarray = [
        ["hiragana":"あね","kanji":"姉","meaning":"older sister"],
        ["hiragana":"あぱーと","kanji":"アパート","meaning":"apartment"],
        ["hiragana":"いもうと","kanji":"妹","meaning":"younger sister"],
        ["hiragana":"うた","kanji":"歌","meaning":"song"],
        ["hiragana":"おとうと","kanji":"弟","meaning":"younger brother"],
        ["hiragana":"おとこのひと","kanji":"男の人","meaning":"man"],
        ["hiragana":"おにいさん","kanji":"お兄さん","meaning":"older brother"],
        ["hiragana":"おねえさん","kanji":"お姉さん","meaning":"elder sister"],
        ["hiragana":"おんなのひと","kanji":"女の人","meaning":"woman"],
        ["hiragana":"かいしゃ","kanji":"会社","meaning":"company"]
    ]
    
    var genki1L7barray = [
        ["hiragana":"かぞく","kanji":"家族","meaning":"family"],
        ["hiragana":"かみ","kanji":"髪","meaning":"hair (on the head)"],
        ["hiragana":"きょうだい","kanji":"兄弟","meaning":"brothers and sisters"],
        ["hiragana":"くに","kanji":"国","meaning":"country"],
        ["hiragana":"くるま","kanji":"車","meaning":"car"],
        ["hiragana":"こんびに","kanji":"コンビニ","meaning":"convenience store"],
        ["hiragana":"しょくどう","kanji":"食堂","meaning":"dining room; cafeteria"],
        ["hiragana":"ちち","kanji":"父","meaning":"father"],
        ["hiragana":"しゃつ","kanji":"シャツ","meaning":"shirt (undergarment)"],
        ["hiragana":"め","kanji":"目","meaning":"eye"]
    ]
    
    var genki1L7carray = [
        ["hiragana":"めがね","kanji":"眼鏡","meaning":"glasses; eyeglasses"],
        ["hiragana":"かっこういい","kanji":"格好良い","meaning":"attractive; good-looking; stylish; cool"],
        ["hiragana":"かわいい","kanji":"可愛い","meaning":"cute; adorable; charming; lovely"],
        ["hiragana":"せがたかい","kanji":"背が高い","meaning":"tall (of a person)"],
        ["hiragana":"せがひくい","kanji":"背が低い","meaning":"short (of a person)"],
        ["hiragana":"ながい","kanji":"長い","meaning":"long (distance, length)"],
        ["hiragana":"はやい","kanji":"速い","meaning":"fast"],
        ["hiragana":"みじかい","kanji":"短い","meaning":"short"],
        ["hiragana":"しんせつ","kanji":"親切","meaning":"kind"],
        ["hiragana":"べんり","kanji":"便利","meaning":"convenient; handy; useful"]
    ]
    
    var genki1L7darray = [
        ["hiragana":"うたう","kanji":"歌う","meaning":"to sing"],
        ["hiragana":"かぶる","kanji":"被る","meaning":"to put on (one's head)"],
        ["hiragana":"しる","kanji":"知る","meaning":"to be aware of; to know; to be conscious of; to cognize"],
        ["hiragana":"すむ","kanji":"住む","meaning":"to live (of humans); to reside"],
        ["hiragana":"はく","kanji":"履く","meaning":"to put on (lower-body clothing, e.g. pants, skirt, footwear)"],
        ["hiragana":"ふとる","kanji":"太る","meaning":"to gain weight"],
        ["hiragana":"かける","kanji":"掛ける","meaning":"to put on (glasses, etc.)"],
        ["hiragana":"きる","kanji":"着る","meaning":"to wear (from the shoulders down)"],
        ["hiragana":"つとめる","kanji":"勤める","meaning":"to work (for)"],
        ["hiragana":"やせる","kanji":"痩せる","meaning":"to lose weight"]
    ]
    
    var genki1L7earray = [
        ["hiragana":"なにも","kanji":"何も","meaning":"nothing (with neg. verb)"],
        ["hiragana":"ひとり","kanji":"一人","meaning":"one person"],
        ["hiragana":"ふたり","kanji":"二人","meaning":"two people"],
        ["hiragana":"べつに","kanji":"別に","meaning":"(not) particularly (with neg. sentence)"],
        ["hiragana":"もちろん","kanji":"勿論","meaning":"of course"],
        ["hiragana":"よかったら","kanji":"良かったら","meaning":"if you like"]
    ]
    
    var genki1L8aarray = [
        ["hiragana":"あさって","kanji":"明後日","meaning":"day after tomorrow"],
        ["hiragana":"あめ","kanji":"雨","meaning":"rain"],
        ["hiragana":"かいしゃいん","kanji":"会社員","meaning":"company employee"],
        ["hiragana":"かめら","kanji":"カメラ","meaning":"camera"],
        ["hiragana":"からおけ","kanji":"カラオケ","meaning":"karaoke"],
        ["hiragana":"くうき","kanji":"空気","meaning":"airplane"],
        ["hiragana":"けさ","kanji":"今朝","meaning":"this morning"],
        ["hiragana":"こんげつ","kanji":"今月","meaning":"this month"],
        ["hiragana":"しごと","kanji":"仕事","meaning":"work; job; occupation"],
        ["hiragana":"だいがくせい","kanji":"大学生","meaning":"university student; college student"]
    ]
    
    var genki1L8barray = [
        ["hiragana":"でぃすこ","kanji":"ディスコ","meaning":"disco"],
        ["hiragana":"てんきよほう","kanji":"天気予報","meaning":"weather forecast"],
        ["hiragana":"ところ","kanji":"所","meaning":"place"],
        ["hiragana":"とまと","kanji":"トマト","meaning":"tomato"],
        ["hiragana":"なつ","kanji":"夏","meaning":"summer"],
        ["hiragana":"なにか","kanji":"何か","meaning":"something; some; any"],
        ["hiragana":"ぱーてぃー","kanji":"パーティー","meaning":"party"],
        ["hiragana":"ばーべきゅー","kanji":"バーベキュー","meaning":"barbecue"],
        ["hiragana":"はし","kanji":"箸","meaning":"chopsticks"],
        ["hiragana":"ふゆ","kanji":"冬","meaning":"winter"]
    ]
    
    var genki1L8carray = [
        ["hiragana":"ほーむすてい","kanji":"ホームステイ","meaning":"homestay"],
        ["hiragana":"まいしゅう","kanji":"毎週","meaning":"every week"],
        ["hiragana":"らいげつ","kanji":"来月","meaning":"next month"],
        ["hiragana":"うまく","kanji":"上手","meaning":"skillful; proficient; good (at)"],
        ["hiragana":"へた","kanji":"下手","meaning":"unskillful; poor; awkward"],
        ["hiragana":"ゆうめい","kanji":"有名","meaning":"famous"],
        ["hiragana":"ふる","kanji":"降る","meaning":"to fall (of rain, snow, ash, etc.)"],
        ["hiragana":"あらう","kanji":"洗う","meaning":"to wash; to cleanse; to rinse"],
        ["hiragana":"いう","kanji":"言う","meaning":"to say; to utter; to declare"],
        ["hiragana":"いる","kanji":"要る","meaning":"to be needed; to be wanted"]
    ]
    
    var genki1L8darray = [
        ["hiragana":"おそく","kanji":"遅く","meaning":"slow; sluggish; late"],
        ["hiragana":"おもう","kanji":"思う","meaning":"to think; to consider; to believe"],
        ["hiragana":"きる","kanji":"切る","meaning":"to cut"],
        ["hiragana":"つくる","kanji":"作る","meaning":"to make; to produce; to manufacture"],
        ["hiragana":"もっていく","kanji":"持って行く","meaning":"to take"],
        ["hiragana":"じろじろみる","kanji":"じろじろ見る","meaning":"to stare at"],
        ["hiragana":"はじめる","kanji":"始める","meaning":"to begin"],
        ["hiragana":"うんてん","kanji":"運転","meaning":"driving"],
        ["hiragana":"せんたく","kanji":"洗濯","meaning":"laundry"],
        ["hiragana":"そうじ","kanji":"掃除","meaning":"cleaning; sweeping; dusting; scrubbing"]
    ]
    
    var genki1L8earray = [
        ["hiragana":"りょうり","kanji":"料理","meaning":"cooking; cuisine; meal"],
        ["hiragana":"ううん","kanji":"ううん","meaning":"nuh-uh; no"],
        ["hiragana":"うん","kanji":"うん","meaning":"yeah"],
        ["hiragana":"かんぱい","kanji":"乾杯","meaning":"cheers"],
        ["hiragana":"ざんねん","kanji":"残念","meaning":"disappointing"],
        ["hiragana":"まだ","kanji":"まだ","meaning":"(not) yet (with verb in the negative)"],
        ["hiragana":"みな","kanji":"皆","meaning":"everyone"]
    ]
    
    var genki1L9aarray = [
        ["hiragana":"いいこ","kanji":"いい子","meaning":"good girl/boy"],
        ["hiragana":"いろ","kanji":"色","meaning":"color"],
        ["hiragana":"おべんとう","kanji":"お弁当","meaning":"bento; Japanese box lunch"],
        ["hiragana":"おんせん","kanji":"温泉","meaning":"hot spring; onsen"],
        ["hiragana":"かぶき","kanji":"歌舞伎","meaning":"kabuki; Japanese classical drama"],
        ["hiragana":"ぎたー","kanji":"ギター","meaning":"guitar"],
        ["hiragana":"くすり","kanji":"薬","meaning":"medicine"],
        ["hiragana":"のむ","kanji":"飲む","meaning":"to drink; to gulp; to swallow; to take"],
        ["hiragana":"こんさーと","kanji":"コンサート","meaning":"concert"],
        ["hiragana":"こんど","kanji":"今度","meaning":"this time; next time; another time"]
    ]
    
    var genki1L9barray = [
        ["hiragana":"さくぶん","kanji":"作文","meaning":"writing (an essay, prose, etc.); composition"],
        ["hiragana":"しけん","kanji":"試験","meaning":"examination"],
        ["hiragana":"しんかんせん","kanji":"新幹線","meaning":"Shinkansen; bullet train"],
        ["hiragana":"すきー","kanji":"スキー","meaning":"ski"],
        ["hiragana":"せんげつ","kanji":"先月","meaning":"last month"],
        ["hiragana":"たんご","kanji":"単語","meaning":"word; vocabulary"],
        ["hiragana":"ぴあの","kanji":"ピアノ","meaning":"piano"],
        ["hiragana":"びょうき","kanji":"病気","meaning":"illness (usu. excluding minor ailments, e.g. colds); sickness"],
        ["hiragana":"あおい","kanji":"青い","meaning":"blue"],
        ["hiragana":"あかい","kanji":"赤い","meaning":"red"]
    ]
    
    var genki1L9carray = [
        ["hiragana":"くろい","kanji":"黒い","meaning":"black"],
        ["hiragana":"さびしい","kanji":"寂しい","meaning":"lonely; lonesome; solitary; desolate"],
        ["hiragana":"しろい","kanji":"白い","meaning":"white"],
        ["hiragana":"わかい","kanji":"若い","meaning":"young"],
        ["hiragana":"いじわる","kanji":"意地悪","meaning":"mean; malicious; ill-tempered; unkind"],
        ["hiragana":"おどる","kanji":"踊る","meaning":"to dance"],
        ["hiragana":"おわる","kanji":"終わる","meaning":"to end"],
        ["hiragana":"にんき","kanji":"人気","meaning":"popularity"],
        ["hiragana":"はじまる","kanji":"始まる","meaning":"to begin"],
        ["hiragana":"ひく","kanji":"弾く","meaning":"to play (a stringed or keyboard instrument)"]
    ]
    
    var genki1L9darray = [
        ["hiragana":"もらう","kanji":"貰う","meaning":"to receive; to take; to accept"],
        ["hiragana":"おぼえる","kanji":"覚える","meaning":"to memorize; to learn by heart; to remember; to learn"],
        ["hiragana":"でる","kanji":"出る","meaning":"to exit; to go out; to appear; to come out;"],
        ["hiragana":"うんどう","kanji":"運動","meaning":"exercise"],
        ["hiragana":"さんぽ","kanji":"散歩","meaning":"walk; stroll"],
        ["hiragana":"から","kanji":"から","meaning":"from (e.g. time, place, numerical quantity)"],
        ["hiragana":"ぜひ","kanji":"是非","meaning":"certainly"],
        ["hiragana":"ところで","kanji":"ところで","meaning":"by the way"],
        ["hiragana":"みな","kanji":"皆","meaning":"all, everything"],
        ["hiragana":"もう","kanji":"もう","meaning":"already"]
    ]
    
    var genki1L9earray = [
        ["hiragana":"ひとつ","kanji":"一つ","meaning":"one"],
        ["hiragana":"ふたつ","kanji":"二つ","meaning":"two"],
        ["hiragana":"みっつ","kanji":"三つ","meaning":"three"],
        ["hiragana":"よっつ","kanji":"四つ","meaning":"four"],
        ["hiragana":"いつつ","kanji":"五つ","meaning":"five"],
        ["hiragana":"むっつ","kanji":"六つ","meaning":"six"],
        ["hiragana":"ななつ","kanji":"七つ","meaning":"seven"],
        ["hiragana":"やっつ","kanji":"八つ","meaning":"eight"],
        ["hiragana":"ここのつ","kanji":"九つ","meaning":"nine"],
        ["hiragana":"とお","kanji":"十","meaning":"ten"]
    ]
    
    var genki1L10aarray = [
        ["hiragana":"あき","kanji":"秋","meaning":"autumn; fall"],
        ["hiragana":"いしゃ","kanji":"医者","meaning":"(medical) doctor"],
        ["hiragana":"えき","kanji":"駅","meaning":"railway station"],
        ["hiragana":"おかねもち","kanji":"お金持ち","meaning":"rich person"],
        ["hiragana":"かお","kanji":"顔","meaning":"face"],
        ["hiragana":"きせつ","kanji":"季節","meaning":"season"],
        ["hiragana":"くれじっとかーど","kanji":"クレジットカード","meaning":"credit card"],
        ["hiragana":"ことし","kanji":"今年","meaning":"this year"],
        ["hiragana":"さっかー","kanji":"サッカー","meaning":"soccer"],
        ["hiragana":"しゃつ","kanji":"シャツ","meaning":"shirt (undergarment)"]
    ]
    
    var genki1L10barray = [
        ["hiragana":"せいかつ","kanji":"生活","meaning":"living; life (one's daily existence)"],
        ["hiragana":"せかい","kanji":"世界","meaning":"the world"],
        ["hiragana":"ちかてつ","kanji":"地下鉄","meaning":"subway"],
        ["hiragana":"てぶくろ","kanji":"手袋","meaning":"glove"],
        ["hiragana":"とこや","kanji":"床屋","meaning":"barbershop"],
        ["hiragana":"はる","kanji":"春","meaning":"spring"],
        ["hiragana":"びよういん","kanji":"美容院","meaning":"beauty parlor; beauty salon; hairdressing salon"],
        ["hiragana":"びん","kanji":"便","meaning":"flight (e.g. airline flight)"],
        ["hiragana":"ふね","kanji":"船","meaning":"ship; boat"],
        ["hiragana":"やきゅう","kanji":"野球","meaning":"baseball"]
    ]
    
    var genki1L10carray = [
        ["hiragana":"ゆうめいじん","kanji":"有名人","meaning":"celebrity; famous person; public figure"],
        ["hiragana":"よやく","kanji":"予約","meaning":"reservation"],
        ["hiragana":"らいがっき","kanji":"来学期","meaning":"next semester; next term"],
        ["hiragana":"りんご","kanji":"リンゴ","meaning":"apple"],
        ["hiragana":"あたたかい","kanji":"暖かい","meaning":"warm"],
        ["hiragana":"おそい","kanji":"遅い","meaning":"slow; late"],
        ["hiragana":"すずしい","kanji":"涼しい","meaning":"cool; refreshing"],
        ["hiragana":"つめたい","kanji":"冷たい","meaning":"cold (to the touch); chilly; coldhearted"],
        ["hiragana":"ねむい","kanji":"眠い","meaning":"sleepy"],
        ["hiragana":"かんたん","kanji":"簡単","meaning":"simple; easy; brief"]
    ]
    
    var genki1L10darray = [
        ["hiragana":"とまる","kanji":"泊まる","meaning":"to stay at (e.g. hotel)"],
        ["hiragana":"なる","kanji":"なる","meaning":"to become; to get; to grow; to be; to reach"],
        ["hiragana":"はらう","kanji":"払う","meaning":"to pay (e.g. money, bill)"],
        ["hiragana":"きめる","kanji":"決める","meaning":"to decide"],
        ["hiragana":"れんしゅう","kanji":"練習","meaning":"practice; training"],
        ["hiragana":"あるく","kanji":"歩く","meaning":"to walk"],
        ["hiragana":"いちばん","kanji":"一番","meaning":"number one; first; first place; best"],
        ["hiragana":"かげつ","kanji":"か月","meaning":"months (period of)"],
        ["hiragana":"ご","kanji":"–後","meaning":"after"],
        ["hiragana":"このごろ","kanji":"この頃","meaning":"these days"]
    ]
    
    var genki1L10earray = [
        ["hiragana":"しゅうかん","kanji":"週間","meaning":"week"],
        ["hiragana":"どうやって","kanji":"どうやって","meaning":"how; by what means"],
        ["hiragana":"どちら","kanji":"どちら","meaning":"which way; which one (esp. of two alternatives)"],
        ["hiragana":"どのぐらい","kanji":"どのぐらい","meaning":"how long; how much"],
        ["hiragana":"ねん","kanji":"年","meaning":"counter for years (e.g. of an era), grades (e.g. school)"],
        ["hiragana":"はやく","kanji":"早く","meaning":"early; fast"],
        ["hiragana":"ぱんつ","kanji":"パンツ","meaning":"underpants; pants"],
        ["hiragana":"かかる","kanji":"かかる","meaning":"to take (a resource, e.g. time or money)"]
    ]
    
    var genki1L11aarray = [
        ["hiragana":"おーすとらりあ","kanji":"オーストラリア","meaning":"Australia"],
        ["hiragana":"おかし","kanji":"お菓子","meaning":"confections; sweets"],
        ["hiragana":"おしょうがつ","kanji":"お正月","meaning":"New Year (esp. first three days)"],
        ["hiragana":"おとこのこ","kanji":"男の子","meaning":"boy"],
        ["hiragana":"おもちゃ","kanji":"おもちゃ","meaning":"toy"],
        ["hiragana":"おんなのこ","kanji":"女の子","meaning":"girl"],
        ["hiragana":"がいこく","kanji":"外国","meaning":"foreign country"],
        ["hiragana":"かしゅ","kanji":"歌手","meaning":"singer"],
        ["hiragana":"きゃんぷ","kanji":"キャンプ","meaning":"camp"],
        ["hiragana":"こちら","kanji":"こちら","meaning":"this person (sb physically close to the speaker and of higher status)"]
    ]
    
    var genki1L11barray = [
        ["hiragana":"いま","kanji":"今","meaning":"the current..."],
        ["hiragana":"がっき","kanji":"学期","meaning":"school term; semester"],
        ["hiragana":"しゃちょう","kanji":"社長","meaning":"company president"],
        ["hiragana":"じゅぎょう","kanji":"授業","meaning":"lesson"],
        ["hiragana":"しょうらい","kanji":"将来","meaning":"future (usually near)"],
        ["hiragana":"どらいぶ","kanji":"ドライブ","meaning":"drive"],
        ["hiragana":"びーる","kanji":"ビール","meaning":"beer"],
        ["hiragana":"びじゅつかん","kanji":"美術館","meaning":"art museum"],
        ["hiragana":"ほすとふぁみりー","kanji":"ホストファミリー","meaning":"host family"],
        ["hiragana":"みずうみ","kanji":"湖","meaning":"lake"]
    ]
    
    var genki1L11carray = [
        ["hiragana":"やま","kanji":"山","meaning":"mountain"],
        ["hiragana":"ゆめ","kanji":"夢","meaning":"dream"],
        ["hiragana":"るーむめいと","kanji":"ルームメイト","meaning":"roommate"],
        ["hiragana":"うそ","kanji":"嘘","meaning":"lie"],
        ["hiragana":"つく","kanji":"つく","meaning":"to tell (a lie)"],
        ["hiragana":"うそをつく","kanji":"嘘をつく","meaning":"to tell a lie"],
        ["hiragana":"おなか","kanji":"お腹","meaning":"stomach"],
        ["hiragana":"すく","kanji":"空く","meaning":"to be hungry"],
        ["hiragana":"おなかがすく","kanji":"お腹が空く","meaning":"to become hungry"],
        ["hiragana":"かう","kanji":"飼う","meaning":"to keep (a pet or other animal)"]
    ]
    
    var genki1L11darray = [
        ["hiragana":"さぼる","kanji":"サボる","meaning":"to cut class; to skip"],
        ["hiragana":"とる","kanji":"取る","meaning":"to take; to obtain"],
        ["hiragana":"ならう","kanji":"習う","meaning":"to learn (from a teacher)"],
        ["hiragana":"のぼる","kanji":"登る","meaning":"to climb"],
        ["hiragana":"はたらく","kanji":"働く","meaning":"to work (for)"],
        ["hiragana":"つかれる","kanji":"疲れる","meaning":"to get tired"],
        ["hiragana":"やめる","kanji":"やめる","meaning":"to quit"],
        ["hiragana":"けんか","kanji":"喧嘩","meaning":"quarrel; fight"],
        ["hiragana":"しょうかい","kanji":"紹介","meaning":"introduction"],
        ["hiragana":"だいえっと","kanji":"ダイエット","meaning":"losing weight by any method (e.g. exercise)"]
    ]
    
    var genki1L11earray = [
        ["hiragana":"ちこく","kanji":"遅刻","meaning":"lateness; tardiness; arriving late"],
        ["hiragana":"りゅうがく","kanji":"留学","meaning":"studying abroad"],
        ["hiragana":"あと","kanji":"後","meaning":"after"],
        ["hiragana":"しゅっしん","kanji":"出身","meaning":"person's origin (e.g. city, country, parentage, school)"],
        ["hiragana":"すごく","kanji":"すごく","meaning":"very"],
        ["hiragana":"そして","kanji":"そして","meaning":"and then"],
        ["hiragana":"だけ","kanji":"だけ","meaning":"only; just"],
        ["hiragana":"てん","kanji":"点","meaning":"mark (in an exam, etc.)"],
        ["hiragana":"ひさしぶり","kanji":"久しぶり","meaning":"a long time (since the last time)"],
        ["hiragana":"まあまあ","kanji":"まあまあ","meaning":"so-so"],
        ["hiragana":"もっと","kanji":"もっと","meaning":"(some) more; even more; longer; further"]
    ]
    
    var genki1L12aarray = [
        ["hiragana":"あし","kanji":"足","meaning":"foot; leg"],
        ["hiragana":"いみ","kanji":"意味","meaning":"meaning"],
        ["hiragana":"おなか","kanji":"お腹","meaning":"belly; stomach"],
        ["hiragana":"かぜ","kanji":"風邪","meaning":"(common) cold"],
        ["hiragana":"かのじょ","kanji":"彼女","meaning":"she; her; girlfriend"],
        ["hiragana":"かれ","kanji":"彼","meaning":"he; him; boyfriend"],
        ["hiragana":"きおん","kanji":"気温","meaning":"air temperature"],
        ["hiragana":"くもり","kanji":"曇り","meaning":"cloudy weather"],
        ["hiragana":"しあい","kanji":"試合","meaning":"match; game"],
        ["hiragana":"じゅーす","kanji":"ジュース","meaning":"juice"]
    ]
    
    var genki1L12barray = [
        ["hiragana":"せいじ","kanji":"政治","meaning":"politics"],
        ["hiragana":"せいせき","kanji":"成績","meaning":"grades"],
        ["hiragana":"せき","kanji":"咳","meaning":"cough"],
        ["hiragana":"のど","kanji":"喉","meaning":"throat"],
        ["hiragana":"は","kanji":"歯","meaning":"tooth"],
        ["hiragana":"はな","kanji":"花","meaning":"flower"],
        ["hiragana":"はれ","kanji":"晴れ","meaning":"clear weather; fine weather"],
        ["hiragana":"ふく","kanji":"服","meaning":"clothes"],
        ["hiragana":"ぷれぜんと","kanji":"プレゼント","meaning":"present"],
        ["hiragana":"ほーむしっく","kanji":"ホームシック","meaning":"homesickness"]
    ]
    
    var genki1L12carray = [
        ["hiragana":"もの","kanji":"物","meaning":"thing"],
        ["hiragana":"ゆき","kanji":"雪","meaning":"snow"],
        ["hiragana":"ようじ","kanji":"用事","meaning":"tasks; things to do; errand"],
        ["hiragana":"あまい","kanji":"甘い","meaning":"sweet"],
        ["hiragana":"いたい","kanji":"痛い","meaning":"painful"],
        ["hiragana":"おおい","kanji":"多い","meaning":"many; numerous; a lot"],
        ["hiragana":"せまい","kanji":"狭い","meaning":"narrow"],
        ["hiragana":"つごう","kanji":"都合","meaning":"circumstances; condition; convenience"],
        ["hiragana":"わるい","kanji":"悪い","meaning":"bad"],
        ["hiragana":"つごうがわるい","kanji":"都合が悪い","meaning":"inconvenient"]
    ]
    
    var genki1L12darray = [
        ["hiragana":"ひく","kanji":"ひく","meaning":"to catch (a cold)"],
        ["hiragana":"かぜをひく","kanji":"風邪をひく","meaning":"to catch a cold"],
        ["hiragana":"きょうみ","kanji":"興味","meaning":"interest (in something)"],
        ["hiragana":"なくす","kanji":"なくす","meaning":"to lose (something)"],
        ["hiragana":"ねつ","kanji":"熱","meaning":"heat; fever"],
        ["hiragana":"かわく","kanji":"渇く","meaning":"to be thirsty; to feel thirsty"],
        ["hiragana":"のどがかわく","kanji":"のどが渇く","meaning":"to be thirsty"],
        ["hiragana":"わかれる","kanji":"別れる","meaning":"to separate (of a couple); to break up"],
        ["hiragana":"きんちょう","kanji":"緊張","meaning":"nervousness"],
        ["hiragana":"しんぱい","kanji":"心配","meaning":"worry; concern; anxiety; uneasiness"]
    ]
    
    var genki1L12earray = [
        ["hiragana":"いつも","kanji":"いつも","meaning":"always"],
        ["hiragana":"おだいじに","kanji":"お大事に","meaning":"get well soon"],
        ["hiragana":"げんき","kanji":"元気","meaning":"energetic; healthy"],
        ["hiragana":"たぶん","kanji":"多分","meaning":"perhaps; probably"],
        ["hiragana":"できるだけ","kanji":"できるだけ","meaning":"as much as possible"],
        ["hiragana":"でしょう","kanji":"でしょう","meaning":"right?; don't you agree?"],
        ["hiragana":"ど","kanji":"度","meaning":"degree (angle, temperature, scale, etc.)"],
        ["hiragana":"にさんにち","kanji":"二、三日","meaning":"two or three days"],
        ["hiragana":"–ので","kanji":"–ので","meaning":"because of...; the reason is ...; given that ..."],
        ["hiragana":"はじめて","kanji":"初めて","meaning":"for the first time"],
        ["hiragana":"もうすぐ","kanji":"もうする","meaning":"soon; before long"]
    ]
    
    var currentQuestionIndex: Int = 0
    var shuffledQuestions: [[String:String]] = []
    
    var isShowingMeaning = false
    
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
        meaningLabel.isHidden = true
        checkmarkImageView.isHidden = true
        goodjobLabel.isHidden = true
        relearnImageView.isHidden = true
        kotaeLabel.isHidden = true
        
        if let genki1 = UserDefaults.standard.object(forKey: "GENKI1") as? Int,
           let chapter = UserDefaults.standard.object(forKey: "CHAPTER") as? Int {
            GENKI1 = genki1
            CHAPTER = chapter
        }
        
        if GENKI1 == 0 && CHAPTER == 0 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
            chapterLabel.text = "1〜10"
            shuffledQuestions = shuffleArray(genki1L1aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 0 && CHAPTER == 1 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
            chapterLabel.text = "11〜20"
            shuffledQuestions = shuffleArray(genki1L1barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 0 && CHAPTER == 2 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
            chapterLabel.text = "21〜30"
            shuffledQuestions = shuffleArray(genki1L1carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 0 && CHAPTER == 3 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
            chapterLabel.text = "31〜40"
            shuffledQuestions = shuffleArray(genki1L1darray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 0 && CHAPTER == 4 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
            chapterLabel.text = "41〜50"
            shuffledQuestions = shuffleArray(genki1L1earray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 0 && CHAPTER == 5 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
            chapterLabel.text = "51〜58"
            shuffledQuestions = shuffleArray(genki1L1farray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 1 && CHAPTER == 0 {
            titleLabel.text = "Lesson 2"
            titleShadowLabel.text = "Lesson 2"
            chapterLabel.text = "1〜10"
            shuffledQuestions = shuffleArray(genki1L2aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 1 && CHAPTER == 1 {
            titleLabel.text = "Lesson 2"
            titleShadowLabel.text = "Lesson 2"
            chapterLabel.text = "11〜20"
            shuffledQuestions = shuffleArray(genki1L2barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 1 && CHAPTER == 2 {
            titleLabel.text = "Lesson 2"
            titleShadowLabel.text = "Lesson 2"
            chapterLabel.text = "21〜30"
            shuffledQuestions = shuffleArray(genki1L2carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 1 && CHAPTER == 3 {
            titleLabel.text = "Lesson 2"
            titleShadowLabel.text = "Lesson 2"
            chapterLabel.text = "31〜40"
            shuffledQuestions = shuffleArray(genki1L2darray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 1 && CHAPTER == 4 {
            titleLabel.text = "Lesson 2"
            titleShadowLabel.text = "Lesson 2"
            chapterLabel.text = "41〜45"
            shuffledQuestions = shuffleArray(genki1L2earray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 2 && CHAPTER == 0 {
            titleLabel.text = "Lesson 3"
            titleShadowLabel.text = "Lesson 3"
            chapterLabel.text = "1〜10"
            shuffledQuestions = shuffleArray(genki1L3aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 2 && CHAPTER == 1 {
            titleLabel.text = "Lesson 3"
            titleShadowLabel.text = "Lesson 3"
            chapterLabel.text = "11〜20"
            shuffledQuestions = shuffleArray(genki1L3barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 2 && CHAPTER == 2 {
            titleLabel.text = "Lesson 3"
            titleShadowLabel.text = "Lesson 3"
            chapterLabel.text = "21〜30"
            shuffledQuestions = shuffleArray(genki1L3carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 2 && CHAPTER == 3 {
            titleLabel.text = "Lesson 3"
            titleShadowLabel.text = "Lesson 3"
            chapterLabel.text = "31〜40"
            shuffledQuestions = shuffleArray(genki1L3darray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 2 && CHAPTER == 4 {
            titleLabel.text = "Lesson 3"
            titleShadowLabel.text = "Lesson 3"
            chapterLabel.text = "41〜47"
            shuffledQuestions = shuffleArray(genki1L3earray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 3 && CHAPTER == 0 {
            titleLabel.text = "Lesson 4"
            titleShadowLabel.text = "Lesson 4"
            chapterLabel.text = "1〜10"
            shuffledQuestions = shuffleArray(genki1L4aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 3 && CHAPTER == 1 {
            titleLabel.text = "Lesson 4"
            titleShadowLabel.text = "Lesson 4"
            chapterLabel.text = "11〜20"
            shuffledQuestions = shuffleArray(genki1L4barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 3 && CHAPTER == 2 {
            titleLabel.text = "Lesson 4"
            titleShadowLabel.text = "Lesson 4"
            chapterLabel.text = "21〜30"
            shuffledQuestions = shuffleArray(genki1L4carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 3 && CHAPTER == 3 {
            titleLabel.text = "Lesson 4"
            titleShadowLabel.text = "Lesson 4"
            chapterLabel.text = "31〜40"
            shuffledQuestions = shuffleArray(genki1L4darray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 3 && CHAPTER == 4 {
            titleLabel.text = "Lesson 4"
            titleShadowLabel.text = "Lesson 4"
            chapterLabel.text = "41〜50"
            shuffledQuestions = shuffleArray(genki1L4earray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 4 && CHAPTER == 5 {
            titleLabel.text = "Lesson 4"
            titleShadowLabel.text = "Lesson 4"
            chapterLabel.text = "51〜53"
            shuffledQuestions = shuffleArray(genki1L4farray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 4 && CHAPTER == 0 {
            titleLabel.text = "Lesson 5"
            titleShadowLabel.text = "Lesson 5"
            chapterLabel.text = "1〜10"
            shuffledQuestions = shuffleArray(genki1L5aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 4 && CHAPTER == 1 {
            titleLabel.text = "Lesson 5"
            titleShadowLabel.text = "Lesson 5"
            chapterLabel.text = "11〜20"
            shuffledQuestions = shuffleArray(genki1L5barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 4 && CHAPTER == 2 {
            titleLabel.text = "Lesson 5"
            titleShadowLabel.text = "Lesson 5"
            chapterLabel.text = "21〜30"
            shuffledQuestions = shuffleArray(genki1L5carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 4 && CHAPTER == 3 {
            titleLabel.text = "Lesson 5"
            titleShadowLabel.text = "Lesson 5"
            chapterLabel.text = "31〜40"
            shuffledQuestions = shuffleArray(genki1L5darray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 4 && CHAPTER == 4 {
            titleLabel.text = "Lesson 5"
            titleShadowLabel.text = "Lesson 5"
            chapterLabel.text = "41〜50"
            shuffledQuestions = shuffleArray(genki1L5earray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 5 && CHAPTER == 0 {
            titleLabel.text = "Lesson 6"
            titleShadowLabel.text = "Lesson 6"
            chapterLabel.text = "1〜10"
            shuffledQuestions = shuffleArray(genki1L6aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 5 && CHAPTER == 1 {
            titleLabel.text = "Lesson 6"
            titleShadowLabel.text = "Lesson 6"
            chapterLabel.text = "11〜20"
            shuffledQuestions = shuffleArray(genki1L6barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 5 && CHAPTER == 2 {
            titleLabel.text = "Lesson 6"
            titleShadowLabel.text = "Lesson 6"
            chapterLabel.text = "21〜30"
            shuffledQuestions = shuffleArray(genki1L6carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 5 && CHAPTER == 3 {
            titleLabel.text = "Lesson 6"
            titleShadowLabel.text = "Lesson 6"
            chapterLabel.text = "31〜40"
            shuffledQuestions = shuffleArray(genki1L6darray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 5 && CHAPTER == 4 {
            titleLabel.text = "Lesson 6"
            titleShadowLabel.text = "Lesson 6"
            chapterLabel.text = "41〜48"
            shuffledQuestions = shuffleArray(genki1L6earray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 6 && CHAPTER == 0 {
            titleLabel.text = "Lesson 7"
            titleShadowLabel.text = "Lesson 7"
            chapterLabel.text = "1〜10"
            shuffledQuestions = shuffleArray(genki1L7aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 6 && CHAPTER == 1 {
            titleLabel.text = "Lesson 7"
            titleShadowLabel.text = "Lesson 7"
            chapterLabel.text = "11〜20"
            shuffledQuestions = shuffleArray(genki1L7barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 6 && CHAPTER == 2 {
            titleLabel.text = "Lesson 7"
            titleShadowLabel.text = "Lesson 7"
            chapterLabel.text = "21〜30"
            shuffledQuestions = shuffleArray(genki1L7carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 6 && CHAPTER == 3 {
            titleLabel.text = "Lesson 7"
            titleShadowLabel.text = "Lesson 7"
            chapterLabel.text = "31〜40"
            shuffledQuestions = shuffleArray(genki1L7darray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 6 && CHAPTER == 4 {
            titleLabel.text = "Lesson 7"
            titleShadowLabel.text = "Lesson 7"
            chapterLabel.text = "41〜46"
            shuffledQuestions = shuffleArray(genki1L7earray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 7 && CHAPTER == 0 {
            titleLabel.text = "Lesson 8"
            titleShadowLabel.text = "Lesson 8"
            chapterLabel.text = "1〜10"
            shuffledQuestions = shuffleArray(genki1L8aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 7 && CHAPTER == 1 {
            titleLabel.text = "Lesson 8"
            titleShadowLabel.text = "Lesson 8"
            chapterLabel.text = "11〜20"
            shuffledQuestions = shuffleArray(genki1L8barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 7 && CHAPTER == 2 {
            titleLabel.text = "Lesson 8"
            titleShadowLabel.text = "Lesson 8"
            chapterLabel.text = "21〜30"
            shuffledQuestions = shuffleArray(genki1L8carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 7 && CHAPTER == 3 {
            titleLabel.text = "Lesson 8"
            titleShadowLabel.text = "Lesson 8"
            chapterLabel.text = "31〜40"
            shuffledQuestions = shuffleArray(genki1L8darray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 7 && CHAPTER == 4 {
            titleLabel.text = "Lesson 8"
            titleShadowLabel.text = "Lesson 8"
            chapterLabel.text = "41〜47"
            shuffledQuestions = shuffleArray(genki1L8earray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 8 && CHAPTER == 0 {
            titleLabel.text = "Lesson 9"
            titleShadowLabel.text = "Lesson 9"
            chapterLabel.text = "1〜10"
            shuffledQuestions = shuffleArray(genki1L9aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 8 && CHAPTER == 1 {
            titleLabel.text = "Lesson 9"
            titleShadowLabel.text = "Lesson 9"
            chapterLabel.text = "11〜20"
            shuffledQuestions = shuffleArray(genki1L9barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 8 && CHAPTER == 2 {
            titleLabel.text = "Lesson 9"
            titleShadowLabel.text = "Lesson 9"
            chapterLabel.text = "21〜30"
            shuffledQuestions = shuffleArray(genki1L9carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 8 && CHAPTER == 3 {
            titleLabel.text = "Lesson 9"
            titleShadowLabel.text = "Lesson 9"
            chapterLabel.text = "31〜40"
            shuffledQuestions = shuffleArray(genki1L9darray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 8 && CHAPTER == 4 {
            titleLabel.text = "Lesson 9"
            titleShadowLabel.text = "Lesson 9"
            chapterLabel.text = "41〜50"
            shuffledQuestions = shuffleArray(genki1L9earray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 9 && CHAPTER == 0 {
            titleLabel.text = "Lesson 10"
            titleShadowLabel.text = "Lesson 10"
            chapterLabel.text = "1〜10"
            shuffledQuestions = shuffleArray(genki1L10aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 9 && CHAPTER == 1 {
            titleLabel.text = "Lesson 10"
            titleShadowLabel.text = "Lesson 10"
            chapterLabel.text = "11〜20"
            shuffledQuestions = shuffleArray(genki1L10barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 9 && CHAPTER == 2 {
            titleLabel.text = "Lesson 10"
            titleShadowLabel.text = "Lesson 10"
            chapterLabel.text = "21〜30"
            shuffledQuestions = shuffleArray(genki1L10carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 9 && CHAPTER == 3 {
            titleLabel.text = "Lesson 10"
            titleShadowLabel.text = "Lesson 10"
            chapterLabel.text = "31〜40"
            shuffledQuestions = shuffleArray(genki1L10darray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 9 && CHAPTER == 4 {
            titleLabel.text = "Lesson 10"
            titleShadowLabel.text = "Lesson 10"
            chapterLabel.text = "41〜48"
            shuffledQuestions = shuffleArray(genki1L10earray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 10 && CHAPTER == 0 {
            titleLabel.text = "Lesson 11"
            titleShadowLabel.text = "Lesson 11"
            chapterLabel.text = "1〜10"
            shuffledQuestions = shuffleArray(genki1L11aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 10 && CHAPTER == 1 {
            titleLabel.text = "Lesson 11"
            titleShadowLabel.text = "Lesson 11"
            chapterLabel.text = "11〜20"
            shuffledQuestions = shuffleArray(genki1L11barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 10 && CHAPTER == 2 {
            titleLabel.text = "Lesson 11"
            titleShadowLabel.text = "Lesson 11"
            chapterLabel.text = "21〜30"
            shuffledQuestions = shuffleArray(genki1L11carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 10 && CHAPTER == 3 {
            titleLabel.text = "Lesson 11"
            titleShadowLabel.text = "Lesson 11"
            chapterLabel.text = "31〜40"
            shuffledQuestions = shuffleArray(genki1L11darray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 10 && CHAPTER == 4 {
            titleLabel.text = "Lesson 11"
            titleShadowLabel.text = "Lesson 11"
            chapterLabel.text = "41〜51"
            shuffledQuestions = shuffleArray(genki1L11earray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 10 && CHAPTER == 0 {
            titleLabel.text = "Lesson 12"
            titleShadowLabel.text = "Lesson 12"
            chapterLabel.text = "1〜10"
            shuffledQuestions = shuffleArray(genki1L12aarray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 10 && CHAPTER == 1 {
            titleLabel.text = "Lesson 12"
            titleShadowLabel.text = "Lesson 12"
            chapterLabel.text = "11〜20"
            shuffledQuestions = shuffleArray(genki1L12barray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 10 && CHAPTER == 2 {
            titleLabel.text = "Lesson 12"
            titleShadowLabel.text = "Lesson 12"
            chapterLabel.text = "21〜30"
            shuffledQuestions = shuffleArray(genki1L12carray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 10 && CHAPTER == 3 {
            titleLabel.text = "Lesson 12"
            titleShadowLabel.text = "Lesson 12"
            chapterLabel.text = "31〜40"
            shuffledQuestions = shuffleArray(genki1L12darray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if GENKI1 == 10 && CHAPTER == 4 {
            titleLabel.text = "Lesson 12"
            titleShadowLabel.text = "Lesson 12"
            chapterLabel.text = "41〜51"
            shuffledQuestions = shuffleArray(genki1L12earray)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
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
    
    @IBAction func tapCardButton(_ sender: UIButton) {
        toggleMeaning()
    }
    
    func updateCard() {
        let word = shuffledQuestions[index]
        
        kanjiLabel.text = word["kanji"]
        meaningLabel.text = word["meaning"]
        
        meaningLabel.isHidden = true
        kanjiLabel.isHidden = false
    }
    
    func toggleMeaning() {
        if meaningLabel.isHidden {
            meaningLabel.isHidden = false
            kanjiLabel.isHidden = true
        } else {
            meaningLabel.isHidden = true
            kanjiLabel.isHidden = false
        }
    }
    
    @IBAction func tapCheckButton() {
        
        guard let answer = textField.text else { return }
        
        let currentQuestionArray: [Dictionary<String, String>]
        
        if GENKI1 == 0 && CHAPTER == 0 {
            currentQuestionArray = genki1L1aarray
        } else if GENKI1 == 0 && CHAPTER == 1 {
            currentQuestionArray = genki1L1barray
        } else if GENKI1 == 0 && CHAPTER == 2 {
            currentQuestionArray = genki1L1carray
        } else if GENKI1 == 0 && CHAPTER == 3 {
            currentQuestionArray = genki1L1darray
        } else if GENKI1 == 0 && CHAPTER == 4 {
            currentQuestionArray = genki1L1earray
        } else if GENKI1 == 0 && CHAPTER == 5 {
            currentQuestionArray = genki1L1farray
        } else if GENKI1 == 1 && CHAPTER == 0 {
            currentQuestionArray = genki1L2aarray
        } else if GENKI1 == 1 && CHAPTER == 1 {
            currentQuestionArray = genki1L2barray
        } else if GENKI1 == 1 && CHAPTER == 2 {
            currentQuestionArray = genki1L2carray
        } else if GENKI1 == 1 && CHAPTER == 3 {
            currentQuestionArray = genki1L2darray
        } else if GENKI1 == 1 && CHAPTER == 4 {
            currentQuestionArray = genki1L2earray
        } else if GENKI1 == 2 && CHAPTER == 0 {
            currentQuestionArray = genki1L3aarray
        } else if GENKI1 == 2 && CHAPTER == 1 {
            currentQuestionArray = genki1L3barray
        } else if GENKI1 == 2 && CHAPTER == 2 {
            currentQuestionArray = genki1L3carray
        } else if GENKI1 == 2 && CHAPTER == 3 {
            currentQuestionArray = genki1L3darray
        } else if GENKI1 == 2 && CHAPTER == 4 {
            currentQuestionArray = genki1L3earray
        } else if GENKI1 == 3 && CHAPTER == 0 {
            currentQuestionArray = genki1L4aarray
        } else if GENKI1 == 3 && CHAPTER == 1 {
            currentQuestionArray = genki1L4barray
        } else if GENKI1 == 3 && CHAPTER == 2 {
            currentQuestionArray = genki1L4carray
        } else if GENKI1 == 3 && CHAPTER == 3 {
            currentQuestionArray = genki1L4darray
        } else if GENKI1 == 3 && CHAPTER == 4 {
            currentQuestionArray = genki1L4earray
        } else if GENKI1 == 3 && CHAPTER == 5 {
            currentQuestionArray = genki1L4earray
        } else if GENKI1 == 4 && CHAPTER == 0 {
            currentQuestionArray = genki1L5aarray
        } else if GENKI1 == 4 && CHAPTER == 1 {
            currentQuestionArray = genki1L5barray
        } else if GENKI1 == 4 && CHAPTER == 2 {
            currentQuestionArray = genki1L5carray
        } else if GENKI1 == 4 && CHAPTER == 3 {
            currentQuestionArray = genki1L5darray
        } else if GENKI1 == 4 && CHAPTER == 4 {
            currentQuestionArray = genki1L5earray
        } else if GENKI1 == 5 && CHAPTER == 0 {
            currentQuestionArray = genki1L6aarray
        } else if GENKI1 == 5 && CHAPTER == 1 {
            currentQuestionArray = genki1L6barray
        } else if GENKI1 == 5 && CHAPTER == 2 {
            currentQuestionArray = genki1L6carray
        } else if GENKI1 == 5 && CHAPTER == 3 {
            currentQuestionArray = genki1L6darray
        } else if GENKI1 == 5 && CHAPTER == 4 {
            currentQuestionArray = genki1L6earray
        } else if GENKI1 == 6 && CHAPTER == 0 {
            currentQuestionArray = genki1L7aarray
        } else if GENKI1 == 6 && CHAPTER == 1 {
            currentQuestionArray = genki1L7barray
        } else if GENKI1 == 6 && CHAPTER == 2 {
            currentQuestionArray = genki1L7carray
        } else if GENKI1 == 6 && CHAPTER == 3 {
            currentQuestionArray = genki1L7darray
        } else if GENKI1 == 6 && CHAPTER == 4 {
            currentQuestionArray = genki1L7earray
        } else if GENKI1 == 7 && CHAPTER == 0 {
            currentQuestionArray = genki1L8aarray
        } else if GENKI1 == 7 && CHAPTER == 1 {
            currentQuestionArray = genki1L8barray
        } else if GENKI1 == 7 && CHAPTER == 2 {
            currentQuestionArray = genki1L8carray
        } else if GENKI1 == 7 && CHAPTER == 3 {
            currentQuestionArray = genki1L8darray
        } else if GENKI1 == 7 && CHAPTER == 4 {
            currentQuestionArray = genki1L8earray
        } else if GENKI1 == 8 && CHAPTER == 0 {
            currentQuestionArray = genki1L9aarray
        } else if GENKI1 == 8 && CHAPTER == 1 {
            currentQuestionArray = genki1L9barray
        } else if GENKI1 == 8 && CHAPTER == 2 {
            currentQuestionArray = genki1L9carray
        } else if GENKI1 == 8 && CHAPTER == 3 {
            currentQuestionArray = genki1L9darray
        } else if GENKI1 == 8 && CHAPTER == 4 {
            currentQuestionArray = genki1L9earray
        } else if GENKI1 == 9 && CHAPTER == 0 {
            currentQuestionArray = genki1L10aarray
        } else if GENKI1 == 9 && CHAPTER == 1 {
            currentQuestionArray = genki1L10barray
        } else if GENKI1 == 9 && CHAPTER == 2 {
            currentQuestionArray = genki1L10carray
        } else if GENKI1 == 9 && CHAPTER == 3 {
            currentQuestionArray = genki1L10darray
        } else if GENKI1 == 9 && CHAPTER == 4 {
            currentQuestionArray = genki1L10earray
        } else if GENKI1 == 10 && CHAPTER == 0 {
            currentQuestionArray = genki1L11aarray
        } else if GENKI1 == 10 && CHAPTER == 1 {
            currentQuestionArray = genki1L11barray
        } else if GENKI1 == 10 && CHAPTER == 2 {
            currentQuestionArray = genki1L11carray
        } else if GENKI1 == 10 && CHAPTER == 3 {
            currentQuestionArray = genki1L11darray
        } else if GENKI1 == 10 && CHAPTER == 4 {
            currentQuestionArray = genki1L11earray
        } else if GENKI1 == 11 && CHAPTER == 0 {
            currentQuestionArray = genki1L12aarray
        } else if GENKI1 == 11 && CHAPTER == 1 {
            currentQuestionArray = genki1L12barray
        } else if GENKI1 == 11 && CHAPTER == 2 {
            currentQuestionArray = genki1L12carray
        } else if GENKI1 == 11 && CHAPTER == 3 {
            currentQuestionArray = genki1L12darray
        } else if GENKI1 == 11 && CHAPTER == 4 {
            currentQuestionArray = genki1L12earray
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
                kanjiLabel.text = nextQuestion["kanji"] // 次の問題のkanjiを表示
                meaningLabel.text = nextQuestion["meaning"] // 次の問題のmeaningを表示
                
                textField.text = ""
                
                if isShowingMeaning {
                    meaningLabel.isHidden = false
                    kanjiLabel.isHidden = true
                } else {
                    meaningLabel.isHidden = true
                    kanjiLabel.isHidden = false
                }
                
                // 正解の場合にprogressViewを進める
                updateProgressView()
            } else {
                // 不正解の場合の処理
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let genki1QuizViewController = storyboard.instantiateViewController(withIdentifier: "Genki1QuizViewController") as! Genki1QuizViewController
                    self.navigationController?.pushViewController(genki1QuizViewController, animated: true)
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
    
    func updateProgressView() {
        // currentArrayの要素数を取得
        let numberOfItemsInCurrentArray = shuffledQuestions.count
        
        // 現在の進捗を計算（0% ～ 100%）
        let currentProgress = Float(currentQuestionIndex + 1) / Float(numberOfItemsInCurrentArray)
        
        progressView.setProgress(currentProgress, animated: true)
    }
    
}
