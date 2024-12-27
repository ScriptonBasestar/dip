# frozen_string_literal: true

require_relative "../command"

module Dip
  module Commands
    class Provision < Dip::Command
      def execute
        puts "Dip.Commands.Provision#execute >>>>>>>" if Dip.debug?
        provision_key = ARGV[1] || :default
        puts "Dip.Commands.Provision #{Dip.config.provision}" if Dip.debug?
        commands = Dip.config.provision[provision_key.to_sym]

        if commands.nil?
          raise Dip::Error, "Provision key '#{provision_key}' not found!"
        end

        commands.each do |command|
          exec_subprocess(command)
        end
      end
    end
  end
end
