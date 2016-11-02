class Link < ApplicationRecord
  has_many :comments, -> {order(created_at: :desc)}
  belongs_to :user
  #新的link在最上面
  default_scope{ order(id: :desc) }
#p "link instance_methods:#{Link.instance_methods.sort}"


  def self.reload
    Link.order(id: :desc)
  end

end
