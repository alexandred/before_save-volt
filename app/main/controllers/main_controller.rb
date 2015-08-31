# By default Volt generates this controller for your Main component
module Main
  class MainController < Volt::ModelController
    model :store
    def index
      page._test = Test.new

      page._test.then do |test|
        page._test_buffer = test.buffer
        page._test_buffer._attribute = "test1"
        page._test_buffer.save!.then do
          tests << page._test
        end
      end

    end

    def about
      # Add code for when the about view is loaded
    end

    private

    # The main template contains a #template binding that shows another
    # template.  This is the path to that template.  It may change based
    # on the params._component, params._controller, and params._action values.
    def main_path
      "#{params._component || 'main'}/#{params._controller || 'main'}/#{params._action || 'index'}"
    end

    # Determine if the current nav component is the active one by looking
    # at the first part of the url against the href attribute.
    def active_tab?
      url.path.split('/')[1] == attrs.href.split('/')[1]
    end
  end
end
