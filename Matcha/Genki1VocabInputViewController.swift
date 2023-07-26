//
//  Genki1VocabInputViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/07/25.
//

import UIKit

class Genki1VocabInputViewController: UIViewController {
    
    @IBOutlet var greenView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleShadowLabel: UILabel!
    @IBOutlet var chapterLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet var cardButton: UIButton!
    
    @IBOutlet var hiraganaLabel: UILabel!
    @IBOutlet var kanjiLabel: UILabel!
    @IBOutlet var meaningLabel: UILabel!
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var backButton: UIButton!
    
    var currentArray: [[String: String]] = []
    var index = 0
    
    var CHAPTER = saveData.object(forKey:"CHAPTER")
    var GENKI1 = saveData.object(forKey:"GENKI1")
    
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
    
    var isShowingMeaning = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if GENKI1 as! Int == 0 && CHAPTER as! Int == 0 {
            return genki1L1aarray.count
        }
        if GENKI1 as! Int == 0 && CHAPTER as! Int == 1 {
            return genki1L1barray.count
        }
        if GENKI1 as! Int == 0 && CHAPTER as! Int == 2 {
            return genki1L1carray.count
        }
        if GENKI1 as! Int == 0 && CHAPTER as! Int == 3 {
            return genki1L1darray.count
        }
        if GENKI1 as! Int == 0 && CHAPTER as! Int == 4 {
            return genki1L1earray.count
        }
        if GENKI1 as! Int == 0 && CHAPTER as! Int == 5 {
            return genki1L1farray.count
        }
        if GENKI1 as! Int == 1 && CHAPTER as! Int == 0 {
            return genki1L2aarray.count
        }
        if GENKI1 as! Int == 1 && CHAPTER as! Int == 1 {
            return genki1L2barray.count
        }
        if GENKI1 as! Int == 1 && CHAPTER as! Int == 2 {
            return genki1L2carray.count
        }
        if GENKI1 as! Int == 1 && CHAPTER as! Int == 3 {
            return genki1L2darray.count
        }
        if GENKI1 as! Int == 1 && CHAPTER as! Int == 4 {
            return genki1L2earray.count
        }
        if GENKI1 as! Int == 2 && CHAPTER as! Int == 0 {
            return genki1L3aarray.count
        }
        if GENKI1 as! Int == 2 && CHAPTER as! Int == 1 {
            return genki1L3barray.count
        }
        if GENKI1 as! Int == 2 && CHAPTER as! Int == 2 {
            return genki1L3carray.count
        }
        if GENKI1 as! Int == 2 && CHAPTER as! Int == 3 {
            return genki1L3darray.count
        }
        if GENKI1 as! Int == 2 && CHAPTER as! Int == 4 {
            return genki1L3earray.count
        }
        if GENKI1 as! Int == 3 && CHAPTER as! Int == 0 {
            return genki1L4aarray.count
        }
        if GENKI1 as! Int == 3 && CHAPTER as! Int == 1 {
            return genki1L4barray.count
        }
        if GENKI1 as! Int == 3 && CHAPTER as! Int == 2 {
            return genki1L4carray.count
        }
        if GENKI1 as! Int == 3 && CHAPTER as! Int == 3 {
            return genki1L4darray.count
        }
        if GENKI1 as! Int == 3 && CHAPTER as! Int == 4 {
            return genki1L4earray.count
        }
        if GENKI1 as! Int == 3 && CHAPTER as! Int == 5 {
            return genki1L4farray.count
        }
        if GENKI1 as! Int == 4 && CHAPTER as! Int == 0 {
            return genki1L5aarray.count
        }
        if GENKI1 as! Int == 4 && CHAPTER as! Int == 1 {
            return genki1L5barray.count
        }
        if GENKI1 as! Int == 4 && CHAPTER as! Int == 2 {
            return genki1L5carray.count
        }
        if GENKI1 as! Int == 4 && CHAPTER as! Int == 3 {
            return genki1L5darray.count
        }
        if GENKI1 as! Int == 4 && CHAPTER as! Int == 4 {
            return genki1L5earray.count
        }
        if GENKI1 as! Int == 5 && CHAPTER as! Int == 0 {
            return genki1L6aarray.count
        }
        if GENKI1 as! Int == 5 && CHAPTER as! Int == 1 {
            return genki1L6barray.count
        }
        if GENKI1 as! Int == 5 && CHAPTER as! Int == 2 {
            return genki1L6carray.count
        }
        if GENKI1 as! Int == 5 && CHAPTER as! Int == 3 {
            return genki1L6darray.count
        }
        if GENKI1 as! Int == 5 && CHAPTER as! Int == 4 {
            return genki1L6earray.count
        }
        if GENKI1 as! Int == 6 && CHAPTER as! Int == 0 {
            return genki1L7aarray.count
        }
        if GENKI1 as! Int == 6 && CHAPTER as! Int == 1 {
            return genki1L7barray.count
        }
        if GENKI1 as! Int == 6 && CHAPTER as! Int == 2 {
            return genki1L7carray.count
        }
        if GENKI1 as! Int == 6 && CHAPTER as! Int == 3 {
            return genki1L7darray.count
        }
        if GENKI1 as! Int == 6 && CHAPTER as! Int == 4 {
            return genki1L7earray.count
        }
        if GENKI1 as! Int == 7 && CHAPTER as! Int == 0 {
            return genki1L8aarray.count
        }
        if GENKI1 as! Int == 7 && CHAPTER as! Int == 1 {
            return genki1L8barray.count
        }
        if GENKI1 as! Int == 7 && CHAPTER as! Int == 2 {
            return genki1L8carray.count
        }
        if GENKI1 as! Int == 7 && CHAPTER as! Int == 3 {
            return genki1L8darray.count
        }
        if GENKI1 as! Int == 7 && CHAPTER as! Int == 4 {
            return genki1L8earray.count
        }
        if GENKI1 as! Int == 8 && CHAPTER as! Int == 0 {
            return genki1L9aarray.count
        }
        if GENKI1 as! Int == 8 && CHAPTER as! Int == 1 {
            return genki1L9barray.count
        }
        if GENKI1 as! Int == 8 && CHAPTER as! Int == 2 {
            return genki1L9carray.count
        }
        if GENKI1 as! Int == 8 && CHAPTER as! Int == 3 {
            return genki1L9darray.count
        }
        if GENKI1 as! Int == 8 && CHAPTER as! Int == 4 {
            return genki1L9earray.count
        }
        if GENKI1 as! Int == 9 && CHAPTER as! Int == 0 {
            return genki1L10aarray.count
        }
        if GENKI1 as! Int == 9 && CHAPTER as! Int == 1 {
            return genki1L10barray.count
        }
        if GENKI1 as! Int == 9 && CHAPTER as! Int == 2 {
            return genki1L10carray.count
        }
        if GENKI1 as! Int == 9 && CHAPTER as! Int == 3 {
            return genki1L10darray.count
        }
        if GENKI1 as! Int == 9 && CHAPTER as! Int == 4 {
            return genki1L10earray.count
        }
        if GENKI1 as! Int == 10 && CHAPTER as! Int == 0 {
            return genki1L11aarray.count
        }
        if GENKI1 as! Int == 10 && CHAPTER as! Int == 1 {
            return genki1L11barray.count
        }
        if GENKI1 as! Int == 10 && CHAPTER as! Int == 2 {
            return genki1L11carray.count
        }
        if GENKI1 as! Int == 10 && CHAPTER as! Int == 3 {
            return genki1L11darray.count
        }
        if GENKI1 as! Int == 10 && CHAPTER as! Int == 4 {
            return genki1L11earray.count
        }
        if GENKI1 as! Int == 11 && CHAPTER as! Int == 0 {
            return genki1L12aarray.count
        }
        if GENKI1 as! Int == 11 && CHAPTER as! Int == 1 {
            return genki1L12barray.count
        }
        if GENKI1 as! Int == 11 && CHAPTER as! Int == 2 {
            return genki1L12carray.count
        }
        if GENKI1 as! Int == 11 && CHAPTER as! Int == 3 {
            return genki1L12darray.count
        }
        if GENKI1 as! Int == 11 && CHAPTER as! Int == 4 {
            return genki1L12earray.count
        }
        return 0
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
        
        backButton.isHidden = true
        
        if GENKI1 as! Int == 0 && CHAPTER as! Int == 0 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L1aarray[0])
        } else if GENKI1 as! Int == 0 && CHAPTER as! Int == 1 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L1barray[0])
        } else if GENKI1 as! Int == 0 && CHAPTER as! Int == 2 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L1carray[0])
        } else if GENKI1 as! Int == 0 && CHAPTER as! Int == 3 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L1darray[0])
        } else if GENKI1 as! Int == 0 && CHAPTER as! Int == 4 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
            chapterLabel.text = "41〜50"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L1earray[0])
        } else if GENKI1 as! Int == 0 && CHAPTER as! Int == 5 {
            titleLabel.text = "Lesson 1"
            titleShadowLabel.text = "Lesson 1"
            chapterLabel.text = "51〜58"
            totalLabel.text = "total 8 words"
            updateLabels(with: genki1L1farray[0])
        } else if GENKI1 as! Int == 1 && CHAPTER as! Int == 0 {
            titleLabel.text = "Lesson 2"
            titleShadowLabel.text = "Lesson 2"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L2aarray[0])
        } else if GENKI1 as! Int == 1 && CHAPTER as! Int == 1 {
            titleLabel.text = "Lesson 2"
            titleShadowLabel.text = "Lesson 2"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L2barray[0])
        } else if GENKI1 as! Int == 1 && CHAPTER as! Int == 2 {
            titleLabel.text = "Lesson 2"
            titleShadowLabel.text = "Lesson 2"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L2carray[0])
        } else if GENKI1 as! Int == 1 && CHAPTER as! Int == 3 {
            titleLabel.text = "Lesson 2"
            titleShadowLabel.text = "Lesson 2"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L2darray[0])
        } else if GENKI1 as! Int == 1 && CHAPTER as! Int == 4 {
            titleLabel.text = "Lesson 2"
            titleShadowLabel.text = "Lesson 2"
            chapterLabel.text = "41〜45"
            totalLabel.text = "total 5 words"
            updateLabels(with: genki1L2earray[0])
        } else if GENKI1 as! Int == 2 && CHAPTER as! Int == 0 {
            titleLabel.text = "Lesson 3"
            titleShadowLabel.text = "Lesson 3"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L3aarray[0])
        } else if GENKI1 as! Int == 2 && CHAPTER as! Int == 1 {
            titleLabel.text = "Lesson 3"
            titleShadowLabel.text = "Lesson 3"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L3barray[0])
        } else if GENKI1 as! Int == 2 && CHAPTER as! Int == 2 {
            titleLabel.text = "Lesson 3"
            titleShadowLabel.text = "Lesson 3"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L3carray[0])
        } else if GENKI1 as! Int == 2 && CHAPTER as! Int == 3 {
            titleLabel.text = "Lesson 3"
            titleShadowLabel.text = "Lesson 3"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L3darray[0])
        } else if GENKI1 as! Int == 2 && CHAPTER as! Int == 4 {
            titleLabel.text = "Lesson 3"
            titleShadowLabel.text = "Lesson 3"
            chapterLabel.text = "41〜47"
            totalLabel.text = "total 7 words"
            updateLabels(with: genki1L3earray[0])
        } else if GENKI1 as! Int == 3 && CHAPTER as! Int == 0 {
            titleLabel.text = "Lesson 4"
            titleShadowLabel.text = "Lesson 4"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L4aarray[0])
        } else if GENKI1 as! Int == 3 && CHAPTER as! Int == 1 {
            titleLabel.text = "Lesson 4"
            titleShadowLabel.text = "Lesson 4"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L4barray[0])
        } else if GENKI1 as! Int == 3 && CHAPTER as! Int == 2 {
            titleLabel.text = "Lesson 4"
            titleShadowLabel.text = "Lesson 4"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L4carray[0])
        } else if GENKI1 as! Int == 3 && CHAPTER as! Int == 3 {
            titleLabel.text = "Lesson 4"
            titleShadowLabel.text = "Lesson 4"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L4darray[0])
        } else if GENKI1 as! Int == 3 && CHAPTER as! Int == 4 {
            titleLabel.text = "Lesson 5"
            titleShadowLabel.text = "Lesson 5"
            chapterLabel.text = "41〜50"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L4earray[0])
        } else if GENKI1 as! Int == 3 && CHAPTER as! Int == 5 {
            titleLabel.text = "Lesson 5"
            titleShadowLabel.text = "Lesson 5"
            chapterLabel.text = "51〜53"
            totalLabel.text = "total 3 words"
            updateLabels(with: genki1L4farray[0])
        } else if GENKI1 as! Int == 4 && CHAPTER as! Int == 0 {
            titleLabel.text = "Lesson 5"
            titleShadowLabel.text = "Lesson 5"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L5aarray[0])
        } else if GENKI1 as! Int == 4 && CHAPTER as! Int == 1 {
            titleLabel.text = "Lesson 5"
            titleShadowLabel.text = "Lesson 5"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L5barray[0])
        } else if GENKI1 as! Int == 4 && CHAPTER as! Int == 2 {
            titleLabel.text = "Lesson 5"
            titleShadowLabel.text = "Lesson 5"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L5carray[0])
        } else if GENKI1 as! Int == 4 && CHAPTER as! Int == 3 {
            titleLabel.text = "Lesson 5"
            titleShadowLabel.text = "Lesson 5"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L5darray[0])
        } else if GENKI1 as! Int == 4 && CHAPTER as! Int == 4 {
            titleLabel.text = "Lesson 5"
            titleShadowLabel.text = "Lesson 5"
            chapterLabel.text = "41〜50"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L5earray[0])
        } else if GENKI1 as! Int == 5 && CHAPTER as! Int == 0 {
            titleLabel.text = "Lesson 6"
            titleShadowLabel.text = "Lesson 6"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L6aarray[0])
        } else if GENKI1 as! Int == 5 && CHAPTER as! Int == 1 {
            titleLabel.text = "Lesson 6"
            titleShadowLabel.text = "Lesson 6"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L6barray[0])
        } else if GENKI1 as! Int == 5 && CHAPTER as! Int == 2 {
            titleLabel.text = "Lesson 6"
            titleShadowLabel.text = "Lesson 6"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L6carray[0])
        } else if GENKI1 as! Int == 5 && CHAPTER as! Int == 3 {
            titleLabel.text = "Lesson 6"
            titleShadowLabel.text = "Lesson 6"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L6darray[0])
        } else if GENKI1 as! Int == 5 && CHAPTER as! Int == 4 {
            titleLabel.text = "Lesson 6"
            titleShadowLabel.text = "Lesson 6"
            chapterLabel.text = "41〜48"
            totalLabel.text = "total 8 words"
            updateLabels(with: genki1L6earray[0])
        } else if GENKI1 as! Int == 6 && CHAPTER as! Int == 0 {
            titleLabel.text = "Lesson 7"
            titleShadowLabel.text = "Lesson 7"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L7aarray[0])
        } else if GENKI1 as! Int == 6 && CHAPTER as! Int == 1 {
            titleLabel.text = "Lesson 7"
            titleShadowLabel.text = "Lesson 7"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L7barray[0])
        } else if GENKI1 as! Int == 6 && CHAPTER as! Int == 2 {
            titleLabel.text = "Lesson 7"
            titleShadowLabel.text = "Lesson 7"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L7carray[0])
        } else if GENKI1 as! Int == 6 && CHAPTER as! Int == 3 {
            titleLabel.text = "Lesson 7"
            titleShadowLabel.text = "Lesson 7"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L7darray[0])
        } else if GENKI1 as! Int == 6 && CHAPTER as! Int == 4 {
            titleLabel.text = "Lesson 7"
            titleShadowLabel.text = "Lesson 7"
            chapterLabel.text = "41〜46"
            totalLabel.text = "total 6 words"
            updateLabels(with: genki1L7earray[0])
        } else if GENKI1 as! Int == 7 && CHAPTER as! Int == 0 {
            titleLabel.text = "Lesson 8"
            titleShadowLabel.text = "Lesson 8"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L8aarray[0])
        } else if GENKI1 as! Int == 7 && CHAPTER as! Int == 1 {
            titleLabel.text = "Lesson 8"
            titleShadowLabel.text = "Lesson 8"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L8barray[0])
        } else if GENKI1 as! Int == 7 && CHAPTER as! Int == 2 {
            titleLabel.text = "Lesson 8"
            titleShadowLabel.text = "Lesson 8"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L8carray[0])
        } else if GENKI1 as! Int == 7 && CHAPTER as! Int == 3 {
            titleLabel.text = "Lesson 8"
            titleShadowLabel.text = "Lesson 8"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L8darray[0])
        } else if GENKI1 as! Int == 7 && CHAPTER as! Int == 4 {
            titleLabel.text = "Lesson 8"
            titleShadowLabel.text = "Lesson 8"
            chapterLabel.text = "41〜47"
            totalLabel.text = "total 7 words"
            updateLabels(with: genki1L8earray[0])
        } else if GENKI1 as! Int == 8 && CHAPTER as! Int == 0 {
            titleLabel.text = "Lesson 9"
            titleShadowLabel.text = "Lesson 9"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L9aarray[0])
        } else if GENKI1 as! Int == 8 && CHAPTER as! Int == 1 {
            titleLabel.text = "Lesson 9"
            titleShadowLabel.text = "Lesson 9"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L9barray[0])
        } else if GENKI1 as! Int == 8 && CHAPTER as! Int == 2 {
            titleLabel.text = "Lesson 9"
            titleShadowLabel.text = "Lesson 9"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L9carray[0])
        } else if GENKI1 as! Int == 8 && CHAPTER as! Int == 3 {
            titleLabel.text = "Lesson 9"
            titleShadowLabel.text = "Lesson 9"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L9darray[0])
        } else if GENKI1 as! Int == 8 && CHAPTER as! Int == 4 {
            titleLabel.text = "Lesson 9"
            titleShadowLabel.text = "Lesson 9"
            chapterLabel.text = "41〜50"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L9earray[0])
        } else if GENKI1 as! Int == 9 && CHAPTER as! Int == 0 {
            titleLabel.text = "Lesson 10"
            titleShadowLabel.text = "Lesson 10"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L10aarray[0])
        } else if GENKI1 as! Int == 9 && CHAPTER as! Int == 1 {
            titleLabel.text = "Lesson 10"
            titleShadowLabel.text = "Lesson 10"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L10barray[0])
        } else if GENKI1 as! Int == 9 && CHAPTER as! Int == 2 {
            titleLabel.text = "Lesson 10"
            titleShadowLabel.text = "Lesson 10"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L10carray[0])
        } else if GENKI1 as! Int == 9 && CHAPTER as! Int == 3 {
            titleLabel.text = "Lesson 10"
            titleShadowLabel.text = "Lesson 10"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L10darray[0])
        } else if GENKI1 as! Int == 9 && CHAPTER as! Int == 4 {
            titleLabel.text = "Lesson 10"
            titleShadowLabel.text = "Lesson 10"
            chapterLabel.text = "41〜48"
            totalLabel.text = "total 8 words"
            updateLabels(with: genki1L10earray[0])
        } else if GENKI1 as! Int == 10 && CHAPTER as! Int == 0 {
            titleLabel.text = "Lesson 11"
            titleShadowLabel.text = "Lesson 11"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L11aarray[0])
        } else if GENKI1 as! Int == 10 && CHAPTER as! Int == 1 {
            titleLabel.text = "Lesson 11"
            titleShadowLabel.text = "Lesson 11"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L11barray[0])
        } else if GENKI1 as! Int == 10 && CHAPTER as! Int == 2 {
            titleLabel.text = "Lesson 11"
            titleShadowLabel.text = "Lesson 11"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L11carray[0])
        } else if GENKI1 as! Int == 10 && CHAPTER as! Int == 3 {
            titleLabel.text = "Lesson 11"
            titleShadowLabel.text = "Lesson 11"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L11darray[0])
        } else if GENKI1 as! Int == 10 && CHAPTER as! Int == 4 {
            titleLabel.text = "Lesson 11"
            titleShadowLabel.text = "Lesson 11"
            chapterLabel.text = "41〜51"
            totalLabel.text = "total 11 words"
            updateLabels(with: genki1L11earray[0])
        } else if GENKI1 as! Int == 11 && CHAPTER as! Int == 0 {
            titleLabel.text = "Lesson 12"
            titleShadowLabel.text = "Lesson 12"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L12aarray[0])
        } else if GENKI1 as! Int == 11 && CHAPTER as! Int == 1 {
            titleLabel.text = "Lesson 12"
            titleShadowLabel.text = "Lesson 12"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L12barray[0])
        } else if GENKI1 as! Int == 11 && CHAPTER as! Int == 2 {
            titleLabel.text = "Lesson 12"
            titleShadowLabel.text = "Lesson 12"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L12carray[0])
        } else if GENKI1 as! Int == 11 && CHAPTER as! Int == 3 {
            titleLabel.text = "Lesson 12"
            titleShadowLabel.text = "Lesson 12"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            updateLabels(with: genki1L12darray[0])
        } else if GENKI1 as! Int == 11 && CHAPTER as! Int == 4 {
            titleLabel.text = "Lesson 12"
            titleShadowLabel.text = "Lesson 12"
            chapterLabel.text = "41〜51"
            totalLabel.text = "total 11 words"
            updateLabels(with: genki1L12earray[0])
        }
        
        updateCurrentArray()
        updateCard()
    }
    
    func updateCurrentArray() {
        if let genki1 = GENKI1 as? Int, let chapter = CHAPTER as? Int {
            if genki1 == 0 && chapter == 0 {
                currentArray = genki1L1aarray
            } else if genki1 == 0 && chapter == 1 {
                currentArray = genki1L1barray
            } else if genki1 == 0 && chapter == 2 {
                currentArray = genki1L1carray
            } else if genki1 == 0 && chapter == 3 {
                currentArray = genki1L1darray
            } else if genki1 == 0 && chapter == 4 {
                currentArray = genki1L1earray
            } else if genki1 == 0 && chapter == 5 {
                currentArray = genki1L1farray
            } else if genki1 == 1 && chapter == 0 {
                currentArray = genki1L2aarray
            } else if genki1 == 1 && chapter == 1 {
                currentArray = genki1L2barray
            } else if genki1 == 1 && chapter == 2 {
                currentArray = genki1L2carray
            } else if genki1 == 1 && chapter == 3 {
                currentArray = genki1L2darray
            } else if genki1 == 1 && chapter == 4 {
                currentArray = genki1L2earray
            } else if genki1 == 2 && chapter == 0 {
                currentArray = genki1L3aarray
            } else if genki1 == 2 && chapter == 1 {
                currentArray = genki1L3barray
            } else if genki1 == 2 && chapter == 2 {
                currentArray = genki1L3carray
            } else if genki1 == 2 && chapter == 3 {
                currentArray = genki1L3darray
            } else if genki1 == 2 && chapter == 4 {
                currentArray = genki1L3earray
            } else if genki1 == 3 && chapter == 0 {
                currentArray = genki1L4aarray
            } else if genki1 == 3 && chapter == 1 {
                currentArray = genki1L4barray
            } else if genki1 == 3 && chapter == 2 {
                currentArray = genki1L4carray
            } else if genki1 == 3 && chapter == 3 {
                currentArray = genki1L4darray
            } else if genki1 == 3 && chapter == 4 {
                currentArray = genki1L4earray
            } else if genki1 == 3 && chapter == 5 {
                currentArray = genki1L4farray
            } else if genki1 == 4 && chapter == 0 {
                currentArray = genki1L5aarray
            } else if genki1 == 4 && chapter == 1 {
                currentArray = genki1L5barray
            } else if genki1 == 4 && chapter == 2 {
                currentArray = genki1L5carray
            } else if genki1 == 4 && chapter == 3 {
                currentArray = genki1L5darray
            } else if genki1 == 4 && chapter == 4 {
                currentArray = genki1L5earray
            } else if genki1 == 5 && chapter == 0 {
                currentArray = genki1L6aarray
            } else if genki1 == 5 && chapter == 1 {
                currentArray = genki1L6barray
            } else if genki1 == 5 && chapter == 2 {
                currentArray = genki1L6carray
            } else if genki1 == 5 && chapter == 3 {
                currentArray = genki1L6darray
            } else if genki1 == 5 && chapter == 4 {
                currentArray = genki1L6earray
            } else if genki1 == 6 && chapter == 0 {
                currentArray = genki1L7aarray
            } else if genki1 == 6 && chapter == 1 {
                currentArray = genki1L7barray
            } else if genki1 == 6 && chapter == 2 {
                currentArray = genki1L7carray
            } else if genki1 == 6 && chapter == 3 {
                currentArray = genki1L7darray
            } else if genki1 == 6 && chapter == 4 {
                currentArray = genki1L7earray
            } else if genki1 == 7 && chapter == 0 {
                currentArray = genki1L8aarray
            } else if genki1 == 7 && chapter == 1 {
                currentArray = genki1L8barray
            } else if genki1 == 7 && chapter == 2 {
                currentArray = genki1L8carray
            } else if genki1 == 7 && chapter == 3 {
                currentArray = genki1L8darray
            } else if genki1 == 7 && chapter == 4 {
                currentArray = genki1L8earray
            } else if genki1 == 8 && chapter == 0 {
                currentArray = genki1L9aarray
            } else if genki1 == 8 && chapter == 1 {
                currentArray = genki1L9barray
            } else if genki1 == 8 && chapter == 2 {
                currentArray = genki1L9carray
            } else if genki1 == 8 && chapter == 3 {
                currentArray = genki1L9darray
            } else if genki1 == 8 && chapter == 4 {
                currentArray = genki1L9earray
            } else if genki1 == 9 && chapter == 0 {
                currentArray = genki1L10aarray
            } else if genki1 == 9 && chapter == 1 {
                currentArray = genki1L10barray
            } else if genki1 == 9 && chapter == 2 {
                currentArray = genki1L10carray
            } else if genki1 == 9 && chapter == 3 {
                currentArray = genki1L10darray
            } else if genki1 == 9 && chapter == 4 {
                currentArray = genki1L10earray
            } else if genki1 == 10 && chapter == 0 {
                currentArray = genki1L11aarray
            } else if genki1 == 10 && chapter == 1 {
                currentArray = genki1L11barray
            } else if genki1 == 10 && chapter == 2 {
                currentArray = genki1L11carray
            } else if genki1 == 10 && chapter == 3 {
                currentArray = genki1L11darray
            } else if genki1 == 10 && chapter == 4 {
                currentArray = genki1L11earray
            } else if genki1 == 11 && chapter == 0 {
                currentArray = genki1L12aarray
            } else if genki1 == 11 && chapter == 1 {
                currentArray = genki1L12barray
            } else if genki1 == 11 && chapter == 2 {
                currentArray = genki1L12carray
            } else if genki1 == 11 && chapter == 3 {
                currentArray = genki1L12darray
            } else if genki1 == 11 && chapter == 4 {
                currentArray = genki1L12earray
            }
        }
    }
    
    func updateLabels(with word: [String: String]) {
        hiraganaLabel.text = word["hiragana"]
        kanjiLabel.text = word["kanji"]
        meaningLabel.text = word["meaning"]
        
        if isShowingMeaning {
            meaningLabel.isHidden = false
            hiraganaLabel.isHidden = true
            kanjiLabel.isHidden = true
        } else {
            meaningLabel.isHidden = true
            hiraganaLabel.isHidden = false
            kanjiLabel.isHidden = false
        }
    }

    @IBAction func tapBackButton(_ sender: UIButton) {
        if index > 0 {
            index -= 1
            updateCard()
            
            updateProgress()
        }
    }
    
    @IBAction func tapNextButton(_ sender: UIButton) {
        if index < currentArray.count - 1 {
            index += 1
            updateCard()
        
            updateProgress()
        }
    }
    
    func updateProgress() {
        // currentArrayの要素数を取得
        let numberOfItemsInCurrentArray = currentArray.count
        
        // 現在の進捗を計算（0% ～ 100%）
        let currentProgress = Float(index) / Float(numberOfItemsInCurrentArray)
        
        // Set progress to 1.0 if on the last element
        if index == currentArray.count - 1 {
                progressView.setProgress(1.0, animated: true)
        } else {
            progressView.setProgress(currentProgress, animated: true)
        }
    }
    
    @IBAction func tapCardButton(_ sender: UIButton) {
        toggleMeaning()
    }
    
    func updateCard() {
        let word = currentArray[index]
        
        hiraganaLabel.text = word["hiragana"]
        kanjiLabel.text = word["kanji"]
        meaningLabel.text = ""
        
        backButton.isHidden = (index == 0)
        nextButton.isHidden = (index == currentArray.count - 1)
        
        meaningLabel.isHidden = true
        hiraganaLabel.isHidden = false
        kanjiLabel.isHidden = false
    }
    
    func toggleMeaning() {
        let word = currentArray[index]
        
        if let meaning = word["meaning"] {
            meaningLabel.text = meaning
        }
        if meaningLabel.isHidden {
            meaningLabel.isHidden = false
            hiraganaLabel.isHidden = true
            kanjiLabel.isHidden = true
        } else {
            meaningLabel.isHidden = true
            hiraganaLabel.isHidden = false
            kanjiLabel.isHidden = false
        }
    }
    
    func getCurrentWord() -> [String: String] {
        if GENKI1 as! Int == 0 && CHAPTER as! Int == 0 {
            return genki1L1aarray[index]
        } else if GENKI1 as! Int == 0 && CHAPTER as! Int == 1 {
            return genki1L1barray[index]
        } else if GENKI1 as! Int == 0 && CHAPTER as! Int == 2 {
            return genki1L1carray[index]
        } else if GENKI1 as! Int == 0 && CHAPTER as! Int == 3 {
            return genki1L1darray[index]
        } else if GENKI1 as! Int == 0 && CHAPTER as! Int == 4 {
            return genki1L1earray[index]
        } else if GENKI1 as! Int == 0 && CHAPTER as! Int == 5 {
            return genki1L1farray[index]
        } else if GENKI1 as! Int == 1 && CHAPTER as! Int == 0 {
            return genki1L2aarray[index]
        } else if GENKI1 as! Int == 1 && CHAPTER as! Int == 1 {
            return genki1L2barray[index]
        } else if GENKI1 as! Int == 1 && CHAPTER as! Int == 2 {
            return genki1L2carray[index]
        } else if GENKI1 as! Int == 1 && CHAPTER as! Int == 3 {
            return genki1L2darray[index]
        } else if GENKI1 as! Int == 1 && CHAPTER as! Int == 4 {
            return genki1L2earray[index]
        } else if GENKI1 as! Int == 2 && CHAPTER as! Int == 0 {
            return genki1L3aarray[index]
        } else if GENKI1 as! Int == 2 && CHAPTER as! Int == 1 {
            return genki1L3barray[index]
        } else if GENKI1 as! Int == 2 && CHAPTER as! Int == 2 {
            return genki1L3carray[index]
        } else if GENKI1 as! Int == 2 && CHAPTER as! Int == 3 {
            return genki1L3darray[index]
        } else if GENKI1 as! Int == 2 && CHAPTER as! Int == 4 {
            return genki1L3earray[index]
        } else if GENKI1 as! Int == 3 && CHAPTER as! Int == 0 {
            return genki1L1aarray[index]
        } else if GENKI1 as! Int == 3 && CHAPTER as! Int == 1 {
            return genki1L4barray[index]
        } else if GENKI1 as! Int == 3 && CHAPTER as! Int == 2 {
            return genki1L4carray[index]
        } else if GENKI1 as! Int == 3 && CHAPTER as! Int == 3 {
            return genki1L4darray[index]
        } else if GENKI1 as! Int == 3 && CHAPTER as! Int == 4 {
            return genki1L4earray[index]
        } else if GENKI1 as! Int == 3 && CHAPTER as! Int == 5 {
            return genki1L4farray[index]
        } else if GENKI1 as! Int == 4 && CHAPTER as! Int == 0 {
            return genki1L5aarray[index]
        } else if GENKI1 as! Int == 4 && CHAPTER as! Int == 1 {
            return genki1L5barray[index]
        } else if GENKI1 as! Int == 4 && CHAPTER as! Int == 2 {
            return genki1L5carray[index]
        } else if GENKI1 as! Int == 4 && CHAPTER as! Int == 3 {
            return genki1L5darray[index]
        } else if GENKI1 as! Int == 4 && CHAPTER as! Int == 4 {
            return genki1L5earray[index]
        } else if GENKI1 as! Int == 5 && CHAPTER as! Int == 0 {
            return genki1L6aarray[index]
        } else if GENKI1 as! Int == 5 && CHAPTER as! Int == 1 {
            return genki1L6barray[index]
        } else if GENKI1 as! Int == 5 && CHAPTER as! Int == 2 {
            return genki1L6carray[index]
        } else if GENKI1 as! Int == 5 && CHAPTER as! Int == 3 {
            return genki1L6darray[index]
        } else if GENKI1 as! Int == 5 && CHAPTER as! Int == 4 {
            return genki1L6earray[index]
        } else if GENKI1 as! Int == 6 && CHAPTER as! Int == 0 {
            return genki1L7aarray[index]
        } else if GENKI1 as! Int == 6 && CHAPTER as! Int == 1 {
            return genki1L7barray[index]
        } else if GENKI1 as! Int == 6 && CHAPTER as! Int == 2 {
            return genki1L7carray[index]
        } else if GENKI1 as! Int == 6 && CHAPTER as! Int == 3 {
            return genki1L7darray[index]
        } else if GENKI1 as! Int == 6 && CHAPTER as! Int == 4 {
            return genki1L7earray[index]
        } else if GENKI1 as! Int == 7 && CHAPTER as! Int == 0 {
            return genki1L8aarray[index]
        } else if GENKI1 as! Int == 7 && CHAPTER as! Int == 1 {
            return genki1L8barray[index]
        } else if GENKI1 as! Int == 7 && CHAPTER as! Int == 2 {
            return genki1L8carray[index]
        } else if GENKI1 as! Int == 7 && CHAPTER as! Int == 3 {
            return genki1L8darray[index]
        } else if GENKI1 as! Int == 7 && CHAPTER as! Int == 4 {
            return genki1L8earray[index]
        } else if GENKI1 as! Int == 8 && CHAPTER as! Int == 0 {
            return genki1L9aarray[index]
        } else if GENKI1 as! Int == 8 && CHAPTER as! Int == 1 {
            return genki1L9barray[index]
        } else if GENKI1 as! Int == 8 && CHAPTER as! Int == 2 {
            return genki1L9carray[index]
        } else if GENKI1 as! Int == 8 && CHAPTER as! Int == 3 {
            return genki1L9darray[index]
        } else if GENKI1 as! Int == 8 && CHAPTER as! Int == 4 {
            return genki1L9earray[index]
        } else if GENKI1 as! Int == 9 && CHAPTER as! Int == 0 {
            return genki1L10aarray[index]
        } else if GENKI1 as! Int == 9 && CHAPTER as! Int == 1 {
            return genki1L10barray[index]
        } else if GENKI1 as! Int == 9 && CHAPTER as! Int == 2 {
            return genki1L10carray[index]
        } else if GENKI1 as! Int == 9 && CHAPTER as! Int == 3 {
            return genki1L10darray[index]
        } else if GENKI1 as! Int == 9 && CHAPTER as! Int == 4 {
            return genki1L10earray[index]
        } else if GENKI1 as! Int == 10 && CHAPTER as! Int == 0 {
            return genki1L11aarray[index]
        } else if GENKI1 as! Int == 10 && CHAPTER as! Int == 1 {
            return genki1L11barray[index]
        } else if GENKI1 as! Int == 10 && CHAPTER as! Int == 2 {
            return genki1L11carray[index]
        } else if GENKI1 as! Int == 10 && CHAPTER as! Int == 3 {
            return genki1L11darray[index]
        } else if GENKI1 as! Int == 10 && CHAPTER as! Int == 4 {
            return genki1L11earray[index]
        } else if GENKI1 as! Int == 10 && CHAPTER as! Int == 0 {
            return genki1L12aarray[index]
        } else if GENKI1 as! Int == 10 && CHAPTER as! Int == 1 {
            return genki1L12barray[index]
        } else if GENKI1 as! Int == 10 && CHAPTER as! Int == 2 {
            return genki1L12carray[index]
        } else if GENKI1 as! Int == 10 && CHAPTER as! Int == 3 {
            return genki1L12darray[index]
        } else if GENKI1 as! Int == 10 && CHAPTER as! Int == 4 {
            return genki1L12earray[index]
        }
        return [:]
    }
    
    
}
