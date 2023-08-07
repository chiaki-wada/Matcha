//
//  Minnichi1QuizViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/07/29.
//

import UIKit

class Minnichi1QuizViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var greenView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleShadowLabel: UILabel!
    @IBOutlet var chapterLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
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
    var MINNICHI1: Int = 0
    
    var minnichi1L1aarray = [
        ["hiragana":"わたし","kanji":"私","meaning":"I"],
        ["hiragana":"わたしたち","kanji":"私達","meaning":"we"],
        ["hiragana":"あなた","kanji":"あなた","meaning":"you"],
        ["hiragana":"ひと","kanji":"人","meaning":"person"],
        ["hiragana":"かた","kanji":"方","meaning":"person / people"],
        ["hiragana":"じん","kanji":"-人","meaning":"-ian (indicates nationality, race, origin, etc.)"],
        ["hiragana":"みなさん","kanji":"皆さん","meaning":"everyone"],
        ["hiragana":"さん","kanji":"-さん","meaning":"Mr./Ms. (suffix used to address someone politely)"],
        ["hiragana":"せんせい","kanji":"先生","meaning":"teacher / instructor"],
        ["hiragana":"きょうし","kanji":"教師","meaning":"teacher (as a profession)"]
    ]
    
    var minnichi1L1barray = [
        ["hiragana":"がくせい","kanji":"学生","meaning":"student"],
        ["hiragana":"かいしゃいん","kanji":"会社員","meaning":"company employee"],
        ["hiragana":"しゃいん","kanji":"社員","meaning":"employee"],
        ["hiragana":"ぎんこういん","kanji":"銀行員","meaning":"bank employee"],
        ["hiragana":"いしゃ","kanji":"医者","meaning":"doctor"],
        ["hiragana":"けんきゅうしゃ","kanji":"研究者","meaning":"researcher"],
        ["hiragana":"えんじにあ","kanji":"エンジニア","meaning":"engineer"],
        ["hiragana":"だいがく","kanji":"大学","meaning":"university"],
        ["hiragana":"びょういん","kanji":"病院","meaning":"hospital"],
        ["hiragana":"でんき","kanji":"電気","meaning":"electricity"]
    ]
    
    var minnichi1L1carray = [
        ["hiragana":"だれ","kanji":"誰","meaning":"who"],
        ["hiragana":"さい","kanji":"歳","meaning":"years old"],
        ["hiragana":"なんさい","kanji":"何歳","meaning":"how old"],
        ["hiragana":"おいくつ","kanji":"おいくつ","meaning":"how old (polite)"],
        ["hiragana":"はい","kanji":"はい","meaning":"yes"],
        ["hiragana":"いいえ","kanji":"いいえ","meaning":"no"],
        ["hiragana":"しつれいですが","kanji":"失礼ですが","meaning":"Excuse me, but..."],
        ["hiragana":"はじめまして","kanji":"初めまして","meaning":"Nice to meet you (meeting for the first time)"],
        ["hiragana":"どうぞよろしく","kanji":"どうぞよろしく","meaning":"Nice to meet you"],
        ["hiragana":"あめりか","kanji":"アメリカ","meaning":"America"]
    ]
    
    var minnichi1L1darray = [
        ["hiragana":"いぎりす","kanji":"イギリス","meaning":"UK"],
        ["hiragana":"いんど","kanji":"インド","meaning":"India"],
        ["hiragana":"いんどねしあ","kanji":"インドネシア","meaning":"Indonesia"],
        ["hiragana":"たい","kanji":"タイ","meaning":"Thailand"],
        ["hiragana":"かんこく","kanji":"韓国","meaning":"Korea"],
        ["hiragana":"ちゅうごく","kanji":"中国","meaning":"China"],
        ["hiragana":"どいつ","kanji":"ドイツ","meaning":"Germany"],
        ["hiragana":"ふらんす","kanji":"フランス","meaning":"France"],
        ["hiragana":"ぶらじる","kanji":"ブラジル","meaning":"Brazil"],
        ["hiragana":"にほん","kanji":"日本","meaning":"Japan"]
    ]
    
    var minnichi1L2aarray = [
        ["hiragana":"これ","kanji":"これ","meaning":"this"],
        ["hiragana":"それ","kanji":"それ","meaning":"that"],
        ["hiragana":"あれ","kanji":"あれ","meaning":"that over there"],
        ["hiragana":"この","kanji":"この","meaning":"this (used before a noun)"],
        ["hiragana":"その","kanji":"その","meaning":"that (used before a noun)"],
        ["hiragana":"あの","kanji":"あの","meaning":"that (used before a noun, far from both speaker and listener)"],
        ["hiragana":"ほん","kanji":"本","meaning":"book"],
        ["hiragana":"じしょ","kanji":"辞書","meaning":"dictionary"],
        ["hiragana":"ざっし","kanji":"雑誌","meaning":"magazine"],
        ["hiragana":"しんぶん","kanji":"新聞","meaning":"newspaper"]
    ]
    
    var minnichi1L2barray = [
        ["hiragana":"のーと","kanji":"ノート","meaning":"notebook"],
        ["hiragana":"てちょう","kanji":"手帳","meaning":"planner"],
        ["hiragana":"めいし","kanji":"名刺","meaning":"business card"],
        ["hiragana":"かーど","kanji":"カード","meaning":"card"],
        ["hiragana":"えんぴつ","kanji":"鉛筆","meaning":"pencil"],
        ["hiragana":"ぼーるぺん","kanji":"ボールペン","meaning":"ballpoint pen"],
        ["hiragana":"しゃーぷぺんしる","kanji":"シャープペンシル","meaning":"mechanical pencil"],
        ["hiragana":"かぎ","kanji":"鍵","meaning":"key"],
        ["hiragana":"とけい","kanji":"時計","meaning":"watch / clock"],
        ["hiragana":"かさ","kanji":"傘","meaning":"umbrella"]
    ]
    
    var minnichi1L2carray = [
        ["hiragana":"かばん","kanji":"鞄","meaning":"bag / briefcase"],
        ["hiragana":"かせっとてーぷ","kanji":"カセットテープ","meaning":"cassette tape"],
        ["hiragana":"てーぷれこーだー","kanji":"テープレコーダー","meaning":"tape recorder"],
        ["hiragana":"てれび","kanji":"テレビ","meaning":"television / TV"],
        ["hiragana":"らじお","kanji":"ラジオ","meaning":"radio"],
        ["hiragana":"かめら","kanji":"カメラ","meaning":"camera"],
        ["hiragana":"こんぴゅーたー","kanji":"コンピューター","meaning":"computer"],
        ["hiragana":"じどうしゃ","kanji":"自動車","meaning":"automobile / car"],
        ["hiragana":"つくえ","kanji":"机","meaning":"desk / table"],
        ["hiragana":"いす","kanji":"椅子","meaning":"chair"]
    ]
    
    var minnichi1L2darray = [
        ["hiragana":"ちょこれーと","kanji":"チョコレート","meaning":"chocolate"],
        ["hiragana":"こーひー","kanji":"コーヒー","meaning":"coffee"],
        ["hiragana":"えいご","kanji":"英語","meaning":"English"],
        ["hiragana":"にほんご","kanji":"日本語","meaning":"Japanese"],
        ["hiragana":"ご","kanji":"語","meaning":"language"],
        ["hiragana":"なん","kanji":"何","meaning":"what"],
        ["hiragana":"そうですか","kanji":"そうですか","meaning":"Is that so? / Really?"],
        ["hiragana":"そうです","kanji":"そうです","meaning":"Yes, that's right."],
        ["hiragana":"ちがいます","kanji":"違います","meaning":"No, that's not right."],
        ["hiragana":"あのう","kanji":"あのう","meaning":"um..."]
    ]
    
    var minnichi1L2earray = [
        ["hiragana":"ほんのきもちです","kanji":"ほんの気持ちです","meaning":"It's just a token of my appreciation."],
        ["hiragana":"どうぞ","kanji":"どうぞ","meaning":"please / here you go."],
        ["hiragana":"どうも","kanji":"どうも","meaning":"Thanks."],
        ["hiragana":"ありがとうございます","kanji":"有難う御座います","meaning":"Thank you very much."],
        ["hiragana":"こちらこそ","kanji":"こちらこそ","meaning":"You're welcome. (in response to 'thank you')"]
    ]
    
    var minnichi1L3aarray = [
        ["hiragana":"ここ","kanji":"ここ","meaning":"here"],
        ["hiragana":"そこ","kanji":"そこ","meaning":"there"],
        ["hiragana":"あそこ","kanji":"あそこ","meaning":"over there"],
        ["hiragana":"どこ","kanji":"どこ","meaning":"where"],
        ["hiragana":"こちら","kanji":"こちら","meaning":"this way"],
        ["hiragana":"そちら","kanji":"そちら","meaning":"that way"],
        ["hiragana":"あちら","kanji":"あちら","meaning":"that way (far from both speaker and listener)"],
        ["hiragana":"どちら","kanji":"どちら","meaning":"which way"],
        ["hiragana":"きょうしつ","kanji":"教室","meaning":"classroom"],
        ["hiragana":"しょくどう","kanji":"食堂","meaning":"cafeteria / dining hall"]
    ]
    
    var minnichi1L3barray = [
        ["hiragana":"じむしょ","kanji":"事務所","meaning":"office"],
        ["hiragana":"かいぎしつ","kanji":"会議室","meaning":"meeting room"],
        ["hiragana":"うけつけ","kanji":"受付","meaning":"reception / information desk"],
        ["hiragana":"ろびー","kanji":"ロビー","meaning":"lobby"],
        ["hiragana":"へや","kanji":"部屋","meaning":"room"],
        ["hiragana":"といれ","kanji":"トイレ","meaning":"restroom / toilet"],
        ["hiragana":"おてあらい","kanji":"お手洗い","meaning":"restroom / toilet (polite form)"],
        ["hiragana":"かいだん","kanji":"階段","meaning":"staircase / stairs"],
        ["hiragana":"えれべーたー","kanji":"エレベーター","meaning":"elevator"],
        ["hiragana":"えすかれーたー","kanji":"エスカレーター","meaning":"escalator"]
    ]
    
    var minnichi1L3carray = [
        ["hiragana":"おくに","kanji":"お国","meaning":"country"],
        ["hiragana":"かいしゃ","kanji":"会社","meaning":"company / corporation"],
        ["hiragana":"うち","kanji":"家","meaning":"home / house"],
        ["hiragana":"でんわ","kanji":"電話","meaning":"telephone"],
        ["hiragana":"くつ","kanji":"靴","meaning":"shoes"],
        ["hiragana":"ねくたい","kanji":"ネクタイ","meaning":"necktie"],
        ["hiragana":"わいん","kanji":"ワイン","meaning":"wine"],
        ["hiragana":"たばこ","kanji":"煙草","meaning":"cigarette"],
        ["hiragana":"うりば","kanji":"売り場","meaning":"sales floor / selling area"],
        ["hiragana":"ちか","kanji":"地下","meaning":"basement"]
    ]
    
    var minnichi1L3darray = [
        ["hiragana":"かい","kanji":"階","meaning":"floor / level"],
        ["hiragana":"なんがい","kanji":"何階","meaning":"which floor"],
        ["hiragana":"えん","kanji":"円","meaning":"yen (Japanese currency)"],
        ["hiragana":"いくら","kanji":"いくら","meaning":"how much / how many"],
        ["hiragana":"ひゃく","kanji":"百","meaning":"hundred"],
        ["hiragana":"せん","kanji":"千","meaning":"thousand"],
        ["hiragana":"まん","kanji":"万","meaning":"ten thousand"],
        ["hiragana":"すみません","kanji":"済みません","meaning":"I'm sorry"],
        ["hiragana":"ございます","kanji":"御座います","meaning":"(can roughly be translated as “am,” “is,” or “are” in English)"],
        ["hiragana":"みせてください","kanji":"見せてください","meaning":"Please show me."]
    ]
    
    var minnichi1L3earray = [
        ["hiragana":"じゃ","kanji":"じゃ","meaning":"well then / so / then"],
        ["hiragana":"ください","kanji":"下さい","meaning":"please"],
        ["katakana":"いたりあ","kanji":"イタリア","meaning":"Italy"],
        ["katakana":"すいす","kanji":"スイス","meaning":"Switzerland"]
    ]
    
    var minnichi1L4aarray = [
        ["hiragana":"でぱーと","kanji":"デパート","meaning":"department store"],
        ["hiragana":"ぎんこう","kanji":"銀行","meaning":"bank"],
        ["hiragana":"ゆうびんきょく","kanji":"郵便局","meaning":"post office"],
        ["hiragana":"としょかん","kanji":"図書館","meaning":"library"],
        ["hiragana":"びじゅつかん","kanji":"美術館","meaning":"art museum"],
        ["hiragana":"いま","kanji":"今","meaning":"now"],
        ["hiragana":"じ","kanji":"〜時","meaning":"hour"],
        ["hiragana":"ふん","kanji":"〜分","meaning":"minute"],
        ["hiragana":"はん","kanji":"半","meaning":"half"],
        ["hiragana":"なんじ","kanji":"何時","meaning":"what time"]
    ]
    
    var minnichi1L4barray = [
        ["hiragana":"なんぷん","kanji":"何分","meaning":"what minute"],
        ["hiragana":"ごぜん","kanji":"午前","meaning":"morning (before noon)"],
        ["hiragana":"ごご","kanji":"午後","meaning":"afternoon (after noon)"],
        ["hiragana":"あさ","kanji":"朝","meaning":"morning"],
        ["hiragana":"ひる","kanji":"昼","meaning":"noon / midday"],
        ["hiragana":"よる","kanji":"夜","meaning":"evening / night"],
        ["hiragana":"ばん","kanji":"晩","meaning":"night (late evening)"],
        ["hiragana":"おととい","kanji":"一昨日","meaning":"day before yesterday"],
        ["hiragana":"きのう","kanji":"昨日","meaning":"yesterday"],
        ["hiragana":"きょう","kanji":"今日","meaning":"today"]
    ]
    
    var minnichi1L4carray = [
        ["hiragana":"あした","kanji":"明日","meaning":"tomorrow"],
        ["hiragana":"あさって","kanji":"明後日","meaning":"day after tomorrow"],
        ["hiragana":"けさ","kanji":"今朝","meaning":"this morning"],
        ["hiragana":"こんばん","kanji":"今晩","meaning":"tonight / this evening"],
        ["hiragana":"さくばん","kanji":"昨晩","meaning":"last night"],
        ["hiragana":"やすみ","kanji":"休み","meaning":"day off / rest day"],
        ["hiragana":"ひるやすみ","kanji":"昼休み","meaning":"lunch break"],
        ["hiragana":"まいあさ","kanji":"毎朝","meaning":"every morning"],
        ["hiragana":"まいばん","kanji":"毎晩","meaning":"every evening"],
        ["hiragana":"まいにち","kanji":"毎日","meaning":"every day"]
    ]
    
    var minnichi1L4darray = [
        ["hiragana":"げつようび","kanji":"月曜日","meaning":"Monday"],
        ["hiragana":"かようび","kanji":"火曜日","meaning":"Tuesday"],
        ["hiragana":"すいようび","kanji":"水曜日","meaning":"Wednesday"],
        ["hiragana":"もくようび","kanji":"木曜日","meaning":"Thursday"],
        ["hiragana":"きんようび","kanji":"金曜日","meaning":"Friday"],
        ["hiragana":"どようび","kanji":"土曜日","meaning":"Saturday"],
        ["hiragana":"にちようび","kanji":"日曜日","meaning":"Sunday"],
        ["hiragana":"ばんごう","kanji":"番号","meaning":"number"],
        ["hiragana":"なんばん","kanji":"何番","meaning":"what number"],
        ["hiragana":"から","kanji":"から","meaning":"from"]
    ]
    
    var minnichi1L4earray = [
        ["hiragana":"まで","kanji":"まで","meaning":"to / until"],
        ["hiragana":"と","kanji":"と","meaning":"and"],
        ["hiragana":"はたらきます","kanji":"働きます","meaning":"to work"],
        ["hiragana":"やすみます","kanji":"休みます","meaning":"to rest / take a break"],
        ["hiragana":"おわります","kanji":"終わります","meaning":"to finish / end"],
        ["hiragana":"おきます","kanji":"起きます","meaning":"to wake up"],
        ["hiragana":"ねます","kanji":"寝ます","meaning":"to sleep"],
        ["hiragana":"べんきょうします","kanji":"勉強します","meaning":"to study"],
        ["hiragana":"ええと","kanji":"ええと","meaning":"um..."]
    ]
    
    var minnichi1L5aarray = [
        ["hiragana":"いきます","kanji":"行きます","meaning":"to go"],
        ["hiragana":"かえります","kanji":"帰ります","meaning":"to return / come back"],
        ["hiragana":"きます","kanji":"来ます","meaning":"to come"],
        ["hiragana":"じてんしゃ","kanji":"自転車","meaning":"bicycle"],
        ["hiragana":"がっこう","kanji":"学校","meaning":"school"],
        ["hiragana":"すーぱー","kanji":"スーパー","meaning":"supermarket"],
        ["hiragana":"えき","kanji":"駅","meaning":"station"],
        ["hiragana":"ひこうき","kanji":"飛行機","meaning":"airplane"],
        ["hiragana":"ふね","kanji":"船","meaning":"ship / boat"],
        ["hiragana":"でんしゃ","kanji":"電車","meaning":"train"]
    ]
    
    var minnichi1L5barray = [
        ["hiragana":"ちかてつ","kanji":"地下鉄","meaning":"subway / metro"],
        ["hiragana":"しんかんせん","kanji":"新幹線","meaning":"bullet train (Shinkansen)"],
        ["hiragana":"ばす","kanji":"バス","meaning":"bus"],
        ["hiragana":"たくしー","kanji":"タクシー","meaning":"taxi"],
        ["hiragana":"あるいて","kanji":"歩いて","meaning":"by walking / on foot"],
        ["hiragana":"ひと","kanji":"人","meaning":"person"],
        ["hiragana":"ともだち","kanji":"友達","meaning":"friend"],
        ["hiragana":"かれ","kanji":"彼","meaning":"he / boyfriend"],
        ["hiragana":"かのじょ","kanji":"彼女","meaning":"she / girlfriend"],
        ["hiragana":"かぞく","kanji":"家族","meaning":"family"]
    ]
    
    var minnichi1L5carray = [
        ["hiragana":"ひとりで","kanji":"一人で","meaning":"alone / by oneself"],
        ["hiragana":"せんしゅう","kanji":"先週","meaning":"last week"],
        ["hiragana":"こんしゅう","kanji":"今週","meaning":"this week"],
        ["hiragana":"らいしゅう","kanji":"来週","meaning":"next week"],
        ["hiragana":"せんげつ","kanji":"先月","meaning":"last month"],
        ["hiragana":"こんげつ","kanji":"今月","meaning":"this month"],
        ["hiragana":"らいげつ","kanji":"来月","meaning":"next month"],
        ["hiragana":"きょねん","kanji":"去年","meaning":"last year"],
        ["hiragana":"ことし","kanji":"今年","meaning":"this year"],
        ["hiragana":"らいねん","kanji":"来年","meaning":"next year"]
    ]
    
    var minnichi1L5darray = [
        ["hiragana":"がつ","kanji":"月","meaning":"month"],
        ["hiragana":"なんがつ","kanji":"何月","meaning":"what month"],
        ["hiragana":"にち","kanji":"日","meaning":"day"],
        ["hiragana":"なんにち","kanji":"何日","meaning":"what day"],
        ["hiragana":"いつ","kanji":"何時","meaning":"what time"],
        ["hiragana":"たんじょうび","kanji":"誕生日","meaning":"birthday"],
        ["hiragana":"ふつう","kanji":"普通","meaning":"regular / local (train)"],
        ["hiragana":"きゅうこう","kanji":"急行","meaning":"express"],
        ["hiragana":"とっきゅう","kanji":"特急","meaning":"limited express"],
        ["hiragana":"つぎ","kanji":"次","meaning":"next"],
        ["hiragana":"どういたしまして","kanji":"どう致しまして","meaning":"you're welcome / don't mention it"],
        ["hiragana":"ばんせん","kanji":"-番線","meaning":"platform / track (for trains)"]
    ]
    
    var minnichi1L6aarray = [
        ["hiragana":"すいます","kanji":"吸います","meaning":"to smoke"],
        ["hiragana":"かいます","kanji":"買います","meaning":"to buy"],
        ["hiragana":"あいます","kanji":"会います","meaning":"to meet"],
        ["hiragana":"ききます","kanji":"聞きます","meaning":"to ask / to listen"],
        ["hiragana":"かきます","kanji":"書きます","meaning":"to write"],
        ["hiragana":"のみます","kanji":"飲みます","meaning":"to drink"],
        ["hiragana":"よみます","kanji":"読みます","meaning":"to read"],
        ["hiragana":"とります","kanji":"撮ります","meaning":"to take (a photo"],
        ["hiragana":"たべます","kanji":"食べます","meaning":"to eat"],
        ["hiragana":"みます","kanji":"見ます","meaning":"to see / to watch"]
    ]
    
    var minnichi1L6barray = [
        ["hiragana":"します","kanji":"します","meaning":"to do"],
        ["hiragana":"ごはん","kanji":"ご飯","meaning":"meal / cooked rice"],
        ["hiragana":"あさごはん","kanji":"朝ご飯","meaning":"breakfast"],
        ["hiragana":"ひるごはん","kanji":"昼ご飯","meaning":"lunch"],
        ["hiragana":"ばんごはん","kanji":"晩ご飯","meaning":"dinner / supper"],
        ["hiragana":"ぱん","kanji":"パン","meaning":"bread"],
        ["hiragana":"たまご","kanji":"卵","meaning":"egg"],
        ["hiragana":"にく","kanji":"肉","meaning":"meat"],
        ["hiragana":"さかな","kanji":"魚","meaning":"fish"],
        ["hiragana":"やさい","kanji":"野菜","meaning":"vegetables"]
    ]
    
    var minnichi1L6carray = [
        ["hiragana":"くだもの","kanji":"果物","meaning":"fruits"],
        ["hiragana":"みず","kanji":"水","meaning":"water"],
        ["hiragana":"おちゃ","kanji":"お茶","meaning":"tea"],
        ["hiragana":"こうちゃ","kanji":"紅茶","meaning":"black tea"],
        ["hiragana":"ぎゅうにゅう","kanji":"牛乳","meaning":"milk"],
        ["hiragana":"みるく","kanji":"ミルク","meaning":"milk"],
        ["hiragana":"じゅーす","kanji":"ジュース","meaning":"juice"],
        ["hiragana":"びーる","kanji":"ビール","meaning":"beer"],
        ["hiragana":"おさけ","kanji":"お酒","meaning":"alcohol / sake"],
        ["hiragana":"びでお","kanji":"ビデオ","meaning":"video"]
    ]
    
    var minnichi1L6darray = [
        ["hiragana":"えいが","kanji":"映画","meaning":"movie / film"],
        ["hiragana":"しーでぃー","kanji":"CD","meaning":"CD"],
        ["hiragana":"てがみ","kanji":"手紙","meaning":"letter"],
        ["hiragana":"れぽーと","kanji":"レポート","meaning":"report / paper"],
        ["hiragana":"しゃしん","kanji":"写真","meaning":"photograph / photo"],
        ["hiragana":"みせ","kanji":"店","meaning":"store / shop"],
        ["hiragana":"れすとらん","kanji":"レストラン","meaning":"restaurant"],
        ["hiragana":"にわ","kanji":"庭","meaning":"garden / yard"],
        ["hiragana":"しゅくだい","kanji":"宿題","meaning":"homework"],
        ["hiragana":"てにす","kanji":"テニス","meaning":"tennis"]
    ]
    
    var minnichi1L6earray = [
        ["hiragana":"さっかー","kanji":"サッカー","meaning":"soccer / football"],
        ["hiragana":"おはなみ","kanji":"お花見","meaning":"cherry blossom viewing"],
        ["hiragana":"なに","kanji":"何","meaning":"what"],
        ["hiragana":"いっしょに","kanji":"一緒に","meaning":"together / with"],
        ["hiragana":"ちょっと","kanji":"ちょっと","meaning":"a little / a moment"],
        ["hiragana":"いつも","kanji":"いつも","meaning":"always"],
        ["hiragana":"ときどき","kanji":"時々","meaning":"sometimes"],
        ["hiragana":"それから","kanji":"それから","meaning":"and then / after that"],
        ["hiragana":"ええ","kanji":"ええ","meaning":"yes"],
        ["hiragana":"いいですね","kanji":"良いですね","meaning":"that's good / that sounds nice"]
    ]
    
    var minnichi1L6farray = [
        ["hiragana":"わかりました","kanji":"分かりました","meaning":"understood / I see"],
        ["hiragana":"じゃ、またあした","kanji":"じゃ、また明日","meaning":"well then, see you tomorrow"],
        ["hiragana":"めきしこ","kanji":"メキシコ","meaning":"Mexico"]
    ]
    
    var minnichi1L7aarray = [
        ["hiragana":"もらいます","kanji":"貰います","meaning":"to receive"],
        ["hiragana":"ならいます","kanji":"習います","meaning":"to learn"],
        ["hiragana":"かします","kanji":"貸します","meaning":"to lend"],
        ["hiragana":"きります","kanji":"切ります","meaning":"to cut"],
        ["hiragana":"おくります","kanji":"送ります","meaning":"to send"],
        ["hiragana":"おしえます","kanji":"教えます","meaning":"to teach"],
        ["hiragana":"かけます","kanji":"かけます","meaning":"to make a phone call / to call"],
        ["hiragana":"あげます","kanji":"あげます","meaning":"to give"],
        ["hiragana":"かります","kanji":"借ります","meaning":"to borrow"],
        ["hiragana":"けしゴム","kanji":"消しゴム","meaning":"eraser"]
    ]
    
    var minnichi1L7barray = [
        ["hiragana":"て","kanji":"手","meaning":"hand"],
        ["hiragana":"はし","kanji":"箸","meaning":"chopsticks"],
        ["hiragana":"すぷーん","kanji":"スプーン","meaning":"spoon"],
        ["hiragana":"ないふ","kanji":"ナイフ","meaning":"knife"],
        ["hiragana":"ふぉーく","kanji":"フォーク","meaning":"fork"],
        ["hiragana":"はさみ","kanji":"鋏","meaning":"scissors"],
        ["hiragana":"ふぁっくす","kanji":"ファックス","meaning":"fax"],
        ["hiragana":"わーぷろ","kanji":"ワープロ","meaning":"word processor"],
        ["hiragana":"ぱんち","kanji":"パンチ","meaning":"hole puncher"],
        ["hiragana":"ぱそこん","kanji":"パソコン","meaning":"personal computer / PC"]
    ]
    
    var minnichi1L7carray = [
        ["hiragana":"ほっちきす","kanji":"ホッチキス","meaning":"stapler"],
        ["hiragana":"せろてーぷ","kanji":"セロテープ","meaning":"adhesive tape / scotch tape"],
        ["hiragana":"かみ","kanji":"紙","meaning":"paper"],
        ["hiragana":"はな","kanji":"花","meaning":"flower"],
        ["hiragana":"しゃつ","kanji":"シャツ","meaning":"shirt"],
        ["hiragana":"ぷれぜんと","kanji":"プレゼント","meaning":"present / gift"],
        ["hiragana":"にもつ","kanji":"荷物","meaning":"luggage / baggage"],
        ["hiragana":"おかね","kanji":"お金","meaning":"money"],
        ["hiragana":"きっぷ","kanji":"切符","meaning":"ticket"],
        ["hiragana":"くりすます","kanji":"クリスマス","meaning":"Christmas"]
    ]
    
    var minnichi1L7darray = [
        ["hiragana":"ちち","kanji":"父","meaning":"father / dad"],
        ["hiragana":"はは","kanji":"母","meaning":"mother / mom"],
        ["hiragana":"おとうさん","kanji":"お父さん","meaning":"father (polite form)"],
        ["hiragana":"おかあさん","kanji":"お母さん","meaning":"mother (polite form)"],
        ["hiragana":"もう","kanji":"もう","meaning":"already"],
        ["hiragana":"まだ","kanji":"まだ","meaning":"not yet"],
        ["hiragana":"これから","kanji":"これから","meaning":"from now on / hereafter"],
        ["hiragana":"すてきですね","kanji":"素敵ですね","meaning":"that's wonderful / lovely"],
        ["hiragana":"ごめんください","kanji":"御免下さい","meaning":"excuse me / pardon me"],
        ["hiragana":"いらっしゃい","kanji":"いらっしゃい","meaning":"welcome / please come in"]
    ]
    
    var minnichi1L7earray = [
        ["hiragana":"おあがりください","kanji":"お上がり下さい","meaning":"please come in (when inviting someone into a room)"],
        ["hiragana":"しつれいします","kanji":"失礼します","meaning":"excuse me / I'm sorry (used when leaving)"],
        ["hiragana":"いかがですか","kanji":"いかがですか","meaning":"how about this / would you like this"],
        ["hiragana":"りょこう","kanji":"旅行","meaning":"trip / travel"],
        ["hiragana":"おみやげ","kanji":"お土産","meaning":"souvenir / gift"],
        ["hiragana":"すペいん","kanji":"スペイン","meaning":"Spain"],
        ["hiragana":"よーろっぱ","kanji":"ヨーロッパ","meaning":"Europe"]
    ]
    
    var minnichi1L8aarray = [
        ["hiragana":"はんさむな","kanji":"ハンサムな","meaning":"handsome"],
        ["hiragana":"きれいな","kanji":"綺麗な","meaning":"beautiful / clean"],
        ["hiragana":"しずかな","kanji":"静かな","meaning":"quiet"],
        ["hiragana":"にぎやかな","kanji":"賑やかな","meaning":"lively / bustling"],
        ["hiragana":"ゆうめいな","kanji":"有名な","meaning":"famous"],
        ["hiragana":"しんせつな","kanji":"親切な","meaning":"kind"],
        ["hiragana":"げんきな","kanji":"元気な","meaning":"energetic"],
        ["hiragana":"ひまな","kanji":"暇な","meaning":"free / leisurely"],
        ["hiragana":"べんりな","kanji":"便利な","meaning":"convenient"],
        ["hiragana":"すてきな","kanji":"素適な","meaning":"lovely / exquisite"]
    ]
    
    var minnichi1L8barray = [
        ["hiragana":"おおきい","kanji":"大きい","meaning":"big / large"],
        ["hiragana":"ちいさい","kanji":"小さい","meaning":"small"],
        ["hiragana":"あたらしい","kanji":"新しい","meaning":"new"],
        ["hiragana":"ふるい","kanji":"古い","meaning":"old"],
        ["hiragana":"いい","kanji":"良い","meaning":"good"],
        ["hiragana":"わるい","kanji":"悪い","meaning":"bad"],
        ["hiragana":"あつい","kanji":"暑い","meaning":"hot (weather)"],
        ["hiragana":"あつい","kanji":"熱い","meaning":"hot (to the touch)"],
        ["hiragana":"さむい","kanji":"寒い","meaning":"cold (weather)"],
        ["hiragana":"つめたい","kanji":"冷たい","meaning":"cold (to the touch)"]
    ]
    
    var minnichi1L8carray = [
        ["hiragana":"むずかしい","kanji":"難しい","meaning":"difficult"],
        ["hiragana":"やさしい","kanji":"易しい","meaning":"easy / simple"],
        ["hiragana":"たかい","kanji":"高い","meaning":"high / tall"],
        ["hiragana":"やすい","kanji":"安い","meaning":"cheap / inexpensive"],
        ["hiragana":"ひくい","kanji":"低い","meaning":"low / short"],
        ["hiragana":"おもしろい","kanji":"面白い","meaning":"interesting / fun"],
        ["hiragana":"おいしい","kanji":"美味しい","meaning":"delicious"],
        ["hiragana":"いそがしい","kanji":"忙しい","meaning":"busy"],
        ["hiragana":"たのしい","kanji":"楽しい","meaning":"enjoyable / fun"],
        ["hiragana":"しろい","kanji":"白い","meaning":"white"]
    ]
    
    var minnichi1L8darray = [
        ["hiragana":"くろい","kanji":"黒い","meaning":"black"],
        ["hiragana":"あかい","kanji":"赤い","meaning":"red"],
        ["hiragana":"あおい","kanji":"青い","meaning":"blue"],
        ["hiragana":"くるま","kanji":"車","meaning":"car"],
        ["hiragana":"さくら","kanji":"桜","meaning":"cherry blossom"],
        ["hiragana":"やま","kanji":"山","meaning":"mountain"],
        ["hiragana":"まち","kanji":"町","meaning":"town / city"],
        ["hiragana":"たべもの","kanji":"食べ物","meaning":"food"],
        ["hiragana":"ところ","kanji":"所","meaning":"place"],
        ["hiragana":"りょう","kanji":"寮","meaning":"dormitory"]
    ]
    
    var minnichi1L8earray = [
        ["hiragana":"べんきょう","kanji":"勉強","meaning":"study"],
        ["hiragana":"せいかつ","kanji":"生活","meaning":"life / living"],
        ["hiragana":"しごと","kanji":"仕事","meaning":"work / job"],
        ["hiragana":"どう","kanji":"どう","meaning":"how"],
        ["hiragana":"どんな","kanji":"どんな","meaning":"what kind of"],
        ["hiragana":"どれ","kanji":"どれ","meaning":"which"],
        ["hiragana":"とても","kanji":"とても","meaning":"very / really"],
        ["hiragana":"あまり","kanji":"あまり","meaning":"not much"],
        ["hiragana":"そして","kanji":"そして","meaning":"and then / and"],
        ["hiragana":"おげんきですか","kanji":"お元気ですか","meaning":"How are you?"]
    ]
    
    var minnichi1L8farray = [
        ["hiragana":"そうですね","kanji":"そうですね","meaning":"That's right / I see"],
        ["hiragana":"なれます","kanji":"慣れます","meaning":"to get used to"],
        ["hiragana":"けっこう","kanji":"結構","meaning":"fine / enough / considerable"],
        ["hiragana":"そろそろ","kanji":"そろそろ","meaning":"soon / before long"]
    ]
    
    var minnichi1L9aarray = [
        ["hiragana":"わかります","kanji":"分かります","meaning":"to understand"],
        ["hiragana":"わたしはくるまがあります","kanji":"私は車があります","meaning":"I have a car."],
        ["hiragana":"すきな","kanji":"好きな","meaning":"favorite / liked"],
        ["hiragana":"きらいな","kanji":"嫌いな","meaning":"disliked / hated"],
        ["hiragana":"じょうずな","kanji":"上手な","meaning":"skillful / good at"],
        ["hiragana":"へたな","kanji":"下手な","meaning":"unskilled / not good at"],
        ["hiragana":"りょうり","kanji":"料理","meaning":"cooking / cuisine"],
        ["hiragana":"のみもの","kanji":"飲み物","meaning":"beverage / drink"],
        ["hiragana":"すぽーつ","kanji":"スポーツ","meaning":"sports"],
        ["hiragana":"やきゅう","kanji":"野球","meaning":"baseball"]
    ]
    
    var minnichi1L9barray = [
        ["hiragana":"だんす","kanji":"ダンス","meaning":"dance"],
        ["hiragana":"おんがく","kanji":"音楽","meaning":"music"],
        ["hiragana":"うた","kanji":"歌","meaning":"song / singing"],
        ["hiragana":"くらしっく","kanji":"クラシック","meaning":"classical music"],
        ["hiragana":"じゃず","kanji":"ジャズ","meaning":"jazz"],
        ["hiragana":"こんさーと","kanji":"コンサート","meaning":"concert"],
        ["hiragana":"からおけ","kanji":"カラオケ","meaning":"karaoke"],
        ["hiragana":"かぶき","kanji":"歌舞伎","meaning":"kabuki (traditional Japanese theater)"],
        ["hiragana":"え","kanji":"絵","meaning":"painting / picture"],
        ["hiragana":"じ","kanji":"字","meaning":"character / letter"]
    ]
    
    var minnichi1L9carray = [
        ["hiragana":"かんじ","kanji":"漢字","meaning":"kanji (Chinese characters used in Japanese)"],
        ["hiragana":"ひらがな","kanji":"平仮名","meaning":"hiragana"],
        ["hiragana":"かたかな","kanji":"片仮名","meaning":"katakana"],
        ["hiragana":"ローマじ","kanji":"ローマ字","meaning":"romaji (Romanization of Japanese)"],
        ["hiragana":"こまかいおかね","kanji":"細かいお金","meaning":"small change / coins"],
        ["hiragana":"ちけっと","kanji":"チケット","meaning":"ticket"],
        ["hiragana":"じかん","kanji":"時間","meaning":"time"],
        ["hiragana":"ようじ","kanji":"用事","meaning":"errand / business"],
        ["hiragana":"やくそく","kanji":"約束","meaning":"promise / appointment"],
        ["hiragana":"ごしゅじん","kanji":"ご主人","meaning":"husband (of someone)"]
    ]
    
    var minnichi1L9darray = [
        ["hiragana":"おっと","kanji":"夫","meaning":"(my) husband"],
        ["hiragana":"しゅじん","kanji":"主人","meaning":"husband / master"],
        ["hiragana":"おくさん","kanji":"奥さん","meaning":"wife"],
        ["hiragana":"つま","kanji":"妻","meaning":"(my) wife"],
        ["hiragana":"かない","kanji":"家内","meaning":"(my) wife (dated/formal)"],
        ["hiragana":"こども","kanji":"子供","meaning":"child / children"],
        ["hiragana":"よく","kanji":"よく","meaning":"often / frequently"],
        ["hiragana":"だいたい","kanji":"だいたい","meaning":"mostly / roughly"],
        ["hiragana":"たくさん","kanji":"たくさん","meaning":"many / a lot"],
        ["hiragana":"すこし","kanji":"少し","meaning":"a little"]
    ]
    
    var minnichi1L9earray = [
        ["hiragana":"ぜんぜん","kanji":"全然","meaning":"not at all / not ... at all"],
        ["hiragana":"はやく","kanji":"早く","meaning":"early"],
        ["hiragana":"から","kanji":"から","meaning":"from"],
        ["hiragana":"どうして","kanji":"どうして","meaning":"why / for what reason"],
        ["hiragana":"ざんねんですね","kanji":"残念ですね","meaning":"That's too bad / I'm sorry to hear that"],
        ["hiragana":"すみません","kanji":"済みません","meaning":"I'm sorry / excuse me"],
        ["hiragana":"もしもし","kanji":"もしもし","meaning":"Hello (on the phone)"],
        ["hiragana":"ああ","kanji":"ああ","meaning":"Oh / Ah"],
        ["hiragana":"ちょっと","kanji":"ちょっと","meaning":"a little / a moment"],
        ["hiragana":"だめですか","kanji":"駄目ですか","meaning":"Is it not good?"],
        ["hiragana":"またこんど","kanji":"また今度","meaning":"See you later / Another time"]
    ]
    
    var minnichi1L10aarray = [
        ["hiragana":"でんちがあります","kanji":"電池があります","meaning":"There is a battery."],
        ["hiragana":"ねこがいます","kanji":"猫がいます","meaning":"There is a cat."],
        ["hiragana":"いろいろな","kanji":"色々な","meaning":"various / different"],
        ["hiragana":"おとこのこ","kanji":"男の子","meaning":"boy"],
        ["hiragana":"おんなのこ","kanji":"女の子","meaning":"girl"],
        ["hiragana":"おとこのひと","kanji":"男の人","meaning":"man"],
        ["hiragana":"おんなのひと","kanji":"女の人","meaning":"woman"],
        ["hiragana":"いぬ","kanji":"犬","meaning":"dog"],
        ["hiragana":"ねこ","kanji":"猫","meaning":"cat"],
        ["hiragana":"き","kanji":"木","meaning":"tree"]
    ]
    
    var minnichi1L10barray = [
        ["hiragana":"もの","kanji":"物","meaning":"thing / object"],
        ["hiragana":"ふぃるむ","kanji":"フィルム","meaning":"film (photographic)"],
        ["hiragana":"でんち","kanji":"電池","meaning":"battery"],
        ["hiragana":"はこ","kanji":"箱","meaning":"box"],
        ["hiragana":"すいっち","kanji":"スイッチ","meaning":"switch"],
        ["hiragana":"れいぞうこ","kanji":"冷蔵庫","meaning":"refrigerator / fridge"],
        ["hiragana":"てーぶる","kanji":"テーブル","meaning":"table"],
        ["hiragana":"べっど","kanji":"ベッド","meaning":"bed"],
        ["hiragana":"たな","kanji":"棚","meaning":"shelf / bookshelf"],
        ["hiragana":"どあ","kanji":"ドア","meaning":"door"]
    ]
    
    var minnichi1L10carray = [
        ["hiragana":"ぽすと","kanji":"ポスト","meaning":"mailbox / postbox"],
        ["hiragana":"びる","kanji":"ビル","meaning":"building"],
        ["hiragana":"こうえん","kanji":"公園","meaning":"park"],
        ["hiragana":"きっさてん","kanji":"喫茶店","meaning":"cafe"],
        ["hiragana":"ほんや","kanji":"本屋","meaning":"bookstore"],
        ["hiragana":"や","kanji":"〜屋","meaning":"-shop (suffix used for stores)"],
        ["hiragana":"のりば","kanji":"乗り場","meaning":"boarding place / platform"],
        ["hiragana":"けん","kanji":"県","meaning":"prefecture"],
        ["hiragana":"うえ","kanji":"上","meaning":"up / above"]
    ]
    
    var minnichi1L10darray = [
        ["hiragana":"した","kanji":"下","meaning":"down / below"],
        ["hiragana":"まえ","kanji":"前","meaning":"front"],
        ["hiragana":"うしろ","kanji":"後ろ","meaning":"back / behind"],
        ["hiragana":"みぎ","kanji":"右","meaning":"right"],
        ["hiragana":"ひだり","kanji":"左","meaning":"left"],
        ["hiragana":"なか","kanji":"中","meaning":"inside / middle"],
        ["hiragana":"そと","kanji":"外","meaning":"outside"],
        ["hiragana":"となり","kanji":"隣","meaning":"next / next to"],
        ["hiragana":"ちかく","kanji":"近く","meaning":"near / close"],
        ["hiragana":"あいだ","kanji":"間","meaning":"between / among"]
    ]
    
    var minnichi1L10earray = [
        ["hiragana":"や","kanji":"や","meaning":"and"],
        ["hiragana":"いちばん","kanji":"一番","meaning":"first / number one"],
        ["hiragana":"だんめ","kanji":"〜段目","meaning":"-th step (suffix for indicating steps or levels)"],
        ["hiragana":"おく","kanji":"奥","meaning":"back / inner part / far end"]
    ]
    
    var minnichi1L11aarray = [
        ["hiragana":"かいしゃをやすみます","kanji":"会社を休みます","meaning":"I will take a day off from work."],
        ["hiragana":"かかります","kanji":"かかります","meaning":"to take time / to consume"],
        ["hiragana":"わたしはあにがいます","kanji":"私は兄がいます","meaning":"I have an older brother."],
        ["hiragana":"にほんにいます","kanji":"日本にいます","meaning":"I am in Japan."],
        ["hiragana":"ねん","kanji":"〜年","meaning":"-year"],
        ["hiragana":"つ","kanji":"〜つ","meaning":"counter for small objects"],
        ["hiragana":"いくつ","kanji":"幾つ","meaning":"how many"],
        ["hiragana":"にん","kanji":"人","meaning":"counter for people"],
        ["hiragana":"だい","kanji":"台","meaning":"counter for machines / vehicles"],
        ["hiragana":"まい","kanji":"枚","meaning":"counter for flat objects (e.g., paper, photographs)"]
    ]
    
    var minnichi1L11barray = [
        ["hiragana":"かい","kanji":"回","meaning":"counter for occurrences / times"],
        ["hiragana":"りんご","kanji":"林檎","meaning":"apple"],
        ["hiragana":"みかん","kanji":"蜜柑","meaning":"mandarin orange"],
        ["hiragana":"さんどいっち","kanji":"サンドイッチ","meaning":"sandwich"],
        ["hiragana":"かれーらいす","kanji":"カレーライス","meaning":"curry rice"],
        ["hiragana":"あいすくりーむ","kanji":"アイスクリーム","meaning":"ice cream"],
        ["hiragana":"きって","kanji":"切手","meaning":"postage stamp"],
        ["hiragana":"はがき","kanji":"葉書","meaning":"postcard"],
        ["hiragana":"ふうとう","kanji":"封筒","meaning":"envelope"],
        ["hiragana":"そくたつ","kanji":"速達","meaning":"express (mail)"]
    ]
    
    var minnichi1L11carray = [
        ["hiragana":"かきとめ","kanji":"書留","meaning":"registered mail"],
        ["hiragana":"えあめーる","kanji":"エアメール","meaning":"airmail"],
        ["hiragana":"こうくうびん","kanji":"航空便","meaning":"airmail"],
        ["hiragana":"ふなびん","kanji":"船便","meaning":"surface mail"],
        ["hiragana":"りょうしん","kanji":"両親","meaning":"parents"],
        ["hiragana":"きょうだい","kanji":"兄弟","meaning":"siblings"],
        ["hiragana":"あに","kanji":"兄","meaning":"elder brother"],
        ["hiragana":"おにいさん","kanji":"お兄さん","meaning":"elder brother (polite form)"],
        ["hiragana":"あね","kanji":"姉","meaning":"elder sister"],
        ["hiragana":"おねえさん","kanji":"お姉さん","meaning":"elder sister (polite form)"]
    ]
    
    var minnichi1L11darray = [
        ["hiragana":"おとうと","kanji":"弟","meaning":"younger brother"],
        ["hiragana":"おとうとさん","kanji":"弟さん","meaning":"younger brother (polite form)"],
        ["hiragana":"いもうと","kanji":"妹","meaning":"younger sister"],
        ["hiragana":"いもうとさん","kanji":"妹さん","meaning":"younger sister (polite form)"],
        ["hiragana":"がいこく","kanji":"外国","meaning":"foreign country"],
        ["hiragana":"じかん","kanji":"〜時間","meaning":"-hour"],
        ["hiragana":"しゅうかん","kanji":"週間","meaning":"week"],
        ["hiragana":"かげつ","kanji":"か月","meaning":"month"],
        ["hiragana":"ぐらい","kanji":"ぐらい","meaning":"about / approximately"],
        ["hiragana":"どのくらい","kanji":"どのくらい","meaning":"how much / how long"]
    ]
    
    var minnichi1L11earray = [
        ["hiragana":"ぜんぶで","kanji":"全部で","meaning":"in total"],
        ["hiragana":"みんな","kanji":"皆","meaning":"everyone / all"],
        ["hiragana":"だけ","kanji":"だけ","meaning":"only / just"],
        ["hiragana":"いらっしゃいませ","kanji":"いらっしゃいませ","meaning":"welcome"],
        ["hiragana":"おーすとらりあ","kanji":"オーストラリア","meaning":"Australia"],
        ["hiragana":"それから","kanji":"それから","meaning":"and then / after that"]
    ]
    
    var minnichi1L12aarray = [
        ["hiragana":"かんたんな","kanji":"簡単な","meaning":"easy / simple"],
        ["hiragana":"ちかい","kanji":"近い","meaning":"near / close"],
        ["hiragana":"とおい","kanji":"遠い","meaning":"far"],
        ["hiragana":"はやい","kanji":"速い","meaning":"fast / quick"],
        ["hiragana":"はやい","kanji":"早い","meaning":"early"],
        ["hiragana":"おそい","kanji":"遅い","meaning":"late / slow"],
        ["hiragana":"おおい","kanji":"多い","meaning":"many / much"],
        ["hiragana":"すくない","kanji":"少ない","meaning":"few / little"],
        ["hiragana":"あたたかい","kanji":"暖かい","meaning":"warm"],
        ["hiragana":"すずしい","kanji":"涼しい","meaning":"cool / refreshing"]
    ]
    
    var minnichi1L12barray = [
        ["hiragana":"あまい","kanji":"甘い","meaning":"sweet"],
        ["hiragana":"からい","kanji":"辛い","meaning":"spicy / hot (as in spicy food)"],
        ["hiragana":"おもい","kanji":"重い","meaning":"heavy"],
        ["hiragana":"かるい","kanji":"軽い","meaning":"light"],
        ["hiragana":"いい","kanji":"良い","meaning":"good / nice"],
        ["hiragana":"きせつ","kanji":"季節","meaning":"season"],
        ["hiragana":"はる","kanji":"春","meaning":"spring"],
        ["hiragana":"なつ","kanji":"夏","meaning":"summer"],
        ["hiragana":"あき","kanji":"秋","meaning":"autumn / fall"],
        ["hiragana":"ふゆ","kanji":"冬","meaning":"winter"]
    ]
    
    var minnichi1L12carray = [
        ["hiragana":"てんき","kanji":"天気","meaning":"weather"],
        ["hiragana":"あめ","kanji":"雨","meaning":"rain"],
        ["hiragana":"ゆき","kanji":"雪","meaning":"snow"],
        ["hiragana":"くもり","kanji":"曇り","meaning":"cloudy"],
        ["hiragana":"ほてる","kanji":"ホテル","meaning":"hotel"],
        ["hiragana":"くうこう","kanji":"空港","meaning":"airport"],
        ["hiragana":"うみ","kanji":"海","meaning":"sea / ocean"],
        ["hiragana":"せかい","kanji":"世界","meaning":"world"],
        ["hiragana":"ぱーてぃー","kanji":"パーティー","meaning":"party"],
        ["hiragana":"まつり","kanji":"祭り","meaning":"festival"]
    ]
    
    var minnichi1L12darray = [
        ["hiragana":"しけん","kanji":"試験","meaning":"examination / test"],
        ["hiragana":"すきやき","kanji":"鋤焼き","meaning":"grilled meat / barbecue"],
        ["hiragana":"さしみ","kanji":"刺身","meaning":"sashimi (raw fish)"],
        ["hiragana":"すし","kanji":"寿司","meaning":"sushi"],
        ["hiragana":"てんぷら","kanji":"天ぷら","meaning":"tempura"],
        ["hiragana":"いけばな","kanji":"生け花","meaning":"ikebana (flower arrangement)"],
        ["hiragana":"もみじ","kanji":"紅葉","meaning":"autumn leaves"],
        ["hiragana":"どちら","kanji":"どちら","meaning":"which (of two)"],
        ["hiragana":"どちらも","kanji":"どちらも","meaning":"both"],
        ["hiragana":"ずっとおおい","kanji":"ずっと多い","meaning":"much more"]
    ]
    
    var minnichi1L12earray = [
        ["hiragana":"はじめて","kanji":"初めて","meaning":"for the first time"],
        ["hiragana":"ただいま","kanji":"ただいま","meaning":"I'm home"],
        ["hiragana":"おかえりなさい","kanji":"お帰りなさい","meaning":"welcome back"],
        ["hiragana":"でも","kanji":"でも","meaning":"but / however"]
    ]
    
    var minnichi1L13aarray = [
        ["hiragana":"およぎます","kanji":"泳ぎます","meaning":"to swim"],
        ["hiragana":"だします","kanji":"出します","meaning":"to submit / hand in"],
        ["hiragana":"あそびます","kanji":"遊びます","meaning":"to play"],
        ["hiragana":"はいります","kanji":"入ります","meaning":"to enter"],
        ["hiragana":"むかえます","kanji":"迎えます","meaning":"to welcome"],
        ["hiragana":"でます","kanji":"出ます","meaning":"to leave"],
        ["hiragana":"つかれます","kanji":"疲れます","meaning":"to get tired"],
        ["hiragana":"けっこんします","kanji":"結婚します","meaning":"to get married / to marry"],
        ["hiragana":"かいものします","kanji":"買い物します","meaning":"to go shopping / to shop"],
        ["hiragana":"しょくじします","kanji":"食事します","meaning":"to have a meal / to eat"]
    ]
    
    var minnichi1L13barray = [
        ["hiragana":"さんぽします","kanji":"散歩します","meaning":"to take a walk / to stroll"],
        ["hiragana":"たいへんな","kanji":"大変な","meaning":"tough / hard / difficult"],
        ["hiragana":"ほしい","kanji":"欲しい","meaning":"want / to want"],
        ["hiragana":"さびしい","kanji":"寂しい","meaning":"lonely / to feel lonely"],
        ["hiragana":"ひろい","kanji":"広い","meaning":"wide / spacious"],
        ["hiragana":"せまい","kanji":"狭い","meaning":"narrow"],
        ["hiragana":"すきー","kanji":"スキー","meaning":"skiing"],
        ["hiragana":"しゅうまつ","kanji":"週末","meaning":"weekend"],
        ["hiragana":"しやくしょ","kanji":"市役所","meaning":"city hall / municipal office"],
        ["hiragana":"ぷーる","kanji":"プール","meaning":"pool"]
    ]
    
    var minnichi1L13carray = [
        ["hiragana":"かわ","kanji":"川","meaning":"river"],
        ["hiragana":"けいざい","kanji":"経済","meaning":"economy"],
        ["hiragana":"びじゅつ","kanji":"美術","meaning":"art"],
        ["hiragana":"つり","kanji":"釣り","meaning":"fishing / to fish"],
        ["hiragana":"かいぎ","kanji":"会議","meaning":"meeting / conference"],
        ["hiragana":"とうろく","kanji":"登録","meaning":"registration / to register"],
        ["hiragana":"ごろ","kanji":"頃","meaning":"around (time) / about"],
        ["hiragana":"なにか","kanji":"何か","meaning":"something"],
        ["hiragana":"どこか","kanji":"何処か","meaning":"somewhere"],
        ["hiragana":"おなかがすきました","kanji":"お腹が空きました","meaning":"I'm hungry"]
    ]
    
    var minnichi1L13darray = [
        ["hiragana":"おなかがいっぱいです","kanji":"お腹がいっぱいです","meaning":"I'm full"],
        ["hiragana":"のどがかわきました","kanji":"喉が渇きました","meaning":"I'm thirsty"],
        ["hiragana":"そうですね","kanji":"そうですね","meaning":"that's right / I see"],
        ["hiragana":"そうしましょう","kanji":"そうしましょう","meaning":"let's do that / let's do it"],
        ["hiragana":"ちゅうもん","kanji":"注文","meaning":"order / to order"],
        ["hiragana":"ていしょく","kanji":"定食","meaning":"set meal"],
        ["hiragana":"ぎゅうどん","kanji":"牛丼","meaning":"beef bowl (gyudon)"],
        ["hiragana":"しょうしょうおまちください","kanji":"少々お待ち下さい","meaning":"a moment please / please wait a moment"],
        ["hiragana":"べつべつに","kanji":"別々に","meaning":"separately / individually"]
    ]
    
    var minnichi1L14aarray = [
        ["hiragana":"てつだいます","kanji":"手伝います","meaning":"to help"],
        ["hiragana":"いそぎます","kanji":"急ぎます","meaning":"to hurry"],
        ["hiragana":"けします","kanji":"消します","meaning":"to turn off"],
        ["hiragana":"はなします","kanji":"話します","meaning":"to talk"],
        ["hiragana":"まちます","kanji":"待ちます","meaning":"to wait"],
        ["hiragana":"もちます","kanji":"持ちます","meaning":"to hold"],
        ["hiragana":"よびます","kanji":"呼びます","meaning":"to call"],
        ["hiragana":"まがります","kanji":"曲がります","meaning":"to turn / to bend"],
        ["hiragana":"とります","kanji":"取ります","meaning":"to take"],
        ["hiragana":"ふります","kanji":"降ります","meaning":"to get off"]
    ]
    
    var minnichi1L14barray = [
        ["hiragana":"つけます","kanji":"点けます","meaning":"to turn on"],
        ["hiragana":"あけます","kanji":"開けます","meaning":"to open"],
        ["hiragana":"みせます","kanji":"見せます","meaning":"to show"],
        ["hiragana":"しめます","kanji":"閉めます","meaning":"to close"],
        ["hiragana":"とめます","kanji":"止めます","meaning":"to stop"],
        ["hiragana":"はじめます","kanji":"始めます","meaning":"to start"],
        ["hiragana":"こぴーします","kanji":"コピーします","meaning":"to copy"],
        ["hiragana":"えあこん","kanji":"エアコン","meaning":"air conditioner"],
        ["hiragana":"ぱすぽーと","kanji":"パスポート","meaning":"passport"],
        ["hiragana":"なまえ","kanji":"名前","meaning":"name"]
    ]
    
    var minnichi1L14carray = [
        ["hiragana":"じゅうしょ","kanji":"住所","meaning":"address"],
        ["hiragana":"ちず","kanji":"地図","meaning":"map"],
        ["hiragana":"しお","kanji":"塩","meaning":"salt"],
        ["hiragana":"さとう","kanji":"砂糖","meaning":"sugar"],
        ["hiragana":"よみかた","kanji":"読み方","meaning":"how to read / pronunciation"],
        ["hiragana":"ゆっくり","kanji":"ゆっくり","meaning":"slowly"],
        ["hiragana":"すぐ","kanji":"すぐ","meaning":"soon / immediately"],
        ["hiragana":"また","kanji":"また","meaning":"again / also"],
        ["hiragana":"あとで","kanji":"後で","meaning":"later / after"],
        ["hiragana":"もういちど","kanji":"もう一度","meaning":"once more / one more time"],
        ["hiragana":"まっすぐ","kanji":"真っ直ぐ","meaning":"straight / straight ahead"],
        ["hiragana":"おつり","kanji":"お釣り","meaning":"change / change (in money)"]
    ]
    
    var minnichi1L15aarray = [
        ["hiragana":"つかいます","kanji":"使います","meaning":"to use"],
        ["hiragana":"おきます","kanji":"置きます","meaning":"to place"],
        ["hiragana":"たちます","kanji":"立ちます","meaning":"to stand"],
        ["hiragana":"すみます","kanji":"住みます","meaning":"to live"],
        ["hiragana":"すわります","kanji":"座ります","meaning":"to sit"],
        ["hiragana":"つくります","kanji":"作ります","meaning":"to make"],
        ["hiragana":"うります","kanji":"売ります","meaning":"to sell"],
        ["hiragana":"しります","kanji":"知ります","meaning":"to know"],
        ["hiragana":"けんきゅうします","kanji":"研究します","meaning":"to research"],
        ["hiragana":"おもいだします","kanji":"思い出します","meaning":"to recall / to remember"]
    ]
    
    var minnichi1L15barray = [
        ["hiragana":"いらっしゃいます","kanji":"いらっしゃいます","meaning":"to come (honorific form)"],
        ["hiragana":"しりょう","kanji":"資料","meaning":"materials / data"],
        ["hiragana":"かたろぐ","kanji":"カタログ","meaning":"catalog"],
        ["hiragana":"じこくひょう","kanji":"時刻表","meaning":"timetable / schedule"],
        ["hiragana":"ふく","kanji":"服","meaning":"clothes"],
        ["hiragana":"せいひん","kanji":"製品","meaning":"product"],
        ["hiragana":"そふと","kanji":"ソフト","meaning":"software"],
        ["hiragana":"せんもん","kanji":"専門","meaning":"specialty / expertise"],
        ["hiragana":"はいしゃ","kanji":"歯医者","meaning":"dentist"],
        ["hiragana":"とこや","kanji":"床屋","meaning":"barber / hairdresser"]
    ]
    
    var minnichi1L15carray = [
        ["hiragana":"ぷれいがいど","kanji":"プレイガイド","meaning":"ticket outlet / play guide"],
        ["hiragana":"どくしん","kanji":"独身","meaning":"single / unmarried"],
        ["hiragana":"とくに","kanji":"特に","meaning":"especially"],
        ["hiragana":"こうこう","kanji":"高校","meaning":"high school"]
    ]
    
    var minnichi1L16aarray = [
        ["hiragana":"だします","kanji":"出します","meaning":"to submit"],
        ["hiragana":"おします","kanji":"押します","meaning":"to press"],
        ["hiragana":"のります","kanji":"乗ります","meaning":"to ride"],
        ["hiragana":"だいがくにはいります","kanji":"大学に入ります","meaning":"to enter university / to enroll in a university"],
        ["hiragana":"のりかえます","kanji":"乗り換えます","meaning":"to transfer (trains, buses, etc.) / to transfer"],
        ["hiragana":"だいがくをでます","kanji":"大学を出ます","meaning":"graduate from university"],
        ["hiragana":"あびます","kanji":"浴びます","meaning":"to bathe / to (take a) shower"],
        ["hiragana":"やめます","kanji":"辞めます","meaning":"to quit / to resign"],
        ["hiragana":"おります","kanji":"降ります","meaning":"to get off"],
        ["hiragana":"いれます","kanji":"入れます","meaning":"to put in"]
    ]
    
    var minnichi1L16barray = [
        ["hiragana":"わかい","kanji":"若い","meaning":"young"],
        ["hiragana":"ながい","kanji":"長い","meaning":"long"],
        ["hiragana":"みじかい","kanji":"短い","meaning":"short"],
        ["hiragana":"あかるい","kanji":"明るい","meaning":"bright / light"],
        ["hiragana":"くらい","kanji":"暗い","meaning":"dark"],
        ["hiragana":"せがたかい","kanji":"背が高い","meaning":"tall / high (referring to height)"],
        ["hiragana":"からだ","kanji":"体","meaning":"body"],
        ["hiragana":"あたまがいい","kanji":"頭が良い","meaning":"smart / intelligent"],
        ["hiragana":"あたま","kanji":"頭","meaning":"head"],
        ["hiragana":"かみ","kanji":"髪","meaning":"hair"]
    ]
    
    var minnichi1L16carray = [
        ["hiragana":"かお","kanji":"顔","meaning":"face"],
        ["hiragana":"め","kanji":"目","meaning":"eye"],
        ["hiragana":"みみ","kanji":"耳","meaning":"ear"],
        ["hiragana":"くち","kanji":"口","meaning":"mouth"],
        ["hiragana":"は","kanji":"歯","meaning":"tooth / teeth"],
        ["hiragana":"おなか","kanji":"お腹","meaning":"stomach"],
        ["hiragana":"あし","kanji":"足","meaning":"leg / foot"],
        ["hiragana":"さーびす","kanji":"サービス","meaning":"service / complimentary service"],
        ["hiragana":"じょぎんぐ","kanji":"ジョギング","meaning":"jogging"],
        ["hiragana":"しゃわー","kanji":"シャワー","meaning":"shower"]
    ]
    
    var minnichi1L16darray = [
        ["hiragana":"みどり","kanji":"緑","meaning":"green / greenery"],
        ["hiragana":"てら","kanji":"寺","meaning":"temple"],
        ["hiragana":"じんじゃ","kanji":"神社","meaning":"shrine"],
        ["hiragana":"りゅうがくせい","kanji":"留学生","meaning":"international student"],
        ["hiragana":"ばん","kanji":"番","meaning":"-th (suffix for indicating order)"],
        ["hiragana":"どうやって","kanji":"どうやって","meaning":"how / by what means"],
        ["hiragana":"どの","kanji":"どの","meaning":"which / what"],
        ["hiragana":"まだまだです","kanji":"まだまだです","meaning":"still a long way to go / still not good enough"],
        ["hiragana":"おひきだし","kanji":"お引き出し","meaning":"cash withdrawal"],
        ["hiragana":"まず","kanji":"まず","meaning":"first of all / to start with"]
    ]
    
    var minnichi1L16earray = [
        ["hiragana":"きゃっしゅかーど","kanji":"キャッシュカード","meaning":"cash card"],
        ["hiragana":"あんしょうばんごう","kanji":"暗証番号","meaning":"PIN number / password"],
        ["hiragana":"つぎに","kanji":"次に","meaning":"next / then"],
        ["hiragana":"きんがく","kanji":"金額","meaning":"amount / sum"],
        ["hiragana":"かくにん","kanji":"確認","meaning":"confirmation / to confirm"],
        ["hiragana":"ぼたん","kanji":"ボタン","meaning":"button"],
        ["hiragana":"べとなむ","kanji":"ベトナム","meaning":"Vietnam"],
        ["hiragana":"あじあ","kanji":"アジア","meaning":"Asia"]
    ]
    
    var minnichi1L17aarray = [
        ["hiragana":"はらいます","kanji":"払います","meaning":"to pay"],
        ["hiragana":"もっていきます","kanji":"持って行きます","meaning":"to take (something) and go / to bring"],
        ["hiragana":"ぬぎます","kanji":"脱ぎます","meaning":"to take off (clothing)"],
        ["hiragana":"なくします","kanji":"失くします","meaning":"to lose (something)"],
        ["hiragana":"しゅくだいをだします","kanji":"宿題を出します","meaning":"to submit homework / to turn in"],
        ["hiragana":"かえします","kanji":"返します","meaning":"to return (something)"],
        ["hiragana":"くすりをのみます","kanji":"薬を飲みます","meaning":"to take medicine"],
        ["hiragana":"おふろにはいります","kanji":"お風呂に入ります","meaning":"to take a bath / to bathe"],
        ["hiragana":"おぼえます","kanji":"覚えます","meaning":"to memorize"],
        ["hiragana":"でかけます","kanji":"出掛けます","meaning":"to go out"]
    ]
    
    var minnichi1L17barray = [
        ["hiragana":"わすれます","kanji":"忘れます","meaning":"to forget"],
        ["hiragana":"もってきます","kanji":"持って来ます","meaning":"to bring"],
        ["hiragana":"しんぱいします","kanji":"心配します","meaning":"to worry"],
        ["hiragana":"ざんぎょうします","kanji":"残業します","meaning":"to work overtime / to do overtime work"],
        ["hiragana":"しゅっちょうします","kanji":"出張します","meaning":"to go on a business trip"],
        ["hiragana":"たいせつな","kanji":"大切な","meaning":"important / valuable"],
        ["hiragana":"だいじょうぶな","kanji":"大丈夫な","meaning":"okay / all right / safe"],
        ["hiragana":"あぶない","kanji":"危ない","meaning":"dangerous"],
        ["hiragana":"もんだい","kanji":"問題","meaning":"problem"],
        ["hiragana":"こたえ","kanji":"答え","meaning":"answer"]
    ]
    
    var minnichi1L17carray = [
        ["hiragana":"きんえん","kanji":"禁煙","meaning":"no smoking / nonsmoking"],
        ["hiragana":"ほけんしょう","kanji":"保険証","meaning":"health insurance card"],
        ["hiragana":"かぜ","kanji":"風邪","meaning":"cold"],
        ["hiragana":"ねつ","kanji":"熱","meaning":"fever"],
        ["hiragana":"びょうき","kanji":"病気","meaning":"illness / sickness"],
        ["hiragana":"くすり","kanji":"薬","meaning":"medicine"],
        ["hiragana":"ふろ","kanji":"風呂","meaning":"bath"],
        ["hiragana":"うわぎ","kanji":"上着","meaning":"jacket / coat"],
        ["hiragana":"したぎ","kanji":"下着","meaning":"underwear"],
        ["hiragana":"せんせい","kanji":"先生","meaning":"teacher"],
    ]
    
    var minnichi1L17darray = [
        ["hiragana":"ですから","kanji":"ですから","meaning":"therefore / so"],
        ["hiragana":"そうしましたか","kanji":"そうしましたか","meaning":"Did you do that?"],
        ["hiragana":"いたい","kanji":"痛い","meaning":"painful / hurt"],
        ["hiragana":"のど","kanji":"喉","meaning":"throat"],
        ["hiragana":"おだいじに","kanji":"お大事に","meaning":"Take care (often said when someone is sick)"]
    ]
    
    var minnichi1L18aarray = [
        ["hiragana":"あらいます","kanji":"洗います","meaning":"to wash"],
        ["hiragana":"うたいます","kanji":"歌います","meaning":"to sing"],
        ["hiragana":"ひきます","kanji":"弾きます","meaning":"to play (a musical instrument)"],
        ["hiragana":"かえます","kanji":"換えます","meaning":"to exchange / to replace"],
        ["hiragana":"できます","kanji":"できます","meaning":"can / to be able to"],
        ["hiragana":"すてます","kanji":"捨てます","meaning":"to throw away / to discard"],
        ["hiragana":"あつめます","kanji":"集めます","meaning":"to gather / to collect"],
        ["hiragana":"うんてんします","kanji":"運転します","meaning":"to drive"],
        ["hiragana":"よやくします","kanji":"予約します","meaning":"to make a reservation / to reserve"],
        ["hiragana":"けんがくします","kanji":"見学します","meaning":"to visit / to tour (a place)"]
    ]
    
    var minnichi1L18barray = [
        ["hiragana":"ぴあの","kanji":"ピアノ","meaning":"piano"],
        ["hiragana":"めーとる","kanji":"メートル","meaning":"meter / metre"],
        ["hiragana":"こくさい","kanji":"国際","meaning":"international"],
        ["hiragana":"げんきん","kanji":"現金","meaning":"cash"],
        ["hiragana":"しゅみ","kanji":"趣味","meaning":"hobby"],
        ["hiragana":"にっき","kanji":"日記","meaning":"diary / journal"],
        ["hiragana":"いのり","kanji":"祈り","meaning":"prayer"],
        ["hiragana":"しゃちょう","kanji":"社長","meaning":"president / CEO"],
        ["hiragana":"ぶちょう","kanji":"部長","meaning":"department head / section chief"],
        ["hiragana":"かちょう","kanji":"課長","meaning":"section manager / team leader"]
    ]
    
    var minnichi1L18carray = [
        ["hiragana":"どうぶつ","kanji":"動物","meaning":"animal"],
        ["hiragana":"うま","kanji":"馬","meaning":"horse"],
        ["hiragana":"へえ","kanji":"へえ","meaning":"oh / oh really"],
        ["hiragana":"なかなか","kanji":"なかなか","meaning":"quite / pretty"],
        ["hiragana":"ほんとう","kanji":"本当","meaning":"true / really"],
        ["hiragana":"ぜひ","kanji":"是非","meaning":"by all means / definitely / without fail"]
    ]
    
    var minnichi1L19aarray = [
        ["hiragana":"のぼります","kanji":"登ります","meaning":"to climb"],
        ["hiragana":"とまります","kanji":"泊まります","meaning":"to stay (overnight)"],
        ["hiragana":"なります","kanji":"なります","meaning":"to become"],
        ["hiragana":"そうじします","kanji":"掃除します","meaning":"to clean"],
        ["hiragana":"せんたくします","kanji":"洗濯します","meaning":"to wash (clothes) / to do the laundry"],
        ["hiragana":"れんしゅうします","kanji":"練習します","meaning":"to practice"],
        ["hiragana":"ねむい","kanji":"眠い","meaning":"sleepy / drowsy"],
        ["hiragana":"つよい","kanji":"強い","meaning":"strong"],
        ["hiragana":"よわい","kanji":"弱い","meaning":"weak"],
        ["hiragana":"ちょうしがいい","kanji":"調子が良い","meaning":"in good shape / feeling good"]
    ]
    
    var minnichi1L19barray = [
        ["hiragana":"ちょうしがわるい","kanji":"調子が悪い","meaning":"in bad shape / feeling bad"],
        ["hiragana":"からだにいい","kanji":"体に良い","meaning":"good for health / good for the body"],
        ["hiragana":"むりな","kanji":"無理な","meaning":"impossible / unreasonable"],
        ["hiragana":"ちょうし","kanji":"調子","meaning":"condition / shape / state"],
        ["hiragana":"ゴルフ","kanji":"ごるふ","meaning":"golf"],
        ["hiragana":"すもう","kanji":"相撲","meaning":"sumo wrestling"],
        ["hiragana":"ぱちんこ","kanji":"パチンコ","meaning":"pachinko"],
        ["hiragana":"ひ","kanji":"日","meaning":"day / date"],
        ["hiragana":"いちど","kanji":"一度","meaning":"once / one time"],
        ["hiragana":"いちども","kanji":"一度も","meaning":"never / not even once"]
    ]
    
    var minnichi1L19carray = [
        ["hiragana":"だんだん","kanji":"だんだん","meaning":"gradually"],
        ["hiragana":"もうすぐ","kanji":"もうすぐ","meaning":"soon / almost / nearly"],
        ["hiragana":"おかげさまで","kanji":"お陰様で","meaning":"thanks to you / thanks to your help"],
        ["hiragana":"かんぱい","kanji":"乾杯","meaning":"cheers / a toast (used before drinking)"],
        ["hiragana":"じつは","kanji":"実は","meaning":"actually / as a matter of fact"],
        ["hiragana":"だいえっと","kanji":"ダイエット","meaning":"diet"],
        ["hiragana":"なんかいも","kanji":"何回も","meaning":"many times / repeatedly"],
        ["hiragana":"しかし","kanji":"しかし","meaning":"however / but"],
        ["hiragana":"けーき","kanji":"ケーキ","meaning":"cake"]
    ]
    
    var minnichi1L20aarray = [
        ["hiragana":"なおします","kanji":"直します","meaning":"to fix / to correct"],
        ["hiragana":"いります","kanji":"要ります","meaning":"to need / to require"],
        ["hiragana":"しらべます","kanji":"調べます","meaning":"investigate / to research"],
        ["hiragana":"しゅうりします","kanji":"修理します","meaning":"to repair / to fix"],
        ["hiragana":"でんわします","kanji":"電話します","meaning":"make a phone call / to call"],
        ["hiragana":"ぼく","kanji":"僕","meaning":"I (informal, used by males)"],
        ["hiragana":"きみ","kanji":"君","meaning":"you (informal)"],
        ["hiragana":"くん","kanji":"君","meaning":"dear / darling (used to address someone affectionately, informal)"],
        ["hiragana":"うん","kanji":"うん","meaning":"yes / yeah"],
        ["hiragana":"ううん","kanji":"ううん","meaning":"uh-uh / no"]
    ]
    
    var minnichi1L20barray = [
        ["hiragana":"さらりーまん","kanji":"サラリーマン","meaning":"salaried worker / office worker"],
        ["hiragana":"ことば","kanji":"言葉","meaning":"word / language"],
        ["hiragana":"ぶっか","kanji":"物価","meaning":"cost of living / prices"],
        ["hiragana":"きもの","kanji":"着物","meaning":"kimono"],
        ["hiragana":"びざ","kanji":"ビザ","meaning":"visa"],
        ["hiragana":"はじめ","kanji":"初め","meaning":"beginning / start"],
        ["hiragana":"おわり","kanji":"終わり","meaning":"end / finish"],
        ["hiragana":"こっち","kanji":"こっち","meaning":"this way / here"],
        ["hiragana":"そっち","kanji":"そっち","meaning":"that way / there (near the listener)"],
        ["hiragana":"あっち","kanji":"あっち","meaning":"that way / over there (far from the speaker and listener)"]
    ]
    
    var minnichi1L20carray = [
        ["hiragana":"どっち","kanji":"どっち","meaning":"which way / which direction"],
        ["hiragana":"このあいだ","kanji":"この間","meaning":"the other day / recently"],
        ["hiragana":"みんなで","kanji":"皆で","meaning":"all together / with everyone"],
        ["hiragana":"どうしたの","kanji":"どうしたの","meaning":"what's wrong / what happened"],
        ["hiragana":"こっちかな","kanji":"こっちかな","meaning":"I wonder if it's this way"],
        ["hiragana":"けど","kanji":"けど","meaning":"but / however"]
    ]
    
    var minnichi1L21aarray = [
        ["hiragana":"しゅしょう","kanji":"首相","meaning":"Prime Minister"],
        ["hiragana":"だいとうりょう","kanji":"大統領","meaning":"President"],
        ["hiragana":"せいじ","kanji":"政治","meaning":"politics"],
        ["hiragana":"にゅーす","kanji":"ニュース","meaning":"news"],
        ["hiragana":"すぴーち","kanji":"スピーチ","meaning":"speech"],
        ["hiragana":"しあい","kanji":"試合","meaning":"match / game"],
        ["hiragana":"あるばいと","kanji":"アルバイト","meaning":"part-time job / part-time work"],
        ["hiragana":"いけん","kanji":"意見","meaning":"opinion"],
        ["hiragana":"はなし","kanji":"話","meaning":"talk / conversation"],
        ["hiragana":"ゆーもあ","kanji":"ユーモア","meaning":"humor"]
    ]
    
    var minnichi1L21barray = [
        ["hiragana":"むだな","kanji":"無駄な","meaning":"wasteful"],
        ["hiragana":"でざいん","kanji":"デザイン","meaning":"design"],
        ["hiragana":"こうつう","kanji":"交通","meaning":"traffic"],
        ["hiragana":"らっしゅ","kanji":"ラッシュ","meaning":"rush / rush hour"],
        ["hiragana":"さいきん","kanji":"最近","meaning":"recently"],
        ["hiragana":"たぶん","kanji":"多分","meaning":"probably / maybe"],
        ["hiragana":"きっと","kanji":"きっと","meaning":"surely / certainly"],
        ["hiragana":"ほんとうに","kanji":"本当に","meaning":"really / truly"],
        ["hiragana":"ついて","kanji":"ついて","meaning":"about / concerning"]
    ]
    
    var minnichi1L21carray = [
        ["hiragana":"しばらく","kanji":"暫く","meaning":"for a while / a little while"],
        ["hiragana":"しかたがありません","kanji":"仕方がありません","meaning":"can't be helped / nothing can be done"],
        ["hiragana":"もちろん","kanji":"勿論","meaning":"of course / certainly"]
    ]
    
    var minnichi1L22aarray = [
        ["hiragana":"はきます","kanji":"履きます","meaning":"to wear (shoes, pants, etc.)"],
        ["hiragana":"かぶります","kanji":"被ります","meaning":"to put on (hat, cap, etc.)"],
        ["hiragana":"きます","kanji":"着ます","meaning":"to wear (clothes)"],
        ["hiragana":"めがねをかけます","kanji":"眼鏡をかけます","meaning":"to wear glasses / to put on glasses"],
        ["hiragana":"うまれます","kanji":"生まれます","meaning":"to be born"],
        ["hiragana":"こーと","kanji":"コート","meaning":"coat"],
        ["hiragana":"すーつ","kanji":"スーツ","meaning":"suit"],
        ["hiragana":"せーたー","kanji":"セーター","meaning":"sweater"],
        ["hiragana":"めがね","kanji":"眼鏡","meaning":"glasses"],
        ["hiragana":"ぼうし","kanji":"帽子","meaning":"hat / cap"]
    ]
    
    var minnichi1L22barray = [
        ["hiragana":"やちん","kanji":"家賃","meaning":"rent / rental fee"],
        ["hiragana":"うーん","kanji":"うーん","meaning":"umm / well"],
        ["hiragana":"わしつ","kanji":"和室","meaning":"Japanese-style room / tatami room"],
        ["hiragana":"おしいれ","kanji":"押し入れ","meaning":"closet"],
        ["hiragana":"ふとん","kanji":"布団","meaning":"futon / Japanese bedding"],
        ["hiragana":"あぱーと","kanji":"アパート","meaning":"apartment"]
    ]
    
    var minnichi1L23aarray = [
        ["hiragana":"せんせいにききます","kanji":"先生に聞きます","meaning":"to ask the teacher"],
        ["hiragana":"ひきます","kanji":"引きます","meaning":"pull / to pull"],
        ["hiragana":"うごきます","kanji":"動きます","meaning":"to move"],
        ["hiragana":"あるきます","kanji":"歩きます","meaning":"to walk"],
        ["hiragana":"まわします","kanji":"回します","meaning":"to turn (an object)"],
        ["hiragana":"さわります","kanji":"触ります","meaning":"to touch"],
        ["hiragana":"わたります","kanji":"渡ります","meaning":"to cross"],
        ["hiragana":"かえます","kanji":"変えます","meaning":"to change"],
        ["hiragana":"きをつけます","kanji":"気を付けます","meaning":"to be careful"],
        ["hiragana":"おつりがでます","kanji":"お釣りが出ます","meaning":"receive change"]
    ]
    
    var minnichi1L23barray = [
        ["hiragana":"ひっこしします","kanji":"引越しします","meaning":"to move (to a new residence)"],
        ["hiragana":"でんきや","kanji":"電気屋","meaning":"electronics store"],
        ["hiragana":"さいず","kanji":"サイズ","meaning":"size"],
        ["hiragana":"おと","kanji":"音","meaning":"sound"],
        ["hiragana":"きかい","kanji":"機械","meaning":"machine"],
        ["hiragana":"つまみ","kanji":"摘み","meaning":"to pick (fruit, flowers, etc.)"],
        ["hiragana":"こしょう","kanji":"故障","meaning":"malfunction / breakdown"],
        ["hiragana":"みち","kanji":"道","meaning":"road / street"],
        ["hiragana":"こうさてん","kanji":"交差点","meaning":"intersection"],
        ["hiragana":"しんごう","kanji":"信号","meaning":"traffic light"]
    ]
    
    var minnichi1L23carray = [
        ["hiragana":"かど","kanji":"角","meaning":"corner"],
        ["hiragana":"はし","kanji":"橋","meaning":"bridge"],
        ["hiragana":"しょうがつ","kanji":"正月","meaning":"New Year"],
        ["hiragana":"ちゅうしゃじょう","kanji":"駐車場","meaning":"parking lot"],
        ["hiragana":"ふたつめ","kanji":"二つ目","meaning":"second"],
        ["hiragana":"ごちそうさまでした","kanji":"ご馳走様でした","meaning":"thank you for the meal (said after eating)"],
        ["hiragana":"たてもの","kanji":"建物","meaning":"building"],
        ["hiragana":"がいこくじんとうろくしょう","kanji":"外国人登録証","meaning":"residence card for foreigners"],
        ["hiragana":"とき","kanji":"時","meaning":"time / hour"]
    ]
    
    var minnichi1L24aarray = [
        ["hiragana":"つれていきます","kanji":"連れて行きます","meaning":"to take (someone) along"],
        ["hiragana":"おくります","kanji":"送ります","meaning":"to send (someone)"],
        ["hiragana":"くれます","kanji":"くれます","meaning":"to give (me)"],
        ["hiragana":"おちゃをいれます","kanji":"お茶を淹れます","meaning":"to make tea / to brew tea"],
        ["hiragana":"つれてきます","kanji":"連れて来ます","meaning":"to bring (someone) along"],
        ["hiragana":"しょうかいします","kanji":"紹介します","meaning":"to introduce"],
        ["hiragana":"あんないします","kanji":"案内します","meaning":"to guide"],
        ["hiragana":"せつめいします","kanji":"説明します","meaning":"to explain"],
        ["hiragana":"おじいさん","kanji":"お祖父さん","meaning":"grandfather"],
        ["hiragana":"おじいさん","kanji":"お爺さん","meaning":"old man / grandfather"],
    ]
    
    var minnichi1L24barray = [
        ["hiragana":"おばあさん","kanji":"お祖母さん","meaning":"grandmother"],
        ["hiragana":"おばあさん","kanji":"お婆さん","meaning":"old woman / grandmother"],
        ["hiragana":"じゅんび","kanji":"準備","meaning":"preparation / getting ready"],
        ["hiragana":"いみ","kanji":"意味","meaning":"meaning / significance"],
        ["hiragana":"かし","kanji":"菓子","meaning":"confectionery / sweets"],
        ["hiragana":"ぜんぶ","kanji":"全部","meaning":"all / everything"],
        ["hiragana":"じぶんで","kanji":"自分で","meaning":"by oneself / on one's own"],
        ["hiragana":"ほかに","kanji":"他に","meaning":"besides / other than"],
        ["hiragana":"べんとう","kanji":"弁当","meaning":"bento / boxed lunch"],
        ["hiragana":"ははのひ","kanji":"母の日","meaning":"Mother's Day"]
    ]
    
    var minnichi1L25aarray = [
        ["hiragana":"つきます","kanji":"着きます","meaning":"to arrive"],
        ["hiragana":"としをとります","kanji":"年を取ります","meaning":"to get older / to age"],
        ["hiragana":"かんがえます","kanji":"考えます","meaning":"to think / to consider"],
        ["hiragana":"りゅうがくします","kanji":"留学します","meaning":"to study abroad"],
        ["hiragana":"がんばります","kanji":"頑張ります","meaning":"to do one's best / to try hard"],
        ["hiragana":"いなか","kanji":"田舎","meaning":"countryside / rural area"],
        ["hiragana":"たいしかん","kanji":"大使館","meaning":"embassy"],
        ["hiragana":"ぐるーぷ","kanji":"グループ","meaning":"group"],
        ["hiragana":"ちゃんす","kanji":"チャンス","meaning":"chance / opportunity"],
        ["hiragana":"おく","kanji":"億","meaning":"hundred million / billion"]
    ]
    
    var minnichi1L25barray = [
        ["hiragana":"てんきん","kanji":"転勤","meaning":"job transfer / transfer (to another location for work)"],
        ["hiragana":"こと","kanji":"事","meaning":"thing / matter"],
        ["hiragana":"おせわになりました","kanji":"お世話になりました","meaning":"thank you for your help (used to show gratitude after receiving help)"],
        ["hiragana":"どうぞおげんきで","kanji":"どうぞお元気で","meaning":"Please take care (used to bid farewell and wish someone well)"]
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
        
        if let minnichi1 = UserDefaults.standard.object(forKey: "MINNICHI1") as? Int,
           let chapter = UserDefaults.standard.object(forKey: "CHAPTER") as? Int {
            MINNICHI1 = minnichi1
            CHAPTER = chapter
        }
        
        if MINNICHI1 == 0 && CHAPTER == 0 {
            titleLabel.text = "第1課"
            titleShadowLabel.text = "第1課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L1aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 0 && CHAPTER == 1 {
            titleLabel.text = "第1課"
            titleShadowLabel.text = "第1課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L1barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 0 && CHAPTER == 2 {
            titleLabel.text = "第1課"
            titleShadowLabel.text = "第1課"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L1carray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 0 && CHAPTER == 3 {
            titleLabel.text = "第1課"
            titleShadowLabel.text = "第1課"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L1darray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 1 && CHAPTER == 0 {
            titleLabel.text = "第2課"
            titleShadowLabel.text = "第2課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L2aarray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 1 && CHAPTER == 1 {
            titleLabel.text = "第2課"
            titleShadowLabel.text = "第2課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L2barray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 1 && CHAPTER == 2 {
            titleLabel.text = "第2課"
            titleShadowLabel.text = "第2課"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L2carray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 1 && CHAPTER == 3 {
            titleLabel.text = "第2課"
            titleShadowLabel.text = "第2課"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L2darray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 1 && CHAPTER == 4 {
            titleLabel.text = "第2課"
            titleShadowLabel.text = "第2課"
            chapterLabel.text = "41〜45"
            totalLabel.text = "total 5 words"
            shuffledQuestions = shuffleArray(minnichi1L2earray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 2 && CHAPTER == 0 {
            titleLabel.text = "第3課"
            titleShadowLabel.text = "第3課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L3aarray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 2 && CHAPTER == 1 {
            titleLabel.text = "第3課"
            titleShadowLabel.text = "第3課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L3barray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 2 && CHAPTER == 2 {
            titleLabel.text = "第3課"
            titleShadowLabel.text = "第3課"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L3carray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 2 && CHAPTER == 3 {
            titleLabel.text = "第3課"
            titleShadowLabel.text = "第3課"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L3darray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 2 && CHAPTER == 4 {
            titleLabel.text = "第3課"
            titleShadowLabel.text = "第3課"
            chapterLabel.text = "41〜44"
            totalLabel.text = "total 4 words"
            shuffledQuestions = shuffleArray(minnichi1L3earray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 3 && CHAPTER == 0 {
            titleLabel.text = "第4課"
            titleShadowLabel.text = "第4課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L4aarray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 3 && CHAPTER == 1 {
            titleLabel.text = "第4課"
            titleShadowLabel.text = "第4課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L4barray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 3 && CHAPTER == 2 {
            titleLabel.text = "第4課"
            titleShadowLabel.text = "第4課"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L4carray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 3 && CHAPTER == 3 {
            titleLabel.text = "第4課"
            titleShadowLabel.text = "第4課"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L4darray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 3 && CHAPTER == 4 {
            titleLabel.text = "第4課"
            titleShadowLabel.text = "第4課"
            chapterLabel.text = "41〜49"
            totalLabel.text = "total 9 words"
            shuffledQuestions = shuffleArray(minnichi1L4earray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 4 && CHAPTER == 0 {
            titleLabel.text = "第5課"
            titleShadowLabel.text = "第5課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L5aarray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 4 && CHAPTER == 1 {
            titleLabel.text = "第5課"
            titleShadowLabel.text = "第5課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L5barray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 4 && CHAPTER == 2 {
            titleLabel.text = "第5課"
            titleShadowLabel.text = "第5課"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L5carray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 4 && CHAPTER == 3 {
            titleLabel.text = "第5課"
            titleShadowLabel.text = "第5課"
            chapterLabel.text = "31〜42"
            totalLabel.text = "total 12 words"
            shuffledQuestions = shuffleArray(minnichi1L5darray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 5 && CHAPTER == 0 {
            titleLabel.text = "第6課"
            titleShadowLabel.text = "第6課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L6aarray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 5 && CHAPTER == 1 {
            titleLabel.text = "第6課"
            titleShadowLabel.text = "第6課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L6barray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 5 && CHAPTER == 2 {
            titleLabel.text = "第6課"
            titleShadowLabel.text = "第6課"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L6carray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 5 && CHAPTER == 3 {
            titleLabel.text = "第6課"
            titleShadowLabel.text = "第6課"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L6darray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 5 && CHAPTER == 4 {
            titleLabel.text = "第6課"
            titleShadowLabel.text = "第6課"
            chapterLabel.text = "41〜50"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L6earray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 5 && CHAPTER == 5 {
            titleLabel.text = "第6課"
            titleShadowLabel.text = "第6課"
            chapterLabel.text = "51〜53"
            totalLabel.text = "total 3 words"
            shuffledQuestions = shuffleArray(minnichi1L6farray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 6 && CHAPTER == 0 {
            titleLabel.text = "第7課"
            titleShadowLabel.text = "第7課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L7aarray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 6 && CHAPTER == 1 {
            titleLabel.text = "第7課"
            titleShadowLabel.text = "第7課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L7barray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 6 && CHAPTER == 2 {
            titleLabel.text = "第7課"
            titleShadowLabel.text = "第7課"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L7carray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 6 && CHAPTER == 3 {
            titleLabel.text = "第7課"
            titleShadowLabel.text = "第7課"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L7darray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 6 && CHAPTER == 4 {
            titleLabel.text = "第7課"
            titleShadowLabel.text = "第7課"
            chapterLabel.text = "41〜47"
            totalLabel.text = "total 7 words"
            shuffledQuestions = shuffleArray(minnichi1L7earray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 7 && CHAPTER == 0 {
            titleLabel.text = "第8課"
            titleShadowLabel.text = "第8課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L8aarray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 7 && CHAPTER == 1 {
            titleLabel.text = "第8課"
            titleShadowLabel.text = "第8課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L8barray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 7 && CHAPTER == 2 {
            titleLabel.text = "第8課"
            titleShadowLabel.text = "第8課"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L8carray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 7 && CHAPTER == 3 {
            titleLabel.text = "第8課"
            titleShadowLabel.text = "第8課"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L8darray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 7 && CHAPTER == 4 {
            titleLabel.text = "第8課"
            titleShadowLabel.text = "第8課"
            chapterLabel.text = "41〜50"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L8earray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 7 && CHAPTER == 4 {
            titleLabel.text = "第8課"
            titleShadowLabel.text = "第8課"
            chapterLabel.text = "51〜54"
            totalLabel.text = "total 4 words"
            shuffledQuestions = shuffleArray(minnichi1L8farray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 8 && CHAPTER == 0 {
            titleLabel.text = "第9課"
            titleShadowLabel.text = "第9課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L9aarray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 8 && CHAPTER == 1 {
            titleLabel.text = "第9課"
            titleShadowLabel.text = "第9課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L9barray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 8 && CHAPTER == 2 {
            titleLabel.text = "第9課"
            titleShadowLabel.text = "第9課"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L9carray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 8 && CHAPTER == 3 {
            titleLabel.text = "第9課"
            titleShadowLabel.text = "第9課"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L9darray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 8 && CHAPTER == 4 {
            titleLabel.text = "第9課"
            titleShadowLabel.text = "第9課"
            chapterLabel.text = "41〜51"
            totalLabel.text = "total 11 words"
            shuffledQuestions = shuffleArray(minnichi1L9earray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 9 && CHAPTER == 0 {
            titleLabel.text = "第10課"
            titleShadowLabel.text = "第10課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L10aarray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 9 && CHAPTER == 1 {
            titleLabel.text = "第10課"
            titleShadowLabel.text = "第10課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L10barray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 9 && CHAPTER == 2 {
            titleLabel.text = "第10課"
            titleShadowLabel.text = "第10課"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L10carray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 9 && CHAPTER == 3 {
            titleLabel.text = "第10課"
            titleShadowLabel.text = "第10課"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L10darray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 9 && CHAPTER == 4 {
            titleLabel.text = "第10課"
            titleShadowLabel.text = "第10課"
            chapterLabel.text = "41〜44"
            totalLabel.text = "total 4 words"
            shuffledQuestions = shuffleArray(minnichi1L10earray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 10 && CHAPTER == 0 {
            titleLabel.text = "第11課"
            titleShadowLabel.text = "第11課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L11aarray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 10 && CHAPTER == 1 {
            titleLabel.text = "第11課"
            titleShadowLabel.text = "第11課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L11barray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 10 && CHAPTER == 2 {
            titleLabel.text = "第11課"
            titleShadowLabel.text = "第11課"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L11carray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 10 && CHAPTER == 3 {
            titleLabel.text = "第11課"
            titleShadowLabel.text = "第11課"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L11darray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 10 && CHAPTER == 4 {
            titleLabel.text = "第11課"
            titleShadowLabel.text = "第11課"
            chapterLabel.text = "41〜46"
            totalLabel.text = "total 6 words"
            shuffledQuestions = shuffleArray(minnichi1L11earray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 11 && CHAPTER == 0 {
            titleLabel.text = "第12課"
            titleShadowLabel.text = "第12課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L12aarray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 11 && CHAPTER == 1 {
            titleLabel.text = "第12課"
            titleShadowLabel.text = "第12課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L12barray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 11 && CHAPTER == 2 {
            titleLabel.text = "第12課"
            titleShadowLabel.text = "第12課"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L12carray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 11 && CHAPTER == 3 {
            titleLabel.text = "第12課"
            titleShadowLabel.text = "第12課"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L12darray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 11 && CHAPTER == 4 {
            titleLabel.text = "第12課"
            titleShadowLabel.text = "第12課"
            chapterLabel.text = "41〜44"
            totalLabel.text = "total 4 words"
            shuffledQuestions = shuffleArray(minnichi1L12earray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 12 && CHAPTER == 0 {
            titleLabel.text = "第13課"
            titleShadowLabel.text = "第13課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L13aarray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 12 && CHAPTER == 1 {
            titleLabel.text = "第13課"
            titleShadowLabel.text = "第13課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L13barray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 12 && CHAPTER == 2 {
            titleLabel.text = "第13課"
            titleShadowLabel.text = "第13課"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L13carray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 12 && CHAPTER == 3 {
            titleLabel.text = "第13課"
            titleShadowLabel.text = "第13課"
            chapterLabel.text = "31〜39"
            totalLabel.text = "total 9 words"
            shuffledQuestions = shuffleArray(minnichi1L13darray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 13 && CHAPTER == 0 {
            titleLabel.text = "第14課"
            titleShadowLabel.text = "第14課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L14aarray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 13 && CHAPTER == 1 {
            titleLabel.text = "第14課"
            titleShadowLabel.text = "第14課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L14barray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 13 && CHAPTER == 2 {
            titleLabel.text = "第14課"
            titleShadowLabel.text = "第14課"
            chapterLabel.text = "21〜32"
            totalLabel.text = "total 12 words"
            shuffledQuestions = shuffleArray(minnichi1L14carray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 14 && CHAPTER == 0 {
            titleLabel.text = "第15課"
            titleShadowLabel.text = "第15課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L15aarray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 14 && CHAPTER == 1 {
            titleLabel.text = "第15課"
            titleShadowLabel.text = "第15課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L15barray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 14 && CHAPTER == 2 {
            titleLabel.text = "第15課"
            titleShadowLabel.text = "第15課"
            chapterLabel.text = "21〜24"
            totalLabel.text = "total 4 words"
            shuffledQuestions = shuffleArray(minnichi1L15carray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 15 && CHAPTER == 0 {
            titleLabel.text = "第16課"
            titleShadowLabel.text = "第16課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L16aarray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 15 && CHAPTER == 1 {
            titleLabel.text = "第16課"
            titleShadowLabel.text = "第16課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L16barray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 15 && CHAPTER == 2 {
            titleLabel.text = "第16課"
            titleShadowLabel.text = "第16課"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L16carray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 15 && CHAPTER == 3 {
            titleLabel.text = "第16課"
            titleShadowLabel.text = "第16課"
            chapterLabel.text = "31〜40"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L16darray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 15 && CHAPTER == 4 {
            titleLabel.text = "第16課"
            titleShadowLabel.text = "第16課"
            chapterLabel.text = "41〜48"
            totalLabel.text = "total 8 words"
            shuffledQuestions = shuffleArray(minnichi1L16earray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 16 && CHAPTER == 0 {
            titleLabel.text = "第17課"
            titleShadowLabel.text = "第17課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L17aarray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 16 && CHAPTER == 1 {
            titleLabel.text = "第17課"
            titleShadowLabel.text = "第17課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L17barray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 16 && CHAPTER == 2 {
            titleLabel.text = "第17課"
            titleShadowLabel.text = "第17課"
            chapterLabel.text = "21〜30"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L17carray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 16 && CHAPTER == 3 {
            titleLabel.text = "第17課"
            titleShadowLabel.text = "第17課"
            chapterLabel.text = "31〜36"
            totalLabel.text = "total 6 words"
            shuffledQuestions = shuffleArray(minnichi1L17darray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 17 && CHAPTER == 0 {
            titleLabel.text = "第18課"
            titleShadowLabel.text = "第18課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L18aarray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 17 && CHAPTER == 1 {
            titleLabel.text = "第18課"
            titleShadowLabel.text = "第18課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L18barray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 17 && CHAPTER == 2 {
            titleLabel.text = "第18課"
            titleShadowLabel.text = "第18課"
            chapterLabel.text = "21〜26"
            totalLabel.text = "total 6 words"
            shuffledQuestions = shuffleArray(minnichi1L18carray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 18 && CHAPTER == 0 {
            titleLabel.text = "第19課"
            titleShadowLabel.text = "第19課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L19aarray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 18 && CHAPTER == 1 {
            titleLabel.text = "第19課"
            titleShadowLabel.text = "第19課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L19barray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 18 && CHAPTER == 2 {
            titleLabel.text = "第19課"
            titleShadowLabel.text = "第19課"
            chapterLabel.text = "21〜29"
            totalLabel.text = "total 9 words"
            shuffledQuestions = shuffleArray(minnichi1L19carray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 19 && CHAPTER == 0 {
            titleLabel.text = "第20課"
            titleShadowLabel.text = "第20課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L20aarray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 19 && CHAPTER == 1 {
            titleLabel.text = "第20課"
            titleShadowLabel.text = "第20課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L20barray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 19 && CHAPTER == 2 {
            titleLabel.text = "第20課"
            titleShadowLabel.text = "第20課"
            chapterLabel.text = "21〜26"
            totalLabel.text = "total 6 words"
            shuffledQuestions = shuffleArray(minnichi1L20carray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 20 && CHAPTER == 0 {
            titleLabel.text = "第21課"
            titleShadowLabel.text = "第21課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L21aarray)
            
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 20 && CHAPTER == 1 {
            titleLabel.text = "第21課"
            titleShadowLabel.text = "第21課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L21barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 20 && CHAPTER == 2 {
            titleLabel.text = "第21課"
            titleShadowLabel.text = "第21課"
            chapterLabel.text = "21〜32"
            totalLabel.text = "total 12 words"
            shuffledQuestions = shuffleArray(minnichi1L21carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 21 && CHAPTER == 0 {
            titleLabel.text = "第22課"
            titleShadowLabel.text = "第22課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L22aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 21 && CHAPTER == 1 {
            titleLabel.text = "第22課"
            titleShadowLabel.text = "第22課"
            chapterLabel.text = "11〜16"
            totalLabel.text = "total 6 words"
            shuffledQuestions = shuffleArray(minnichi1L22barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 22 && CHAPTER == 0 {
            titleLabel.text = "第23課"
            titleShadowLabel.text = "第23課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L23aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 22 && CHAPTER == 1 {
            titleLabel.text = "第23課"
            titleShadowLabel.text = "第23課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L23barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 22 && CHAPTER == 2 {
            titleLabel.text = "第23課"
            titleShadowLabel.text = "第23課"
            chapterLabel.text = "21〜29"
            totalLabel.text = "total 9 words"
            shuffledQuestions = shuffleArray(minnichi1L23carray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 23 && CHAPTER == 0 {
            titleLabel.text = "第24課"
            titleShadowLabel.text = "第24課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L24aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 23 && CHAPTER == 1 {
            titleLabel.text = "第24課"
            titleShadowLabel.text = "第24課"
            chapterLabel.text = "11〜20"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L24barray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 24 && CHAPTER == 0 {
            titleLabel.text = "第25課"
            titleShadowLabel.text = "第25課"
            chapterLabel.text = "1〜10"
            totalLabel.text = "total 10 words"
            shuffledQuestions = shuffleArray(minnichi1L25aarray)
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if MINNICHI1 == 24 && CHAPTER == 1 {
            titleLabel.text = "第25課"
            titleShadowLabel.text = "第25課"
            chapterLabel.text = "11〜14"
            totalLabel.text = "total 4 words"
            shuffledQuestions = shuffleArray(minnichi1L25barray)
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
        
        if MINNICHI1 == 0 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L1aarray
        } else if MINNICHI1 == 0 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L1barray
        } else if MINNICHI1 == 0 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L1carray
        } else if MINNICHI1 == 0 && CHAPTER == 3 {
            currentQuestionArray = minnichi1L1darray
        } else if MINNICHI1 == 1 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L2aarray
        } else if MINNICHI1 == 1 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L2barray
        } else if MINNICHI1 == 1 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L2carray
        } else if MINNICHI1 == 1 && CHAPTER == 3 {
            currentQuestionArray = minnichi1L2darray
        } else if MINNICHI1 == 1 && CHAPTER == 4 {
            currentQuestionArray = minnichi1L2earray
        } else if MINNICHI1 == 2 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L3aarray
        } else if MINNICHI1 == 2 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L3barray
        } else if MINNICHI1 == 2 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L3carray
        } else if MINNICHI1 == 2 && CHAPTER == 3 {
            currentQuestionArray = minnichi1L3darray
        } else if MINNICHI1 == 2 && CHAPTER == 4 {
            currentQuestionArray = minnichi1L3earray
        } else if MINNICHI1 == 3 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L4aarray
        } else if MINNICHI1 == 3 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L4barray
        } else if MINNICHI1 == 3 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L4carray
        } else if MINNICHI1 == 3 && CHAPTER == 3 {
            currentQuestionArray = minnichi1L4darray
        } else if MINNICHI1 == 3 && CHAPTER == 4 {
            currentQuestionArray = minnichi1L4earray
        } else if MINNICHI1 == 4 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L5aarray
        } else if MINNICHI1 == 4 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L5barray
        } else if MINNICHI1 == 4 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L5carray
        } else if MINNICHI1 == 4 && CHAPTER == 3 {
            currentQuestionArray = minnichi1L5darray
        } else if MINNICHI1 == 5 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L6aarray
        } else if MINNICHI1 == 5 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L6barray
        } else if MINNICHI1 == 5 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L6carray
        } else if MINNICHI1 == 5 && CHAPTER == 3 {
            currentQuestionArray = minnichi1L6darray
        } else if MINNICHI1 == 5 && CHAPTER == 4 {
            currentQuestionArray = minnichi1L6earray
        } else if MINNICHI1 == 5 && CHAPTER == 5 {
            currentQuestionArray = minnichi1L6farray
        } else if MINNICHI1 == 6 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L7aarray
        } else if MINNICHI1 == 6 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L7barray
        } else if MINNICHI1 == 6 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L7carray
        } else if MINNICHI1 == 6 && CHAPTER == 3 {
            currentQuestionArray = minnichi1L7darray
        } else if MINNICHI1 == 6 && CHAPTER == 4 {
            currentQuestionArray = minnichi1L7earray
        } else if MINNICHI1 == 7 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L8aarray
        } else if MINNICHI1 == 7 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L8barray
        } else if MINNICHI1 == 7 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L8carray
        } else if MINNICHI1 == 7 && CHAPTER == 3 {
            currentQuestionArray = minnichi1L8darray
        } else if MINNICHI1 == 7 && CHAPTER == 4 {
            currentQuestionArray = minnichi1L8earray
        } else if MINNICHI1 == 7 && CHAPTER == 5 {
            currentQuestionArray = minnichi1L8farray
        } else if MINNICHI1 == 8 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L9aarray
        } else if MINNICHI1 == 8 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L9barray
        } else if MINNICHI1 == 8 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L9carray
        } else if MINNICHI1 == 8 && CHAPTER == 3 {
            currentQuestionArray = minnichi1L9darray
        } else if MINNICHI1 == 8 && CHAPTER == 4 {
            currentQuestionArray = minnichi1L9earray
        } else if MINNICHI1 == 9 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L10aarray
        } else if MINNICHI1 == 9 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L10barray
        } else if MINNICHI1 == 9 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L10carray
        } else if MINNICHI1 == 9 && CHAPTER == 3 {
            currentQuestionArray = minnichi1L10darray
        } else if MINNICHI1 == 9 && CHAPTER == 4 {
            currentQuestionArray = minnichi1L10earray
        } else if MINNICHI1 == 10 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L11aarray
        } else if MINNICHI1 == 10 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L11barray
        } else if MINNICHI1 == 10 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L11carray
        } else if MINNICHI1 == 10 && CHAPTER == 3 {
            currentQuestionArray = minnichi1L11darray
        } else if MINNICHI1 == 10 && CHAPTER == 4 {
            currentQuestionArray = minnichi1L11earray
        } else if MINNICHI1 == 11 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L12aarray
        } else if MINNICHI1 == 11 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L12barray
        } else if MINNICHI1 == 11 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L12carray
        } else if MINNICHI1 == 11 && CHAPTER == 3 {
            currentQuestionArray = minnichi1L12darray
        } else if MINNICHI1 == 11 && CHAPTER == 4 {
            currentQuestionArray = minnichi1L12earray
        } else if MINNICHI1 == 12 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L13aarray
        } else if MINNICHI1 == 12 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L13barray
        } else if MINNICHI1 == 12 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L13carray
        } else if MINNICHI1 == 12 && CHAPTER == 3 {
            currentQuestionArray = minnichi1L13darray
        } else if MINNICHI1 == 13 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L14aarray
        } else if MINNICHI1 == 13 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L14barray
        } else if MINNICHI1 == 13 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L14carray
        } else if MINNICHI1 == 14 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L15aarray
        } else if MINNICHI1 == 14 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L15barray
        } else if MINNICHI1 == 14 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L15carray
        } else if MINNICHI1 == 15 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L16aarray
        } else if MINNICHI1 == 15 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L16barray
        } else if MINNICHI1 == 15 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L16carray
        } else if MINNICHI1 == 15 && CHAPTER == 3 {
            currentQuestionArray = minnichi1L16darray
        } else if MINNICHI1 == 15 && CHAPTER == 4 {
            currentQuestionArray = minnichi1L16earray
        } else if MINNICHI1 == 16 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L17aarray
        } else if MINNICHI1 == 16 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L17barray
        } else if MINNICHI1 == 16 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L17carray
        } else if MINNICHI1 == 16 && CHAPTER == 3 {
            currentQuestionArray = minnichi1L17darray
        } else if MINNICHI1 == 17 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L18aarray
        } else if MINNICHI1 == 17 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L18barray
        } else if MINNICHI1 == 17 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L18carray
        } else if MINNICHI1 == 18 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L19aarray
        } else if MINNICHI1 == 18 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L19barray
        } else if MINNICHI1 == 18 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L19carray
        } else if MINNICHI1 == 19 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L20aarray
        } else if MINNICHI1 == 19 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L20barray
        } else if MINNICHI1 == 19 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L20carray
        } else if MINNICHI1 == 20 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L21aarray
        } else if MINNICHI1 == 20 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L21barray
        } else if MINNICHI1 == 20 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L21carray
        } else if MINNICHI1 == 21 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L22aarray
        } else if MINNICHI1 == 21 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L22barray
        } else if MINNICHI1 == 22 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L23aarray
        } else if MINNICHI1 == 22 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L23barray
        } else if MINNICHI1 == 22 && CHAPTER == 2 {
            currentQuestionArray = minnichi1L23carray
        } else if MINNICHI1 == 23 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L24aarray
        } else if MINNICHI1 == 23 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L24barray
        } else if MINNICHI1 == 24 && CHAPTER == 0 {
            currentQuestionArray = minnichi1L25aarray
        } else if MINNICHI1 == 24 && CHAPTER == 1 {
            currentQuestionArray = minnichi1L25barray
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
