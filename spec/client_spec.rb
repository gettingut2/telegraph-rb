require 'telegraph'

describe Telegraph::Client, :vcr do
  let(:token) {'a24dbcafbd49a962e4a7f5842410afdb07e49f0f7ac108a3c68146e75ca5'}
  let(:client) { Telegraph::Client.new(token) }
  let(:account) { client.account }

  describe 'create_page' do
    subject { client.create_page({title: 'keka', content: content}) }

    context 'content given' do
      let(:content) { [{tag: 'p', children:['Hello']}].to_json }

      it 'creates page' do
        expect(subject).to be_a Telegraph::Page
      end
    end

    context 'content not given' do
      let(:content) { [{tag: 'p', children:['']}].to_json }

      it 'creates page' do
        expect{subject}.to raise_error(ArgumentError, 'CONTENT_TEXT_REQUIRED')
      end
    end
  end

  describe 'edit_account_info' do
    subject do
      client.edit_account_info(
        {
          short_name: 'new name',
          author_name: 'new author',
          author_url: 'http://new-url.com'
        }
      )
    end

    it 'changes account attributes' do
      p account
    end
  end
end