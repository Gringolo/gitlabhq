module Gitlab
  module Ci
    class Config
      module Node
        class Validator < SimpleDelegator
          include ActiveModel::Validations
          include Node::Validators

          def initialize(node)
            super(node)
            @node = node
          end

          def messages
            errors.full_messages.map do |error|
              "#{location} #{error}".humanize
            end
          end

          def self.name
            'Validator'
          end

          private

          def location
            key || @node.class.name.demodulize.underscore
          end
        end
      end
    end
  end
end
