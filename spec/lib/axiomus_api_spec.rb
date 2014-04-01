require_relative '../spec_helper'

describe 'AxiomusApi' do
  it 'should assign logger' do
    AxiomusApi.logger = Logger.new($stdout)
  end
end
