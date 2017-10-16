# require_relative '../lib/telegraph.rb'

# using NodeHelper

# # telegraph = Telegraph::Account.create do
# #   short_name 'keka'
# #   author_name 'kek'
# #   author_url 'kek'
# # end

# telegraph = Telegraph.client('a24dbcafbd49a962e4a7f5842410afdb07e49f0f7ac108a3c68146e75ca5')

# # telegraph = Telegraph.create_account(
# #   short_name: 'keka',
# #   author_name: 'keka',
# #   author_url: 'http://author.com'
# # )

# par = Nokogiri::XML("<p>keksto<b>KEK</b></p>").children.map do |elem|
#   elem.to_node
# end

# #p par

# p telegraph.create_page({title: 'test', content: par})
# #p telegraph.get_account_info
