require 'spec_helper'

describe Guard::Sunspot do
  let(:options) { {} }
  let(:plugin_instance) { described_class.new(options) }

  before do
    # Silence UI.info output
    allow(::Guard::UI).to receive(:info).and_return(true)
    allow(::Guard::Notifier).to receive(:notify).and_return(true)
  end

  describe '#initialize' do
    subject { plugin_instance }

    context 'when the bundler option is specified' do
      let(:options) { {bundler: true} }
      it 'stores the option' do
        expect(subject.instance_variable_get(:@bundler)).to eq(true)
      end
      it 'sets the zeus option to false' do
        expect(subject.instance_variable_get(:@zeus)).to eq(false)
      end
    end

    context 'when the zeus option is specified' do
      let(:options) { {zeus: true} }
      it 'stores the option as true' do
        expect(subject.instance_variable_get(:@zeus)).to eq(true)
      end
      it 'sets the bundler option to false' do
        expect(subject.instance_variable_get(:@bundler)).to eq(false)
      end
    end

    context 'when an environment is specified' do
      let(:options) { {environment: 'foo'} }
      it 'stores the environment' do
        expect(subject.instance_variable_get(:@environment)).to eq('foo')
      end
    end

    context 'when no environment is specified' do
      it 'defaults to "development"' do
        expect(subject.instance_variable_get(:@environment)).to eq('development')
      end
    end
  end

  describe '#start' do
    it 'makes a system call to start solr' do
      expect(plugin_instance).to receive(:system).with(/sunspot:solr:start/)
      plugin_instance.start
    end
  end

  describe '#stop' do
    it 'makes a system call to stop solr' do
      expect(plugin_instance).to receive(:system).with(/sunspot:solr:stop/)
      plugin_instance.stop
    end
  end

  describe '#reload' do
    it 'calls stop then start' do
      expect(plugin_instance).to receive(:stop).ordered
      expect(plugin_instance).to receive(:start).ordered
      plugin_instance.reload
    end
  end

  describe '#run_on_change (for guard 1.0.x and earlier)' do
    it 'calls reload' do
      expect(plugin_instance).to receive(:reload)
      plugin_instance.run_on_change('/file')
    end
  end

  describe '#run_on_changes' do
    it 'calls reload' do
      expect(plugin_instance).to receive(:reload)
      plugin_instance.run_on_change('/file')
    end
  end

  describe '#rake' do
    subject { plugin_instance.send(:rake) }
    context "when bundler is enabled" do
      let(:options) { {bundler: true} }
      it { is_expected.to eq('bundle exec rake') }
    end

    context "when zeus is enabled" do
      let(:options) { {zeus: true} }
      it { is_expected.to eq('zeus rake') }
    end

    context "when neither are enabled" do
      it { is_expected.to eq('rake') }
    end
  end
end
