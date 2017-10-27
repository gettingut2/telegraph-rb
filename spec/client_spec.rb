require 'telegraph'

describe Telegraph::Client, :vcr do
  let(:token) {'a24dbcafbd49a962e4a7f5842410afdb07e49f0f7ac108a3c68146e75ca5'}
  let(:client) { Telegraph.setup(token) }
  let(:account) { client.account }
  let(:configuration) {Telegraph.configuration}

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

      it 'raises error' do
        expect{subject}.to raise_error(ArgumentError, 'CONTENT_TEXT_REQUIRED')
      end
    end
  end

  describe 'edit_account_info' do
    subject do
      client.edit_account_info(
          short_name: 'new name',
          author_name: 'new author',
          author_url: 'http://new-url.com'
      )
    end

    it 'changes account short_name' do
      p account
      expect{subject}.to change{account.short_name}.from('keka').to('new name')
    end
    # it 'changes account acuthor name' do
    #   expect{subject}.to change{account.author_name}.from('keka').to('new name')
    # end
  end
end