class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '医療系' },
    { id: 3, name: '心理・福祉・リハビリ' },
    { id: 4, name: '美容・ファッション' },
    { id: 5, name: '旅行・ホテル' },
    { id: 6, name: '飲食' },
    { id: 7, name: '販売' },
    { id: 8, name: '教育・研究・保育' },
    { id: 9, name: '動物' },
    { id: 11, name: 'デザイン・広告' },
    { id: 12, name: 'IT・Web' },
    { id: 13, name: '法律・士業・政治' },
    { id: 14, name: '公務員' },
    { id: 15, name: '金融・コンサル' },
    { id: 16, name: '貿易' },
    { id: 17, name: '建築・インテリア' },
    { id: 18, name: '不動産' },
    { id: 19, name: '事務' },
    { id: 20, name: 'オフィス' },
    { id: 21, name: '営業' },
    { id: 22, name: '商社' },
    { id: 23, name: '通信' },
    { id: 24, name: '製造' },
    { id: 25, name: '運輸・輸送' },
    { id: 26, name: '冠婚葬祭' },
    { id: 27, name: '農業' },
    { id: 28, name: '林業' },
    { id: 29, name: '漁業' },
    { id: 30, name: '出版・報道' },
    { id: 31, name: 'テレビ・映画' },
    { id: 32, name: '音楽・ラジオ' },
    { id: 33, name: '芸能' },
    { id: 34, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :articles

  end