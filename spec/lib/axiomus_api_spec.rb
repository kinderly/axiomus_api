require_relative '../spec_helper'

describe AxiomusApi do
  it 'should assign logger' do
    described_class.logger = Logger.new($stdout)
  end
end
