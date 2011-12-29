# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all()
Product.create(
:title => 'Programming Ruby 1.9', 
:description => %{Ruby is the fastest growing and most exciting dynamic language out there. If you need to get working programs delivered fast, you should add Ruby to your toolbox.},
:price => 10.95,
:image_url => 'rails.png'
)
Product.create(
:title => 'EU SOU SUA', 
:description => %{Tenha essas gostosas todas para voce},
:price => 0.95,
:image_url => '1.jpg'
)
Product.create(
:title => 'Carnaval 2007', 
:description => %{ O melhor caranaval,de todos os tempos esta aqui.},
:price => 10.95,
:image_url => '2.jpg'
)
Product.create(
:title => 'As branquelas', 
:description => %{ O melhor caranaval,de todos os tempos esta aqui.},
:price => 10.95,
:image_url => '3.jpg'
)
Product.create(
:title => 'Maquinas da II Guerra', 
:description => %{ O melhor caranaval,de todos os tempos esta aqui.},
:price => 10.95,
:image_url => '4.jpg'
)