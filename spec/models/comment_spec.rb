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

    l1 = Link.create(title:"wow, cool", url:"www.abc.com")
    c1 = l1.comments.create(message:"great, thanks")
    c2 = l1.comments.create(message:"it is my wanted")
    c3 = l1.comments.create(message:"i like it")
    
		l2 = Link.create(title:"hope u like it", url:"www.ddd.com")
    c21 = l2.comments.create(message:"no good")
    c22 = l2.comments.create(message:"like a bs~")

		#p "#{l1.comments.sort_by &:id}"
    p "comments_methods:#{l1.comments.methods.sort}"
		p "comments_include?(all):#{l1.comments.methods.include?(:all)}"
    p "comments_methods:#{l1.comments.order(created_at: :desc).first.id}"
		expect(l1.comments.order(created_at: :desc)).to eq([c3,c2,c1])#自己排序
    expect(l2.comments.order(created_at: :desc)).to eq([c22,c21])#自己排序
  	expect(l1.comments.all).to(eq([c3,c2,c1]))#app/model/coment.rb已經排序好了
	end


end
