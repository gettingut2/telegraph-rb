require 'telegraph'

describe Telegraph, :vcr do
  let(:token) {'a24dbcafbd49a962e4a7f5842410afdb07e49f0f7ac108a3c68146e75ca5'}

  describe 'self.create_account' do
    context 'short_name given' do
      subject do
        Telegraph.create_account(
          short_name: 'test_name',
          author_name: 'test_author',
          author_url: 'http://author.com'
        )
      end

      it { is_expected.to be_a Telegraph::Account }
      its("short_name") { is_expected.to eq('test_name')}
      its("author_name") { is_expected.to eq('test_author')}
      its("author_url") { is_expected.to eq('http://author.com/')}
    end

    context 'short_name not given' do
      subject do
        -> { Telegraph.create_account(
          short_name: '',
          author_name: 'test_author',
          author_url: 'http://author.com'
        ) }
      end

      it { is_expected.to raise_error(ArgumentError, "short_name can't be nil or blank") }
    end
  end

  describe 'self.client' do
    subject { Telegraph.client(token) }

    its("account.short_name") { is_expected.to eq('keka')}
  end
end