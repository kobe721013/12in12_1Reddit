require 'rails_helper'

RSpec.describe Comment, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "個別link的留言個數要正確" do
    l1 = Link.create(title:"wow, cool", url:"www.abc.com")
    l1.comments.create(message:"great, thanks")
    l1.comments.create(message:"it is my wanted")
    l1.comments.create(message:"i like it")


    l2 = Link.create(title:"hope u like it", url:"www.ddd.com")
    l2.comments.create(message:"no good")

    expect(l1.comments.count).to be(3)
    expect(l2.comments.count).to be(1)
  end

  it "新留言要在每筆link最上面" do
    #todo...

  end


end
