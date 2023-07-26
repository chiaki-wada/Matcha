//
//  YomiQuizViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/06/06.
//

import UIKit

class YomiQuizViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var greenView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleShadowLabel: UILabel!
    @IBOutlet var chapterLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
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
    var LEVEL: Int = 0
    
    //JLPT N1
    var n1ch1array = [
        ["hiragana":"ぶんしょ","kanji":"文書","meaning":"document, writing, paperwork"],
        ["hiragana":"だげき","kanji":"打撃","meaning":"blow, shock, strike"],
        ["hiragana":"ほうしゅう","kanji":"報酬","meaning":"emuneration, recompense, reward"],
        ["hiragana":"いみん","kanji":"移民","meaning":"emigration, immigration"],
        ["hiragana":"いぜん","kanji":"依然","meaning":"still; as yet; as it has been"],
        ["hiragana":"じぞく","kanji":"持続","meaning":"continuation; persisting; lasting; sustaining"],
        ["hiragana":"かたむける","kanji":"傾ける","meaning":"to incline, to lean, to tilt"],
        ["hiragana":"こうい","kanji":"好意","meaning":"good will, favor, courtesy"],
        ["hiragana":"こうにゅう","kanji":"購入","meaning":"purchase, buy"],
        ["hiragana":"めいりょう","kanji":"明瞭","meaning":"clear; distinct; obvious; evident; articulate"],
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
        ["hiragana":"かだい","kanji":"課題","meaning":"subject; issue; homework; assignment; challenge"],
        ["hiragana":"きこう","kanji":"機構","meaning":"mechanism, organization"],
        ["hiragana":"きそう","kanji":"競う","meaning":"to compete; to contend; to vie; to contest"],
        ["hiragana":"きょうれつ","kanji":"強烈","meaning":"strong, intense, severe"],
        ["hiragana":"りせい","kanji":"理性","meaning":"reason, reasoning power"],
        ["hiragana":"りょういき","kanji":"領域","meaning":"area; domain; territory; field; range; region"],
        ["hiragana":"せんとう","kanji":"戦闘","meaning":"battle, fight, combat"],
        ["hiragana":"しじ","kanji":"指示","meaning":"instructions, directions, indication"],
        ["hiragana":"しかく","kanji":"資格","meaning":"qualifications; requirements; capabilities"],
        ["hiragana":"しこう","kanji":"思考","meaning":"thought; consideration; thinking"],
        ["hiragana":"しょうめい","kanji":"照明","meaning":"illumination; lighting"],
        ["hiragana":"しょうれい","kanji":"奨励","meaning":"encouragement, promotion"],
        ["hiragana":"しょうり","kanji":"勝利","meaning":"victory, triumph, win"],
        ["hiragana":"とぼしい","kanji":"乏しい","meaning":"meager; scarce; limited; destitute; lacking"],
        ["hiragana":"ぞうきょう","kanji":"増強","meaning":"augment, reinforce, increase"],
        ["hiragana":"あやまち","kanji":"過ち","meaning":"fault, error, indiscretion"],
        ["hiragana":"どくさい","kanji":"独裁","meaning":"dictatorship, despotism"],
        ["hiragana":"じかく","kanji":"自覚","meaning":"self-consciousness; self-awareness"],
        ["hiragana":"じぜん","kanji":"事前","meaning":"prior; beforehand; in advance"]
    ]
    
    var n1ch3array = [
        ["hiragana":"かんし","kanji":"監視","meaning":"monitoring, watching, observation"],
        ["hiragana":"しきん","kanji":"資金","meaning":"funds, capital"],
        ["hiragana":"しょゆう","kanji":"所有","meaning":"one’s possessions; ownership"],
        ["hiragana":"そまる","kanji":"染まる","meaning":"to be dyed; to be tainted; to be infected; to be stained; to be steeped"],
        ["hiragana":"そくざに","kanji":"即座に","meaning":"immediately; right away; on the spot"],
        ["hiragana":"たいしゅう","kanji":"大衆","meaning":"general public, the masses"],
        ["hiragana":"うごき","kanji":"動き","meaning":"movement; move; motion; trend; fluctuation"],
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
        ["hiragana":"やしなう","kanji":"養う","meaning":"to support; to raise; to feed"],
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
        ["hiragana":"ていきょう","kanji":"提供","meaning":"offer; providing; supplying"],
        ["hiragana":"とっぱ","kanji":"突破","meaning":"breaking through, penetration"]
    ]
    
    var n1ch8array = [
        ["hiragana":"とうろん","kanji":"討論","meaning":"debate; discussion"],
        ["hiragana":"うんめい","kanji":"運命","meaning":"fate, destiny"],
        ["hiragana":"ざんこく","kanji":"残酷","meaning":"cruelty, harshness"],
        ["hiragana":"ちゅうだん","kanji":"中断","meaning":"interruption; suspension; break"],
        ["hiragana":"はいし","kanji":"廃止","meaning":"abolition; repeal"],
        ["hiragana":"はたす","kanji":"果たす","meaning":"to accomplish; to achieve; to carry out; to fulfill"],
        ["hiragana":"はつげん","kanji":"発言","meaning":"statement; remark; observation; utterance; speech"],
        ["hiragana":"ひろう","kanji":"疲労","meaning":"fatigue, weariness"],
        ["hiragana":"いためる","kanji":"痛める","meaning":"to hurt; to injure; to harm; to damage"],
        ["hiragana":"いと","kanji":"意図","meaning":"ntention; aim; design"],
        ["hiragana":"じゅうぎょういん","kanji":"従業員","meaning":"employee, worker"],
        ["hiragana":"けいか","kanji":"経過","meaning":"passage, expiration, progress"],
        ["hiragana":"きせき","kanji":"奇跡","meaning":"miracle, wonder, marvel"],
        ["hiragana":"きゅうきょく","kanji":"究極","meaning":"ultimate, extreme, final"],
        ["hiragana":"もさく","kanji":"模索","meaning":"groping"],
        ["hiragana":"し","kanji":"死","meaning":"death, decease"],
        ["hiragana":"しくみ","kanji":"仕組み","meaning":"structure; construction; arrangement; mechanism"],
        ["hiragana":"そなわる","kanji":"備わる","meaning":"to be furnished with, to be equipped with"],
        ["hiragana":"たいしょく","kanji":"退職","meaning":"retirement; resignation"],
        ["hiragana":"ゆうかん","kanji":"勇敢","meaning":"brave, heroic, gallant"]
    ]
    
    var n1ch9array = [
        ["hiragana":"ふどうさん","kanji":"不動産","meaning":"real estate"],
        ["hiragana":"ふうさ","kanji":"封鎖","meaning":"blockade"],
        ["hiragana":"はあく","kanji":"把握","meaning":"grasp, catch, understanding"],
        ["hiragana":"ひめい","kanji":"悲鳴","meaning":"shriek, scream"],
        ["hiragana":"ひさん","kanji":"悲惨","meaning":"disastrous, tragic"],
        ["hiragana":"じっせん","kanji":"実践","meaning":"practice; putting into practice; implementation"],
        ["hiragana":"かくしん","kanji":"確信","meaning":"conviction; belief; confidence"],
        ["hiragana":"こうりつ","kanji":"効率","meaning":"efficiency"],
        ["hiragana":"みかた","kanji":"見方","meaning":"viewpoint, point of view"],
        ["hiragana":"せいぎ","kanji":"正義","meaning":"justice, right, righteousness"],
        ["hiragana":"しんり","kanji":"真理","meaning":"truth"],
        ["hiragana":"しんそう","kanji":"真相","meaning":"truth, real situation"],
        ["hiragana":"しょくむ","kanji":"職務","meaning":"professional duties"],
        ["hiragana":"そくしん","kanji":"促進","meaning":"promotion, acceleration"],
        ["hiragana":"よわめる","kanji":"弱める","meaning":"to weaken"],
        ["hiragana":"あくじ","kanji":"悪事","meaning":"evil deed, crime"],
        ["hiragana":"あつかい","kanji":"扱い","meaning":"treatment, service"],
        ["hiragana":"ぼうちょう","kanji":"膨張","meaning":"expansion, swelling, increase"],
        ["hiragana":"ちせい","kanji":"知性","meaning":"intelligence"],
        ["hiragana":"ちゅうじつ","kanji":"忠実","meaning":"faithful; devoted; loyal; honest; true"]
    ]
    
    var n1ch10array = [
        ["hiragana":"ふはい","kanji":"腐敗","meaning":"decomposition, corruption, decay"],
        ["hiragana":"ふしょう","kanji":"負傷","meaning":"injury, wound"],
        ["hiragana":"ふたん","kanji":"負担","meaning":"burden; load; responsibility; bearing"],
        ["hiragana":"ほうてい","kanji":"法廷","meaning":"courtroom"],
        ["hiragana":"じょうねつ","kanji":"情熱","meaning":"passion, enthusiasm"],
        ["hiragana":"かける","kanji":"賭ける","meaning":"to wager, to bet, to gamble"],
        ["hiragana":"こうぎ","kanji":"抗議","meaning":"protest, objection"],
        ["hiragana":"めぐむ","kanji":"恵む","meaning":"to bless; to show mercy to; to give"],
        ["hiragana":"めいよ","kanji":"名誉","meaning":"honor, credit, prestige"],
        ["hiragana":"むじつ","kanji":"無実","meaning":"innocence, guiltlessness"],
        ["hiragana":"りそく","kanji":"利息","meaning":"interest"],
        ["hiragana":"さっち","kanji":"察知","meaning":"sense, infer"],
        ["hiragana":"しょうどう","kanji":"衝動","meaning":"impulse, impetus, urge"],
        ["hiragana":"しゅほう","kanji":"手法","meaning":"technique, method"],
        ["hiragana":"そうさ","kanji":"捜査","meaning":"search, investigation"],
        ["hiragana":"てんじ","kanji":"展示","meaning":"exhibition; display"],
        ["hiragana":"つうじょう","kanji":"通常","meaning":"usual; ordinary; normal; regular; general"],
        ["hiragana":"うんよう","kanji":"運用","meaning":"making use of, application"],
        ["hiragana":"びんかん","kanji":"敏感","meaning":"sensitive; alert; aware; susceptible"],
        ["hiragana":"ぶか","kanji":"部下","meaning":"subordinate person"]
    ]
    
    var n1ch11array = [
        ["hiragana":"ちかづく","kanji":"近づく","meaning":"to approach; to get close; to get acquainted with"],
        ["hiragana":"どうき","kanji":"動機","meaning":"motive; incentive"],
        ["hiragana":"どうめい","kanji":"同盟","meaning":"alliance, union, league"],
        ["hiragana":"はいりょ","kanji":"配慮","meaning":"consideration, concern, attention"],
        ["hiragana":"ほけん","kanji":"保険","meaning":"insurance, guarantee"],
        ["hiragana":"いこう","kanji":"移行","meaning":"switching over to; migration; transition"],
        ["hiragana":"じゅうなん","kanji":"柔軟","meaning":"flexible; lithe; soft; pliable"],
        ["hiragana":"かいはつ","kanji":"開発","meaning":"development; exploitation"],
        ["hiragana":"かくめい","kanji":"革命","meaning":"revolution"],
        ["hiragana":"けいかい","kanji":"警戒","meaning":"vigilance, caution, alertness"],
        ["hiragana":"こてい","kanji":"固定","meaning":"fixing"],
        ["hiragana":"なやみ","kanji":"悩み","meaning":"trouble; worry; distress; sorrows; problem"],
        ["hiragana":"おそう","kanji":"襲う","meaning":"to attack, to assail"],
        ["hiragana":"さいあく","kanji":"最悪","meaning":"worst; horrible; horrid; awful; terrible"],
        ["hiragana":"せっとく","kanji":"説得","meaning":"persuasion"],
        ["hiragana":"てんかん","kanji":"転換","meaning":"conversion; diversion; changeover; switchover"],
        ["hiragana":"てんざい","kanji":"天才","meaning":"genius; prodigy; natural gift"],
        ["hiragana":"ぜんてい","kanji":"前提","meaning":"condition; assumption; prerequisite; hypothesis"],
        ["hiragana":"ばくだん","kanji":"爆弾","meaning":"bomb"],
        ["hiragana":"ぶじょく","kanji":"侮辱","meaning":"insult, affront, slight"]
        
    ]
    
    var n1ch12array = [
        ["hiragana":"ちょっかん","kanji":"直感","meaning":"intuition, instinct, hunch"],
        ["hiragana":"げんそく","kanji":"原則","meaning":"principle; general rule"],
        ["hiragana":"くるしみ","kanji":"苦しみ","meaning":"pain, anguish, suffering"],
        ["hiragana":"もらす","kanji":"漏らす","meaning":"to let leak, to reveal"],
        ["hiragana":"ねんりょう","kanji":"燃料","meaning":"fuel"],
        ["hiragana":"にくしみ","kanji":"憎しみ","meaning":"hatred"],
        ["hiragana":"せってい","kanji":"設定","meaning":"establishment; creation; posing"],
        ["hiragana":"しょうげん","kanji":"証言","meaning":"testimony"],
        ["hiragana":"しょうこ","kanji":"証拠","meaning":"evidence, proof"],
        ["hiragana":"しょうさい","kanji":"詳細","meaning":"details; particulars; specifics"],
        ["hiragana":"とうたつ","kanji":"到達","meaning":"reaching; attaining; arrival"],
        ["hiragana":"よくせい","kanji":"抑制","meaning":"control, restraint, suppression"],
        ["hiragana":"あっとう","kanji":"圧倒","meaning":"overwhelm, overpower"],
        ["hiragana":"べんご","kanji":"弁護","meaning":"defence, pleading, advocacy"],
        ["hiragana":"ぶれい","kanji":"無礼","meaning":"impolite, rude"],
        ["hiragana":"ちゅうこく","kanji":"忠告","meaning":"advice, warning"],
        ["hiragana":"どうし","kanji":"同士","meaning":"fellow, companion, comrade"],
        ["hiragana":"どうよう","kanji":"動揺","meaning":"shaking, trembling, disturbance"],
        ["hiragana":"ごうせい","kanji":"合成","meaning":"composition, synthesis"],
        ["hiragana":"ぎょうむ","kanji":"業務","meaning":"business, affairs, duties"]
    ]
    
    var n1ch13array = [
        ["hiragana":"はばむ","kanji":"阻む","meaning":"to keep someone from doing, to prevent"],
        ["hiragana":"ひょう","kanji":"票","meaning":"vote, ballot"],
        ["hiragana":"きょうさん","kanji":"共産","meaning":"communism"],
        ["hiragana":"になう","kanji":"担う","meaning":"to carry on shoulder, to bear"],
        ["hiragana":"ろうひ","kanji":"浪費","meaning":"waste, extravagance"],
        ["hiragana":"してき","kanji":"指摘","meaning":"pointing out; identification"],
        ["hiragana":"そし","kanji":"阻止","meaning":"obstruction, check, hindrance"],
        ["hiragana":"すいたい","kanji":"衰退","meaning":"decline, degeneration, decay"],
        ["hiragana":"すく","kanji":"好く","meaning":"to like, to love"],
        ["hiragana":"てんけん","kanji":"点検","meaning":"inspection; examination; checking"],
        ["hiragana":"とうごう","kanji":"統合","meaning":"integration, unification, synthesis"],
        ["hiragana":"うながす","kanji":"促す","meaning":"to urge; to encourage; to press; to prompt"],
        ["hiragana":"だっしゅつ","kanji":"脱出","meaning":"escape; break-out; prolapse; proptosis"],
        ["hiragana":"どくせん","kanji":"独占","meaning":"monopoly; exclusivity; keeping to oneself"],
        ["hiragana":"どきょう","kanji":"度胸","meaning":"courage, bravery, nerve"],
        ["hiragana":"ふかけつ","kanji":"不可欠","meaning":"indispensable; essential"],
        ["hiragana":"はいじょ","kanji":"排除","meaning":"exclusion, removal, elimination"],
        ["hiragana":"へいさ","kanji":"閉鎖","meaning":"closing, shutdown, lockout"],
        ["hiragana":"いちぶ","kanji":"一部","meaning":"one part, one portion"],
        ["hiragana":"けんい","kanji":"権威","meaning":"authority, power, influence"]
    ]
    
    var n1ch14array = [
        ["hiragana":"こばむ","kanji":"拒む","meaning":"to refuse, to reject, to decline"],
        ["hiragana":"きょうい","kanji":"脅威","meaning":"threat, menace"],
        ["hiragana":"みち","kanji":"未知","meaning":"not yet known, unknown"],
        ["hiragana":"みたす","kanji":"満たす","meaning":"to satisfy"],
        ["hiragana":"りくつ","kanji":"理屈","meaning":"theory, reason"],
        ["hiragana":"しさん","kanji":"資産","meaning":"property, fortune, assets"],
        ["hiragana":"そしょう","kanji":"訴訟","meaning":"liftigation, lawsuit"],
        ["hiragana":"ようせい","kanji":"要請","meaning":"appeal, request, demand"],
        ["hiragana":"ゆうする","kanji":"有する","meaning":"to own, to be endowed with"],
        ["hiragana":"ちんぎん","kanji":"賃金","meaning":"wages"],
        ["hiragana":"はけん","kanji":"派遣","meaning":"dispatch, despatch, deployment"],
        ["hiragana":"はくじょう","kanji":"白状","meaning":"confession"],
        ["hiragana":"ひんぱん","kanji":"頻繁","meaning":"frequent, incessant"],
        ["hiragana":"きんきゅう","kanji":"緊急","meaning":"urgent, pressing, emergency"],
        ["hiragana":"きずく","kanji":"築く","meaning":"to build, to construct"],
        ["hiragana":"こよう","kanji":"雇用","meaning":"employment, hire"],
        ["hiragana":"くちょう","kanji":"口調","meaning":"tone"],
        ["hiragana":"きょひ","kanji":"拒否","meaning":"refusal; rejection; denial; veto"],
        ["hiragana":"にくたい","kanji":"肉体","meaning":"the body, the flesh"],
        ["hiragana":"さくせん","kanji":"作戦","meaning":"tactics, strategy"]
    ]
    
    var n1ch15array = [
        ["hiragana":"さとる","kanji":"悟る","meaning":"to perceive, to sense, to understand"],
        ["hiragana":"しんぼう","kanji":"辛抱","meaning":"patience, endurance"],
        ["hiragana":"しんじつ","kanji":"真実","meaning":"truth, reality"],
        ["hiragana":"てじゅん","kanji":"手順","meaning":"process, procedure, sequence"],
        ["hiragana":"よかん","kanji":"予感","meaning":"presentiment; premonition; hunch"],
        ["hiragana":"ようする","kanji":"要する","meaning":"to need, to demand, to require"],
        ["hiragana":"べんかい","kanji":"弁解","meaning":"justification, explanation"],
        ["hiragana":"びしょう","kanji":"微笑","meaning":"smile"],
        ["hiragana":"どだい","kanji":"土台","meaning":"foundation; base; basis"],
        ["hiragana":"えんじる","kanji":"演じる","meaning":"to perform"],
        ["hiragana":"はっせい","kanji":"発生","meaning":"outbreak, spring forth, occurrence"],
        ["hiragana":"ほんのう","kanji":"本能","meaning":"instinct"],
        ["hiragana":"ほんしん","kanji":"本心","meaning":"true feelings"],
        ["hiragana":"かぶしき","kanji":"株式","meaning":"stock"],
        ["hiragana":"かんしょう","kanji":"干渉","meaning":"interference, intervention, meddling"],
        ["hiragana":"かんよ","kanji":"関与","meaning":"participation, taking part in"],
        ["hiragana":"けいたい","kanji":"携帯","meaning":"something carried"],
        ["hiragana":"こちょう","kanji":"誇張","meaning":"exaggeration"],
        ["hiragana":"こうかい","kanji":"公開","meaning":"making available to the public; exhibiting; showing"],
        ["hiragana":"しょうたい","kanji":"正体","meaning":"true character, true form"]
    ]
    
    var n1ch16array = [
        ["hiragana":"しゅうえき","kanji":"収益","meaning":"earnings, proceeds, returns"],
        ["hiragana":"たいけん","kanji":"体験","meaning":"personal experience; one's own experience"],
        ["hiragana":"つよまる","kanji":"強まる","meaning":"to get strong, to gain strength"],
        ["hiragana":"ゆうわく","kanji":"誘惑","meaning":"temptation, allurement"],
        ["hiragana":"えいぞう","kanji":"映像","meaning":"image"],
        ["hiragana":"げんち","kanji":"現地","meaning":"actual place, local"],
        ["hiragana":"ひなん","kanji":"避難","meaning":"taking refuge; evacuation; escape"],
        ["hiragana":"ひつぜん","kanji":"必然","meaning":"inevitable, necessary"],
        ["hiragana":"じもと","kanji":"地元","meaning":"home area; home town; local"],
        ["hiragana":"かんりょう","kanji":"官僚","meaning":"bureaucrat, bureaucracy"],
        ["hiragana":"けいろ","kanji":"経路","meaning":"course, route, means"],
        ["hiragana":"けんげん","kanji":"権限","meaning":"power, authority, jurisdiction"],
        ["hiragana":"けつだん","kanji":"決断","meaning":"decision; determination"],
        ["hiragana":"きぜつ","kanji":"気絶","meaning":"faint, swoon"],
        ["hiragana":"きずつける","kanji":"傷つける","meaning":"to wound, to injure"],
        ["hiragana":"くつじょく","kanji":"屈辱","meaning":"disgrace, humiliation"],
        ["hiragana":"きょうくん","kanji":"教訓","meaning":"lesson, precept"],
        ["hiragana":"せいじゅく","kanji":"成熟","meaning":"maturity, ripeness"],
        ["hiragana":"せんりゃく","kanji":"戦略","meaning":"strategy; tactics"],
        ["hiragana":"しき","kanji":"指揮","meaning":"command, direction"]
    ]
    
    var n1ch17array = [
        ["hiragana":"しゅうしゅう","kanji":"収集","meaning":"collecting; accumulating; gathering"],
        ["hiragana":"てんじょう","kanji":"天井","meaning":"ceiling, ceiling price"],
        ["hiragana":"とうにゅう","kanji":"投入","meaning":"throwing into, inserting"],
        ["hiragana":"とうせい","kanji":"統制","meaning":"regulation, control"],
        ["hiragana":"ついせき","kanji":"追跡","meaning":"chase, pursuit, tracing"],
        ["hiragana":"ついやす","kanji":"費やす","meaning":"to spend, to consume"],
        ["hiragana":"だいたん","kanji":"大胆","meaning":"bold, daring, audacious"],
        ["hiragana":"どうじょう","kanji":"同情","meaning":"sympathy, compassion"],
        ["hiragana":"はいち","kanji":"配置","meaning":"arrangement, deployment"],
        ["hiragana":"ほうき","kanji":"放棄","meaning":"abandonment, renunciation"],
        ["hiragana":"いちじるしい","kanji":"著しい","meaning":"striking; remarkable; considerable"],
        ["hiragana":"じごく","kanji":"地獄","meaning":"hell"],
        ["hiragana":"じっしつ","kanji":"実質","meaning":"substance; essence; real"],
        ["hiragana":"かんよう","kanji":"寛容","meaning":"tolerance, generosity"],
        ["hiragana":"けつい","kanji":"決意","meaning":"decision, determination"],
        ["hiragana":"こうしょう","kanji":"交渉","meaning":"negotiations, discussions"],
        ["hiragana":"おとずれる","kanji":"訪れる","meaning":"to visit; to call on; to arrive; to come"],
        ["hiragana":"おう","kanji":"負う","meaning":"to bear, to take responsibility for"],
        ["hiragana":"れんちゅう","kanji":"連中","meaning":"company, lot, bunch"],
        ["hiragana":"さいぶ","kanji":"細部","meaning":"details"]
    ]
    
    var n1ch18array = [
        ["hiragana":"しいる","kanji":"強いる","meaning":"to force, to compel, to coerce"],
        ["hiragana":"しょうがい","kanji":"生涯","meaning":"one's lifetime"],
        ["hiragana":"しゅえい","kanji":"守衛","meaning":"security guard, doorkeeper"],
        ["hiragana":"たもつ","kanji":"保つ","meaning":"to keep; to preserve; to hold; to retain; to maintain; to sustain; to last; to endure"],
        ["hiragana":"とみ","kanji":"富","meaning":"riches, wealth, fortune"],
        ["hiragana":"うちあける","kanji":"打ち明ける","meaning":"to confide; to reveal; to disclose; to speak frankly"],
        ["hiragana":"やしん","kanji":"野心","meaning":"ambition, aspiration"],
        ["hiragana":"よういん","kanji":"要因","meaning":"main cause; primary factor"],
        ["hiragana":"ぶんさん","kanji":"分散","meaning":"dispersion, breakup"],
        ["hiragana":"ちんもく","kanji":"沈黙","meaning":"silence, being silent"],
        ["hiragana":"げんみつ","kanji":"厳密","meaning":"strict, close, precise"],
        ["hiragana":"へんかく","kanji":"変革","meaning":"change, transformation"],
        ["hiragana":"へんけん","kanji":"偏見","meaning":"prejudice, narrow view"],
        ["hiragana":"ほうかい","kanji":"崩壊","meaning":"collapse, crumbling"],
        ["hiragana":"かわす","kanji":"交わす","meaning":"to exchange, to intersect, to cross"],
        ["hiragana":"こせい","kanji":"個性","meaning":"individuality; personality; character"],
        ["hiragana":"みなもと","kanji":"源","meaning":"source, origin, root"],
        ["hiragana":"むこう","kanji":"無効","meaning":"invalid, no effect"],
        ["hiragana":"さだめる","kanji":"定める","meaning":"to decide; to determine; to prescribe"],
        ["hiragana":"さいせい","kanji":"再生","meaning":"regeneration; reformation; playback"]
    ]
    
    var n1ch19array = [
        ["hiragana":"せいじつ","kanji":"誠実","meaning":"sincere, honest, faithful"],
        ["hiragana":"しじ","kanji":"支持","meaning":"support; backing; endorsement; approval"],
        ["hiragana":"とうし","kanji":"投資","meaning":"investment"],
        ["hiragana":"ばいしゅう","kanji":"買収","meaning":"acquisition, buy-out, takeover"],
        ["hiragana":"ぼうりょく","kanji":"暴力","meaning":"violence, mayhem"],
        ["hiragana":"ぶんぱい","kanji":"分配","meaning":"division; splitting; sharing; distribution; dissemination; allocation"],
        ["hiragana":"どうるい","kanji":"同類","meaning":"the same kind"],
        ["hiragana":"どうとう","kanji":"同等","meaning":"equality; equal; same rank; equivalence"],
        ["hiragana":"へいし","kanji":"兵士","meaning":"soldier"],
        ["hiragana":"ひってき","kanji":"匹敵","meaning":"to be a match for, to rival"],
        ["hiragana":"いかり","kanji":"怒り","meaning":"anger; rage; fury; wrath; indignation"],
        ["hiragana":"いっこく","kanji":"一刻","meaning":"minute, moment, an instant"],
        ["hiragana":"じょげん","kanji":"助言","meaning":"advice, suggestion"],
        ["hiragana":"こどく","kanji":"孤独","meaning":"solitude; loneliness; isolation"],
        ["hiragana":"こうかい","kanji":"後悔","meaning":"regret, repentance, remorse"],
        ["hiragana":"みぢか","kanji":"身近","meaning":"near oneself, close to one, familiar"],
        ["hiragana":"にんしん","kanji":"妊娠","meaning":"conception, pregnancy"],
        ["hiragana":"のうじょう","kanji":"農場","meaning":"farm"],
        ["hiragana":"おかす","kanji":"犯す","meaning":"to commit"],
        ["hiragana":"せいふく","kanji":"征服","meaning":"conquest, subjugation"]
    ]
    
    var n1ch20array = [
        ["hiragana":"たいせい","kanji":"態勢","meaning":"attitude, posture, preparedness"],
        ["hiragana":"ていたい","kanji":"停滞","meaning":"stagnation, tie-up, congestion"],
        ["hiragana":"ちくせき","kanji":"蓄積","meaning":"accumulation; accumulate; store"],
        ["hiragana":"はい","kanji":"肺","meaning":"lung"],
        ["hiragana":"ひなん","kanji":"非難","meaning":"criticism; blame; censure; attack; reproach"],
        ["hiragana":"いとなむ","kanji":"営む","meaning":"to run"],
        ["hiragana":"じょうせい","kanji":"情勢","meaning":"state of things, state of affairs"],
        ["hiragana":"かいひ","kanji":"回避","meaning":"evasion, avoidance"],
        ["hiragana":"かいじょ","kanji":"解除","meaning":"cancellation, release"],
        ["hiragana":"かんぺき","kanji":"完璧","meaning":"perfect; complete; flawless"],
        ["hiragana":"けいれき","kanji":"経歴","meaning":"personal history, career"],
        ["hiragana":"きんべん","kanji":"勤勉","meaning":"diligent, industrious"],
        ["hiragana":"こころみる","kanji":"試みる","meaning":"to try, to attempt"],
        ["hiragana":"こんきょ","kanji":"根拠","meaning":"basis, foundation"],
        ["hiragana":"きょうはく","kanji":"脅迫","meaning":"threat, menace, coercion"],
        ["hiragana":"きょうじゅ","kanji":"享受","meaning":"reception, acceptance, enjoyment"],
        ["hiragana":"きょうせい","kanji":"強制","meaning":"obligation, coercion, compulsion"],
        ["hiragana":"むりょく","kanji":"無力","meaning":"powerlessness, incompetent"],
        ["hiragana":"おそれ","kanji":"恐れ","meaning":"fear, horror, anxiety"],
        ["hiragana":"さかえる","kanji":"栄える","meaning":"to prosper, to flourish"]
    ]
    
    var n1ch21array = [
        ["hiragana":"せいさく","kanji":"政策","meaning":"political measures; policy"],
        ["hiragana":"しせん","kanji":"視線","meaning":"one’s line of sight, one’s gaze"],
        ["hiragana":"しっと","kanji":"嫉妬","meaning":"jealousy, envy"],
        ["hiragana":"そこなう","kanji":"損なう","meaning":"to harm, to hurt, to injure"],
        ["hiragana":"すいこう","kanji":"遂行","meaning":"accomplishment, execution"],
        ["hiragana":"とりひき","kanji":"取引","meaning":"transactions, dealings"],
        ["hiragana":"ととのえる","kanji":"整える","meaning":"to put in order, to adjust"],
        ["hiragana":"ちょくめん","kanji":"直面","meaning":"confrontation, to face"],
        ["hiragana":"ふくしゅう","kanji":"復讐","meaning":"revenge"],
        ["hiragana":"はんえい","kanji":"繁栄","meaning":"prosperity, thriving"],
        ["hiragana":"へんどう","kanji":"変動","meaning":"change, fluctuation"],
        ["hiragana":"いぞん","kanji":"依存","meaning":"dependence, reliance"],
        ["hiragana":"じぎょう","kanji":"事業","meaning":"project; business; industry; operations; service"],
        ["hiragana":"かいにゅう","kanji":"介入","meaning":"intervention"],
        ["hiragana":"かけ","kanji":"賭け","meaning":"betting, gambling"],
        ["hiragana":"かくほ","kanji":"確保","meaning":"securing; obtaining; ensuring; guarantee"],
        ["hiragana":"けいげん","kanji":"軽減","meaning":"abatement; reduction"],
        ["hiragana":"きてい","kanji":"規定","meaning":"stipulation; provision; regulation; rule"],
        ["hiragana":"おもに","kanji":"重荷","meaning":"load, heavy burden"],
        ["hiragana":"おろか","kanji":"愚か","meaning":"foolish, stupid"]
    ]
    
    var n1ch22array = [
        ["hiragana":"ろんり","kanji":"論理","meaning":"logic, logical"],
        ["hiragana":"さいよう","kanji":"採用","meaning":"adoption; appointment; employment; recruitment"],
        ["hiragana":"せいとう","kanji":"正当","meaning":"just, justifiable, right"],
        ["hiragana":"しめい","kanji":"使命","meaning":"mission; errand; task; duty; obligation"],
        ["hiragana":"しんか","kanji":"進化","meaning":"evolution; progress"],
        ["hiragana":"しょうちょう","kanji":"象徴","meaning":"symbol"],
        ["hiragana":"しょうめつ","kanji":"消滅","meaning":"extinction, extinguishment"],
        ["hiragana":"そち","kanji":"措置","meaning":"measure, measures, step"],
        ["hiragana":"そんしつ","kanji":"損失","meaning":"loss"],
        ["hiragana":"たっせい","kanji":"達成","meaning":"achievement; accomplishment; realization"],
        ["hiragana":"つげる","kanji":"告げる","meaning":"to tell, to inform"],
        ["hiragana":"うんえい","kanji":"運営","meaning":"management; administration; operation"],
        ["hiragana":"ようけん","kanji":"用件","meaning":"thing to be done; information that should be conveyed"]
    ]
    
    //JLPT N2
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
        ["hiragana":"はんかん","kanji":"反感","meaning":"antipathy; antagonism; animosity; ill feeling"],
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
        ["hiragana":"じゅうじつ","kanji":"充実","meaning":"fullness; completion; enhancement; enrichment"],
        ["hiragana":"かがやき","kanji":"輝き","meaning":"brightness; brilliance; radiance; glitter"],
        ["hiragana":"かいさい","kanji":"開催","meaning":"holding"],
        ["hiragana":"かくじ","kanji":"各自","meaning":"each"],
        ["hiragana":"かくやす","kanji":"格安","meaning":"cheap; reasonable"],
        ["hiragana":"かつじ","kanji":"活字","meaning":"printing type; movable type; printed text; print"],
        ["hiragana":"かつやく","kanji":"活躍","meaning":"activity"],
        ["hiragana":"きをおとす","kanji":"気を落とす","meaning":"to be discouraged; to be disheartened"],
        ["hiragana":"きんちょうかん","kanji":"緊張感","meaning":"feeling of tension; tension; nervousness"],
        ["hiragana":"こんき","kanji":"根気","meaning":"patience; perseverance; persistence; tenacity"],
        ["hiragana":"こうひんしつ","kanji":"高品質","meaning":"high quality"],
        ["hiragana":"こうじょう","kanji":"向上","meaning":"rise; improvement; advancement; progress"],
        ["hiragana":"こうり","kanji":"小売","meaning":"retail"],
        ["hiragana":"こうざ","kanji":"講座","meaning":"course"],
        ["hiragana":"くりかえし","kanji":"繰り返し","meaning":"repetition; repeat; reiteration; refrain"],
        ["hiragana":"きゅうびょう","kanji":"急病","meaning":"sudden illness"],
        ["hiragana":"もちだす","kanji":"持ち出す","meaning":"to bring out from where it belongs; to mention something; to broach a topic"]
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
        ["hiragana":"たいさく","kanji":"対策","meaning":"measure; provision; countermeasure; counterplan"],
        ["hiragana":"たんしゅく","kanji":"短縮","meaning":"shortening; reduction; curtailment; abbreviation"],
        ["hiragana":"ていいん","kanji":"定員","meaning":"fixed number"],
        ["hiragana":"ていれ","kanji":"手入れ","meaning":"care; looking after; repair; maintenance"],
        ["hiragana":"ていし","kanji":"停止","meaning":"stoppage; halt; standstill; ceasing"]
    ]
    
    var n2ch4array = [
        ["hiragana":"てもと","kanji":"手元","meaning":"at hand; on hand; nearby; close at hand"],
        ["hiragana":"てんきん","kanji":"転勤","meaning":"job transfer; job relocation; intra-company transfer"],
        ["hiragana":"とりつく","kanji":"取り付く","meaning":"to cling to; to hold on to; to set about doing"],
        ["hiragana":"とりあげる","kanji":"取り上げる","meaning":"to pick up; to adopt"],
        ["hiragana":"とざんか","kanji":"登山家","meaning":"mountain climber; mountaineer"],
        ["hiragana":"つけくわえる","kanji":"付け加える","meaning":"to add"],
        ["hiragana":"つみかさなる","kanji":"積み重なる","meaning":"to pile up; to stack up; to accumulate"],
        ["hiragana":"わかわかしい","kanji":"若々しい","meaning":"youthful; young; young-looking"],
        ["hiragana":"やくそくごと","kanji":"約束事","meaning":"promise; vow; engagement; rule; resolution"],
        ["hiragana":"よろおそく","kanji":"夜遅く","meaning":"late at night; at a late hour"],
        ["hiragana":"ゆうりょく","kanji":"有力","meaning":"influential; prominent; strong; likely; plausible"],
        ["hiragana":"ざつだん","kanji":"雑談","meaning":"chatting; idle talk"],
        ["hiragana":"ぜんはん","kanji":"前半","meaning":"first half"],
        ["hiragana":"ぞくしゅつ","kanji":"続出","meaning":"appearing one after another"],
        ["hiragana":"ぞうげん","kanji":"増減","meaning":"increase and decrease; fluctuation"],
        ["hiragana":"あまやかす","kanji":"甘やかす","meaning":"to pamper; to spoil"],
        ["hiragana":"あともどり","kanji":"後戻り","meaning":"going backward; turning back; retrogression"],
        ["hiragana":"ちかづく","kanji":"近づく","meaning":"to approach; to get close; to get acquainted with"],
        ["hiragana":"ちゅうじつ","kanji":"忠実","meaning":"faithful; devoted; loyal; honest; true"],
        ["hiragana":"ふかまる","kanji":"深まる","meaning":"to deepen; to heighten; to intensify"]
    ]
    
    var n2ch5array = [
        ["hiragana":"げんさく","kanji":"原作","meaning":"original work"],
        ["hiragana":"げんさん","kanji":"原産","meaning":"place of origin; habitat"],
        ["hiragana":"はかまいり","kanji":"墓参り","meaning":"visit to a grave"],
        ["hiragana":"はじ","kanji":"恥","meaning":"shame; embarrassment; disgrace"],
        ["hiragana":"はりがみ","kanji":"張り紙","meaning":"paper patch; poster; sticker; label"],
        ["hiragana":"ひろげる","kanji":"広げる","meaning":"to spread; to expand; to enlarge; to widen; to broaden"],
        ["hiragana":"じっち","kanji":"実地","meaning":"practice"],
        ["hiragana":"じかく","kanji":"自覚","meaning":"self-consciousness; self-awareness"],
        ["hiragana":"じもと","kanji":"地元","meaning":"home area; home town; local"],
        ["hiragana":"じっせき","kanji":"実績","meaning":"achievements; accomplishments; past results"],
        ["hiragana":"じっし","kanji":"実施","meaning":"enforcement; implementation; putting into practice"],
        ["hiragana":"じゅどうてき","kanji":"受動的","meaning":"passive"],
        ["hiragana":"じゅこう","kanji":"受講","meaning":"attend a lecture"],
        ["hiragana":"じゅうまん","kanji":"充満","meaning":"being filled with; being full of; permeation"],
        ["hiragana":"かげき","kanji":"過激","meaning":"extreme; radical"],
        ["hiragana":"かいてん","kanji":"回転","meaning":"rotation"],
        ["hiragana":"かっこうつける","kanji":"格好つける","meaning":"to affect a stylish air; to try to look good"],
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
        ["hiragana":"ききて","kanji":"聞き手","meaning":"hearer; listener; audience; interviewer"],
        ["hiragana":"きせい","kanji":"帰省","meaning":"homecoming; returning home"],
        ["hiragana":"こべつ","kanji":"個別","meaning":"particular case; discrete; individual; separate"],
        ["hiragana":"こまやか","kanji":"細やか","meaning":"tender; caring; thoughtful; detailed; attentive"],
        ["hiragana":"こんじょう","kanji":"根性","meaning":"willpower; guts; determination; grit; spirit"],
        ["hiragana":"こうせん","kanji":"光線","meaning":"beam; light ray"],
        ["hiragana":"くうかん","kanji":"空間","meaning":"space; room; airspace"],
        ["hiragana":"くうそう","kanji":"空想","meaning":"daydream; fantasy; fancy; vision"],
        ["hiragana":"きょうかい","kanji":"協会","meaning":"association; society; organization"],
        ["hiragana":"めいもん","kanji":"名門","meaning":"noted family; noble family; prestigious school"],
        ["hiragana":"もりあがる","kanji":"盛り上がる","meaning":"to swell; to rise; to bulge; to get excited"],
        ["hiragana":"むじょうけん","kanji":"無条件","meaning":"unconditional"],
        ["hiragana":"ねっこ","kanji":"根っこ","meaning":"root"]
    ]
    
    var n2ch7array = [
        ["hiragana":"ねずよい","kanji":"根強い","meaning":"firmly rooted; deep-seated"],
        ["hiragana":"のうこう","kanji":"濃厚","meaning":"rich"],
        ["hiragana":"おもいつく","kanji":"思いつく","meaning":"to come into one's mind; to be struck with an idea"],
        ["hiragana":"らいねんど","kanji":"来年度","meaning":"next year; next fiscal year"],
        ["hiragana":"りんじ","kanji":"臨時","meaning":"temporary; provisional; interim; special"],
        ["hiragana":"りてん","kanji":"利点","meaning":"advantage; point in favor"],
        ["hiragana":"ろんせん","kanji":"論戦","meaning":"verbal dispute"],
        ["hiragana":"りょうしょう","kanji":"了承","meaning":"acknowledgement; understanding"],
        ["hiragana":"さいしょうげん","kanji":"最小限","meaning":"minimum; lowest"],
        ["hiragana":"さいていげん","kanji":"最低限","meaning":"minimum; at the very least"],
        ["hiragana":"さきざき","kanji":"先々","meaning":"distant future; inevitable future; places one goes to"],
        ["hiragana":"さっそく","kanji":"早速","meaning":"at once; immediately; promptly"],
        ["hiragana":"せいそう","kanji":"清掃","meaning":"cleaning; garbage collection"],
        ["hiragana":"せんしゅつ","kanji":"選出","meaning":"election; selection; choice"],
        ["hiragana":"せおう","kanji":"背負う","meaning":"to carry on one's back; to be burdened with"],
        ["hiragana":"しんらいせい","kanji":"信頼性","meaning":"credibility; confidence; reliability"],
        ["hiragana":"しゅっぱんしゃ","kanji":"出版社","meaning":"publisher; publishing company"],
        ["hiragana":"しゅっぱつてん","kanji":"出発点","meaning":"starting point; point of departure"],
        ["hiragana":"しゅっしゃ","kanji":"出社","meaning":"going to work"],
        ["hiragana":"そうおう","kanji":"相応","meaning":"suitable; appropriate; befitting; proper"]
    ]
    
    var n2ch8array = [
        ["hiragana":"そうたいてき","kanji":"相対的","meaning":"relative"],
        ["hiragana":"すいへい","kanji":"水平","meaning":"horizontal; level; even"],
        ["hiragana":"すいとる","kanji":"吸い取る","meaning":"to absorb; to squeeze"],
        ["hiragana":"たいせん","kanji":"対戦","meaning":"waging war; competition"],
        ["hiragana":"たりょう","kanji":"多量","meaning":"large quantity; large amount"],
        ["hiragana":"たてかえる","kanji":"立て替える","meaning":"o pay someone else's debt as a loan"],
        ["hiragana":"とうけい","kanji":"統計","meaning":"statistics"],
        ["hiragana":"とうたつ","kanji":"到達","meaning":"reaching; attaining; arrival"],
        ["hiragana":"つぶす","kanji":"潰す","meaning":"to smash; to crush; to flatten; to kill"],
        ["hiragana":"つうち","kanji":"通知","meaning":"notice; notification; report; posting"],
        ["hiragana":"うちがわ","kanji":"内側","meaning":"inside; interior; inner part"],
        ["hiragana":"わしょく","kanji":"和食","meaning":"Japanese food; Japanese cuisine"],
        ["hiragana":"ざんぎょうだい","kanji":"残業代","meaning":"overtime pay; overtime payment"],
        ["hiragana":"ぜいかん","kanji":"税関","meaning":"customs; customs house"],
        ["hiragana":"ぞくぞく","kanji":"続々","meaning":"successively; one after another"],
        ["hiragana":"あわただしい","kanji":"慌ただしい","meaning":"busy; hurried; confused; flurried"],
        ["hiragana":"どうちゅう","kanji":"道中","meaning":"during the journey; on the way; while travelling"],
        ["hiragana":"ふく","kanji":"副","meaning":"assistant; associate; vice-; sub-; deputy"],
        ["hiragana":"がい","kanji":"街","meaning":"...street; ...quarter; ...district"],
        ["hiragana":"がくれき","kanji":"学歴","meaning":"academic background"]
    ]
    
    var n2ch9array = [
        ["hiragana":"はっさん","kanji":"発散","meaning":"emission; radiation; diffusion; letting out"],
        ["hiragana":"へいぼん","kanji":"平凡","meaning":"ordinary; common; mediocre; undistinguished"],
        ["hiragana":"ほじょ","kanji":"補助","meaning":"assistance; support; aid; help; subsidy; supplement"],
        ["hiragana":"じこ","kanji":"自己","meaning":"self; oneself"],
        ["hiragana":"じょれつ","kanji":"序列","meaning":"rank; ranking order; hierarchy"],
        ["hiragana":"じょうはんしん","kanji":"上半身","meaning":"upper half of"],
        ["hiragana":"かなう","kanji":"叶う","meaning":"to come true"],
        ["hiragana":"かし","kanji":"歌詞","meaning":"song lyrics; words of a song; libretto"],
        ["hiragana":"けいげん","kanji":"軽減","meaning":"abatement; reduction"],
        ["hiragana":"ききとる","kanji":"聞き取る","meaning":"to catch"],
        ["hiragana":"こだわる","kanji":"拘る","meaning":"to fuss over; to be particular about"],
        ["hiragana":"こうはん","kanji":"後半","meaning":"second half; latter half"],
        ["hiragana":"こうお","kanji":"好悪","meaning":"likes and dislikes"],
        ["hiragana":"こづかい","kanji":"小遣い","meaning":"pocket money; spending money; pin money"],
        ["hiragana":"きょひ","kanji":"拒否","meaning":"refusal; rejection; denial; veto"],
        ["hiragana":"きょうゆう","kanji":"共有","meaning":"joint ownership; co-ownership; sharing"],
        ["hiragana":"きゅう","kanji":"旧","meaning":"ex-; former; old"],
        ["hiragana":"めぐむ","kanji":"恵む","meaning":"to bless; to show mercy to; to give"],
        ["hiragana":"めいぶつ","kanji":"名物","meaning":"famous product; special product; specialty"]
    ]
    
    var n2ch10array = [
        ["hiragana":"みたす","kanji":"満たす","meaning":"to satisfy"],
        ["hiragana":"もはん","kanji":"模範","meaning":"exemplar; model; example; pattern"],
        ["hiragana":"なだらか","kanji":"傾らか","meaning":"gently sloping; gentle; easy; smooth"],
        ["hiragana":"にんしき","kanji":"認識","meaning":"recognition; awareness; perception; understanding"],
        ["hiragana":"おどろき","kanji":"驚き","meaning":"surprise; astonishment; wonder; amazement"],
        ["hiragana":"おとく","kanji":"お得","meaning":"economical; bargain; good value; good-value"],
        ["hiragana":"らいにち","kanji":"来日","meaning":"arrival in Japan; coming to Japan; visit to Japan"],
        ["hiragana":"らいじょう","kanji":"来場","meaning":"attendance"],
        ["hiragana":"りっしょく","kanji":"立食","meaning":"stand-up meal; buffet"],
        ["hiragana":"さいそく","kanji":"催促","meaning":"pressing; urging; demanding; demand"],
        ["hiragana":"さまたげる","kanji":"妨げる","meaning":"to disturb; to prevent; to obstruct; to hinder"],
        ["hiragana":"さつえい","kanji":"撮影","meaning":"photography"],
        ["hiragana":"せっけいず","kanji":"設計図","meaning":"plan; blueprint"],
        ["hiragana":"せんざい","kanji":"洗剤","meaning":"detergent; cleanser; washing material"],
        ["hiragana":"せってい","kanji":"設定","meaning":"establishment; creation; posing"],
        ["hiragana":"しがんしゃ","kanji":"志願者","meaning":"applicant; candidate"],
        ["hiragana":"しょ","kanji":"諸","meaning":"various; many; several"],
        ["hiragana":"しょくひ","kanji":"食費","meaning":"food expense"],
        ["hiragana":"しょくせいかつ","kanji":"食生活","meaning":"eating habits"],
        ["hiragana":"しゅうへん","kanji":"周辺","meaning":"circumference; environs; around; in the vicinity of"]
    ]
    
    var n2ch11array = [
        ["hiragana":"そとがわ","kanji":"外側","meaning":"exterior; outside; outer; external; lateral"],
        ["hiragana":"たいない","kanji":"体内","meaning":"interior of the body"],
        ["hiragana":"たいてき","kanji":"大敵","meaning":"great rival; powerful enemy; archenemy"],
        ["hiragana":"ためる","kanji":"溜める","meaning":"to amass; to accumulate; to store; to leave unpaid"],
        ["hiragana":"とくしょく","kanji":"特色","meaning":"characteristic; feature; idiosyncrasy; personal color"],
        ["hiragana":"とりのぞく","kanji":"取り除く","meaning":"to remove; to deinstall; to take away"],
        ["hiragana":"としん","kanji":"都心","meaning":"city centre"],
        ["hiragana":"よくばる","kanji":"欲張る","meaning":"to covet; to lust for"],
        ["hiragana":"ゆるやか","kanji":"緩やか","meaning":"loose; slack; gentle"],
        ["hiragana":"ざいがく","kanji":"在学","meaning":"attending"],
        ["hiragana":"ぞうだい","kanji":"増大","meaning":"enlargement; increase"],
        ["hiragana":"あきらめ","kanji":"諦め","meaning":"resignation; acceptance; consolation"],
        ["hiragana":"あこがれ","kanji":"憧れ","meaning":"yearning; longing; aspiration; admiration"],
        ["hiragana":"べっそう","kanji":"別荘","meaning":"holiday house; vacation home; villa; prison; jail"],
        ["hiragana":"ぼくじょう","kanji":"牧場","meaning":"farm"],
        ["hiragana":"ぶっし","kanji":"物資","meaning":"goods; materials; commodities; resources; supplies"],
        ["hiragana":"えほん","kanji":"絵本","meaning":"picture book"],
        ["hiragana":"ふどうさん","kanji":"不動産","meaning":"real estate"],
        ["hiragana":"ふくし","kanji":"福祉","meaning":"welfare; well-being; social welfare; social service"],
        ["hiragana":"げんこう","kanji":"原稿","meaning":"manuscript; copy; draft; notes; contribution"]
    ]
    
    var n2ch12array = [
        ["hiragana":"げんそう","kanji":"幻想","meaning":"fantasy; illusion; vision; dream"],
        ["hiragana":"ぎだい","kanji":"議題","meaning":"topic of discussion; agenda"],
        ["hiragana":"ぎょうれつ","kanji":"行列","meaning":"line; queue; procession; parade"],
        ["hiragana":"ひきょう","kanji":"卑怯","meaning":"cowardice; meanness; unfairness"],
        ["hiragana":"ひろびろ","kanji":"広々","meaning":"extensive; spacious"],
        ["hiragana":"いりかえる","kanji":"入り替える","meaning":"to replace; to substitute; to shift"],
        ["hiragana":"じょうい","kanji":"上位","meaning":"superior"],
        ["hiragana":"じょうおん","kanji":"常温","meaning":"normal temperature; room temperature"],
        ["hiragana":"じゅんじょ","kanji":"順序","meaning":"order; sequence; procedure"],
        ["hiragana":"じゅしん","kanji":"受診","meaning":"having a medical examination; seeing a doctor"],
        ["hiragana":"かちかん","kanji":"価値観","meaning":"sense of values; values; value system"],
        ["hiragana":"かんちがい","kanji":"勘違い","meaning":"misunderstanding; mistaken idea; wrong guess"],
        ["hiragana":"かねつ","kanji":"加熱","meaning":"heating; application of heat"],
        ["hiragana":"かんそく","kanji":"観測","meaning":"observation; survey; measurement"],
        ["hiragana":"きりとる","kanji":"切り取る","meaning":"to cut off; to tear off; to tear out"],
        ["hiragana":"こうれいしゃ","kanji":"高齢者","meaning":"old person; old people"],
        ["hiragana":"こうりつ","kanji":"効率","meaning":"efficiency"],
        ["hiragana":"こうさつ","kanji":"考察","meaning":"consideration; inquiry; enquiry; investigation"],
        ["hiragana":"こうざ","kanji":"口座","meaning":"account"],
        ["hiragana":"きゃっかんてき","kanji":"客観的","meaning":"objective"]
    ]
    
    var n2ch13array = [
        ["hiragana":"きょうふう","kanji":"強風","meaning":"strong wind; high wind; moderate gale"],
        ["hiragana":"きょうよう","kanji":"教養","meaning":"cultivation; refinement; culture; education"],
        ["hiragana":"まんいん","kanji":"満員","meaning":"full house; no vacancy; full"],
        ["hiragana":"めぐみ","kanji":"恵み","meaning":"blessing; grace"],
        ["hiragana":"みぶりてぶり","kanji":"身振り手振り","meaning":"gestures; gesturing"],
        ["hiragana":"もより","kanji":"最寄り","meaning":"nearest; neighboring; nearby"],
        ["hiragana":"むすびつく","kanji":"結びつく","meaning":"to be related; to be connected; to be joined together; to result in; to lead to; to bring about"],
        ["hiragana":"むすう","kanji":"無数","meaning":"innumerable; countless; numberless"],
        ["hiragana":"なんじゃく","kanji":"軟弱","meaning":"weakness"],
        ["hiragana":"なりたつ","kanji":"成り立つ","meaning":"to consist of; to be made up of"],
        ["hiragana":"ねんきん","kanji":"年金","meaning":"annuity; pension"],
        ["hiragana":"にくい","kanji":"憎い","meaning":"hateful; abominable; poor-looking; detestable"],
        ["hiragana":"おおめに","kanji":"多目に","meaning":"plenty; lots"],
        ["hiragana":"おとなしい","kanji":"大人しい","meaning":"obedient; docile; quiet"],
        ["hiragana":"らんぼう","kanji":"乱暴","meaning":"violence; assault; running riot; rough"],
        ["hiragana":"うらめん","kanji":"裏面","meaning":"back; reverse; other side; inside; tails"],
        ["hiragana":"さいしゅうび","kanji":"最終日","meaning":"last day; final day"],
        ["hiragana":"せっする","kanji":"接する","meaning":"to touch; to come in contact with"],
        ["hiragana":"しめる","kanji":"湿る","meaning":"to become damp; to become moist; to become wet"],
        ["hiragana":"しんや","kanji":"深夜","meaning":"late at night"]
    ]
    
    var n2ch14array = [
        ["hiragana":"しょっきるい","kanji":"食器類","meaning":"dinnerware; cutlery"],
        ["hiragana":"しょうしか","kanji":"少子化","meaning":"declining birth rates; decrease in the number of children"],
        ["hiragana":"そう","kanji":"沿う","meaning":"to run along; to run beside; to stick to"],
        ["hiragana":"そうぞう","kanji":"創造","meaning":"creation"],
        ["hiragana":"たんきかん","kanji":"短期間","meaning":"short term; short time"],
        ["hiragana":"てんちょう","kanji":"店長","meaning":"shop manager"],
        ["hiragana":"てさぎょう","kanji":"手作業","meaning":"manual labor; manual procedures"],
        ["hiragana":"てんさい","kanji":"天才","meaning":"genius; prodigy; natural gift"],
        ["hiragana":"とじこもる","kanji":"閉じこもる","meaning":"to seclude oneself; to shut oneself away"],
        ["hiragana":"ととのう","kanji":"整う","meaning":"to be ready; to be in order; to be well-ordered"],
        ["hiragana":"とうろん","kanji":"討論","meaning":"debate; discussion"],
        ["hiragana":"うんがよい","kanji":"運が良い","meaning":"lucky"],
        ["hiragana":"うんそう","kanji":"運送","meaning":"transport; freight; shipping"],
        ["hiragana":"よびかける","kanji":"呼びかける","meaning":"to call out to; to hail; to appeal"],
        ["hiragana":"よていひょう","kanji":"予定表","meaning":"schedule; program; programme; itinerary"],
        ["hiragana":"あとまわし","kanji":"後回し","meaning":"putting off; postponing"],
        ["hiragana":"ばいぞう","kanji":"倍増","meaning":"double"],
        ["hiragana":"ふあんてい","kanji":"不安定","meaning":"instability; insecurity; crankiness"],
        ["hiragana":"ふきそく","kanji":"不規則","meaning":"irregularity; unsteadiness; disorderly"],
        ["hiragana":"ふめいりょう","kanji":"不明瞭","meaning":"dimness; obscurity; indistinctness; unclear"]
    ]
    
    var n2ch15array = [
        ["hiragana":"ふさいよう","kanji":"不採用","meaning":"rejection"],
        ["hiragana":"がんぼう","kanji":"願望","meaning":"desire; wish; aspiration"],
        ["hiragana":"ぎょうじ","kanji":"行事","meaning":"event; function"],
        ["hiragana":"はっそう","kanji":"発想","meaning":"idea; conception; way of thinking"],
        ["hiragana":"へんしゅう","kanji":"編集","meaning":"editing; compilation"],
        ["hiragana":"ひする","kanji":"秘する","meaning":"to keep secret; to conceal"],
        ["hiragana":"いちだん","kanji":"一段","meaning":"more; much more; still more; all the more"],
        ["hiragana":"いちれい","kanji":"一例","meaning":"example; an instance"],
        ["hiragana":"いぎ","kanji":"意義","meaning":"meaning; significance"],
        ["hiragana":"いくじ","kanji":"育児","meaning":"childcare; child-rearing; nursing; upbringing"],
        ["hiragana":"じどう","kanji":"児童","meaning":"children; juvenile"],
        ["hiragana":"じょうぶ","kanji":"上部","meaning":"top part; surface"],
        ["hiragana":"じょうしょう","kanji":"上昇","meaning":"rising; ascending; climbing"],
        ["hiragana":"じゅんのう","kanji":"順応","meaning":"adaptation; accommodation; adjustment"],
        ["hiragana":"かたむく","kanji":"傾く","meaning":"to incline toward; to slant; to be prone to"],
        ["hiragana":"かたづく","kanji":"片付く","meaning":"to be put in order; to be solved"],
        ["hiragana":"かつりょく","kanji":"活力","meaning":"vitality; energy; dynamism"],
        ["hiragana":"けっちゃく","kanji":"決着","meaning":"conclusion; decision; end; settlement"],
        ["hiragana":"けんきょ","kanji":"謙虚","meaning":"modest; humble"],
        ["hiragana":"きたえる","kanji":"鍛える","meaning":"to forge; to temper; to drill; to train"]
    ]
    
    var n2ch16array = [
        ["hiragana":"きょうしゅく","kanji":"恐縮","meaning":"being thankful; being sorry"],
        ["hiragana":"きゅうじん","kanji":"求人","meaning":"recruiting; job offer; job vacancy"],
        ["hiragana":"まねる","kanji":"真似る","meaning":"to mimic; to imitate"],
        ["hiragana":"みなれる","kanji":"見慣れる","meaning":"to become used to seeing; to be familiar with"],
        ["hiragana":"おいもとめる","kanji":"追い求める","meaning":"to pursue"],
        ["hiragana":"おんけい","kanji":"恩恵","meaning":"grace; favor; favour; blessing; benefit"],
        ["hiragana":"らいてん","kanji":"来店","meaning":"coming to a store"],
        ["hiragana":"さかのぼる","kanji":"遡る","meaning":"to go upstream; to go back"],
        ["hiragana":"さしひく","kanji":"差し引く","meaning":"to deduct; to make allowances for something"],
        ["hiragana":"せいりつ","kanji":"成立","meaning":"formation; materialization; coming into existence"],
        ["hiragana":"せいさんしゃ","kanji":"生産者","meaning":"manufacturer; producer"],
        ["hiragana":"せんもんてん","kanji":"専門店","meaning":"shop specializing in a few types of product"],
        ["hiragana":"しひょう","kanji":"指標","meaning":"index; indices; indicator"],
        ["hiragana":"しりょく","kanji":"視力","meaning":"eyesight"],
        ["hiragana":"しょかい","kanji":"初回","meaning":"first time; first innings; initial attempt"],
        ["hiragana":"しょき","kanji":"初期","meaning":"early"],
        ["hiragana":"しょうひしゃ","kanji":"消費者","meaning":"consumer"],
        ["hiragana":"しょうりゃく","kanji":"省略","meaning":"omission; abbreviation; abridgement"],
        ["hiragana":"そろえる","kanji":"揃える","meaning":"to collect; to get together; to complete"],
        ["hiragana":"たいしゃ","kanji":"退社","meaning":"resignation; leaving office; leaving work"]
    ]
    
    var n2ch17array = [
        ["hiragana":"ていか","kanji":"定価","meaning":"list price; regular price; established price"],
        ["hiragana":"ていこうかん","kanji":"抵抗感","meaning":"antipathy; reluctance; resistance"],
        ["hiragana":"といかける","kanji":"問いかける","meaning":"to ask a question"],
        ["hiragana":"うむ","kanji":"有無","meaning":"existence or nonexistence; presence or absence"],
        ["hiragana":"うつる","kanji":"映る","meaning":"to be reflected; to harmonize with"],
        ["hiragana":"わりこむ","kanji":"割り込む","meaning":"to cut into"],
        ["hiragana":"やぶれる","kanji":"破れる","meaning":"to get torn; to tear; to rip; to wear out"],
        ["hiragana":"ゆううつ","kanji":"憂鬱","meaning":"depression; melancholy; dejection; gloom"],
        ["hiragana":"じょうりく","kanji":"上陸","meaning":"landing; disembarkation; landfall"],
        ["hiragana":"あいま","kanji":"合間","meaning":"interval; break; pause; spare moment"],
        ["hiragana":"あやしい","kanji":"怪しい","meaning":"suspicious; dubious; doubtful; dodgy; suspicious"],
        ["hiragana":"あざやか","kanji":"鮮やか","meaning":"vivid; bright; brilliant; vibrant; skillful"],
        ["hiragana":"びよういん","kanji":"美容院","meaning":"beauty parlor; beauty salon; hairdressing salon"],
        ["hiragana":"ぼうだい","kanji":"膨大","meaning":"huge; vast; enormous; large; swelling; expansion"],
        ["hiragana":"ちきゅうおんだんか","kanji":"地球温暖化","meaning":"global warming"],
        ["hiragana":"ちょうこくか","kanji":"彫刻家","meaning":"engraver; carver; sculptor"],
        ["hiragana":"ふさぐ","kanji":"塞ぐ","meaning":"to stop up; to close up; to block"],
        ["hiragana":"ごらく","kanji":"娯楽","meaning":"pleasure; amusement"],
        ["hiragana":"はんばいしゃ","kanji":"販売者","meaning":"seller; vendor"],
        ["hiragana":"へんしん","kanji":"返信","meaning":"reply"]
    ]
    
    var n2ch18array = [
        ["hiragana":"ほいくしょ","kanji":"保育所","meaning":"nursery school; nursery"],
        ["hiragana":"ほんかく","kanji":"本格","meaning":"original method or procedure; serious; orthodox; classical; genuine"],
        ["hiragana":"いいかげん","kanji":"いい加減","meaning":"irresponsible; careless; vague"],
        ["hiragana":"いきぬき","kanji":"息抜き","meaning":"taking a breather; relaxation; vent hole"],
        ["hiragana":"じかい","kanji":"次回","meaning":"next time"],
        ["hiragana":"じぎょう","kanji":"事業","meaning":"project; enterprise; business; industry; operations; venture; service"],
        ["hiragana":"じっせん","kanji":"実践","meaning":"practice; putting into practice; implementation"],
        ["hiragana":"じょうりく","kanji":"上陸","meaning":"landing; disembarkation; landfall"],
        ["hiragana":"じゅしょう","kanji":"受賞","meaning":"winning"],
        ["hiragana":"じゅうなん","kanji":"柔軟","meaning":"flexible; lithe; soft; pliable"],
        ["hiragana":"じゅうたくち","kanji":"住宅地","meaning":"housing district; residential district"],
        ["hiragana":"かいせつ","kanji":"解説","meaning":"explanation; commentary; exposition; elucidation"],
        ["hiragana":"かいやく","kanji":"解約","meaning":"cancellation of contract"],
        ["hiragana":"かくじゅう","kanji":"拡充","meaning":"expansion"],
        ["hiragana":"かんじとる","kanji":"感じ取る","meaning":"to perceive; to sense; to take in; to feel"],
        ["hiragana":"かそく","kanji":"加速","meaning":"acceleration; speeding up"],
        ["hiragana":"けいさい","kanji":"掲載","meaning":"publication"],
        ["hiragana":"けいとう","kanji":"系統","meaning":"system; lineage; ancestry; family line; group"],
        ["hiragana":"けずる","kanji":"削る","meaning":"to shave"],
        ["hiragana":"きがおもい","kanji":"気が重い","meaning":"depressed; heavy-hearted; feeling reluctant"]
    ]
    
    var n2ch19array = [
        ["hiragana":"こがね","kanji":"小金","meaning":"small sum of money"],
        ["hiragana":"こうちょう","kanji":"好調","meaning":"favorable; promising; satisfactory; in good shape"],
        ["hiragana":"こうさく","kanji":"工作","meaning":"handicraft; manufacturing; maneuvering"],
        ["hiragana":"めだつ","kanji":"目立つ","meaning":"to be conspicuous; to stand out"],
        ["hiragana":"みだし","kanji":"見出し","meaning":"heading; headline; title; caption"],
        ["hiragana":"みつもりしょ","kanji":"見積書","meaning":"written estimate; quotation; quote"],
        ["hiragana":"もくざい","kanji":"木材","meaning":"lumber; timber; wood"],
        ["hiragana":"なごやか","kanji":"和やか","meaning":"mild; congenial; amicable; harmonious; peaceful"],
        ["hiragana":"なかにわ","kanji":"中庭","meaning":"courtyard; quadrangle; middle court"],
        ["hiragana":"なれ","kanji":"慣れ","meaning":"practice; practising; experience"],
        ["hiragana":"にゅうきん","kanji":"入金","meaning":"deposit; payment; money received; money due"],
        ["hiragana":"にゅうせいひん","kanji":"乳製品","meaning":"dairy products"],
        ["hiragana":"おいかえす","kanji":"追い返す","meaning":"to drive away; to turn away; to send away; to repel; to repulse"],
        ["hiragana":"おおごえ","kanji":"大声","meaning":"loud voice"],
        ["hiragana":"りょうたん","kanji":"両端","meaning":"both ends; either end; sitting on the fence"],
        ["hiragana":"さっきゅう","kanji":"早急","meaning":"immediate; prompt; quick; rapid; urgent; pressing"],
        ["hiragana":"せいしつ","kanji":"性質","meaning":"nature; property; disposition"],
        ["hiragana":"せんせんしゅう","kanji":"先先週","meaning":"week before last"],
        ["hiragana":"しゃない","kanji":"車内","meaning":"inside a train, car, etc."],
        ["hiragana":"しん","kanji":"芯","meaning":"wick; marrow; staple"]
    ]
    
    var n2ch20array = [
        ["hiragana":"しょうぎょう","kanji":"商業","meaning":"commerce; trade; business"],
        ["hiragana":"しゅつえんしゃ","kanji":"出演者","meaning":"performer; entertainer; actor"],
        ["hiragana":"そくてい","kanji":"測定","meaning":"measurement"],
        ["hiragana":"たいじょう","kanji":"退場","meaning":"exit"],
        ["hiragana":"たいおう","kanji":"対応","meaning":"correspondence"],
        ["hiragana":"たっせい","kanji":"達成","meaning":"achievement; attainment; accomplishment; realization"],
        ["hiragana":"とういつ","kanji":"統一","meaning":"unity; consolidation; uniformity; unification"],
        ["hiragana":"つぶやく","kanji":"呟く","meaning":"to mutter; to murmur; to grumble"],
        ["hiragana":"つかいわける","kanji":"使い分ける","meaning":"to use properly; to use"],
        ["hiragana":"つみかさねる","kanji":"積み重ねる","meaning":"to pile up; to accumulate"],
        ["hiragana":"つむ","kanji":"積む","meaning":"to pile up; to stack; to load"],
        ["hiragana":"よるがた","kanji":"夜型","meaning":"nocturnal"],
        ["hiragana":"ようりょう","kanji":"容量","meaning":"capacity; volume"],
        ["hiragana":"ようしき","kanji":"様式","meaning":"style; form; pattern"],
        ["hiragana":"ゆうひ","kanji":"夕日","meaning":"evening sun; setting sun"],
        ["hiragana":"すべらす","kanji":"滑らす","meaning":"to shift; to slide"],
        ["hiragana":"ずずうしい","kanji":"図々しい","meaning":"impudent; shameless; brazen; audacious; cheeky"],
        ["hiragana":"あいまい","kanji":"曖昧","meaning":"vague; ambiguous; unclear"],
        ["hiragana":"あいしゃ","kanji":"愛社","meaning":"devotion to one’s company"],
        ["hiragana":"あんがい","kanji":"案外","meaning":"unexpectedly; surprisingly; unanticipated; unforeseen"]
    ]
    
    var n2ch21array = [
        ["hiragana":"ぶんたん","kanji":"分担","meaning":"taking on one’s share"],
        ["hiragana":"だんかい","kanji":"段階","meaning":"grade; level; stage; class; phase; steps; order"],
        ["hiragana":"ふきげん","kanji":"不機嫌","meaning":"pout; displeasure; ill humor; sullenness"],
        ["hiragana":"ふくめる","kanji":"含める","meaning":"to include"],
        ["hiragana":"ふれあい","kanji":"触れ合い","meaning":"contact; connectedness; rapport; mutual touching"],
        ["hiragana":"がようし","kanji":"画用紙","meaning":"drawing paper"],
        ["hiragana":"はなしあい","kanji":"話し合い","meaning":"discussion; conference"],
        ["hiragana":"はんすう","kanji":"半数","meaning":"half the number"],
        ["hiragana":"へいてん","kanji":"閉店","meaning":"closing up shop"],
        ["hiragana":"ひび","kanji":"日々","meaning":"every day; daily; day after day; days"],
        ["hiragana":"ひそか","kanji":"密か","meaning":"secret; private; surreptitious"],
        ["hiragana":"ほっする","kanji":"欲する","meaning":"to want; to desire"],
        ["hiragana":"いちめん","kanji":"一面","meaning":"one face; the whole surface; one aspect; one side"],
        ["hiragana":"いちらん","kanji":"一覧","meaning":"glance; summary; list; table; catalog; catalogue"],
        ["hiragana":"いいわけ","kanji":"言い訳","meaning":"excuse; explanation"],
        ["hiragana":"いんかん","kanji":"印鑑","meaning":"stamp; seal"],
        ["hiragana":"いぜん","kanji":"依然","meaning":"still; as yet; as it has been"],
        ["hiragana":"じょうきゅうしゃ","kanji":"上級者","meaning":"advanced learner; experienced person"],
        ["hiragana":"かがやかしい","kanji":"輝かしい","meaning":"brilliant; glorious; glittering; splendid"],
        ["hiragana":"かんりゃく","kanji":"簡略","meaning":"simple; simplicity; brief; brevity"]
    ]
    
    var n2ch22array = [
        ["hiragana":"けんしゅうかい","kanji":"研修会","meaning":"workshop; training course"],
        ["hiragana":"こころみ","kanji":"試み","meaning":"attempt; trial; experiment; endeavor"],
        ["hiragana":"ことばづかい","kanji":"言葉遣い","meaning":"speech; expression; wording; language"],
        ["hiragana":"こうりゅうかい","kanji":"交流会","meaning":"gathering; meetup; assembly; exchange meeting"],
        ["hiragana":"こうてい","kanji":"肯定","meaning":"affirmation"],
        ["hiragana":"こうよう","kanji":"紅葉","meaning":"autumn colors; fall colors; leaves changing color"],
        ["hiragana":"くうせき","kanji":"空席","meaning":"empty seat; unoccupied seat; vacancy; vacant post"],
        ["hiragana":"きゅうぎょう","kanji":"休業","meaning":"closed"],
        ["hiragana":"まどぐち","kanji":"窓口","meaning":"ticket window; teller window; counter"],
        ["hiragana":"みわける","kanji":"見分ける","meaning":"to distinguish; to tell apart; to differentiate"],
        ["hiragana":"むかんけい","kanji":"無関係","meaning":"unrelated"],
        ["hiragana":"むかしばなし","kanji":"昔話","meaning":"old tale; folk tale; legend; reminiscence"],
        ["hiragana":"おすすめ","kanji":"お勧め","meaning":"recommendation; advice; suggestion; encouragement"],
        ["hiragana":"りゃくす","kanji":"略す","meaning":"to abbreviate; to omit"],
        ["hiragana":"さいせい","kanji":"再生","meaning":"regeneration; reformation; playback"],
        ["hiragana":"せいしんりょく","kanji":"精神力","meaning":"emotional strength; force of will"],
        ["hiragana":"せんぎょうしゅふ","kanji":"専業主婦","meaning":"housewife"],
        ["hiragana":"しびれる","kanji":"痺れる","meaning":"to become numb; to go to sleep"],
        ["hiragana":"しがん","kanji":"志願","meaning":"aspiration; volunteering; desire; application"],
        ["hiragana":"しんこう","kanji":"進行","meaning":"moving forward"]
    ]
    
    var n2ch23array = [
        ["hiragana":"しろうと","kanji":"素人","meaning":"amateur; layman; ordinary person; novice"],
        ["hiragana":"しや","kanji":"視野","meaning":"field of vision; view; one's outlook"],
        ["hiragana":"そまる","kanji":"染まる","meaning":"to be dyed; to be infected; to be stained"],
        ["hiragana":"そうさく","kanji":"創作","meaning":"creation; production; creative work"],
        ["hiragana":"たいこう","kanji":"対抗","meaning":"opposition; antagonism"],
        ["hiragana":"たいしゅつ","kanji":"退出","meaning":"leaving"],
        ["hiragana":"てあし","kanji":"手足","meaning":"hands and feet; limbs"],
        ["hiragana":"てちょう","kanji":"手帳","meaning":"notebook; memo pad"],
        ["hiragana":"てんこうせい","kanji":"転校生","meaning":"transfer student; student changing schools"],
        ["hiragana":"とくしゅう","kanji":"特集","meaning":"feature"],
        ["hiragana":"とおまわり","kanji":"遠回り","meaning":"detour; roundabout way"],
        ["hiragana":"うすぐらい","kanji":"薄暗い","meaning":"dim; gloomy"],
        ["hiragana":"やきん","kanji":"夜勤","meaning":"night shift"],
        ["hiragana":"やむをえない","kanji":"やむを得ない","meaning":"cannot be helped; unavoidable"],
        ["hiragana":"ようひん","kanji":"用品","meaning":"articles; supplies; parts"],
        ["hiragana":"ずひょう","kanji":"図表","meaning":"chart; diagram; graph; figure"],
        ["hiragana":"あいちゃく","kanji":"愛着","meaning":"attachment; love; covetous affection"],
        ["hiragana":"あいらしい","kanji":"愛らしい","meaning":"pretty; charming; lovely; adorable"],
        ["hiragana":"あくじょうけん","kanji":"悪条件","meaning":"unfavorable conditions"],
        ["hiragana":"あせる","kanji":"焦る","meaning":"to be in a hurry; to be impatient; to be flustered"]
    ]
    
    var n2ch24array = [
        ["hiragana":"ぶんけい","kanji":"文系","meaning":"humanities, social sciences, and fine arts; liberal arts"],
        ["hiragana":"ちゅうじゅん","kanji":"中旬","meaning":"middle of a month; second third of a month"],
        ["hiragana":"ちゅうりんじょ","kanji":"駐輪所","meaning":"bicycle parking place"],
        ["hiragana":"だらしない","kanji":"だらし無い","meaning":"slovenly"],
        ["hiragana":"ふじゅうぶん","kanji":"不十分","meaning":"insufficient; inadequate; imperfect; shortage"],
        ["hiragana":"ふくらます","kanji":"膨らます","meaning":"to swell; to expand; to inflate; to bulge"],
        ["hiragana":"がいよう","kanji":"概要","meaning":"outline; summary; overview; abridgment; synopsis"],
        ["hiragana":"はやり","kanji":"流行り","meaning":"fashion; fad; vogue; craze"],
        ["hiragana":"ほいくえん","kanji":"保育園","meaning":"nursery school; day nursery; preschool"],
        ["hiragana":"ほこう","kanji":"歩行","meaning":"walk"],
        ["hiragana":"いてん","kanji":"移転","meaning":"moving; relocation; change of address; transfer"],
        ["hiragana":"じんざい","kanji":"人材","meaning":"capable person; human resources; personnel"],
        ["hiragana":"じっしつ","kanji":"実質","meaning":"substance; essence; real"],
        ["hiragana":"じたい","kanji":"辞退","meaning":"declining; refusal; nonacceptance; withdrawal"],
        ["hiragana":"かいほうかん","kanji":"開放感","meaning":"sense of space; spaciousness"],
        ["hiragana":"かくべつ","kanji":"格別","meaning":"particular; special; exceptional; especial"],
        ["hiragana":"けいと","kanji":"毛糸","meaning":"knitting wool; woollen yarn"],
        ["hiragana":"きじつ","kanji":"期日","meaning":"fixed date; settlement date"],
        ["hiragana":"きんむ","kanji":"勤務","meaning":"service; duty; work"],
        ["hiragana":"このたび","kanji":"この度","meaning":"this occasion; at this time; now"]
    ]
    
    var n2ch25array = [
        ["hiragana":"こそだて","kanji":"子育て","meaning":"child rearing; child raising; parenting"],
        ["hiragana":"ことがら","kanji":"事柄","meaning":"matter; thing; affair; circumstance"],
        ["hiragana":"こうえん","kanji":"公演","meaning":"public performance"],
        ["hiragana":"こうかん","kanji":"好感","meaning":"good feeling; good will; favorable impression"],
        ["hiragana":"きょくせん","kanji":"曲線","meaning":"curve"],
        ["hiragana":"まちなみ","kanji":"町並み","meaning":"townscape; street"],
        ["hiragana":"まきこむ","kanji":"巻き込む","meaning":"to roll up; to enfold; to swallow up; to involve"],
        ["hiragana":"みちあんない","kanji":"道案内","meaning":"guidance; showing the way; guide; guidepost"],
        ["hiragana":"もぐる","kanji":"潜る","meaning":"to dive"],
        ["hiragana":"もけい","kanji":"模型","meaning":"model; dummy; maquette"],
        ["hiragana":"ねびき","kanji":"値引き","meaning":"price reduction; discount"],
        ["hiragana":"にづくり","kanji":"荷造り","meaning":"packing; baling; crating"],
        ["hiragana":"おくびょう","kanji":"臆病","meaning":"cowardly; timid; easily frightened"],
        ["hiragana":"おやこ","kanji":"親子","meaning":"parent and child"],
        ["hiragana":"らっかん","kanji":"楽観","meaning":"optimism; taking an optimistic view"],
        ["hiragana":"らん","kanji":"欄","meaning":"section"],
        ["hiragana":"ろうどうりょく","kanji":"労働力","meaning":"labor; manpower; working force"],
        ["hiragana":"さす","kanji":"刺す","meaning":"to pierce; to prick; to stick; to thrust; to sting"],
        ["hiragana":"せばめる","kanji":"狭める","meaning":"to narrow; to reduce; to contract"],
        ["hiragana":"せいぶん","kanji":"成分","meaning":"ingredient; component; composition"]
    ]
    
    
    //JLPT N3
    var n3ch1array = [
        ["hiragana":"ばか","kanji":"馬鹿","meaning":"fool, idiot"],
        ["hiragana":"ちか","kanji":"地下","meaning":"basement, cellar"],
        ["hiragana":"ちしき","kanji":"知識","meaning":"knowledge, information"],
        ["hiragana":"でんとう","kanji":"伝統","meaning":"tradition, convention"],
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
    
    var n3ch6array = [
        ["hiragana":"おわり","kanji":"終","meaning":"the end"],
        ["hiragana":"りょう","kanji":"量","meaning":"quantity, amount"],
        ["hiragana":"りゅうこう","kanji":"流行","meaning":"fashion, vogue"],
        ["hiragana":"さいてい","kanji":"最低","meaning":"least, lowest, worst"],
        ["hiragana":"さくもつ","kanji":"作物","meaning":"produce, crops"],
        ["hiragana":"さまざま","kanji":"様々","meaning":"varied, various"],
        ["hiragana":"せきゆ","kanji":"石油","meaning":"oil, petroleum"],
        ["hiragana":"しばはつ","kanji":"始発","meaning":"first train, first bus"],
        ["hiragana":"しらせ","kanji":"知らせ","meaning":"news, notice"],
        ["hiragana":"しつぎょう","kanji":"失業","meaning":"unemployment"],
        ["hiragana":"しょくりょう","kanji":"食糧","meaning":"provisions, food supply"],
        ["hiragana":"しょうち","kanji":"承知","meaning":"knowledge, awareness"],
        ["hiragana":"しゅじゅつ","kanji":"手術","meaning":"surgical operation"],
        ["hiragana":"しゅうきょう","kanji":"宗教","meaning":"religion"],
        ["hiragana":"たいど","kanji":"態度","meaning":"attitude, manner"],
        ["hiragana":"たいほ","kanji":"逮捕","meaning":"arrest, apprehension"],
        ["hiragana":"たいりょう","kanji":"大量","meaning":"large quantity, mass"],
        ["hiragana":"たいざい","kanji":"滞在","meaning":"staying, sojourn"],
        ["hiragana":"たね","kanji":"種","meaning":"seed, kind, variety"],
        ["hiragana":"たたく","kanji":"叩く","meaning":"to strike, to beat"]
    ]
    
    var n3ch7array = [
        ["hiragana":"ていこう","kanji":"抵抗","meaning":"resistance, opposition"],
        ["hiragana":"てきする","kanji":"適する","meaning":"to fit, to suit"],
        ["hiragana":"つきあい","kanji":"付合い","meaning":"association, socializing"],
        ["hiragana":"つめる","kanji":"詰める","meaning":"to stuff into, to jam"],
        ["hiragana":"うばう","kanji":"奪う","meaning":"to snatch away"],
        ["hiragana":"うまれ","kanji":"生まれ","meaning":"birth, birthplace"],
        ["hiragana":"うったえる","kanji":"訴える","meaning":"to appeal, to sue"],
        ["hiragana":"わ","kanji":"輪","meaning":"ring, circle, loop"],
        ["hiragana":"やまのぼり","kanji":"山登り","meaning":"mountain climbing"],
        ["hiragana":"よみ","kanji":"読み","meaning":"reading"],
        ["hiragana":"ば","kanji":"場","meaning":"place, spot, scene"],
        ["hiragana":"びん","kanji":"便","meaning":"mail, post, flight"],
        ["hiragana":"ぶっしつ","kanji":"物質","meaning":"material, substance"],
        ["hiragana":"びょうどう","kanji":"平等","meaning":"equality, evenness"],
        ["hiragana":"ちく","kanji":"地区","meaning":"district, section, sector"],
        ["hiragana":"えいよう","kanji":"栄養","meaning":"nutrition, nourishment"],
        ["hiragana":"ふだん","kanji":"普段","meaning":"usual, habitual"],
        ["hiragana":"ふじゆう","kanji":"不自由","meaning":"discomfort, inconvenience"],
        ["hiragana":"ふしぎ","kanji":"不思議","meaning":"wonder, miracle, strange"],
        ["hiragana":"がくもん","kanji":"学問","meaning":"learning, study"]
    ]
    
    var n3ch8array = [
        ["hiragana":"はだか","kanji":"裸","meaning":"naked, nude"],
        ["hiragana":"はで","kanji":"派手","meaning":"showy, flashy"],
        ["hiragana":"はく","kanji":"掃く","meaning":"to sweep, to brush"],
        ["hiragana":"ひ","kanji":"費","meaning":"cost, expense"],
        ["hiragana":"ほしょう","kanji":"保証","meaning":"guarantee, security"],
        ["hiragana":"いねむり","kanji":"居眠り","meaning":"nodding off, dozing"],
        ["hiragana":"いんしょく","kanji":"飲食","meaning":"food and drink, eating and drinking"],
        ["hiragana":"じんしゅ","kanji":"人種","meaning":"race"],
        ["hiragana":"じたい","kanji":"事態","meaning":"situation"],
        ["hiragana":"じたく","kanji":"自宅","meaning":"one’s home, one’s house"],
        ["hiragana":"じょうきょう","kanji":"状況","meaning":"state of affairs"],
        ["hiragana":"かいごう","kanji":"会合","meaning":"meeting, assembly"],
        ["hiragana":"かいてき","kanji":"快適","meaning":"pleasant, comfortable"],
        ["hiragana":"かげん","kanji":"加減","meaning":"adjustment, degree, extent"],
        ["hiragana":"かぎる","kanji":"限る","meaning":"to restrict, to limit"],
        ["hiragana":"かんじょう","kanji":"感情","meaning":"emotion, feeling"],
        ["hiragana":"かれら","kanji":"彼ら","meaning":"they"],
        ["hiragana":"けいじ","kanji":"刑事","meaning":"police detective, criminal matter"],
        ["hiragana":"きそ","kanji":"基礎","meaning":"foundation, basis"],
        ["hiragana":"こくふく","kanji":"克服","meaning":"conquest, overcoming"]
    ]
    
    var n3ch9array = [
        ["hiragana":"くむ","kanji":"組む","meaning":"to link, to put together"],
        ["hiragana":"きょうじゅ","kanji":"教授","meaning":"professor"],
        ["hiragana":"きゅうか","kanji":"休暇","meaning":"holiday, day off"],
        ["hiragana":"まわり","kanji":"回り","meaning":"rotation"],
        ["hiragana":"めいじる","kanji":"命じる","meaning":"to order, to command"],
        ["hiragana":"み","kanji":"実","meaning":"fruit, nut"],
        ["hiragana":"なお","kanji":"直","meaning":"straight, ordinary, common"],
        ["hiragana":"にちじょう","kanji":"日常","meaning":"ordinary, everyday"],
        ["hiragana":"にゅうりょく","kanji":"入力","meaning":"input"],
        ["hiragana":"おび","kanji":"帯","meaning":"obi, kimono sash"],
        ["hiragana":"おだやか","kanji":"穏やか","meaning":"calm, gentle, quiet"],
        ["hiragana":"おおいに","kanji":"大いに","meaning":"very, much, greatly"],
        ["hiragana":"おとる","kanji":"劣る","meaning":"to be inferior to"],
        ["hiragana":"おたがい","kanji":"お互い","meaning":"mutual"],
        ["hiragana":"りっぱ","kanji":"立派","meaning":"splendid, fine"],
        ["hiragana":"ろんぶん","kanji":"論文","meaning":"thesis, essay"],
        ["hiragana":"さほう","kanji":"作法","meaning":"manners, etiquette"],
        ["hiragana":"さっきょく","kanji":"作曲","meaning":"composition"],
        ["hiragana":"さめる","kanji":"覚める","meaning":"to wake up"],
        ["hiragana":"さっぱり","kanji":"さっぱり","meaning":"feeling refreshed"]
    ]
    
    var n3ch10array = [
        ["hiragana":"さらに","kanji":"更に","meaning":"furthermore, again"],
        ["hiragana":"さる","kanji":"猿","meaning":"monkey"],
        ["hiragana":"せい","kanji":"正","meaning":"true, regular"],
        ["hiragana":"せい","kanji":"所為","meaning":"consequence, result, blame"],
        ["hiragana":"せいかく","kanji":"性格","meaning":"character, personality"],
        ["hiragana":"しんちょう","kanji":"慎重","meaning":"careful, cautious, prudent"],
        ["hiragana":"しんにゅうせい","kanji":"新入生","meaning":"new student, freshman"],
        ["hiragana":"してん","kanji":"支店","meaning":"branch office"],
        ["hiragana":"しやくしょ","kanji":"市役所","meaning":"municipal office, city hall"],
        ["hiragana":"しゅうりょう","kanji":"終了","meaning":"end, close, termination"],
        ["hiragana":"すすめる","kanji":"勧める","meaning":"to recommend"],
        ["hiragana":"たびたび","kanji":"度々","meaning":"often, again and again"],
        ["hiragana":"とおり","kanji":"通り","meaning":"avenue, street"],
        ["hiragana":"とれる","kanji":"取れる","meaning":"to come off, to be removed"],
        ["hiragana":"とうちゃく","kanji":"到着","meaning":"arrival"],
        ["hiragana":"つかれ","kanji":"疲れ","meaning":"tiredness, fatigue"],
        ["hiragana":"うなる","kanji":"唸る","meaning":"to groan, to moan"],
        ["hiragana":"うつ","kanji":"撃つ","meaning":"to shoot, to attack"],
        ["hiragana":"よぶん","kanji":"余分","meaning":"extra, excess"],
        ["hiragana":"ゆうびん","kanji":"郵便","meaning":"mail service"]
    ]
    
    var n3ch11array = [
        ["hiragana":"ゆうじょう","kanji":"友情","meaning":"friendship, fellowship"],
        ["hiragana":"ぜんこく","kanji":"全国","meaning":"countrywide, nationwide"],
        ["hiragana":"あかり","kanji":"明かり","meaning":"light, illumination, glow"],
        ["hiragana":"あずける","kanji":"預ける","meaning":"to give into custody"],
        ["hiragana":"ちいき","kanji":"地域","meaning":"area, region"],
        ["hiragana":"だいとかい","kanji":"大都会","meaning":"metropolis, big city"],
        ["hiragana":"だんじょ","kanji":"男女","meaning":"men and women, both genders"],
        ["hiragana":"どうじ","kanji":"同時","meaning":"simultaneous, concurrent"],
        ["hiragana":"どうし","kanji":"動詞","meaning":"verb"],
        ["hiragana":"えいきょう","kanji":"影響","meaning":"influence, effect"],
        ["hiragana":"ふで","kanji":"筆","meaning":"writing brush"],
        ["hiragana":"ふんいき","kanji":"雰囲気","meaning":"atmosphere"],
        ["hiragana":"がいしょく","kanji":"外食","meaning":"eating out, dining out"],
        ["hiragana":"がっかり","kanji":"がっかり","meaning":"feel disappointed"],
        ["hiragana":"ごみ","kanji":"塵","meaning":"rubbish, trash"],
        ["hiragana":"はなす","kanji":"離す","meaning":"to separate, to part"],
        ["hiragana":"へんか","kanji":"変化","meaning":"change, alteration"],
        ["hiragana":"ほね","kanji":"骨","meaning":"bone"],
        ["hiragana":"ほうこく","kanji":"報告","meaning":"report, information"],
        ["hiragana":"いまにも","kanji":"今にも","meaning":"at any time, soon"]
    ]
    
    var n3ch12array = [
        ["hiragana":"いたむ","kanji":"痛む","meaning":"to hurt, to ache, to feel a pain"],
        ["hiragana":"いたずら","kanji":"悪戯","meaning":"mischief, prank"],
        ["hiragana":"じつは","kanji":"実は","meaning":"as a matter of fact"],
        ["hiragana":"かいしゅう","kanji":"回収","meaning":"collection, retrieval"],
        ["hiragana":"かんりょう","kanji":"完了","meaning":"completion, conclusion"],
        ["hiragana":"かた","kanji":"肩","meaning":"shoulder"],
        ["hiragana":"けいき","kanji":"景気","meaning":"business condition"],
        ["hiragana":"けっしん","kanji":"決心","meaning":"determination, resolution"],
        ["hiragana":"けってん","kanji":"欠点","meaning":"weak point, weakness"],
        ["hiragana":"きちょう","kanji":"貴重","meaning":"precious, valuable"],
        ["hiragana":"きこう","kanji":"気候","meaning":"climate"],
        ["hiragana":"きろく","kanji":"記録","meaning":"record, document"],
        ["hiragana":"こっかい","kanji":"国会","meaning":"National Diet, parliament"],
        ["hiragana":"こうそく","kanji":"高速","meaning":"high speed"],
        ["hiragana":"こや","kanji":"小屋","meaning":"hut, cabin, shed"],
        ["hiragana":"くさる","kanji":"腐る","meaning":"to rot, to go bad"],
        ["hiragana":"くわえる","kanji":"加える","meaning":"to add, to sum up"],
        ["hiragana":"まどぐち","kanji":"窓口","meaning":"ticket window; teller window; counter"],
        ["hiragana":"まず","kanji":"先ず","meaning":"first of all, to start with"],
        ["hiragana":"まずしい","kanji":"貧しい","meaning":"poor"]
    ]
    
    var n3ch13array = [
        ["hiragana":"もちはこび","kanji":"持ち運び","meaning":"carrying"],
        ["hiragana":"もうふ","kanji":"毛布","meaning":"blanket"],
        ["hiragana":"なべ","kanji":"鍋","meaning":"saucepan, pot"],
        ["hiragana":"なかなおり","kanji":"仲直り","meaning":"reconciliation, make peace with"],
        ["hiragana":"にちじ","kanji":"日時","meaning":"date and time"],
        ["hiragana":"のき","kanji":"軒","meaning":"eaves"],
        ["hiragana":"らく","kanji":"楽","meaning":"comfort, ease"],
        ["hiragana":"りかい","kanji":"理解","meaning":"understanding, comprehension"],
        ["hiragana":"ろんじる","kanji":"論じる","meaning":"to argue, to debate"],
        ["hiragana":"さいわい","kanji":"幸い","meaning":"happiness, luckily"],
        ["hiragana":"さんそ","kanji":"酸素","meaning":"oxygen"],
        ["hiragana":"せいじか","kanji":"政治家","meaning":"politician, statesman"],
        ["hiragana":"しどう","kanji":"指導","meaning":"leadership, guidance"],
        ["hiragana":"しどうしゃ","kanji":"指導者","meaning":"leader, guide"],
        ["hiragana":"しほん","kanji":"資本","meaning":"funds, capital"],
        ["hiragana":"しかも","kanji":"然も","meaning":"moreover, furthermore"],
        ["hiragana":"しんせん","kanji":"新鮮","meaning":"fresh"],
        ["hiragana":"しるし","kanji":"印","meaning":"seal, stamp, mark"],
        ["hiragana":"したがう","kanji":"従う","meaning":"to abide"],
        ["hiragana":"しつど","kanji":"湿度","meaning":"level of humidity"]
    ]
    
    var n3ch14array = [
        ["hiragana":"しょくもつ","kanji":"食物","meaning":"food, foodstuff"],
        ["hiragana":"しょうじょう","kanji":"症状","meaning":"symptoms, condition"],
        ["hiragana":"しゅうしょく","kanji":"就職","meaning":"finding employment"],
        ["hiragana":"すいせん","kanji":"推薦","meaning":"recommendation, referral"],
        ["hiragana":"とばす","kanji":"飛ばす","meaning":"to fly, to skip over"],
        ["hiragana":"とくちょう","kanji":"特徴","meaning":"feature, trait"],
        ["hiragana":"つかまる","kanji":"捕まる","meaning":"to be caught"],
        ["hiragana":"つもる","kanji":"積もる","meaning":"to pile up, to accumulate"],
        ["hiragana":"うけとる","kanji":"受け取る","meaning":"to receive, to get"],
        ["hiragana":"わり","kanji":"割","meaning":"rate, ratio, proportion"],
        ["hiragana":"よぼう","kanji":"予防","meaning":"prevention, precaution"],
        ["hiragana":"よこ","kanji":"横","meaning":"horizontal, beside"],
        ["hiragana":"ゆき","kanji":"行き","meaning":"bound for, going to"],
        ["hiragana":"あきらか","kanji":"明らか","meaning":"obvious, evident, clear"],
        ["hiragana":"あたり","kanji":"辺り","meaning":"neighborhood, nearby"],
        ["hiragana":"ちょうし","kanji":"調子","meaning":"tone, condition, health"],
        ["hiragana":"だいきん","kanji":"代金","meaning":"price, payment, cost"],
        ["hiragana":"であう","kanji":"出会う","meaning":"to meet"],
        ["hiragana":"ふよう","kanji":"不用","meaning":"disused, unused"],
        ["hiragana":"がいこくさん","kanji":"外国産","meaning":"of foreign manufacture"]
    ]
    
    var n3ch15array = [
        ["hiragana":"がいこう","kanji":"外交","meaning":"diplomacy"],
        ["hiragana":"げか","kanji":"外科","meaning":"surgery, department of surgery"],
        ["hiragana":"ぎいん","kanji":"議員","meaning":"member of the Diet"],
        ["hiragana":"はみがき","kanji":"歯磨き","meaning":"brushing one's teeth"],
        ["hiragana":"はいたつ","kanji":"配達","meaning":"delivery, distribution"],
        ["hiragana":"はなしかける","kanji":"話しかける","meaning":"to start a conversation"],
        ["hiragana":"ほこり","kanji":"埃","meaning":"dust"],
        ["hiragana":"いっぱん","kanji":"一般","meaning":"general, universal"],
        ["hiragana":"いし","kanji":"意思","meaning":"intention, purpose"],
        ["hiragana":"じしん","kanji":"自信","meaning":"self-confidence"],
        ["hiragana":"かんぜん","kanji":"完全","meaning":"perfection, completeness"],
        ["hiragana":"けいい","kanji":"敬意","meaning":"respect, honor"],
        ["hiragana":"きぼう","kanji":"希望","meaning":"hope, wish"],
        ["hiragana":"きんえん","kanji":"禁煙","meaning":"no smoking"],
        ["hiragana":"きんぞく","kanji":"金属","meaning":"metal"],
        ["hiragana":"きたい","kanji":"期待","meaning":"expectation, hope"],
        ["hiragana":"こじん","kanji":"個人","meaning":"individual, personal"],
        ["hiragana":"こうふく","kanji":"幸福","meaning":"happiness"],
        ["hiragana":"こづつみ","kanji":"小包","meaning":"parcel, package"],
        ["hiragana":"きゅうじょ","kanji":"救助","meaning":"relief, aid"]
    ]
    
    var n3ch16array = [
        ["hiragana":"まもる","kanji":"守る","meaning":"to protect, to guard"],
        ["hiragana":"みまい","kanji":"見舞い","meaning":"visiting ill or distressed people"],
        ["hiragana":"もどす","kanji":"戻す","meaning":"to put back, to give back"],
        ["hiragana":"むだ","kanji":"無駄","meaning":"futility, uselessness"],
        ["hiragana":"むく","kanji":"向く","meaning":"to face, to turn toward"],
        ["hiragana":"にっこり","kanji":"にっこり","meaning":"smile, grin"],
        ["hiragana":"おおゆき","kanji":"大雪","meaning":"heavy snow"],
        ["hiragana":"おさない","kanji":"幼い","meaning":"very young, childish"],
        ["hiragana":"おせん","kanji":"汚染","meaning":"pollution, contamination"],
        ["hiragana":"れつ","kanji":"列","meaning":"queue, line"],
        ["hiragana":"せいじん","kanji":"成人","meaning":"adult"],
        ["hiragana":"せいかく","kanji":"正確","meaning":"accurate, punctual"],
        ["hiragana":"せいせき","kanji":"成績","meaning":"results, grade"],
        ["hiragana":"しめる","kanji":"締める","meaning":"to tie, to fasten, to tighten"],
        ["hiragana":"しんぽ","kanji":"進歩","meaning":"progress, advance"],
        ["hiragana":"しんせき","kanji":"親戚","meaning":"relative, relation"],
        ["hiragana":"しゅうかく","kanji":"収穫","meaning":"harvest, crop"],
        ["hiragana":"するどい","kanji":"鋭い","meaning":"sharp, pointed"],
        ["hiragana":"たてなおす","kanji":"立て直す","meaning":"to restore, to revive"],
        ["hiragana":"てじな","kanji":"手品","meaning":"sleight of hand, magic"]
    ]
    
    var n3ch17array = [
        ["hiragana":"てき","kanji":"敵","meaning":"opponent, rival"],
        ["hiragana":"つつみ","kanji":"包み","meaning":"bundle, package, parcel"],
        ["hiragana":"つうじる","kanji":"通じる","meaning":"to lead to, to be understood"],
        ["hiragana":"やぶる","kanji":"破る","meaning":"to tear, to break"],
        ["hiragana":"ゆうこう","kanji":"友好","meaning":"friendship"],
        ["hiragana":"ゆうしゅう","kanji":"優秀","meaning":"superiority, excellence"],
        ["hiragana":"ぜひ","kanji":"是非","meaning":"certainly, without fail"],
        ["hiragana":"ぜんしゃ","kanji":"前者","meaning":"the former"],
        ["hiragana":"あらわす","kanji":"表す","meaning":"to represent, to show, to display"],
        ["hiragana":"ばくだい","kanji":"莫大","meaning":"enormous, vast"],
        ["hiragana":"ちちおや","kanji":"父親","meaning":"father"],
        ["hiragana":"ちゅうがく","kanji":"中学","meaning":"middle school"],
        ["hiragana":"どうとく","kanji":"道徳","meaning":"morals"],
        ["hiragana":"ふうふ","kanji":"夫婦","meaning":"married couple, spouses"],
        ["hiragana":"ぐん","kanji":"軍","meaning":"army, troop"],
        ["hiragana":"はったつ","kanji":"発達","meaning":"development, growth"],
        ["hiragana":"ひえる","kanji":"冷える","meaning":"to grow cold, to get chilly"],
        ["hiragana":"ひげき","kanji":"悲劇","meaning":"tragedy"],
        ["hiragana":"ひるね","kanji":"昼寝","meaning":"nap"],
        ["hiragana":"ほお","kanji":"頬","meaning":"cheek"]
    ]
    
    var n3ch18array = [
        ["hiragana":"ほうほう","kanji":"方法","meaning":"method, way, manner"],
        ["hiragana":"ほうせき","kanji":"宝石","meaning":"gem, jewel"],
        ["hiragana":"いったい","kanji":"一体","meaning":"what on earth…"],
        ["hiragana":"じんこう","kanji":"人工","meaning":"artificial, man-made"],
        ["hiragana":"かみ","kanji":"上","meaning":"person of high rank, government"],
        ["hiragana":"かんじ","kanji":"感じ","meaning":"feeling, sense"],
        ["hiragana":"かんしん","kanji":"感心","meaning":"admiration"],
        ["hiragana":"かんり","kanji":"管理","meaning":"control, management"],
        ["hiragana":"けんちく","kanji":"建築","meaning":"construction, architecture"],
        ["hiragana":"けんとう","kanji":"検討","meaning":"consideration, examination"],
        ["hiragana":"きほん","kanji":"基本","meaning":"foundation, basis"],
        ["hiragana":"きり","kanji":"霧","meaning":"fog, mist"],
        ["hiragana":"こくみん","kanji":"国民","meaning":"national, citizen"],
        ["hiragana":"こんかい","kanji":"今回","meaning":"now, this time"],
        ["hiragana":"こうぶつ","kanji":"好物","meaning":"favourite food"],
        ["hiragana":"こうへい","kanji":"公平","meaning":"fairness, justice"],
        ["hiragana":"こうじ","kanji":"工事","meaning":"construction work"],
        ["hiragana":"こうくう","kanji":"航空","meaning":"aviation, flying"],
        ["hiragana":"くみたてる","kanji":"組み立てる","meaning":"to assemble, to set up"],
        ["hiragana":"きゅうそく","kanji":"急速","meaning":"rapid"]
    ]
    
    var n3ch19array = [
        ["hiragana":"まご","kanji":"孫","meaning":"grandchild"],
        ["hiragana":"みかた","kanji":"味方","meaning":"friend, ally"],
        ["hiragana":"もえる","kanji":"燃える","meaning":"to burn, to get fired up"],
        ["hiragana":"ものがたり","kanji":"物語","meaning":"tale, story"],
        ["hiragana":"ながめ","kanji":"眺め","meaning":"view, scene, prospect"],
        ["hiragana":"ねだん","kanji":"値段","meaning":"price, cost"],
        ["hiragana":"ねんじゅう","kanji":"年中","meaning":"whole year, all year round"],
        ["hiragana":"のびる","kanji":"伸びる","meaning":"to stretch, to extend"],
        ["hiragana":"のう","kanji":"能","meaning":"talent, gift, function"],
        ["hiragana":"おちつく","kanji":"落ち着く","meaning":"to calm down, to compose oneself"],
        ["hiragana":"おもわず","kanji":"思わず","meaning":"unintentionally"],
        ["hiragana":"およぼす","kanji":"及ぼす","meaning":"to exert, to cause"],
        ["hiragana":"れい","kanji":"例","meaning":"example, case"],
        ["hiragana":"せい","kanji":"性","meaning":"gender"],
        ["hiragana":"せいど","kanji":"制度","meaning":"system, institution"],
        ["hiragana":"せいしき","kanji":"正式","meaning":"official, formality"],
        ["hiragana":"せめる","kanji":"責める","meaning":"to blame, to condemn"],
        ["hiragana":"せつやく","kanji":"節約","meaning":"economizing, saving"],
        ["hiragana":"しじん","kanji":"詩人","meaning":"poet"],
        ["hiragana":"しょっき","kanji":"食器","meaning":"tableware"]
    ]
    
    var n3ch20array = [
        ["hiragana":"しょくりょう","kanji":"食料","meaning":"food"],
        ["hiragana":"そで","kanji":"袖","meaning":"sleeve"],
        ["hiragana":"すべて","kanji":"全て","meaning":"everything, all"],
        ["hiragana":"たま","kanji":"弾","meaning":"ball, sphere, globe, bullet"],
        ["hiragana":"たにん","kanji":"他人","meaning":"another person, others"],
        ["hiragana":"たんじょう","kanji":"誕生","meaning":"birth, creation"],
        ["hiragana":"とら","kanji":"虎","meaning":"tiger"],
        ["hiragana":"とうじつ","kanji":"当日","meaning":"appointed day, very day"],
        ["hiragana":"つうがく","kanji":"通学","meaning":"commuting to school"],
        ["hiragana":"うりきれる","kanji":"売り切れる","meaning":"to be sold out"],
        ["hiragana":"わき","kanji":"脇","meaning":"beside, close to, nearby"],
        ["hiragana":"わる","kanji":"割る","meaning":"to divide, to cut"],
        ["hiragana":"よろこび","kanji":"喜び","meaning":"joy, delight"],
        ["hiragana":"ようそ","kanji":"要素","meaning":"element, factor, component"],
        ["hiragana":"やや","kanji":"稍","meaning":"a little, partially"],
        ["hiragana":"あたためる","kanji":"温める","meaning":"to warm, to heat"],
        ["hiragana":"びみょう","kanji":"微妙","meaning":"delicate, subtle"],
        ["hiragana":"ぶん","kanji":"文","meaning":"sentence"],
        ["hiragana":"ぶんせき","kanji":"分析","meaning":"analysis"],
        ["hiragana":"ちゅうかん","kanji":"中間","meaning":"middle, midway, center"]
    ]
    
    var n3ch21array = [
        ["hiragana":"がか","kanji":"画家","meaning":"painter, artist"],
        ["hiragana":"げんご","kanji":"言語","meaning":"language"],
        ["hiragana":"はなす","kanji":"放す","meaning":"to release, to let go"],
        ["hiragana":"へいじつ","kanji":"平日","meaning":"weekday, ordinary days"],
        ["hiragana":"ひょうじょう","kanji":"表情","meaning":"facial expression"],
        ["hiragana":"いはん","kanji":"違反","meaning":"violence, offense"],
        ["hiragana":"いるい","kanji":"衣類","meaning":"clothes, garments"],
        ["hiragana":"じけん","kanji":"事件","meaning":"event, affair, accident"],
        ["hiragana":"じゅうだい","kanji":"重大","meaning":"serious, important"],
        ["hiragana":"がまん","kanji":"我慢","meaning":"patience, endurance"],
        ["hiragana":"かなり","kanji":"可也","meaning":"considerably, fairly"],
        ["hiragana":"かたがた","kanji":"方々","meaning":"they"],
        ["hiragana":"けっせき","kanji":"欠席","meaning":"absence"],
        ["hiragana":"けつあつ","kanji":"血圧","meaning":"blood pressure"],
        ["hiragana":"きまり","kanji":"決まり","meaning":"rule, settlement"],
        ["hiragana":"きにゅう","kanji":"記入","meaning":"entry, filling in forms"],
        ["hiragana":"きんゆう","kanji":"金融","meaning":"finance; credit transacting; loaning of money"],
        ["hiragana":"きわ","kanji":"際","meaning":"edge, brink, verge"],
        ["hiragana":"こい","kanji":"濃い","meaning":"thick, dense, strong"],
        ["hiragana":"こいびと","kanji":"恋人","meaning":"lover, sweetheart"]
    ]
    
    var n3ch22array = [
        ["hiragana":"このむ","kanji":"好む","meaning":"to like, to prefer"],
        ["hiragana":"こし","kanji":"腰","meaning":"lower back, waist"],
        ["hiragana":"ことなる","kanji":"異なる","meaning":"to differ, to vary"],
        ["hiragana":"こうさい","kanji":"交際","meaning":"association, friendship"],
        ["hiragana":"くもり","kanji":"曇","meaning":"cloudiness, cloudy weather"],
        ["hiragana":"くらし","kanji":"暮らし","meaning":"life, living"],
        ["hiragana":"くせ","kanji":"癖","meaning":"habit"],
        ["hiragana":"くう","kanji":"食う","meaning":"to eat"],
        ["hiragana":"めいかく","kanji":"明確","meaning":"clear; precise; definite; distinct"],
        ["hiragana":"めん","kanji":"面","meaning":"face, mask"],
        ["hiragana":"みにつける","kanji":"身につける","meaning":"to learn; to acquire knowledge"],
        ["hiragana":"むし","kanji":"無視","meaning":"disregarding, ignoring"],
        ["hiragana":"な","kanji":"名","meaning":"name, given name"],
        ["hiragana":"なか","kanji":"仲","meaning":"relation, relationship"],
        ["hiragana":"なみ","kanji":"波","meaning":"wave"],
        ["hiragana":"にってい","kanji":"日程","meaning":"schedule, program"],
        ["hiragana":"おおあめ","kanji":"大雨","meaning":"heavy rain"],
        ["hiragana":"れんしゅう","kanji":"練習","meaning":"practice, practicing"],
        ["hiragana":"さす","kanji":"指す","meaning":"to point, to indicate"],
        ["hiragana":"せいかい","kanji":"正解","meaning":"correct, right"]
    ]
    
    var n3ch23array = [
        ["hiragana":"せいき","kanji":"世紀","meaning":"century, era"],
        ["hiragana":"し","kanji":"詩","meaning":"poem"],
        ["hiragana":"しな","kanji":"品","meaning":"article, item, goods"],
        ["hiragana":"しんぞう","kanji":"心臓","meaning":"heart, guts, nerve"],
        ["hiragana":"しょうぼう","kanji":"消防","meaning":"fire fighting"],
        ["hiragana":"たば","kanji":"束","meaning":"bundle, bunch"],
        ["hiragana":"たちば","kanji":"立場","meaning":"standpoint, position"],
        ["hiragana":"たいりょく","kanji":"体力","meaning":"physical strength, stamina"],
        ["hiragana":"たて","kanji":"縦","meaning":"the vertical, height"],
        ["hiragana":"たつ","kanji":"経つ","meaning":"to pass, to lapse"],
        ["hiragana":"てんない","kanji":"店内","meaning":"store interior"],
        ["hiragana":"とち","kanji":"土地","meaning":"plot of land, soil"],
        ["hiragana":"とく","kanji":"解く","meaning":"to untie, to solve"],
        ["hiragana":"とおりすぎる","kanji":"通り過ぎる","meaning":"to pass through"],
        ["hiragana":"とう","kanji":"塔","meaning":"tower, pagoda"],
        ["hiragana":"つれ","kanji":"連れ","meaning":"companion, company"],
        ["hiragana":"わりびき","kanji":"割引","meaning":"discount, reduction"],
        ["hiragana":"ゆうき","kanji":"勇気","meaning":"courage, bravery"],
        ["hiragana":"ぞう","kanji":"象","meaning":"elephant"],
        ["hiragana":"ず","kanji":"図","meaning":"drawing, picture, diagram"]
    ]
    
    var n3ch24array = [
        ["hiragana":"あしもと","kanji":"足元","meaning":"at one’s feet, under foot"],
        ["hiragana":"ばくはつ","kanji":"爆発","meaning":"explosion, detonation"],
        ["hiragana":"ぼうけん","kanji":"冒険","meaning":"adventure, risk"],
        ["hiragana":"ぶつり","kanji":"物理","meaning":"physics"],
        ["hiragana":"だまる","kanji":"黙る","meaning":"to be silent"],
        ["hiragana":"でんごん","kanji":"伝言","meaning":"verbal message"],
        ["hiragana":"どうきゅうせい","kanji":"同級生","meaning":"classmate"],
        ["hiragana":"えんぎ","kanji":"演技","meaning":"acting, performance"],
        ["hiragana":"ふくろ","kanji":"袋","meaning":"bag, sack"],
        ["hiragana":"ふれる","kanji":"触れる","meaning":"to touch, to feel"],
        ["hiragana":"がくぶ","kanji":"学部","meaning":"department of a university"],
        ["hiragana":"ごく","kanji":"極","meaning":"quite, very"],
        ["hiragana":"ぎょうぎ","kanji":"行儀","meaning":"manners, behavior"],
        ["hiragana":"はば","kanji":"幅","meaning":"width, breadth"],
        ["hiragana":"はんとし","kanji":"半年","meaning":"half year"],
        ["hiragana":"はってん","kanji":"発展","meaning":"development, growth"],
        ["hiragana":"はやめに","kanji":"早めに","meaning":"ahead of time"],
        ["hiragana":"ひきうける","kanji":"引き受ける","meaning":"to undertake, to accept"],
        ["hiragana":"ひとびと","kanji":"人々","meaning":"people; men and women"],
        ["hiragana":"ほんや","kanji":"本屋","meaning":"bookstore, bookshop"]
    ]
    
    var n3ch25array = [
        ["hiragana":"ひょうげん","kanji":"表現","meaning":"expression, representation"],
        ["hiragana":"いちりゅう","kanji":"一流","meaning":"first-class, top grade"],
        ["hiragana":"いんしょう","kanji":"印象","meaning":"impression"],
        ["hiragana":"いし","kanji":"医師","meaning":"doctor, physician"],
        ["hiragana":"いずみ","kanji":"泉","meaning":"spring, fountain"],
        ["hiragana":"じゅんちょう","kanji":"順調","meaning":"favorable, doing well"],
        ["hiragana":"かいさつ","kanji":"改札","meaning":"ticket gate, ticket barrier"],
        ["hiragana":"かぎ","kanji":"鍵","meaning":"key"],
        ["hiragana":"かじ","kanji":"家事","meaning":"housework"],
        ["hiragana":"かくす","kanji":"隠す","meaning":"to hide, to conceal"],
        ["hiragana":"かんこうきゃく","kanji":"観光客","meaning":"tourist"],
        ["hiragana":"かさねる","kanji":"重ねる","meaning":"to pile up, to heap up"],
        ["hiragana":"かたる","kanji":"語る","meaning":"to talk about"],
        ["hiragana":"けんこう","kanji":"健康","meaning":"health"],
        ["hiragana":"きにする","kanji":"気にする","meaning":"to mind, to care about"],
        ["hiragana":"きらう","kanji":"嫌う","meaning":"to hate, to dislike"],
        ["hiragana":"きよう","kanji":"器用","meaning":"dexterous, skillful"],
        ["hiragana":"こっきょう","kanji":"国境","meaning":"national border"],
        ["hiragana":"きょうつうてん","kanji":"共通点","meaning":"point in common, common feature"],
        ["hiragana":"きゅうけい","kanji":"休憩","meaning":"rest, break, recess"]
    ]
    
    var n3ch26array = [
        ["hiragana":"まちがい","kanji":"間違い","meaning":"mistake, error, blunder"],
        ["hiragana":"み","kanji":"身","meaning":"body, oneself"],
        ["hiragana":"みまん","kanji":"未満","meaning":"less than, insufficient"],
        ["hiragana":"むける","kanji":"向ける","meaning":"to turn toward, to point"],
        ["hiragana":"ながめる","kanji":"眺める","meaning":"to view, to gaze at"],
        ["hiragana":"ないよう","kanji":"内容","meaning":"contents, matter"],
        ["hiragana":"のうりょく","kanji":"能力","meaning":"ability"],
        ["hiragana":"さ","kanji":"差","meaning":"difference, variation"],
        ["hiragana":"せいぶつ","kanji":"生物","meaning":"living things"],
        ["hiragana":"せいちょう","kanji":"成長","meaning":"growth, grow to adulthood"],
        ["hiragana":"せいさん","kanji":"生産","meaning":"production, manufacture"],
        ["hiragana":"せけん","kanji":"世間","meaning":"world, society"],
        ["hiragana":"せつび","kanji":"設備","meaning":"equipment, device"],
        ["hiragana":"しきゅう","kanji":"支給","meaning":"provision, supply"],
        ["hiragana":"しんらい","kanji":"信頼","meaning":"reliance, trust"],
        ["hiragana":"しょくよく","kanji":"食欲","meaning":"appetite"],
        ["hiragana":"しょうじる","kanji":"生じる","meaning":"to produce; to yield; to result from; to arise"],
        ["hiragana":"しゅふ","kanji":"主婦","meaning":"housewife, mistress"],
        ["hiragana":"そうぞく","kanji":"相続","meaning":"succession, inheritance"],
        ["hiragana":"ていりゅうじょ","kanji":"停留所","meaning":"bus stop, tram stop"]
    ]
    
    var n3ch27array = [
        ["hiragana":"とざん","kanji":"登山","meaning":"mountain climbing"],
        ["hiragana":"つうしん","kanji":"通信","meaning":"correspondence, communication"],
        ["hiragana":"うつす","kanji":"移す","meaning":"to transfer, to move"],
        ["hiragana":"わだい","kanji":"話題","meaning":"topic, subject"],
        ["hiragana":"わかれ","kanji":"別れ","meaning":"parting, separation"],
        ["hiragana":"よくあさ","kanji":"翌朝","meaning":"next morning"],
        ["hiragana":"あい","kanji":"愛","meaning":"love, affection, care"],
        ["hiragana":"あくしゅ","kanji":"握手","meaning":"handshake"],
        ["hiragana":"あたえる","kanji":"与える","meaning":"to give, to bestow"],
        ["hiragana":"あつかう","kanji":"扱う","meaning":"to deal with, to treat"],
        ["hiragana":"あわ","kanji":"泡","meaning":"bubble, foam"],
        ["hiragana":"ぶんめい","kanji":"文明","meaning":"civilization"],
        ["hiragana":"ぶんるい","kanji":"分類","meaning":"categorization, sorting"],
        ["hiragana":"びょう","kanji":"秒","meaning":"second"],
        ["hiragana":"ちゅうこ","kanji":"中古","meaning":"used, second-hand"],
        ["hiragana":"ちゅうもく","kanji":"注目","meaning":"notice, attention"],
        ["hiragana":"ちゅうもん","kanji":"注文","meaning":"order, request"],
        ["hiragana":"だいじん","kanji":"大臣","meaning":"cabinet minister"],
        ["hiragana":"ど","kanji":"度","meaning":"degree, counter for occurrences"],
        ["hiragana":"とうじ","kanji":"当時","meaning":"at that time, in those days"]
    ]
    
    var n3ch28array = [
        ["hiragana":"えさ","kanji":"餌","meaning":"feed, bait"],
        ["hiragana":"げんじつ","kanji":"現実","meaning":"reality, actuality"],
        ["hiragana":"ぎむ","kanji":"義務","meaning":"duty, obligation"],
        ["hiragana":"ご","kanji":"語","meaning":"language"],
        ["hiragana":"ごかい","kanji":"誤解","meaning":"misunderstanding"],
        ["hiragana":"はい","kanji":"灰","meaning":"ashes"],
        ["hiragana":"はいそう","kanji":"配送","meaning":"delivery"],
        ["hiragana":"はかせ","kanji":"博士","meaning":"doctorate"],
        ["hiragana":"ほんもの","kanji":"本物","meaning":"genuine article"],
        ["hiragana":"ほうそう","kanji":"放送","meaning":"broadcast, broadcasting"],
        ["hiragana":"いち","kanji":"位置","meaning":"place, position"],
        ["hiragana":"いちどに","kanji":"一度に","meaning":"all at once"],
        ["hiragana":"いちじ","kanji":"一時","meaning":"time, moment"],
        ["hiragana":"いっか","kanji":"一家","meaning":"a house, a home"],
        ["hiragana":"いわう","kanji":"祝う","meaning":"to congratulate, to celebrate"],
        ["hiragana":"じじょう","kanji":"事情","meaning":"circumstances"],
        ["hiragana":"じむしつ","kanji":"事務室","meaning":"office"],
        ["hiragana":"じんぶつ","kanji":"人物","meaning":"person, character, figure"],
        ["hiragana":"じょうきょう","kanji":"上京","meaning":"proceeding to the capital"],
        ["hiragana":"じょゆう","kanji":"女優","meaning":"actress"]
    ]
    
    var n3ch29array = [
        ["hiragana":"じゅんばん","kanji":"順番","meaning":"turn, order of things"],
        ["hiragana":"かんさつ","kanji":"観察","meaning":"observation"],
        ["hiragana":"かんせい","kanji":"完成","meaning":"complete, completion"],
        ["hiragana":"かしゅ","kanji":"歌手","meaning":"singer"],
        ["hiragana":"かず","kanji":"数","meaning":"number"],
        ["hiragana":"けいこく","kanji":"警告","meaning":"warning, advice"],
        ["hiragana":"けっかん","kanji":"欠陥","meaning":"defect, fault"],
        ["hiragana":"きぼうしゃ","kanji":"希望者","meaning":"applicant, candidate"],
        ["hiragana":"きねんひん","kanji":"記念品","meaning":"souvenir, memento"],
        ["hiragana":"きんがく","kanji":"金額","meaning":"amount of money"],
        ["hiragana":"きんにく","kanji":"筋肉","meaning":"muscle"],
        ["hiragana":"きんし","kanji":"禁止","meaning":"prohibition, ban"],
        ["hiragana":"こっか","kanji":"国家","meaning":"state, country, nation"],
        ["hiragana":"こくばん","kanji":"黒板","meaning":"blackboard"],
        ["hiragana":"こんざつ","kanji":"混雑","meaning":"congestion, jam"],
        ["hiragana":"ころす","kanji":"殺す","meaning":"to kill"],
        ["hiragana":"こううん","kanji":"幸運","meaning":"good luck, fortune"],
        ["hiragana":"く","kanji":"句","meaning":"sentence, passage"],
        ["hiragana":"くやしい","kanji":"悔しい","meaning":"annoying, frustrating"],
        ["hiragana":"きゅうしゅう","kanji":"吸収","meaning":"absorption"]
    ]
    
    var n3ch30array = [
        ["hiragana":"めんきょしょう","kanji":"免許証","meaning":"license, permit"],
        ["hiragana":"みとめる","kanji":"認める","meaning":"to accept, to admit"],
        ["hiragana":"なまける","kanji":"怠ける","meaning":"to be idle"],
        ["hiragana":"ねんれい","kanji":"年齢","meaning":"age, years"],
        ["hiragana":"にぎる","kanji":"握る","meaning":"to grip, to grasp"],
        ["hiragana":"のばす","kanji":"伸ばす","meaning":"to grow long"],
        ["hiragana":"のうみん","kanji":"農民","meaning":"farmers, peasants"],
        ["hiragana":"おく","kanji":"奥","meaning":"inner part"],
        ["hiragana":"おもいで","kanji":"思い出","meaning":"memories"],
        ["hiragana":"おいつく","kanji":"追い付く","meaning":"to catch up with"],
        ["hiragana":"おそろしい","kanji":"恐ろしい","meaning":"terrible, dreadful"],
        ["hiragana":"おうじる","kanji":"応じる","meaning":"to respond, to comply"],
        ["hiragana":"ぴったり","kanji":"ぴったり","meaning":"exactly, tightly"],
        ["hiragana":"りそう","kanji":"理想","meaning":"ideal"],
        ["hiragana":"さます","kanji":"覚ます","meaning":"to awaken"],
        ["hiragana":"さゆう","kanji":"左右","meaning":"left and right, control"],
        ["hiragana":"せい","kanji":"製","meaning":"-made, make"],
        ["hiragana":"せきたん","kanji":"石炭","meaning":"coal"],
        ["hiragana":"せんしゅ","kanji":"選手","meaning":"player, team member"],
        ["hiragana":"しめきり","kanji":"締め切り","meaning":"deadline, closing"]
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
        
        if let level = UserDefaults.standard.object(forKey: "LEVEL") as? Int,
           let chapter = UserDefaults.standard.object(forKey: "CHAPTER") as? Int {
            LEVEL = level
            CHAPTER = chapter
        }
        
        if LEVEL == 0 && CHAPTER == 0 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 1"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch1array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 1 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 2"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch2array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 2 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 3"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch3array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 3 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 4"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch4array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 4 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 5"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch5array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 5 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 6"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch6array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 6 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 7"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch7array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 7 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 8"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch8array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 8 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 9"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch9array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 9 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 10"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch10array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 10 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 11"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch11array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 11 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 12"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch12array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 12 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 13"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch13array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 13 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 14"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch14array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 14 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 15"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch15array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 15 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 16"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch16array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 16 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 17"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch17array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 17 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 18"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch18array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 18 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 19"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch19array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 19 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 20"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch20array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 20 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 21"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch21array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 0 && CHAPTER == 21 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 22"
            totalLabel.text = "total 13 words"
            shuffledQuestions = shuffleArray(n1ch22array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
            
        // JLPT N2
        } else if LEVEL == 1 && CHAPTER == 0 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 1"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch1array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 1 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 2"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch2array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 2 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 3"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch3array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 3 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 4"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch4array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 4 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 5"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch5array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 5 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 6"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch6array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 6 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 7"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch7array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 7 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 8"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch8array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 8 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 9"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch9array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 9 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 10"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch10array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 10 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 11"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch11array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 11 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 12"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch12array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 12 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 13"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch13array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 13 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 14"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch14array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 14 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 15"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch15array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 15 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 16"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch16array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 16 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 17"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch17array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 17 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 18"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch18array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 18 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 19"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch19array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 19 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 20"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch20array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 20 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 21"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch21array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 21 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 22"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch22array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 22 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 23"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch23array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 23 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 24"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch24array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 1 && CHAPTER == 24 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 25"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch25array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
            
        // JLPT N3
        } else if LEVEL == 2 && CHAPTER == 0 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 1"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch1array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 1 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 2"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch2array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 2 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 3"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch3array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 3 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 4"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch4array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 4 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 5"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch5array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 5 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 6"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch6array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 6 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 7"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch7array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 7 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 8"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch8array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 8 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 9"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch9array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 9 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 10"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch10array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 10 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 11"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch11array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 11 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 12"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch12array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 12 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 13"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch13array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 13 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 14"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch14array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 14 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 15"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch15array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 15 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 16"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch16array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 16 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 17"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch17array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 17 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 18"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch18array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 18 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 19"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch19array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 19 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 20"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch20array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 20 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 21"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch21array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 21 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 22"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch22array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 22 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 23"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch23array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 23 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 24"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch24array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 24 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 25"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch25array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 25 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 26"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch26array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 26 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 27"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch27array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 27 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 28"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch28array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 28 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 29"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch29array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
            meaningLabel.text = shuffledQuestions[currentQuestionIndex]["meaning"]
        } else if LEVEL == 2 && CHAPTER == 29 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 30"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch30array)
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
        let word = shuffledQuestions[currentQuestionIndex]
        
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
        
        if LEVEL == 0 && CHAPTER == 0 {
            currentQuestionArray = n1ch1array
        } else if LEVEL == 0 && CHAPTER == 1 {
            currentQuestionArray = n1ch2array
        } else if LEVEL == 0 && CHAPTER == 2 {
            currentQuestionArray = n1ch3array
        } else if LEVEL == 0 && CHAPTER == 3 {
            currentQuestionArray = n1ch4array
        } else if LEVEL == 0 && CHAPTER == 4 {
            currentQuestionArray = n1ch5array
        } else if LEVEL == 0 && CHAPTER == 5 {
            currentQuestionArray = n1ch6array
        } else if LEVEL == 0 && CHAPTER == 6 {
            currentQuestionArray = n1ch7array
        } else if LEVEL == 0 && CHAPTER == 7 {
            currentQuestionArray = n1ch8array
        } else if LEVEL == 0 && CHAPTER == 8 {
            currentQuestionArray = n1ch9array
        } else if LEVEL == 0 && CHAPTER == 9 {
            currentQuestionArray = n1ch10array
        } else if LEVEL == 0 && CHAPTER == 10 {
            currentQuestionArray = n1ch11array
        } else if LEVEL == 0 && CHAPTER == 11 {
            currentQuestionArray = n1ch12array
        } else if LEVEL == 0 && CHAPTER == 12 {
            currentQuestionArray = n1ch13array
        } else if LEVEL == 0 && CHAPTER == 13 {
            currentQuestionArray = n1ch14array
        } else if LEVEL == 0 && CHAPTER == 14 {
            currentQuestionArray = n1ch15array
        } else if LEVEL == 0 && CHAPTER == 15 {
            currentQuestionArray = n1ch16array
        } else if LEVEL == 0 && CHAPTER == 16 {
            currentQuestionArray = n1ch17array
        } else if LEVEL == 0 && CHAPTER == 17 {
            currentQuestionArray = n1ch18array
        } else if LEVEL == 0 && CHAPTER == 18 {
            currentQuestionArray = n1ch19array
        } else if LEVEL == 0 && CHAPTER == 19 {
            currentQuestionArray = n1ch20array
        } else if LEVEL == 0 && CHAPTER == 20 {
            currentQuestionArray = n1ch21array
        } else if LEVEL == 0 && CHAPTER == 21 {
            currentQuestionArray = n1ch22array
            
        } else if LEVEL == 1 && CHAPTER == 0 {
            currentQuestionArray = n2ch1array
        } else if LEVEL == 1 && CHAPTER == 1 {
            currentQuestionArray = n2ch2array
        } else if LEVEL == 1 && CHAPTER == 2 {
            currentQuestionArray = n2ch3array
        } else if LEVEL == 1 && CHAPTER == 3 {
            currentQuestionArray = n2ch4array
        } else if LEVEL == 1 && CHAPTER == 4 {
            currentQuestionArray = n2ch5array
        } else if LEVEL == 1 && CHAPTER == 5 {
            currentQuestionArray = n2ch6array
        } else if LEVEL == 1 && CHAPTER == 6 {
            currentQuestionArray = n2ch7array
        } else if LEVEL == 1 && CHAPTER == 7 {
            currentQuestionArray = n2ch8array
        } else if LEVEL == 1 && CHAPTER == 8 {
            currentQuestionArray = n2ch9array
        } else if LEVEL == 1 && CHAPTER == 9 {
            currentQuestionArray = n2ch10array
        } else if LEVEL == 1 && CHAPTER == 10 {
            currentQuestionArray = n2ch11array
        } else if LEVEL == 1 && CHAPTER == 11 {
            currentQuestionArray = n2ch12array
        } else if LEVEL == 1 && CHAPTER == 12 {
            currentQuestionArray = n2ch13array
        } else if LEVEL == 1 && CHAPTER == 13 {
            currentQuestionArray = n2ch14array
        } else if LEVEL == 1 && CHAPTER == 14 {
            currentQuestionArray = n2ch15array
        } else if LEVEL == 1 && CHAPTER == 15 {
            currentQuestionArray = n2ch16array
        } else if LEVEL == 1 && CHAPTER == 16 {
            currentQuestionArray = n2ch17array
        } else if LEVEL == 1 && CHAPTER == 17 {
            currentQuestionArray = n2ch18array
        } else if LEVEL == 1 && CHAPTER == 18 {
            currentQuestionArray = n2ch19array
        } else if LEVEL == 1 && CHAPTER == 19 {
            currentQuestionArray = n2ch20array
        } else if LEVEL == 1 && CHAPTER == 20 {
            currentQuestionArray = n2ch21array
        } else if LEVEL == 1 && CHAPTER == 21 {
            currentQuestionArray = n2ch22array
        } else if LEVEL == 1 && CHAPTER == 22 {
            currentQuestionArray = n2ch23array
        } else if LEVEL == 1 && CHAPTER == 23 {
            currentQuestionArray = n2ch24array
        } else if LEVEL == 1 && CHAPTER == 24 {
            currentQuestionArray = n2ch25array
            
        } else if LEVEL == 2 && CHAPTER == 0 {
            currentQuestionArray = n3ch1array
        } else if LEVEL == 2 && CHAPTER == 1 {
            currentQuestionArray = n3ch2array
        } else if LEVEL == 2 && CHAPTER == 2 {
            currentQuestionArray = n3ch3array
        } else if LEVEL == 2 && CHAPTER == 3 {
            currentQuestionArray = n3ch4array
        } else if LEVEL == 2 && CHAPTER == 4 {
            currentQuestionArray = n3ch5array
        } else if LEVEL == 2 && CHAPTER == 5 {
            currentQuestionArray = n3ch6array
        } else if LEVEL == 2 && CHAPTER == 6 {
            currentQuestionArray = n3ch7array
        } else if LEVEL == 2 && CHAPTER == 7 {
            currentQuestionArray = n3ch8array
        } else if LEVEL == 2 && CHAPTER == 8 {
            currentQuestionArray = n3ch9array
        } else if LEVEL == 2 && CHAPTER == 9 {
            currentQuestionArray = n3ch10array
        } else if LEVEL == 2 && CHAPTER == 10 {
            currentQuestionArray = n3ch11array
        } else if LEVEL == 2 && CHAPTER == 11 {
            currentQuestionArray = n3ch12array
        } else if LEVEL == 2 && CHAPTER == 12 {
            currentQuestionArray = n3ch13array
        } else if LEVEL == 2 && CHAPTER == 13 {
            currentQuestionArray = n3ch14array
        } else if LEVEL == 2 && CHAPTER == 14 {
            currentQuestionArray = n3ch15array
        } else if LEVEL == 2 && CHAPTER == 15 {
            currentQuestionArray = n3ch16array
        } else if LEVEL == 2 && CHAPTER == 16 {
            currentQuestionArray = n3ch17array
        } else if LEVEL == 2 && CHAPTER == 17 {
            currentQuestionArray = n3ch18array
        } else if LEVEL == 2 && CHAPTER == 18 {
            currentQuestionArray = n3ch19array
        } else if LEVEL == 2 && CHAPTER == 19 {
            currentQuestionArray = n3ch20array
        } else if LEVEL == 2 && CHAPTER == 20 {
            currentQuestionArray = n3ch21array
        } else if LEVEL == 2 && CHAPTER == 21 {
            currentQuestionArray = n3ch22array
        } else if LEVEL == 2 && CHAPTER == 22 {
            currentQuestionArray = n3ch23array
        } else if LEVEL == 2 && CHAPTER == 23 {
            currentQuestionArray = n3ch24array
        } else if LEVEL == 2 && CHAPTER == 24 {
            currentQuestionArray = n3ch25array
        } else if LEVEL == 2 && CHAPTER == 25 {
            currentQuestionArray = n3ch26array
        } else if LEVEL == 2 && CHAPTER == 26 {
            currentQuestionArray = n3ch27array
        } else if LEVEL == 2 && CHAPTER == 27 {
            currentQuestionArray = n3ch28array
        } else if LEVEL == 2 && CHAPTER == 28 {
            currentQuestionArray = n3ch29array
        } else if LEVEL == 2 && CHAPTER == 29 {
            currentQuestionArray = n3ch30array
        } else {
            // エラー処理
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
                    let quizViewController = storyboard.instantiateViewController(withIdentifier: "QuizViewController") as! QuizViewController
                    self.navigationController?.pushViewController(quizViewController, animated: true)
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
