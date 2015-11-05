require 'spec_helper'

describe 'ec2_facts' do
  let(:msg) { 'You should use the new `ec2_metadata` fact' }

  context 'with fix disabled' do

    context 'when using the new fact' do
      let(:code) { "notice($::ec2_metadata)" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end

    context 'when accessing a key of the new fact' do
      let(:code) { "notice($::ec2_metadata['hostname'])" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end
    end

    context 'when using $::ec2_hostname' do
      let(:code) { "notice($::ec2_hostname)" }

      it 'should detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should create a warning' do
        expect(problems).to contain_warning(msg).on_line(1).in_column(8)
      end
    end

    context 'when using $ec2_hostname' do
      let(:code) { "notice($ec2_hostname)" }

      it 'should detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should create a warning' do
        expect(problems).to contain_warning(msg).on_line(1).in_column(8)
      end
    end

    context 'when using $::ec2_public_hostname' do
      let(:code) { "notice($::ec2_public_hostname)" }

      it 'should detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should create a warning' do
        expect(problems).to contain_warning(msg).on_line(1).in_column(8)
      end
    end
  end

  context 'with fix enabled' do
    before do
      PuppetLint.configuration.fix = true
    end

    after do
      PuppetLint.configuration.fix = false
    end

    context 'when using the new fact' do
      let(:code) { "notice($::ec2_metadata)" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end

      it 'should not modify the manifest' do
        expect(manifest).to eq(code)
      end
    end

    context 'when accessing a key of the new fact' do
      let(:code) { "notice($::ec2_metadata['hostname'])" }

      it 'should not detect any problems' do
        expect(problems).to have(0).problems
      end

      it 'should not modify the manifest' do
        expect(manifest).to eq(code)
      end
    end

    context 'when using $::ec2_hostname' do
      let(:code) { "notice($::ec2_hostname)" }

      it 'should detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should fix the problem' do
        expect(problems).to contain_fixed(msg).on_line(1).in_column(8)
      end

      it 'should use ec2_metadata[]' do
        expect(manifest).to eq("notice($::ec2_metadata['hostname'])")
      end
    end

    context 'when using $ec2_hostname' do
      let(:code) { "notice($ec2_hostname)" }

      it 'should detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should not modify the manifest' do
        expect(manifest).to eq(code)
      end
    end

    context 'when using $::ec2_public_hostname' do
      let(:code) { "notice($::ec2_public_hostname)" }

      it 'should detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should fix the problem' do
        expect(problems).to contain_fixed(msg).on_line(1).in_column(8)
      end

      it 'should use ec2_metadata[]' do
        expect(manifest).to eq("notice($::ec2_metadata['public-hostname'])")
      end
    end

    context 'when using $ec2_public_hostname' do
      let(:code) { "notice($ec2_public_hostname)" }

      it 'should detect a single problem' do
        expect(problems).to have(1).problem
      end

      it 'should not modify the manifest' do
        expect(manifest).to eq(code)
      end
    end
  end
end
