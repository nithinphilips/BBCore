require 'ostruct'
require 'albacore/support/openstruct'

module RapcConfig
    include Albacore::Configuration

    def self.rapcconfig
        @config ||= OpenStruct.new.extend(OpenStructToHash).extend(RapcConfig)
    end

    def rapc
        config ||= RapcConfig.rapcconfig
        yield(config) if block_given?
        config
    end

   def self.included(mod)
       # nothing to do
   end

end
