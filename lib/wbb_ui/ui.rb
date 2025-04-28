# app/lib/wbb_ui/ui.rb

require "ostruct"

module WbbUi
  class Ui
    include ActionView::Helpers::RenderingHelper
    include ActionView::Helpers::TagHelper
    include ActionView::Context

    def initialize(view_context)
      @view = view_context
    end

    def method_missing(name, *args, **kwargs, &block)
      partial = "wbb_ui/components/#{name}"

      object = args.first

      if object.nil? && kwargs.any?
        object = OpenStruct.new(kwargs)
      elsif object.is_a?(Hash)
        object = OpenStruct.new(object)
      end

      if block
        slot_context = SlotContext.new(@view)
        @view.capture(slot_context, &block)
        @view.render(partial, name => object, slots: slot_context)
      else
        @view.render(partial, name => object)
      end
    end
  end

  class SlotContext
    def initialize(view_context)
      @view_context = view_context
      @slots = {}
    end

    def method_missing(name, *args, &block)
      if block_given?
        # Falls ein Block übergeben wird => Speichern unter dem Namen
        @slots[name] = @view_context.capture(&block)
      else
        # Falls einfach aufgerufen wird => Rückgabe
        @slots[name]
      end
    end

    def respond_to_missing?(name, include_private = false)
      true
    end
  end
  
end