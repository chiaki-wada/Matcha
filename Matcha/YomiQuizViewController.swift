//
//  YomiQuizViewController.swift
//  Matcha
//
//  Created by Chiaki Wada on 2023/06/06.
//

import UIKit

class YomiQuizViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var titleShadowLabel: UILabel!
    @IBOutlet var chapterLabel: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var kanjiLabel: UILabel!
    @IBOutlet var checkmarkImageView: UIImageView!
    @IBOutlet var goodjobLabel: UILabel!
    @IBOutlet var relearnImageView: UIImageView!
    @IBOutlet var kotaeLabel: UILabel!
    
    var CHAPTER: Int = 0
    var LEVEL: Int = 0
    
    //JLPT N1
    var n1ch1array = [
        ["hiragana":"ぶんしょ","kanji":"文書","meaning":"document, writing, paperwork"],
        ["hiragana":"だげき","kanji":"打撃","meaning":"blow, shock, strike"],
        ["hiragana":"ほうしゅう","kanji":"報酬","meaning":"emuneration, recompense, reward"],
        ["hiragana":"いみん","kanji":"移民","meaning":"emigration, immigration"],
        ["hiragana":"いぜん","kanji":"依然","meaning":"still; as yet; as it has been"],
        ["hiragana":"じぞく","kanji":"持続","meaning":"continuation; persisting; lasting; sustaining; enduring"],
        ["hiragana":"かたむける","kanji":"傾ける","meaning":"to incline, to lean, to tilt"],
        ["hiragana":"こうい","kanji":"好意","meaning":"good will, favor, courtesy"],
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
        ["hiragana":"じぜん","kanji":"事前","meaning":"prior; beforehand; in advance"]
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
        ["hiragana":"つうじょう","kanji":"通常","meaning":"usual; ordinary; normal; regular; general; common"],
        ["hiragana":"うんよう","kanji":"運用","meaning":"making use of, application"],
        ["hiragana":"びんかん","kanji":"敏感","meaning":"sensitive; alert; aware; susceptible"],
        ["hiragana":"ぶか","kanji":"部下","meaning":"subordinate person"]
    ]
    
    var n1ch11array = [
        ["hiragana":"ちかづく","kanji":"近づく","meaning":"to approach; to draw near; to get close; to get acquainted with; to get closer to; to get to know"],
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
        ["hiragana":"なやみ","kanji":"悩み","meaning":"trouble; troubles; worry; distress; sorrows; anguish; agony; problem"],
        ["hiragana":"おそう","kanji":"襲う","meaning":"to attack, to assail"],
        ["hiragana":"さいあく","kanji":"最悪","meaning":"worst; horrible; horrid; awful; terrible"],
        ["hiragana":"せっとく","kanji":"説得","meaning":"persuasion"],
        ["hiragana":"てんかん","kanji":"転換","meaning":"conversion; diversion; changeover; commutation; switchover"],
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
        ["hiragana":"しょうさい","kanji":"詳細","meaning":"details; particulars; specifics; detailed; specific; minute"],
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
        ["hiragana":"うながす","kanji":"促す","meaning":"to urge; to encourage; to press; to prompt; to draw"],
        ["hiragana":"だっしゅつ","kanji":"脱出","meaning":"escape; break-out; prolapse; proptosis"],
        ["hiragana":"どくせん","kanji":"独占","meaning":"monopoly; monopolization; exclusivity; keeping to oneself"],
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
        ["hiragana":"こうかい","kanji":"公開","meaning":"opening to the public; making available to the public; putting on display; exhibiting; showing"],
        ["hiragana":"しょうたい","kanji":"正体","meaning":"true character, true form"]
    ]
    
    var n1ch16array = [
        ["hiragana":"しゅうえき","kanji":"収益","meaning":"earnings, proceeds, returns"],
        ["hiragana":"たいけん","kanji":"体験","meaning":"personal experience; physical experience; one's own experience"],
        ["hiragana":"つよまる","kanji":"強まる","meaning":"to get strong, to gain strength"],
        ["hiragana":"ゆうわく","kanji":"誘惑","meaning":"temptation, allurement"],
        ["hiragana":"えいぞう","kanji":"映像","meaning":"image"],
        ["hiragana":"げんち","kanji":"現地","meaning":"actual place, local"],
        ["hiragana":"ひなん","kanji":"避難","meaning":"taking refuge; finding shelter; evacuation; escape; seeking safe haven"],
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
        ["hiragana":"しゅうしゅう","kanji":"収集","meaning":"collecting; accumulating; gathering; collection"],
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
        ["hiragana":"おとずれる","kanji":"訪れる","meaning":"to visit; to call on; to arrive; to come; to appear"],
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
        ["hiragana":"うちあける","kanji":"打ち明ける","meaning":"to confide; to reveal; to disclose; to lay bare; to speak frankly; to open"],
        ["hiragana":"やしん","kanji":"野心","meaning":"ambition, aspiration"],
        ["hiragana":"よういん","kanji":"要因","meaning":"main cause; primary factor"],
        ["hiragana":"ぶんさん","kanji":"分散","meaning":"dispersion, breakup"],
        ["hiragana":"ちんもく","kanji":"沈黙","meaning":"silence, being silent"],
        ["hiragana":"げんみつ","kanji":"厳密","meaning":"strict, close, precise"],
        ["hiragana":"へんかく","kanji":"変革","meaning":"change, transformation"],
        ["hiragana":"へんけん","kanji":"偏見","meaning":"prejudice, narrow view"],
        ["hiragana":"ほうかい","kanji":"崩壊","meaning":"collapse, crumbling"],
        ["hiragana":"かわす","kanji":"交わす","meaning":"to exchange, to intersect, to cross"],
        ["hiragana":"こせい","kanji":"個性","meaning":"individuality; personality; idiosyncrasy; character; individual characteristic"],
        ["hiragana":"みなもと","kanji":"源","meaning":"source, origin, root"],
        ["hiragana":"むこう","kanji":"無効","meaning":"invalid, no effect"],
        ["hiragana":"さだめる","kanji":"定める","meaning":"to decide; to determine; to establish; to lay down; to prescribe"],
        ["hiragana":"さいせい","kanji":"再生","meaning":"regeneration; restoration to life; reformation; rehabilitation; playback"]
    ]
    
    var n1ch19array = [
        ["hiragana":"せいじつ","kanji":"誠実","meaning":"sincere, honest, faithful"],
        ["hiragana":"しじ","kanji":"支持","meaning":"support; backing; endorsement; approval"],
        ["hiragana":"とうし","kanji":"投資","meaning":"investment"],
        ["hiragana":"ばいしゅう","kanji":"買収","meaning":"acquisition, buy-out, takeover"],
        ["hiragana":"ぼうりょく","kanji":"暴力","meaning":"violence, mayhem"],
        ["hiragana":"ぶんぱい","kanji":"分配","meaning":"division; splitting; sharing; distribution; dissemination; allocation"],
        ["hiragana":"どうるい","kanji":"同類","meaning":"the same kind"],
        ["hiragana":"どうとう","kanji":"同等","meaning":"equality; equal; same rights; same rank; equivalence"],
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
        ["hiragana":"じぎょう","kanji":"事業","meaning":"project; enterprise; business; industry; operations; venture; service"],
        ["hiragana":"かいにゅう","kanji":"介入","meaning":"intervention"],
        ["hiragana":"かけ","kanji":"賭け","meaning":"betting, gambling"],
        ["hiragana":"かくほ","kanji":"確保","meaning":"securing; obtaining; ensuring; guarantee; maintaining"],
        ["hiragana":"けいげん","kanji":"軽減","meaning":"abatement; reduction"],
        ["hiragana":"きてい","kanji":"規定","meaning":"stipulation; prescription; provision; regulation; rule"],
        ["hiragana":"おもに","kanji":"重荷","meaning":"load, heavy burden"],
        ["hiragana":"おろか","kanji":"愚か","meaning":"foolish, stupid"]
    ]
    
    var n1ch22array = [
        ["hiragana":"ろんり","kanji":"論理","meaning":"logic, logical"],
        ["hiragana":"さいよう","kanji":"採用","meaning":"use; adoption; acceptance; appointment; employment; engagement; recruitment"],
        ["hiragana":"せいとう","kanji":"正当","meaning":"just, justifiable, right"],
        ["hiragana":"しめい","kanji":"使命","meaning":"mission; errand; task; duty; obligation"],
        ["hiragana":"しんか","kanji":"進化","meaning":"evolution; progress"],
        ["hiragana":"しょうちょう","kanji":"象徴","meaning":"symbol"],
        ["hiragana":"しょうめつ","kanji":"消滅","meaning":"extinction, extinguishment"],
        ["hiragana":"そち","kanji":"措置","meaning":"measure, measures, step"],
        ["hiragana":"そんしつ","kanji":"損失","meaning":"loss"],
        ["hiragana":"たっせい","kanji":"達成","meaning":"achievement; attainment; accomplishment; realization"],
        ["hiragana":"つげる","kanji":"告げる","meaning":"to tell, to inform"],
        ["hiragana":"うんえい","kanji":"運営","meaning":"management; administration; operation"],
        ["hiragana":"ようけん","kanji":"用件","meaning":"business; thing to be done; something that should be performed; information that should be conveyed"]
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
    
    //JLPT N3
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
    
    
    var currentQuestionIndex: Int = 0
    var shuffledQuestions: [[String:String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        textField.delegate = self
        
        // 初期状態で非表示に設定する
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
        } else if LEVEL == 0 && CHAPTER == 1 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 2"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch2array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 0 && CHAPTER == 2 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 3"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch3array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 0 && CHAPTER == 3 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 4"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch4array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 0 && CHAPTER == 4 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 5"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch5array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 0 && CHAPTER == 5 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 6"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch6array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 0 && CHAPTER == 6 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 7"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch7array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 0 && CHAPTER == 7 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 8"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch8array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 0 && CHAPTER == 8 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 9"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch9array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 0 && CHAPTER == 9 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 10"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch10array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 0 && CHAPTER == 10 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 11"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch11array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 0 && CHAPTER == 11 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 12"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch12array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 0 && CHAPTER == 12 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 13"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch13array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 0 && CHAPTER == 13 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 14"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch14array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 0 && CHAPTER == 14 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 15"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch15array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 0 && CHAPTER == 15 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 16"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch16array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 0 && CHAPTER == 16 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 17"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch17array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 0 && CHAPTER == 17 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 18"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch18array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 0 && CHAPTER == 18 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 19"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch19array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 0 && CHAPTER == 19 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 20"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch20array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 0 && CHAPTER == 20 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 21"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n1ch21array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 0 && CHAPTER == 21 {
            titleLabel.text = "JLPT N1 Vocabulary"
            titleShadowLabel.text = "JLPT N1 Vocabulary"
            chapterLabel.text = "Chapter 22"
            totalLabel.text = "total 13 words"
            shuffledQuestions = shuffleArray(n1ch22array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 1 && CHAPTER == 0 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 1"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch1array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 1 && CHAPTER == 0 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 2"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch2array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 1 && CHAPTER == 1 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 3"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch3array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 1 && CHAPTER == 0 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 2"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch2array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 1 && CHAPTER == 1 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 3"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch3array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 1 && CHAPTER == 2 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 4"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch4array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 1 && CHAPTER == 3 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 5"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch5array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 1 && CHAPTER == 4 {
            titleLabel.text = "JLPT N2 Vocabulary"
            titleShadowLabel.text = "JLPT N2 Vocabulary"
            chapterLabel.text = "Chapter 6"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n2ch6array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 2 && CHAPTER == 0 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 1"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch1array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 2 && CHAPTER == 1 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 1"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch2array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 2 && CHAPTER == 2 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 2"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch3array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 2 && CHAPTER == 3 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 3"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch4array)
            kanjiLabel.text = shuffledQuestions[currentQuestionIndex]["kanji"]
        } else if LEVEL == 2 && CHAPTER == 4 {
            titleLabel.text = "JLPT N3 Vocabulary"
            titleShadowLabel.text = "JLPT N3 Vocabulary"
            chapterLabel.text = "Chapter 4"
            totalLabel.text = "total 20 words"
            shuffledQuestions = shuffleArray(n3ch5array)
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
                kanjiLabel.text = nextQuestion["kanji"]
                
                textField.text = ""
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
    
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
