# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: 'dumbo_test',
  email: 'dumbo@test.com',
  password: 'password',
  age: '2020-01-03 00:00:00',
  sex: "男性"
)

Admin.create!(
  name: 'admin_dumbo',
  email: 'dumbo.fs@gmail.com',
  password: 'DumboAppPass'
)

Genre.create!(
  name: '運動'
)

Genre.create!(
  name: '睡眠'
)

Genre.create!(
  name: '早起き'
)

Genre.create!(
  name: '勉強'
)

Genre.create!(
  name: '読書'
)

Genre.create!(
  name: 'ダイエット'
)

Genre.create!(
  name: '瞑想'
)

Genre.create!(
  name: '家事'
)

Genre.create!(
  name: '悪い習慣'
)

Genre.create!(
  name: 'その他'
)

Psychology.create!(
  title: '目標プランニング',
  psychology_image: open("./db/fixtures/目標プランニング_icon.png"),
  discription_image: open("./db/fixtures/説明/目標プランニング.png")
)
Psychology.create!(
  title: 'パワフル発言',
  psychology_image: open("./db/fixtures/パワフル発言_icon.png"),
  discription_image: open("./db/fixtures/説明/パワフル発言.png")
)
Psychology.create!(
  title: '行動チェーン',
  psychology_image: open("./db/fixtures/行動チェーン_icon.png"),
  discription_image: open("./db/fixtures/説明/行動チェーン.png")
)
Psychology.create!(
  title: 'こつこつプランニング',
  psychology_image: open("./db/fixtures/こつこつプランニング_icon.png"),
  discription_image: open("./db/fixtures/説明/こつこつプランニング.png")
)
Psychology.create!(
  title: '張り紙効果',
  psychology_image: open("./db/fixtures/張り紙効果_icon.png"),
  discription_image: open("./db/fixtures/説明/張り紙効果.png")
)
Psychology.create!(
  title: 'ながら習慣',
  psychology_image: open("./db/fixtures/ながら習慣_icon.png"),
  discription_image: open("./db/fixtures/説明/ながら習慣.png")
)
Psychology.create!(
  title: '宣言効果',
  psychology_image: open("./db/fixtures/宣言効果_icon.png"),
  discription_image: open("./db/fixtures/説明/宣言効果.png")
)
Psychology.create!(
  title: '友人サポート',
  psychology_image: open("./db/fixtures/友人サポート_icon.png"),
  discription_image: open("./db/fixtures/説明/友人サポート.png")
)
Psychology.create!(
  title: '過程イメージング',
  psychology_image: open("./db/fixtures/過程イメージング_icon.png"),
  discription_image: open("./db/fixtures/説明/過程イメージング.png")
)
Psychology.create!(
  title: '20秒ルール',
  psychology_image: open("./db/fixtures/20秒ルール_icon.png"),
  discription_image: open("./db/fixtures/説明/20秒ルール.png")
)
Psychology.create!(
  title: '未来イメージング',
  psychology_image: open("./db/fixtures/未来イメージング_icon.png"),
  discription_image: open("./db/fixtures/説明/未来イメージング.png")
)
Psychology.create!(
  title: '逆転の発想(悪い習慣)',
  psychology_image: open("./db/fixtures/逆転の発想_icon.png"),
  discription_image: open("./db/fixtures/説明/逆転の発想.png")
)
Psychology.create!(
  title: 'ストップセンサー(悪い習慣)',
  psychology_image: open("./db/fixtures/ストップセンサー_icon.png"),
  discription_image: open("./db/fixtures/説明/ストップセンサー.png")
)
Psychology.create!(
  title: '思考転換(悪い習慣)',
  psychology_image: open("./db/fixtures/思考転換_icon.png"),
  discription_image: open("./db/fixtures/説明/思考転換.png")
)
Psychology.create!(
  title: 'ボディースキャン(ストレス対策)',
  psychology_image: open("./db/fixtures/ボディースキャン_icon.png"),
  discription_image: open("./db/fixtures/説明/ボディースキャン.png")
)
Psychology.create!(
  title: 'リラックス効果(ストレス対策)',
  psychology_image: open("./db/fixtures/リラックス効果_icon.png"),
  discription_image: open("./db/fixtures/説明/リラックス効果.png")
)

NotificationComment.create!(
  comment: '『失敗したところでやめてしまうから失敗になる。
  成功するところまで続ければそれは成功になる。』',
  date_type: '日',
  action: '',
  author: '松下幸之助'
)
NotificationComment.create!(
  comment: '『失敗？これはうまくいかないということを確認した成功だよ。』',
  date_type: '日',
  action: '',
  author: 'トーマス・エジソン'
)
NotificationComment.create!(
  comment: '『夢中で日を過ごしておれば、
  いつかはわかる時が来る。』',
  date_type: '日',
  action: '',
  author: '坂本龍馬'
)
NotificationComment.create!(
  comment: '『やってみて「ダメだ」とわかったことと、
  はじめから「ダメだ」と言われたことは、違います。』',
  date_type: '日',
  action: '',
  author: 'イチロー'
)
NotificationComment.create!(
  comment: '『人生における大きな喜びは、「君にはできない」と世間が言うことをやってのけることである。』',
  date_type: '日',
  action: '',
  author: 'ウォルター･バジョット'
)
NotificationComment.create!(
  comment: '『必死に生きてこそ、その生涯は光を放つ』',
  date_type: '日',
  action: '',
  author: '織田信長'
)
NotificationComment.create!(
  comment: '『目標を達成するには、全力で取り組む以外に方法はない。
  そこに近道はない。』',
  date_type: '日',
  action: '',
  author: 'マイケル・ジョーダン'
)
NotificationComment.create!(
  comment: '『つらい道を避けないこと。自分の目指す場所にたどりつくためには進まなければ。』',
  date_type: '日',
  action: '',
  author: 'キャサリン・アン・ポーター'
)
NotificationComment.create!(
  comment: '『小さいことを重ねることがとんでもないところに行くただ一つの道だと感じている』',
  date_type: '日',
  action: '',
  author: 'イチロー'
)
NotificationComment.create!(
  comment: '『私たちの最大の弱点は諦めることにある。成功するのに最も確実な方法は、常にもう一回だけ試してみることです。』',
  date_type: '日',
  action: '',
  author: 'トーマス・エジソン'
)
NotificationComment.create!(
  comment: '『努力は必ず報われる。もし報われない努力があるのならば、それはまだ努力と呼べない。』',
  date_type: '日',
  action: '',
  author: '王貞治'
)
NotificationComment.create!(
  comment: '『「まあ、しょうがない」と思うだけでは、しょうがないだけの選手で終わってしまう』',
  date_type: '日',
  action: '',
  author: '落合博満'
)
NotificationComment.create!(
  comment: '『習慣とは非常に軽いものであり、普段はその存在にさえ気づかない。だが一度意識すると、非常に重く断ち難いものであることがわかる』',
  date_type: '日',
  action: '',
  author: 'ウォーレン・バフェット'
)
NotificationComment.create!(
  comment: '『人間は理性の生き物でもなければ、本能の生き物でもない。人間は習慣の生き物である。』',
  date_type: '日',
  action: '',
  author: 'ジョン・デューイ'
)
NotificationComment.create!(
  comment: '『習慣は第二の自然である。第一の自然に比べて弱いものではけっしてない。』',
  date_type: '日',
  action: '',
  author: 'モンテーニュ'
)
NotificationComment.create!(
  comment: '『人の本性は皆ほとんど同じである。違いが生じるのはそれぞれの習慣によってである。』',
  date_type: '日',
  action: '',
  author: '孔子'
)
NotificationComment.create!(
  comment: '『自分を磨き上げておけ。なぜなら、自分自身が世の中を見る窓になるからだ』',
  date_type: '日',
  action: '',
  author: 'ジョージ・バーナード・ショー'
)
NotificationComment.create!(
  comment: '『今日始めなかったことが、明日終わることはない』',
  date_type: '日',
  action: '',
  author: 'ゲーテ'
)
NotificationComment.create!(
  comment: '『習慣が最も完全になるのは、若い頃身につけたものである』',
  date_type: '日',
  action: '',
  author: 'フランシス・ベーコン'
)
NotificationComment.create!(
  comment: '『不規則な生活が続けば、それが規則となる』',
  date_type: '日',
  action: '',
  author: 'ジョセフ・マーフィー'
)
NotificationComment.create!(
  comment: '『途中で諦めないかぎり、失敗はあり得ない』',
  date_type: '日',
  action: '',
  author: 'エルバート・ハバード'
)
NotificationComment.create!(
  comment: '『人生における成功は、幸せが継続的に広がっていくこと』',
  date_type: '日',
  action: '',
  author: 'ディーパック・チョプラ'
)
NotificationComment.create!(
  comment: '『人は心の持ち方を変えることで、人生をも変えることができる存在だ』',
  date_type: '日',
  action: '',
  author: 'ウィリアム・ジェームズ'
)
NotificationComment.create!(
  comment: '『一日一日を、それぞれ新たな人生と考えて生きるべきだ』',
  date_type: '日',
  action: '',
  author: 'ルキウス・アンナエウス・セネカ'
)
NotificationComment.create!(
  comment: '『継続するということは、同じことの繰り返しではなく、成長し続けること』',
  date_type: '日',
  action: '',
  author: '伊達公子'
)
NotificationComment.create!(
  comment: '『言葉は人の才覚を示し、行動は人の真意を示す』',
  date_type: '日',
  action: '',
  author: 'ベンジャミン・フランクリン'
)
NotificationComment.create!(
  comment: '『一日一日を、それぞれ新たな人生と考えて生きるべきだ』',
  date_type: '日',
  action: '',
  author: 'ルキウス・アンナエウス・セネカ'
)
NotificationComment.create!(
  comment: '『人は繰り返し行うことの集大成である』',
  date_type: '日',
  action: '',
  author: 'アリストテレス'
)
NotificationComment.create!(
  comment: '『人間は理性の生き物でもなければ、本能の生き物でもない。人間は習慣の生き物である。』',
  date_type: '日',
  action: '',
  author: 'ジョン・デューイ'
)
NotificationComment.create!(
  comment: '『習慣化はやる気ではなく、やり方だ』',
  date_type: '日',
  action: '',
  author: 'dumbo'
)
NotificationComment.create!(
  comment: 'おめでとうございます!達成率が100%です!あなたは習慣化に向けての行動意識が非常に高いです。引き続き、習慣化方法を意識して継続していきましょう!',
  date_type: '週',
  action: '100',
  author: ''
)
NotificationComment.create!(
  comment: '達成率が85%であり、もう少しで100%達成です!あなたは習慣化に向けての行動が好調です。引き続き、習慣化方法を意識して継続していきましょう!',
  date_type: '週',
  action: '85',
  author: ''
)
NotificationComment.create!(
  comment: '達成率が71%であり、習慣化されている数値です!どうしても習慣化行動ができない日は、『例外ルール』を行いながら継続日を伸ばしましょう!',
  date_type: '週',
  action: '71',
  author: ''
)
NotificationComment.create!(
  comment: '達成率が57%であり、習慣化が身に付き始めています!週に4回以上の習慣化行動が理想のため、計画的に時間を確保できるようにしましょう!',
  date_type: '週',
  action: '57',
  author: ''
)
NotificationComment.create!(
  comment: '達成率が42%であり、習慣化までもう一息です!明日から改めてチャレンジしていきましょう!もし達成率に伸び悩んでいる場合は、あなたに合った習慣化方法を再度検討してみませんか?',
  date_type: '週',
  action: '42',
  author: ''
)
NotificationComment.create!(
  comment: '達成率が28%であり、習慣化に苦戦しているかもしれません。定期的に習慣化を行う目的と目標を見直す意識をしましょう!もし達成率に伸び悩んでいる場合は、自分に合った習慣化方法を再度検討してみませんか?',
  date_type: '週',
  action: '28',
  author: ''
)
NotificationComment.create!(
  comment: '達成率が14%であり、習慣化に苦戦している模様です。継続ができない自分を責めるのではなく、習慣化のやり方の見直してみましょう!あなたに合った習慣化方法を再度検討してみませんか?',
  date_type: '週',
  action: '14',
  author: ''
)
NotificationComment.create!(
  comment: '達成率が28%であり、習慣化行動の時間を確保できていないのかもしれません。計画的に時間を確保する生活を心がけ、まずは達成できる範囲の目標を設定することが大切です。あなたに合った習慣化方法を再度検討してみませんか?',
  date_type: '週',
  action: '0',
  author: ''
)


NotificationComment.create!(
  comment: 'おめでとうございます!達成率が100%です!あなたは習慣化に向けての行動意識が非常に高いです。引き続き、習慣化方法を意識して継続していきましょう!',
  date_type: '月',
  action: '100',
  author: ''
)
NotificationComment.create!(
  comment: '達成率が85%であり、もう少しで100%達成です!あなたは習慣化に向けての行動が好調です。引き続き、習慣化方法を意識して継続していきましょう!',
  date_type: '月',
  action: '85',
  author: ''
)
NotificationComment.create!(
  comment: '達成率が71%であり、習慣化されている数値です!どうしても習慣化行動ができない日は、『例外ルール』を行いながら継続日を伸ばしましょう!',
  date_type: '月',
  action: '71',
  author: ''
)
NotificationComment.create!(
  comment: '達成率が57%であり、習慣化が身に付き始めています!週に4回以上の習慣化行動が理想のため、計画的に時間を確保できるようにしましょう!',
  date_type: '月',
  action: '57',
  author: ''
)
NotificationComment.create!(
  comment: '達成率が42%であり、習慣化までもう一息です!明日から改めてチャレンジしていきましょう!もし達成率に伸び悩んでいる場合は、あなたに合った習慣化方法を再度検討してみませんか?',
  date_type: '月',
  action: '42',
  author: ''
)
NotificationComment.create!(
  comment: '達成率が28%であり、習慣化に苦戦しているかもしれません。定期的に習慣化を行う目的と目標を見直す意識をしましょう!もし達成率に伸び悩んでいる場合は、自分に合った習慣化方法を再度検討してみませんか?',
  date_type: '月',
  action: '28',
  author: ''
)
NotificationComment.create!(
  comment: '達成率が14%であり、習慣化に苦戦している模様です。継続ができない自分を責めるのではなく、習慣化のやり方の見直してみましょう!あなたに合った習慣化方法を再度検討してみませんか?',
  date_type: '月',
  action: '14',
  author: ''
)
NotificationComment.create!(
  comment: '達成率が28%であり、習慣化行動の時間を確保できていないのかもしれません。計画的に時間を確保する生活を心がけ、まずは達成できる範囲の目標を設定することが大切です。あなたに合った習慣化方法を再度検討してみませんか?',
  date_type: '月',
  action: '0',
  author: ''
)
