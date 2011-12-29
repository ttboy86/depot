require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  
  def new_product(image_url) 
    Product.new(
    :title => "Nao acredito no natal",
    :description => 'yyyyyyyyyyyyyyy',
    :price => 12934.11,
    :image_url => image_url
    )
  end
  
   test "product attributes must have properties" do
     product = Product.new
     assert product.invalid?
     assert product.errors[:title].any?
     assert product.errors[:description].any?
     assert product.errors[:price].any?
     assert product.errors[:image_url].any?
   end
   
   
  test "image_url" do

     ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
     nok = %w{ fred.doc fred.gif/more fred.gif.more }
     
     ok.each do |name|
       assert new_product(name).valid? , "#{name} should be valid"
     end
     
     nok.each do |name|
       assert new_product(name).invalid?, "#{name} should be invalid"
     end
  
end
  
  test "product price must be positive" do
  product = Product.new(:title => "Testinho",
                        :description => "bla bla bla bla bla bla bla",
                        :image_url => "bunda.jpg"  )
                           
  product.price = -1
  assert product.invalid?
  assert_equal "must be greater than or equal to 0.01",product.errors[:price].join("; ")
    
  product.price = 0
  assert product.invalid?
  assert_equal "must be greater than or equal to 0.01",product.errors[:price].join("; ") 
     
  product.price = 1
  assert product.valid? 
end

  test "product description must have at least 10 chars"do
  product = Product.new(:title => "Testinho",
                        :price => 10,
                        :image_url => "bunda.jpg"  )

  product.description = "a"*9
  assert product.invalid?,"Nove chars deveria ser invalido"
  
  product.description = %{b}*10
  assert product.valid?,%{Dez chars deveria ser valido}

end

  test "product is not valid without a unique title" do
    product = Product.new(
    :title => products(:ruby).title,
    :description => 'yyyyyyyyyyyyy',
    :price => 1,
    :image_url => "fred.jpg"
    )
    
    assert !product.save
    assert_equal 'has already been taken',product.errors[:title].join("; ")    
end

end