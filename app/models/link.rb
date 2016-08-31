class Link < ApplicationRecord
  has_many :comments, -> {order(created_at: :desc)}
  default_scope{ order(id: :desc) }
#p "link instance_methods:#{Link.instance_methods.sort}"


  def self.reload
    Link.order(id: :desc)
  end

end
