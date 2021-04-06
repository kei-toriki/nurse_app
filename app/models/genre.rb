class Genre < ActiveHash::Base
  self.data = [
   { id: 1, name: '--' },
   { id: 2, name: '知識' },
   { id: 3, name: 'アセスメント' },
   { id: 4, name: '人間関係' },
   { id: 5, name: '管理職' },
   { id: 6, name: 'リーダー' },
   { id: 7, name: '経営' },
   { id: 8, name: '医者向け' },
   { id: 9, name: '医療関連ニュース' },
   { id: 10, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :questions
  
end