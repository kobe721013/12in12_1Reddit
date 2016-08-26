class Link < ApplicationRecord
  has_many :comments
  #p "link instance_methods:#{Link.instance_methods.sort}"


  def self.reload
    Link.order(id: :desc)
  end

end
