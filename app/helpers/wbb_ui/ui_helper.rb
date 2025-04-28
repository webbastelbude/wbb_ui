module WbbUi
  module UiHelper
    def wbb_ui
      @wbb_ui ||= WbbUi::Ui.new(self)
    end
  end
end