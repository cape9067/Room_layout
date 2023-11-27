
Admin.create!(

  email: 'admin@admin',
  password: 'password'

  )

user1 = User.create(
      email: 'test1@test.com',
      name: 'もちすけ',
      password: "testpassword"
    )
user1.save!
    
user2 = User.create(
      email: 'test2@test.com',
      name: 'ayame',
      password: "testpassword"
    )
    user2.save!
    
user3 = User.create(
      email: 'test3@test.com',
      name: 'ヒカル',
      password: "testpassword"
    )
    user3.save!
    
user4 = User.create(
      email: 'test4@test.com',
      name: 'Ethan',
      password: "testpassword"
    )
    user4.save!
    
user5 = User.create(
      email: 'test5@test.com',
      name: 'ひまり',
      password: "testpassword"
    )
    user5.save!
    
user6 = User.create(
      email: 'test6@test.com',
      name: 'ユウキ',
      password: "testpassword"
    )
    user6.save!


[
  ['個室'],
  ['寝室'],
  ['リビング'],
  ['キッチン'],
  ['ダイニング'],
  ['子供部屋'],
  ['オフィス'],
  ['ロビー'],
  ['店舗'],
  ['事務所'],
  ['研究室']
].each do |name|
  Category.create!(
    { name: name[0] }
  )
end

room1 = Room.new(
      user_id: '1',
      category_ids: [3],
      title: '暖炉のあるリビング',
      body: 'このリビングは温かみと居心地の良さが漂う空間で、目を引くのはその中心にある美しいレンガの暖炉です。壁一面を覆うように積み上げられたレンガは、風格と温かみを部屋に与えています。'
    )

    room1.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'living1.jpg')), filename: 'living1.jpg')
    room1.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'living2.jpg')), filename: 'living2.jpg')
    room1.save!

room2 = Room.new(
      user_id: '3',
      category_ids: [6],
      title: '遊び心が満載の子供部屋',
      body: 'この子供部屋は、創造性や楽しさを重視した空間で、子供たちが安心して遊んだり寝たりできるようにデザインされています。'
    )

    room2.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'kids_room.jpg')), filename: 'kids_room.jpg')
    room2.save!
    
room3 = Room.new(
      user_id: '4',
      category_ids: [8],
      title: 'ロビー',
      body: '訪れる人々が待ち時間を快適に過ごせるようになっています。くつろぎながら会話や待機ができるようになっています。'
    )

    room3.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'lobby.jpg')), filename: 'lobby.jpg')
    room3.save!
    
room4 = Room.new(
      user_id: '1',
      category_ids: [1],
      title: '趣味の部屋',
      body: '趣味の部屋です'
    )

    room4.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'japan_room.jpg')), filename: 'japan_room.jpg')
    room4.save!
    
room5 = Room.new(
      user_id: '6',
      category_ids: [1,2],
      title: 'ダークな雰囲気の寝室',
      body: '暗いトーンや深い色調を用いて、落ち着いた雰囲気を演出しました。'
    )

    room5.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'bedroom.jpg')), filename: 'bedroom.jpg')
    room5.save!
    
room6 = Room.new(
      user_id: '5',
      category_ids: [1],
      title: '書斎',
      body: '祖父がよく使っていた書斎です。少し本が散らばっています。'
    )

    room6.images.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'syosai.jpg')), filename: 'syosai.jpg')
    room6.save!

Bookmark.create(
 user_id: 1,
 room_id: 2
)

Bookmark.create(
 user_id: 1,
 room_id: 5
)

Bookmark.create(
 user_id: 2,
 room_id: 1
)

Bookmark.create(
 user_id: 3,
 room_id: 1
)

Bookmark.create(
 user_id: 3,
 room_id: 6
)
Bookmark.create(
 user_id: 3,
 room_id: 4
)
Bookmark.create(
 user_id: 4,
 room_id: 3
)

Bookmark.create(
 user_id: 5,
 room_id: 3
)

Bookmark.create(
 user_id: 6,
 room_id: 1
)

Comment.create(
  user_id: 1,
  room_id: 2,
  comment: '幻想的な雰囲気で素敵です！'
  )
  
Comment.create(
  user_id: 1,
  room_id: 6,
  comment: 'good'
  )

Comment.create(
  user_id: 2,
  room_id: 5,
  comment: 'よく眠れそう'
  )
Comment.create(
  user_id: 2,
  room_id: 1,
  comment: '陽射しが気持ちよさそう'
  )
Comment.create(
  user_id: 3,
  room_id: 1,
  comment: '冬は大活躍ですね！'
  )
Comment.create(
  user_id: 4,
  room_id: 4,
  comment: '凄い...'
  )
Comment.create(
  user_id: 5,
  room_id: 1,
  comment: 'レンガがいい味を出していますね！'
  )