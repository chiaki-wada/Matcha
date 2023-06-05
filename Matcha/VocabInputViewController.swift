//
//  VocabInputViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/05/28.
//

import UIKit

class VocabInputViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleShadowLabel: UILabel!
    @IBOutlet var chapterLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    
    @IBOutlet var cardButton: UIButton!
    
    @IBOutlet var hiraganaLabel: UILabel!
    @IBOutlet var kanjiLabel: UILabel!
    @IBOutlet var meaningLabel: UILabel!
    
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var backButton: UIButton!
    
    var currentArray: [[String: String]] = []
    var index = 0
    
    var CHAPTER = saveData.object(forKey:"CHAPTER")
    var LEVEL = saveData.object(forKey:"LEVEL")
    
    var n1ch1array = [
        ["hiragana":"ぶんしょ","kanji":"文書","meaning":"document, writing, paperwork"],
        ["hiragana":"だげき","kanji":"打撃","meaning":"blow, shock, strike"],
        ["hiragana":"ほうしゅう","kanji":"報酬","meaning":"emuneration, recompense, reward"],
        ["hiragana":"いみん","kanji":"移民","meaning":"emigration, immigration"],
        ["hiragana":"いぜん","kanji":"依然","meaning":"still; as yet; as it has been"],
        ["hiragana":"じぞく","kanji":"持続","meaning":"continuation; persisting; lasting; sustaining; enduring"],
        ["hiragana":"かたむける","kanji":"傾ける","meaning":"to incline, to lean, to tilt"],
        ["hiragana":"こうい","kanji":"厚意","meaning":"good will, favor, courtesy"],
        ["hiragana":"こうにゅう","kanji":"購入","meaning":"purchase, buy"],
        ["hiragana":"めいりょう","kanji":"明瞭","meaning":"clear; plain; distinct; obvious; evident; articulate"],
        ["hiragana":"りろん","kanji":"理論","meaning":"theory"],
        ["hiragana":"せつりつ","kanji":"設立","meaning":"establishment, founding"],
        ["hiragana":"しや","kanji":"視野","meaning":"field of vision; view; one’s outlook"],
        ["hiragana":"しょうすう","kanji":"少数","meaning":"minority; few"],
        ["hiragana":"つのる","kanji":"募る","meaning":"to grow violent, to become stronger"],
        ["hiragana":"よち","kanji":"余地","meaning":"place, room, margin"],
        ["hiragana":"ざいせい","kanji":"財政","meaning":"public finance, financial affairs"],
        ["hiragana":"あつりょく","kanji":"圧力","meaning":"pressure, stress"],
        ["hiragana":"ちょうせん","kanji":"挑戦","meaning":"challenge, defiance, dare"],
        ["hiragana":"ふとう","kanji":"不当","meaning":"injustice, impropriety, unfair"]
        
    ]
    var n1ch2array = [
        ["hiragana":"ぐんじ","kanji":"軍事","meaning":"military affairs"],
        ["hiragana":"かだい","kanji":"課題","meaning":"subject; theme; issue; matter; homework; assignment; task; challenge; problem; question"],
        ["hiragana":"きこう","kanji":"機構","meaning":"mechanism, organization"],
        ["hiragana":"きそう","kanji":"競う","meaning":"to compete; to contend; to vie; to contest"],
        ["hiragana":"きょうれつ","kanji":"強烈","meaning":"strong, intense, severe"],
        ["hiragana":"りせい","kanji":"理性","meaning":"reason, reasoning power"],
        ["hiragana":"りょういき","kanji":"領域","meaning":"area; domain; territory; field; range; region; regime"],
        ["hiragana":"せんとう","kanji":"戦闘","meaning":"battle, fight, combat"],
        ["hiragana":"しじ","kanji":"指示","meaning":"instructions, directions, indication"],
        ["hiragana":"しかく","kanji":"資格","meaning":"qualifications; requirements; capabilities"],
        ["hiragana":"しこう","kanji":"思考","meaning":"thought; consideration; thinking"],
        ["hiragana":"しょうめい","kanji":"照明","meaning":"illumination; lighting"],
        ["hiragana":"しょうれい","kanji":"奨励","meaning":"encouragement, promotion"],
        ["hiragana":"しょうり","kanji":"勝利","meaning":"victory, triumph, win"],
        ["hiragana":"とぼしい","kanji":"乏しい","meaning":"meager; scarce; limited; destitute; lacking; scanty"],
        ["hiragana":"ぞうきょう","kanji":"増強","meaning":"augment, reinforce, increase"],
        ["hiragana":"あやまち","kanji":"過ち","meaning":"fault, error, indiscretion"],
        ["hiragana":"どくさい","kanji":"独裁","meaning":"dictatorship, despotism"],
        ["hiragana":"じかく","kanji":"自覚","meaning":"self-consciousness; self-awareness"],
        ["hiragana":"じぜん","kanji":"事前","meaning":"prior; beforehand; in advance; before the fact; ex ante"]
    ]
    
    var n1ch3array = [
        ["hiragana":"かんし","kanji":"監視","meaning":"monitoring, watching, observation"],
        ["hiragana":"しきん","kanji":"資金","meaning":"funds, capital"],
        ["hiragana":"しょゆう","kanji":"所有","meaning":"one’s possessions; ownership"],
        ["hiragana":"そまる","kanji":"染まる","meaning":"to be dyed; to be tainted; to be infected; to be stained; to be steeped"],
        ["hiragana":"そくざに","kanji":"即座に","meaning":"immediately; right away; on the spot"],
        ["hiragana":"たいしゅう","kanji":"大衆","meaning":"general public, the masses"],
        ["hiragana":"うごき","kanji":"動き","meaning":"movement; move; motion; trend; development; change; fluctuation"],
        ["hiragana":"ゆうし","kanji":"融資","meaning":"financing, loan"],
        ["hiragana":"ぜつぼう","kanji":"絶望","meaning":"despair, hopelessness"],
        ["hiragana":"びんぼう","kanji":"貧乏","meaning":"poverty, destitute, poor"],
        ["hiragana":"ぼうえい","kanji":"防衛","meaning":"defense, protection"],
        ["hiragana":"どういん","kanji":"動員","meaning":"mobilization"],
        ["hiragana":"はいご","kanji":"背後","meaning":"back, rear, background"],
        ["hiragana":"はんのう","kanji":"反応","meaning":"reaction, response"],
        ["hiragana":"ひきいる","kanji":"率いる","meaning":"to lead, to command"],
        ["hiragana":"ほんしつ","kanji":"本質","meaning":"essence, true nature"],
        ["hiragana":"いじゅう","kanji":"移住","meaning":"migration, immigration"],
        ["hiragana":"いよく","kanji":"意欲","meaning":"will; desire; ambition; urge"],
        ["hiragana":"かんじん","kanji":"肝心","meaning":"essential, fundamental, crucial"],
        ["hiragana":"きせい","kanji":"規制","meaning":"regulation, control, restriction"]
    ]
    
    var n1ch4array = [
        ["hiragana":"ねつい","kanji":"熱意","meaning":"zeal, enthusiasm"],
        ["hiragana":"しんてん","kanji":"進展","meaning":"progress, development"],
        ["hiragana":"たかまる","kanji":"高まる","meaning":"to rise; to swell; to be promoted"],
        ["hiragana":"てきおう","kanji":"適応","meaning":"adaptation, accommodation"],
        ["hiragana":"わな","kanji":"罠","meaning":"snare, trap"],
        ["hiragana":"よくぼう","kanji":"欲望","meaning":"desire, appetite, lust"],
        ["hiragana":"あかじ","kanji":"赤字","meaning":"deficit"],
        ["hiragana":"ちゃくしゅ","kanji":"着手","meaning":"to start work"],
        ["hiragana":"がいねん","kanji":"概念","meaning":"general idea, concept"],
        ["hiragana":"ぎょうせき","kanji":"業績","meaning":"achievement, performance, results"],
        ["hiragana":"はかい","kanji":"破壊","meaning":"destruction, disruption"],
        ["hiragana":"はんらん","kanji":"反乱","meaning":"insurrection, rebellion"],
        ["hiragana":"へいき","kanji":"兵器","meaning":"arms, weapons, ordnance"],
        ["hiragana":"ひんこん","kanji":"貧困","meaning":"poor, needy"],
        ["hiragana":"かためる","kanji":"固める","meaning":"to harden, to solidify"],
        ["hiragana":"こうふん","kanji":"興奮","meaning":"excitement, stimulation, agitation"],
        ["hiragana":"おおはば","kanji":"大幅","meaning":"big; large; drastic; substantial"],
        ["hiragana":"らっかん","kanji":"楽観","meaning":"optimism; taking an optimistic view"],
        ["hiragana":"りょうしん","kanji":"良心","meaning":"conscience"],
        ["hiragana":"せいふく","kanji":"制服","meaning":"uniform"]
    ]
    
    var n1ch5array = [
        ["hiragana":"せいか","kanji":"成果","meaning":"fruits"],
        ["hiragana":"せんよう","kanji":"専用","meaning":"exclusive use; personal use; dedicated"],
        ["hiragana":"しょぶん","kanji":"処分","meaning":"disposal, dealing"],
        ["hiragana":"すいしん","kanji":"推進","meaning":"propulsion, drive, promotion"],
        ["hiragana":"ておくれ","kanji":"手遅れ","meaning":"being too late"],
        ["hiragana":"とびら","kanji":"扉","meaning":"door, gate, opening"],
        ["hiragana":"とっけん","kanji":"特権","meaning":"privilege, special right"],
        ["hiragana":"ゆうせん","kanji":"優先","meaning":"preference; priority; precedence"],
        ["hiragana":"ちょうたつ","kanji":"調達","meaning":"supply, provision"],
        ["hiragana":"ふんそう","kanji":"紛争","meaning":"dispute, trouble, strife"],
        ["hiragana":"げんそう","kanji":"幻想","meaning":"fantasy; illusion; vision; dream"],
        ["hiragana":"ぎせい","kanji":"犠牲","meaning":"victim, sacrifice, scapegoat"],
        ["hiragana":"ほどこす","kanji":"施す","meaning":"to give, to do, to conduct"],
        ["hiragana":"ほご","kanji":"保護","meaning":"care, protection, shelter"],
        ["hiragana":"じょうりく","kanji":"上陸","meaning":"landing; disembarkation; landfall"],
        ["hiragana":"かいかく","kanji":"改革","meaning":"reform, reformation"],
        ["hiragana":"めいはく","kanji":"明白","meaning":"obvious, clear, plain"],
        ["hiragana":"にんしき","kanji":"認識","meaning":"recognition; awareness; perception"],
        ["hiragana":"おぼえ","kanji":"覚え","meaning":"memory, sense, experience"],
        ["hiragana":"たくらむ","kanji":"企む","meaning":"to scheme, to plan, to conspire"]
    ]
    
    var n1ch6array = [
        ["hiragana":"うすれる","kanji":"薄れる","meaning":"to fade; to become dim"],
        ["hiragana":"ちつじょ","kanji":"秩序","meaning":"order, regularity"],
        ["hiragana":"だんけつ","kanji":"団結","meaning":"unity; union; solidarity; combination; teaming up"],
        ["hiragana":"ほうさく","kanji":"方策","meaning":"plan, policy"],
        ["hiragana":"じょうほ","kanji":"譲歩","meaning":"concession, conciliation"],
        ["hiragana":"きぼ","kanji":"規模","meaning":"scale; scope; plan; structure"],
        ["hiragana":"きき","kanji":"危機","meaning":"crisis, danger, risk"],
        ["hiragana":"こうい","kanji":"行為","meaning":"act, deed, conduct"],
        ["hiragana":"きょくたん","kanji":"極端","meaning":"extreme; extremity"],
        ["hiragana":"きょうかん","kanji":"共感","meaning":"sympathy, empathy, response"],
        ["hiragana":"きゅうさい","kanji":"救済","meaning":"relief, aid, rescue"],
        ["hiragana":"もたらす","kanji":"齎す","meaning":"to bring, to take, to bring about"],
        ["hiragana":"せだい","kanji":"世代","meaning":"generation, the world, the age"],
        ["hiragana":"せんきょ","kanji":"選挙","meaning":"election"],
        ["hiragana":"せんりょう","kanji":"占領","meaning":"occupying, possession, capture"],
        ["hiragana":"しんりゃく","kanji":"侵略","meaning":"aggression, invasion"],
        ["hiragana":"しょとく","kanji":"所得","meaning":"income, earnings"],
        ["hiragana":"しょうしん","kanji":"昇進","meaning":"promotion, advancement"],
        ["hiragana":"しゅどう","kanji":"主導","meaning":"leadership, initiative, spearhead"],
        ["hiragana":"たいしょ","kanji":"対処","meaning":"dealing with; coping with"]
    ]
    
    var n1ch7array = [
        ["hiragana":"とむ","kanji":"富む","meaning":"to be rich in, to abound in"],
        ["hiragana":"ついきゅう","kanji":"追求","meaning":"pursuit"],
        ["hiragana":"やみ","kanji":"闇","meaning":"darkness, the dark"],
        ["hiragana":"やしなう","kanji":"養う","meaning":"to support; to provide for; to bring up, to raise; to feed"],
        ["hiragana":"べんめい","kanji":"弁明","meaning":"explanation, excuse"],
        ["hiragana":"ぶそう","kanji":"武装","meaning":"arms, armament"],
        ["hiragana":"だきょう","kanji":"妥協","meaning":"compromise, giving in"],
        ["hiragana":"ふさわしい","kanji":"相応しい","meaning":"appropriate, adequate"],
        ["hiragana":"げんしょう","kanji":"減少","meaning":"decrease, reduction, decline"],
        ["hiragana":"いたむ","kanji":"痛む","meaning":"to hurt, to ache, to feel a pain"],
        ["hiragana":"じんそく","kanji":"迅速","meaning":"quick, fast, rapid, swift"],
        ["hiragana":"けいひ","kanji":"経費","meaning":"expenses; cost; outlay"],
        ["hiragana":"けいせい","kanji":"形成","meaning":"formation, molding, taking form"],
        ["hiragana":"さいぜん","kanji":"最善","meaning":"the very best, utmost"],
        ["hiragana":"せっしょく","kanji":"接触","meaning":"touch, contact"],
        ["hiragana":"そうび","kanji":"装備","meaning":"equipment"],
        ["hiragana":"そうぞう","kanji":"創造","meaning":"creation"],
        ["hiragana":"たいおう","kanji":"対応","meaning":"correspondence"],
        ["hiragana":"ていきょう","kanji":"提供","meaning":"offer; tender; providing; supplying; making available; donating"],
        ["hiragana":"とっぱ","kanji":"突破","meaning":"breaking through, penetration"]
    ]
    
    var n1ch8array = [
        ["hiragana":"とうろん","kanji":"討論","meaning":"debate; discussion"],
        ["hiragana":"うんめい","kanji":"運命","meaning":"fate, destiny"],
        ["hiragana":"ざんこく","kanji":"残酷","meaning":"cruelty, harshness"],
        ["hiragana":"ちゅうだん","kanji":"中断","meaning":"interruption; suspension; break"],
        ["hiragana":"はいし","kanji":"廃止","meaning":"abolition; repeal"],
        ["hiragana":"はたす","kanji":"果たす","meaning":"to accomplish; to achieve; to carry out; to fulfill; to fulfil"],
        ["hiragana":"はつげん","kanji":"発言","meaning":"statement; remark; observation; utterance; speech"],
        ["hiragana":"ひろう","kanji":"疲労","meaning":"fatigue, weariness"],
        ["hiragana":"いためる","kanji":"痛める","meaning":"to hurt; to injure; to cause pain; to harm; to damage"],
        ["hiragana":"いと","kanji":"意図","meaning":"ntention; aim; design"],
        ["hiragana":"じゅうぎょういん","kanji":"従業員","meaning":"employee, worker"],
        ["hiragana":"けいか","kanji":"経過","meaning":"passage, expiration, progress"],
        ["hiragana":"きせき","kanji":"奇跡","meaning":"miracle, wonder, marvel"],
        ["hiragana":"きゅうきょく","kanji":"究極","meaning":"ultimate, extreme, final"],
        ["hiragana":"もさく","kanji":"模索","meaning":"groping"],
        ["hiragana":"し","kanji":"死","meaning":"death, decease"],
        ["hiragana":"しくみ","kanji":"仕組み","meaning":"structure; construction; arrangement; contrivance; mechanism; workings; plan; plot"],
        ["hiragana":"そなわる","kanji":"備わる","meaning":"to be furnished with, to be equipped with"],
        ["hiragana":"たいしょく","kanji":"退職","meaning":"retirement; resignation"],
        ["hiragana":"ゆうかん","kanji":"勇敢","meaning":"brave, heroic, gallant"]
    ]
    
    var n2ch1array = [
        ["hiragana":"しょうすう","kanji":"少数","meaning":"minority; few"],
        ["hiragana":"あんか","kanji":"安価","meaning":"ow-priced; cheap; inexpensive"],
        ["hiragana":"あらそう","kanji":"争う","meaning":"to compete; to contest; to contend"],
        ["hiragana":"あっというま","kanji":"あっという間","meaning":"a blink of time"],
        ["hiragana":"ちょくりつ","kanji":"直立","meaning":"standing upright; standing straight"],
        ["hiragana":"ちょうほうけい","kanji":"長方形","meaning":"rectangle; oblong"],
        ["hiragana":"ちゅうせん","kanji":"抽選","meaning":"lottery; raffle; drawing"],
        ["hiragana":"どうき","kanji":"動機","meaning":"motive; incentive"],
        ["hiragana":"どうさ","kanji":"動作","meaning":"action; movements; motions; bearing; behaviour"],
        ["hiragana":"がいかん","kanji":"外観","meaning":"outward appearance; exterior appearance"],
        ["hiragana":"がくひ","kanji":"学費","meaning":"tuition; school expenses"],
        ["hiragana":"がくねん","kanji":"学年","meaning":"academic year; school year"],
        ["hiragana":"がんじょう","kanji":"頑丈","meaning":"solid; firm; stout; burly; strong; sturdy"],
        ["hiragana":"はく","kanji":"泊","meaning":"counter for nights of a stay"],
        ["hiragana":"はんかん","kanji":"反感","meaning":"antipathy; antagonism; animosity; revulsion; ill feeling"],
        ["hiragana":"はっそう","kanji":"発送","meaning":"sending; forwarding; shipping"],
        ["hiragana":"はたらきて","kanji":"働き手","meaning":"worker; breadwinner; supporter"],
        ["hiragana":"はつげん","kanji":"発言","meaning":"statement; remark; observation; utterance; speech"],
        ["hiragana":"へんきん","kanji":"返金","meaning":"repayment"],
        ["hiragana":"ひあたり","kanji":"日当たり","meaning":"exposure to the sun; sunny place"]
    ]
    
    var n2ch2array = [
        ["hiragana":"いっぽうてき","kanji":"一方的","meaning":"one-sided; unilateral; arbitrary"],
        ["hiragana":"じれい","kanji":"事例","meaning":"example; precedent; case"],
        ["hiragana":"じゅみょう","kanji":"寿命","meaning":"life span"],
        ["hiragana":"じゅうじつ","kanji":"充実","meaning":"fullness; completion; perfection; enhancement; enrichment"],
        ["hiragana":"かがやき","kanji":"輝き","meaning":"brightness; brilliance; brilliancy; radiance; glitter"],
        ["hiragana":"かいさい","kanji":"開催","meaning":"holding"],
        ["hiragana":"かくじ","kanji":"各自","meaning":"each"],
        ["hiragana":"かくやす","kanji":"格安","meaning":"cheap; reasonable"],
        ["hiragana":"かつじ","kanji":"活字","meaning":"printing type; movable type; printed text; print"],
        ["hiragana":"かつやく","kanji":"活躍","meaning":"activity"],
        ["hiragana":"きをおとす","kanji":"気を落とす","meaning":"to be discouraged; to be disheartened"],
        ["hiragana":"きんちょうかん","kanji":"緊張感","meaning":"feeling of tension; air of tension; tension; nervousness"],
        ["hiragana":"こんき","kanji":"根気","meaning":"patience; perseverance; persistence; tenacity; energy"],
        ["hiragana":"こうひんしつ","kanji":"高品質","meaning":"high quality"],
        ["hiragana":"こうじょう","kanji":"向上","meaning":"elevation; rise; improvement; advancement; progress"],
        ["hiragana":"こうり","kanji":"小売","meaning":"retail"],
        ["hiragana":"こうざ","kanji":"講座","meaning":"course"],
        ["hiragana":"くりかえし","kanji":"繰り返し","meaning":"repetition; repeat; reiteration; iteration; refrain"],
        ["hiragana":"きゅうびょう","kanji":"急病","meaning":"sudden illness"],
        ["hiragana":"もちだす","kanji":"持ち出す","meaning":"to take out; to carry out; to bring out from where it belongs; to mention something; to broach a topic"]
    ]
    
    var n2ch3array = [
        ["hiragana":"もくせい","kanji":"木製","meaning":"wooden; made of wood"],
        ["hiragana":"もくてきち","kanji":"目的地","meaning":"place of destination"],
        ["hiragana":"のうりつ","kanji":"能率","meaning":"efficiency"],
        ["hiragana":"おぼえがき","kanji":"覚え書き","meaning":"memo; memorandum; note"],
        ["hiragana":"おぎなう","kanji":"補う","meaning":"to compensate for; to supplement"],
        ["hiragana":"おくれ","kanji":"遅れ","meaning":"delay; lag; postponement; falling behind"],
        ["hiragana":"おおて","kanji":"大手","meaning":"major company; big company"],
        ["hiragana":"りょうかい","kanji":"了解","meaning":"comprehension; consent; understanding; agreement"],
        ["hiragana":"せつぞく","kanji":"接続","meaning":"connection; attachment; union; join; joint; link"],
        ["hiragana":"しゃそう","kanji":"車窓","meaning":"train window; car window"],
        ["hiragana":"しぼう","kanji":"志望","meaning":"    wish; desire; ambition"],
        ["hiragana":"してき","kanji":"指摘","meaning":"pointing out; identification"],
        ["hiragana":"しゅりょく","kanji":"主力","meaning":"main force; chief object; mainline"],
        ["hiragana":"そうしん","kanji":"送信","meaning":"transmission; sending"],
        ["hiragana":"たい","kanji":"対","meaning":"opposite; opposition; versus; vs.; v."],
        ["hiragana":"たいさく","kanji":"対策","meaning":"measure; provision; step; countermeasure; counterplan"],
        ["hiragana":"たんしゅく","kanji":"短縮","meaning":"shortening; contraction; reduction; curtailment; abbreviation"],
        ["hiragana":"ていいん","kanji":"定員","meaning":"fixed number"],
        ["hiragana":"ていれ","kanji":"手入れ","meaning":"care; looking after; repair; maintenance"],
        ["hiragana":"ていし","kanji":"停止","meaning":"stoppage; coming to a stop; halt; standstill; ceasing"]
    ]
    
    var n2ch4array = [
        ["hiragana":"てもと","kanji":"手元","meaning":"at hand; on hand; nearby; close at hand"],
        ["hiragana":"てんきん","kanji":"転勤","meaning":"job transfer; job relocation; intra-company transfer"],
        ["hiragana":"とりつく","kanji":"取り付く","meaning":"to cling to; to hold on to; to hold fast to; to set about doing; to begin"],
        ["hiragana":"とりあげる","kanji":"取り上げる","meaning":"to pick up; to adopt"],
        ["hiragana":"とざんか","kanji":"登山家","meaning":"mountain climber; mountaineer"],
        ["hiragana":"つけくわえる","kanji":"付け加える","meaning":"to add"],
        ["hiragana":"つみかさなる","kanji":"積み重なる","meaning":"to pile up; to stack up; to accumulate"],
        ["hiragana":"わかわかしい","kanji":"若々しい","meaning":"youthful; young; young-looking"],
        ["hiragana":"やくそくごと","kanji":"約束事","meaning":"promise; vow; engagement; convention; rule; resolution"],
        ["hiragana":"よろおそく","kanji":"夜遅く","meaning":"late at night; at a late hour"],
        ["hiragana":"ゆうりょく","kanji":"有力","meaning":"influential; prominent; strong; likely; plausible; potent"],
        ["hiragana":"ざつだん","kanji":"雑談","meaning":"chatting; idle talk"],
        ["hiragana":"ぜんはん","kanji":"前半","meaning":"first half"],
        ["hiragana":"ぞくしゅつ","kanji":"続出","meaning":"appearing one after another; cropping up one after another"],
        ["hiragana":"ぞうげん","kanji":"増減","meaning":"increase and decrease; fluctuation"],
        ["hiragana":"あまやかす","kanji":"甘やかす","meaning":"to pamper; to spoil"],
        ["hiragana":"あともどり","kanji":"後戻り","meaning":"going backward; turning back; backtracking; doubling back; retrogression"],
        ["hiragana":"ちかづく","kanji":"近づく","meaning":"to approach; to draw near; to get close; to get acquainted with"],
        ["hiragana":"ちゅうじつ","kanji":"忠実","meaning":"faithful; devoted; loyal; honest; true"],
        ["hiragana":"ふかまる","kanji":"深まる","meaning":"to deepen; to heighten; to intensify"]
    ]
    
    var n2ch5array = [
        ["hiragana":"げんさく","kanji":"原作","meaning":"original work"],
        ["hiragana":"げんさん","kanji":"原産","meaning":"place of origin; habitat"],
        ["hiragana":"はかまいり","kanji":"墓参り","meaning":"visit to a grave"],
        ["hiragana":"はじ","kanji":"恥","meaning":"shame; embarrassment; disgrace"],
        ["hiragana":"はりがみ","kanji":"張り紙","meaning":"paper patch; paper backing; poster; sticker; label"],
        ["hiragana":"ひろげる","kanji":"広げる","meaning":"to spread; to extend; to expand; to enlarge; to widen; to broaden"],
        ["hiragana":"じっち","kanji":"実地","meaning":"practice"],
        ["hiragana":"じかく","kanji":"自覚","meaning":"self-consciousness; self-awareness"],
        ["hiragana":"じもと","kanji":"地元","meaning":"home area; home town; local"],
        ["hiragana":"じっせき","kanji":"実績","meaning":"achievements; actual results; accomplishments; past results"],
        ["hiragana":"じっし","kanji":"実施","meaning":"enforcement; implementation; putting into practice; carrying out"],
        ["hiragana":"じゅどうてき","kanji":"受動的","meaning":"passive"],
        ["hiragana":"じゅこう","kanji":"受講","meaning":"attend a lecture"],
        ["hiragana":"じゅうまん","kanji":"充満","meaning":"being filled with; being full of; permeation"],
        ["hiragana":"かげき","kanji":"過激","meaning":"extreme; radical"],
        ["hiragana":"かいてん","kanji":"回転","meaning":"rotation"],
        ["hiragana":"かっこうつける","kanji":"格好つける","meaning":"to affect a stylish air; to try to look good; to show off"],
        ["hiragana":"かくい","kanji":"各位","meaning":"everyone; each and every one"],
        ["hiragana":"かくとく","kanji":"獲得","meaning":"acquisition; possession"],
        ["hiragana":"かんげいかい","kanji":"歓迎会","meaning":"welcome party"]
    ]
    
    var n2ch6array = [
        ["hiragana":"かかり","kanji":"係","meaning":"charge; duty; person in charge; official; clerk"],
        ["hiragana":"かんこうち","kanji":"観光地","meaning":"tourist attraction; sight-seeing area"],
        ["hiragana":"かんりゃくか","kanji":"簡略化","meaning":"simplification"],
        ["hiragana":"けいひ","kanji":"経費","meaning":"expenses; cost; outlay"],
        ["hiragana":"けんそん","kanji":"謙遜","meaning":"modesty; humility; being humble"],
        ["hiragana":"けっしょう","kanji":"決勝","meaning":"decision of a contest; finals"],
        ["hiragana":"きがる","kanji":"気軽","meaning":"carefree; buoyant; lighthearted; sprightly"],
        ["hiragana":"ききて","kanji":"聞き手","meaning":"hearer; listener; audience; interviewer; questioner"],
        ["hiragana":"きせい","kanji":"帰省","meaning":"homecoming; returning home"],
        ["hiragana":"こべつ","kanji":"個別","meaning":"particular case; discrete; individual; separate"],
        ["hiragana":"こまやか","kanji":"細やか","meaning":"tender; warm; caring; thoughtful; meticulous; detailed; attentive"],
        ["hiragana":"こんじょう","kanji":"根性","meaning":"willpower; guts; determination; grit; spirit"],
        ["hiragana":"こうせん","kanji":"光線","meaning":"beam; light ray"],
        ["hiragana":"くうかん","kanji":"空間","meaning":"space; room; airspace"],
        ["hiragana":"くうそう","kanji":"空想","meaning":"daydream; fantasy; fancy; vision"],
        ["hiragana":"きょうかい","kanji":"協会","meaning":"association; society; organization; organisation"],
        ["hiragana":"めいもん","kanji":"名門","meaning":"noted family; noble family; prestigious school"],
        ["hiragana":"もりあがる","kanji":"盛り上がる","meaning":"to swell; to rise; to bulge; to be piled up; to rouse; to get excited"],
        ["hiragana":"むじょうけん","kanji":"無条件","meaning":"unconditional"],
        ["hiragana":"ねっこ","kanji":"根っこ","meaning":"root"]
    ]
    
    var n3ch1array = [
        ["hiragana":"ばか","kanji":"馬鹿","meaning":"fool, idiot"],
        ["hiragana":"ちか","kanji":"地下","meaning":"basement, cellar"],
        ["hiragana":"ちしき","kanji":"知識","meaning":"knowledge, information"],
        ["hiragana":"でんせつ","kanji":"伝統","meaning":"tradition, convention"],
        ["hiragana":"どく","kanji":"毒","meaning":"poison, toxicant"],
        ["hiragana":"ふくそう","kanji":"服装","meaning":"garments, attire"],
        ["hiragana":"ふせぐ","kanji":"防ぐ","meaning":"to defend, to protect"],
        ["hiragana":"ひてい","kanji":"否定","meaning":"negation, denial"],
        ["hiragana":"ほうふ","kanji":"豊富","meaning":"abundance, wealth"],
        ["hiragana":"ほうもん","kanji":"訪問","meaning":"call, visit"],
        ["hiragana":"いふく","kanji":"衣服","meaning":"clothes"],
        ["hiragana":"じっこう","kanji":"実行","meaning":"execution, practice"],
        ["hiragana":"じしん","kanji":"自身","meaning":"by oneself, personally"],
        ["hiragana":"じっしゅう","kanji":"実習","meaning":"practice"],
        ["hiragana":"かい","kanji":"会","meaning":"meeting, assembly"],
        ["hiragana":"かいぜん","kanji":"改善","meaning":"improvement"],
        ["hiragana":"かご","kanji":"籠","meaning":"basket, cage"],
        ["hiragana":"かみのけ","kanji":"髪の毛","meaning":"hair"],
        ["hiragana":"かる","kanji":"刈る","meaning":"to cut"],
        ["hiragana":"かさい","kanji":"火災","meaning":"conflagration, fire"]
    ]
    
    var n3ch2array = [
        ["hiragana":"かてい","kanji":"仮定","meaning":"assumption, hypothesis"],
        ["hiragana":"きん","kanji":"金","meaning":"gold"],
        ["hiragana":"きんだい","kanji":"近代","meaning":"present day"],
        ["hiragana":"こうりょ","kanji":"考慮","meaning":"consideration"],
        ["hiragana":"くばる","kanji":"配る","meaning":"to distribute, to hand out"],
        ["hiragana":"くべつ","kanji":"区別","meaning":"distinction, differentiation"],
        ["hiragana":"きょか","kanji":"許可","meaning":"permission, approval"],
        ["hiragana":"きょうどう","kanji":"共同","meaning":"doing together, joint"],
        ["hiragana":"きょうつう","kanji":"共通","meaning":"commonness, community"],
        ["hiragana":"きゅうに","kanji":"急に","meaning":"swiftly, rapidly"],
        ["hiragana":"まけ","kanji":"負け","meaning":"defeat, loss"],
        ["hiragana":"もうしわけ","kanji":"申し訳","meaning":"apology, excuse"],
        ["hiragana":"むしば","kanji":"虫歯","meaning":"cavity, tooth decay"],
        ["hiragana":"ねったい","kanji":"熱帯","meaning":"tropics"],
        ["hiragana":"にっちゅう","kanji":"日中","meaning":"daytime, during the day"],
        ["hiragana":"にっこう","kanji":"日光","meaning":"sunlight"],
        ["hiragana":"にんずう","kanji":"人数","meaning":"the number of people"],
        ["hiragana":"のべる","kanji":"述べる","meaning":"to state, to express"],
        ["hiragana":"おしゃべり","kanji":"お喋り","meaning":"chattering, talk"],
        ["hiragana":"さいこう","kanji":"最高","meaning":"highest, supreme"]
    ]
    
    var n3ch3array = [
        ["hiragana":"れい","kanji":"礼","meaning":"note, paper money"],
        ["hiragana":"しりあう","kanji":"知り合う","meaning":"to get to know"],
        ["hiragana":"しずむ","kanji":"沈む","meaning":"to sink, to go under"],
        ["hiragana":"しょう","kanji":"章","meaning":"chapter, section"],
        ["hiragana":"しゅるい","kanji":"種類","meaning":"variety, kind, type"],
        ["hiragana":"たまたま","kanji":"偶々","meaning":"casually, unexpectedly"],
        ["hiragana":"ためる","kanji":"貯める","meaning":"to save up"],
        ["hiragana":"たんい","kanji":"単位","meaning":"unit, denomination"],
        ["hiragana":"たたかう","kanji":"戦う","meaning":"to fight, to struggle"],
        ["hiragana":"ていでん","kanji":"停電","meaning":"power outage, blackout"],
        ["hiragana":"うごかす","kanji":"動かす","meaning":"to move, to shift"],
        ["hiragana":"うらやましい","kanji":"羨ましい","meaning":"envious, jealous"],
        ["hiragana":"うしなう","kanji":"失う","meaning":"to lose"],
        ["hiragana":"うわさ","kanji":"噂","meaning":"rumor, gossip"],
        ["hiragana":"わがや","kanji":"我が家","meaning":"one’s house, one’;s home"],
        ["hiragana":"やりなおす","kanji":"やり直す","meaning":"to do over again, to redo"],
        ["hiragana":"よなか","kanji":"夜中","meaning":"midnight, dead of night"],
        ["hiragana":"よさん","kanji":"予算","meaning":"estimate, budget"],
        ["hiragana":"よそうがい","kanji":"予想外","meaning":"unexpected, unforeseen"],
        ["hiragana":"ようす","kanji":"様子","meaning":"state, appearance"]
    ]
    
    var n3ch4array = [
        ["hiragana":"ゆうりょう","kanji":"有料","meaning":"fee-charging, paid"],
        ["hiragana":"あつまり","kanji":"集まり","meaning":"gathering, meeting"],
        ["hiragana":"べんごし","kanji":"弁護士","meaning":"lawyer, attorney"],
        ["hiragana":"ちきゅう","kanji":"地球","meaning":"the earth, the globe"],
        ["hiragana":"でんしれんじ","kanji":"電子レンジ","meaning":"microwave oven"],
        ["hiragana":"どろ","kanji":"泥","meaning":"mud, dirt"],
        ["hiragana":"えがお","kanji":"笑顔","meaning":"smiling face"],
        ["hiragana":"えんき","kanji":"延期","meaning":"postponement"],
        ["hiragana":"ぐんたい","kanji":"軍隊","meaning":"armed forces"],
        ["hiragana":"はたけ","kanji":"畑","meaning":"field"],
        ["hiragana":"へいわ","kanji":"平和","meaning":"peace, harmony"],
        ["hiragana":"ひひょう","kanji":"批評","meaning":"criticism, review"],
        ["hiragana":"ひく","kanji":"轢く","meaning":"to run over"],
        ["hiragana":"ひたい","kanji":"額","meaning":"forehead, brow"],
        ["hiragana":"ほんにん","kanji":"本人","meaning":"the person himself"],
        ["hiragana":"いっぽう","kanji":"一方","meaning":"one way, the other way"],
        ["hiragana":"じつげん","kanji":"実現","meaning":"implementation"],
        ["hiragana":"じょうひん","kanji":"上品","meaning":"elegant, polished"],
        ["hiragana":"じょうとう","kanji":"上等","meaning":"superiority, first-class"],
        ["hiragana":"かいせい","kanji":"快晴","meaning":"clear weather, cloudless weather"]
    ]
    
    var n3ch5array = [
        ["hiragana":"かぐ","kanji":"家具","meaning":"furniture"],
        ["hiragana":"かんそう","kanji":"乾燥","meaning":"drying"],
        ["hiragana":"かしだし","kanji":"貸出","meaning":"lending, loaning"],
        ["hiragana":"かつよう","kanji":"活用","meaning":"practical use"],
        ["hiragana":"けいじ","kanji":"掲示","meaning":"notice, bulletin"],
        ["hiragana":"けつろん","kanji":"結論","meaning":"conclusion"],
        ["hiragana":"きく","kanji":"効く","meaning":"to be effective"],
        ["hiragana":"こむぎ","kanji":"小麦","meaning":"wheat"],
        ["hiragana":"こうけい","kanji":"光景","meaning":"scene, spectacle"],
        ["hiragana":"きょうごう","kanji":"競合","meaning":"competition, rivalry"],
        ["hiragana":"まぶしい","kanji":"眩しい","meaning":"dazzling, radiant"],
        ["hiragana":"まねく","kanji":"招く","meaning":"to invite, to ask"],
        ["hiragana":"みつめる","kanji":"見つめる","meaning":"to stare at, to gaze at"],
        ["hiragana":"みやこ","kanji":"都","meaning":"capital, metropolis"],
        ["hiragana":"もり","kanji":"盛り","meaning":"serving, helping"],
        ["hiragana":"もうしこみしょ","kanji":"申込書","meaning":"application form"],
        ["hiragana":"ねがい","kanji":"願い","meaning":"desire, wish"],
        ["hiragana":"の","kanji":"野","meaning":"plain, field"],
        ["hiragana":"おくる","kanji":"贈る","meaning":"to give"],
        ["hiragana":"おうえん","kanji":"応援","meaning":"aid, assistance, help"]
    ]
    
    
    var isShowingMeaning = false
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if LEVEL as! Int == 0 && CHAPTER as! Int == 0 {
            return n1ch1array.count
        }
        if LEVEL as! Int == 0 && CHAPTER as! Int == 1 {
            return n1ch2array.count
        }
        if LEVEL as! Int == 0 && CHAPTER as! Int == 2 {
            return n1ch3array.count
        }
        if LEVEL as! Int == 1 && CHAPTER as! Int == 0 {
            return n2ch1array.count
        }
        if LEVEL as! Int == 1 && CHAPTER as! Int == 1 {
            return n2ch2array.count
        }
        if LEVEL as! Int == 1 && CHAPTER as! Int == 2 {
            return n2ch3array.count
        }
        if LEVEL as! Int == 1 && CHAPTER as! Int == 3 {
            return n2ch4array.count
        }
        if LEVEL as! Int == 1 && CHAPTER as! Int == 4 {
            return n2ch5array.count
        }
        if LEVEL as! Int == 1 && CHAPTER as! Int == 5 {
            return n2ch6array.count
        }
        if LEVEL as! Int == 1 && CHAPTER as! Int == 0 {
            return n3ch1array.count
        }
        if LEVEL as! Int == 1 && CHAPTER as! Int == 1 {
            return n3ch2array.count
        }
        if LEVEL as! Int == 1 && CHAPTER as! Int == 2 {
            return n3ch3array.count
        }
        if LEVEL as! Int == 1 && CHAPTER as! Int == 3 {
            return n3ch4array.count
        }
        if LEVEL as! Int == 1 && CHAPTER as! Int == 4 {
            return n3ch5array.count
        }
        return 0
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        backButton.isHidden = true
        
        if LEVEL as! Int == 0 && CHAPTER as! Int == 0 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 1"
            totalLabel.text = "total 20 words"
            updateLabels(with: n1ch1array[0])
        }
        else if LEVEL as! Int == 0 && CHAPTER as! Int == 1 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 2"
            totalLabel.text = "total 20 words"
            updateLabels(with: n1ch2array[0])
        }
        else if LEVEL as! Int == 0 && CHAPTER as! Int == 2 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 3"
            totalLabel.text = "total 20 words"
            updateLabels(with: n1ch3array[0])
        }
        else if LEVEL as! Int == 0 && CHAPTER as! Int == 3 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 4"
            totalLabel.text = "total 20 words"
            updateLabels(with: n1ch4array[0])
        }
        else if LEVEL as! Int == 0 && CHAPTER as! Int == 4 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 5"
            totalLabel.text = "total 20 words"
            updateLabels(with: n1ch5array[0])
        }
        else if LEVEL as! Int == 0 && CHAPTER as! Int == 5 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 6"
            totalLabel.text = "total 20 words"
            updateLabels(with: n1ch6array[0])
        }
        else if LEVEL as! Int == 0 && CHAPTER as! Int == 6 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 7"
            totalLabel.text = "total 20 words"
            updateLabels(with: n1ch7array[0])
        }
        else if LEVEL as! Int == 0 && CHAPTER as! Int == 7 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 8"
            totalLabel.text = "total 20 words"
            updateLabels(with: n1ch8array[0])
        }
        else if LEVEL as! Int == 1 && CHAPTER as! Int == 1 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 1"
            totalLabel.text = "total 20 words"
            updateLabels(with: n2ch1array[0])
        }
        else if LEVEL as! Int == 1 && CHAPTER as! Int == 2 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 2"
            totalLabel.text = "total 20 words"
            updateLabels(with: n2ch2array[0])
        }
        else if LEVEL as! Int == 1 && CHAPTER as! Int == 3 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 3"
            totalLabel.text = "total 20 words"
            updateLabels(with: n2ch3array[0])
        }
        else if LEVEL as! Int == 1 && CHAPTER as! Int == 4 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 4"
            totalLabel.text = "total 20 words"
            updateLabels(with: n2ch4array[0])
        }
        else if LEVEL as! Int == 1 && CHAPTER as! Int == 5 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 5"
            totalLabel.text = "total 20 words"
            updateLabels(with: n2ch5array[0])
        }
        else if LEVEL as! Int == 1 && CHAPTER as! Int == 6 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 6"
            totalLabel.text = "total 20 words"
            updateLabels(with: n2ch6array[0])
        }
        else if LEVEL as! Int == 2 && CHAPTER as! Int == 0 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 1"
            totalLabel.text = "total 20 words"
            updateLabels(with: n3ch1array[0])
        }
        else if LEVEL as! Int == 2 && CHAPTER as! Int == 1 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 2"
            totalLabel.text = "total 20 words"
            updateLabels(with: n3ch2array[0])
        }
        else if LEVEL as! Int == 2 && CHAPTER as! Int == 2 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 3"
            totalLabel.text = "total 20 words"
            updateLabels(with: n3ch3array[0])
        }
        else if LEVEL as! Int == 2 && CHAPTER as! Int == 3 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 4"
            totalLabel.text = "total 20 words"
            updateLabels(with: n3ch4array[0])
        }
        else if LEVEL as! Int == 2 && CHAPTER as! Int == 4 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 5"
            totalLabel.text = "total 20 words"
            updateLabels(with: n3ch5array[0])
        }
        
        updateCurrentArray()
        updateCard()
    }
    
    func updateCurrentArray() {
        if let level = LEVEL as? Int, let chapter = CHAPTER as? Int {
            if level == 0 && chapter == 0 {
                currentArray = n1ch1array
            } else if level == 0 && chapter == 1 {
                currentArray = n1ch2array
            } else if level == 0 && chapter == 2 {
                currentArray = n1ch3array
            } else if level == 0 && chapter == 3 {
                currentArray = n1ch4array
            } else if level == 0 && chapter == 4 {
                currentArray = n1ch5array
            } else if level == 0 && chapter == 5 {
                currentArray = n1ch6array
            } else if level == 0 && chapter == 6 {
                currentArray = n1ch7array
            } else if level == 0 && chapter == 7 {
                currentArray = n1ch8array
            } else if level == 1 && chapter == 0 {
                currentArray = n2ch1array
            } else if level == 1 && chapter == 1 {
                currentArray = n2ch2array
            } else if level == 1 && chapter == 2 {
                currentArray = n2ch3array
            } else if level == 1 && chapter == 3 {
                currentArray = n2ch4array
            } else if level == 1 && chapter == 4 {
                currentArray = n2ch5array
            } else if level == 1 && chapter == 5 {
                currentArray = n2ch6array
            } else if level == 2 && chapter == 0 {
                currentArray = n3ch1array
            } else if level == 2 && chapter == 1 {
                currentArray = n3ch2array
            } else if level == 2 && chapter == 2 {
                currentArray = n3ch3array
            } else if level == 2 && chapter == 3 {
                currentArray = n3ch4array
            } else if level == 2 && chapter == 4 {
                currentArray = n3ch5array
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
        }
    }
    
    @IBAction func tapNextButton(_ sender: UIButton) {
        if index < n1ch1array.count - 1 {
            index += 1
            updateCard()
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
        if LEVEL as! Int == 0 && CHAPTER as! Int == 0 {
            return n1ch1array[index]
        } else if LEVEL as! Int == 0 && CHAPTER as! Int == 1 {
            return n1ch2array[index]
        } else if LEVEL as! Int == 0 && CHAPTER as! Int == 2 {
            return n1ch3array[index]
        } else if LEVEL as! Int == 0 && CHAPTER as! Int == 3 {
            return n1ch4array[index]
        } else if LEVEL as! Int == 0 && CHAPTER as! Int == 4 {
            return n1ch5array[index]
        } else if LEVEL as! Int == 0 && CHAPTER as! Int == 5 {
            return n1ch6array[index]
        } else if LEVEL as! Int == 0 && CHAPTER as! Int == 6 {
            return n1ch7array[index]
        } else if LEVEL as! Int == 0 && CHAPTER as! Int == 7 {
            return n1ch8array[index]
        } else if LEVEL as! Int == 1 && CHAPTER as! Int == 0 {
            return n2ch1array[index]
        } else if LEVEL as! Int == 1 && CHAPTER as! Int == 1 {
            return n2ch2array[index]
        } else if LEVEL as! Int == 1 && CHAPTER as! Int == 2 {
            return n2ch3array[index]
        } else if LEVEL as! Int == 1 && CHAPTER as! Int == 3 {
            return n2ch4array[index]
        } else if LEVEL as! Int == 1 && CHAPTER as! Int == 4 {
            return n2ch5array[index]
        } else if LEVEL as! Int == 1 && CHAPTER as! Int == 5 {
            return n2ch6array[index]
        } else if LEVEL as! Int == 2 && CHAPTER as! Int == 0 {
            return n3ch1array[index]
        } else if LEVEL as! Int == 2 && CHAPTER as! Int == 1 {
            return n3ch2array[index]
        } else if LEVEL as! Int == 2 && CHAPTER as! Int == 2 {
            return n3ch3array[index]
        } else if LEVEL as! Int == 2 && CHAPTER as! Int == 3 {
            return n3ch4array[index]
        } else if LEVEL as! Int == 2 && CHAPTER as! Int == 4 {
            return n3ch5array[index]
        }
        return [:]
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
