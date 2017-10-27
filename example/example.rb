require_relative '../lib/telegraph.rb'

# using NodeHelper

telegraph = Telegraph.create_account(short_name: 'testing')

content = [{:tag=>"h1", :children=>["Mastering Bitcoin"]}, {:tag=>"p", :children=>["Second Edition"]}, {:tag=>"p", :children=>["Programming the Open Blockchain"]}, {:tag=>"p", :children=>["Andreas M. Antonopoulos"]}, {:tag=>"h1", :children=>["Mastering Bitcoin"]}, {:tag=>"h1", :children=>["Revision History for the Second Edition"]},{:tag=>"h1", :children=>["Mastering Bitcoin"]}, {:tag=>"p", :children=>["Second Edition"]}, {:tag=>"p", :children=>["Programming the Open Blockchain"]}, {:tag=>"p", :children=>["Andreas M. Antonopoulos"]}, {:tag=>"h1", :children=>["Mastering Bitcoin"]}, {:tag=>"h1", :children=>["Revision History for the Second Edition"]},{:tag=>"h1", :children=>["Mastering Bitcoin"]}, {:tag=>"p", :children=>["Second Edition"]}, {:tag=>"p", :children=>["Programming the Open Blockchain"]}, {:tag=>"p", :children=>["Andreas M. Antonopoulos"]}, {:tag=>"h1", :children=>["Mastering Bitcoin"]}, {:tag=>"h1", :children=>["Revision History for the Second Edition"]},{:tag=>"h1", :children=>["Mastering Bitcoin"]}, {:tag=>"p", :children=>["Second Edition"]}, {:tag=>"p", :children=>["Programming the Open Blockchain"]}, {:tag=>"p", :children=>["Andreas M. Antonopoulos"]}, {:tag=>"h1", :children=>["Mastering Bitcoin"]}, {:tag=>"h1", :children=>["Revision History for the Second Edition"]},{:tag=>"h1", :children=>["Mastering Bitcoin"]}, {:tag=>"p", :children=>["Second Edition"]}, {:tag=>"p", :children=>["Programming the Open Blockchain"]}, {:tag=>"p", :children=>["Andreas M. Antonopoulos"]}, {:tag=>"h1", :children=>["Mastering Bitcoin"]}, {:tag=>"h1", :children=>["Revision History for the Second Edition"]},{:tag=>"h1", :children=>["Mastering Bitcoin"]}, {:tag=>"p", :children=>["Second Edition"]}, {:tag=>"p", :children=>["Programming the Open Blockchain"]}, {:tag=>"p", :children=>["Andreas M. Antonopoulos"]}, {:tag=>"h1", :children=>["Mastering Bitcoin"]}, {:tag=>"h1", :children=>["Revision History for the Second Edition"]},{:tag=>"h1", :children=>["Mastering Bitcoin"]}, {:tag=>"p", :children=>["Second Edition"]}, {:tag=>"p", :children=>["Programming the Open Blockchain"]}, {:tag=>"p", :children=>["Andreas M. Antonopoulos"]}, {:tag=>"h1", :children=>["Mastering Bitcoin"]}, {:tag=>"h1", :children=>["Revision History for the Second Edition"]},{:tag=>"h1", :children=>["Mastering Bitcoin"]}, {:tag=>"p", :children=>["Second Edition"]}, {:tag=>"p", :children=>["Programming the Open Blockchain"]}, {:tag=>"p", :children=>["Andreas M. Antonopoulos"]}, {:tag=>"h1", :children=>["Mastering Bitcoin"]}, {:tag=>"h1", :children=>["Revision History for the Second Edition"]},{:tag=>"h1", :children=>["Mastering Bitcoin"]}, {:tag=>"p", :children=>["Second Edition"]}, {:tag=>"p", :children=>["Programming the Open Blockchain"]}, {:tag=>"p", :children=>["Andreas M. Antonopoulos"]}, {:tag=>"h1", :children=>["Mastering Bitcoin"]}, {:tag=>"h1", :children=>["Revision History for the Second Edition"]},{:tag=>"h1", :children=>["Mastering Bitcoin"]}, {:tag=>"p", :children=>["Second Edition"]}, {:tag=>"p", :children=>["Programming the Open Blockchain"]}, {:tag=>"p", :children=>["Andreas M. Antonopoulos"]}, {:tag=>"h1", :children=>["Mastering Bitcoin"]}, {:tag=>"h1", :children=>["Revision History for the Second Edition"]}].to_json

#telegraph = Telegraph.setup('a24dbcafbd49a962e4a7f5842410afdb07e49f0f7ac108a3c68146e75ca5')

# # telegraph = Telegraph.create_account(
# #   short_name: 'keka',
# #   author_name: 'keka',
# #   author_url: 'http://author.com'
# # )

# par = Nokogiri::XML("<p>keksto<b>KEK</b></p>").children.map do |elem|
#   elem.to_node
# end

# #p par

p telegraph.create_page({title: 'test', content: content})
# #p telegraph.get_account_info
