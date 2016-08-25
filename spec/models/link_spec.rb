require 'rails_helper'

RSpec.describe Link, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "post URL的個數檢查" do
    Link.create(title:"1_url", url:"www.abc")
    Link.create(title:"2_url", url:"www.dfsfsd")  
    expect(Link.all.count).to be(2)
  end

  it "最新的貼文排在第一位" do
    l1 = Link.create(title:"1_url", url:"www.abc")
    l2 = Link.create(title:"2_url", url:"www.dfsfsd")

    expect(Link.reload).to eq([l2, l1])
  end

end
