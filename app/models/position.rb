class Position < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '看護師' },
    { id: 3, name: '准看護師' },
    { id: 4, name: '医者' },
    { id: 5, name: '理学療法士' },
    { id: 6, name: '作業療法士' },
    { id: 7, name: '言語聴覚士' },
    { id: 8, name: '薬剤師' },
    { id: 9, name: '介護福祉士' },
    { id: 10, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :introductions
  end