require 'telegraph'

describe Telegraph::Client, :vcr do
  let(:token) {'a24dbcafbd49a962e4a7f5842410afdb07e49f0f7ac108a3c68146e75ca5'}

  describe 'create_page' do
    let(:client) { Telegraph::Client.new(token) }
    let(:content) { [{tag: 'p', children:['Hello']}].to_json }
    subject do
      client.create_page({title: 'keka', content: content})
    end

    it 'dsd' do
      p subject.ok
    end
  end
end