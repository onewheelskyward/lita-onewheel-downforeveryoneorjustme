module Lita
  module Handlers
    class OnewheelDownForEveryoneOrJustMe < Handler
      route /isitdown (.*)/, :down_for_everyone_or_just_me, command: true

      def down_for_everyone_or_just_me(response)

      end

      Lita.register_handler(self)
    end
  end
end
