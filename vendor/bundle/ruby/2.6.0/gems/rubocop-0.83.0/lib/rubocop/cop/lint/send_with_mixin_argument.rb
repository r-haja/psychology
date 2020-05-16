# frozen_string_literal: true

module RuboCop
  module Cop
    module Lint
      #
      # This cop checks for `send`, `public_send`, and `__send__` methods
      # when using mix-in.
      #
      # `include` and `prepend` methods were private methods until Ruby 2.0,
      # they were mixed-in via `send` method. This cop uses Ruby 2.1 or
      # higher style that can be called by public methods.
      # And `extend` method that was originally a public method is also targeted
      # for style unification.
      #
      # @example
      #   # bad
      #   Foo.send(:include, Bar)
      #   Foo.send(:prepend, Bar)
      #   Foo.send(:extend, Bar)
      #
      #   # bad
      #   Foo.public_send(:include, Bar)
      #   Foo.public_send(:prepend, Bar)
      #   Foo.public_send(:extend, Bar)
      #
      #   # bad
      #   Foo.__send__(:include, Bar)
      #   Foo.__send__(:prepend, Bar)
      #   Foo.__send__(:extend, Bar)
      #
      #   # good
      #   Foo.include Bar
      #   Foo.prepend Bar
      #   Foo.extend Bar
      #
      class SendWithMixinArgument < Cop
        include RangeHelp

        MSG = 'Use `%<method>s %<module_name>s` instead of `%<bad_method>s`.'
        MIXIN_METHODS = %i[include prepend extend].freeze

        def_node_matcher :send_with_mixin_argument?, <<~PATTERN
          (send
            (const _ _) {:send :public_send :__send__}
            ({sym str} $#mixin_method?)
              $(const _ _))
        PATTERN

        def on_send(node)
          send_with_mixin_argument?(node) do |method, module_name|
            message = message(
              method, module_name.source, bad_location(node).source
            )

            add_offense(node, location: bad_location(node), message: message)
          end
        end

        def autocorrect(node)
          send_with_mixin_argument?(node) do |method, module_name|
            lambda do |corrector|
              corrector.replace(
                bad_location(node), "#{method} #{module_name.source}"
              )
            end
          end
        end

        private

        def bad_location(node)
          loc = node.loc

          range_between(loc.selector.begin_pos, loc.expression.end_pos)
        end

        def message(method, module_name, bad_method)
          format(
            MSG,
            method: method, module_name: module_name, bad_method: bad_method
          )
        end

        def mixin_method?(node)
          MIXIN_METHODS.include?(node.to_sym)
        end
      end
    end
  end
end
