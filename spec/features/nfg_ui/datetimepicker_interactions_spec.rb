require 'rails_helper'

RSpec.describe 'Bootstrap4-datetimepicker interactions', js: true do
  before { visit datetimepicker_javascript_plugins_path }

  describe 'the combo date and time picker interface' do
    it 'outputs the combo datetime interface' do
      by 'clicking the text input' do
        page.find("input[data-datetimepicker='datetime']").click
      end

      and_it 'shows the calendar with access to the time picker' do
        expect(page).to have_css '.bootstrap-datetimepicker-widget.dropdown-menu.fs-ignore-rage-clicks'
        expect(page).to have_css '.collapse.show .datepicker'
      end

      and_it 'is accurately showing the correct month' do
        expect(page).to have_selector '.picker-switch', text: Date::MONTHNAMES[Date.today.month]
      end

      and_it 'hides the time picker' do
        expect(page).to have_selector '.picker-switch.accordion-toggle .fa-clock-o'
        expect(page).to have_css '.collapse .timepicker', visible: false
      end

      and_by 'clicking the time picker' do
        page.find('.picker-switch.accordion-toggle .fa-clock-o').click
      end

      and_it 'shows the time picker' do
        expect(page).to have_css '.collapse.show .timepicker'
      end

      and_it 'hides the calendar' do
        expect(page).to have_css '.collapse .datepicker', visible: false
      end
    end
  end

  describe 'the calendar-only interface' do
    it 'outputs the calendar date picker interface' do
      by 'clicking the text input' do
        page.find("input[data-datetimepicker='date']").click
      end

      and_it 'renders the calendar' do
        expect(page).to have_css "input[data-datetimepicker='date'] + .bootstrap-datetimepicker-widget.dropdown-menu.fs-ignore-rage-clicks"
      end
    end
  end

  describe 'the timepicker-only interface' do
    it 'outputs the time picker interface' do
      by 'clicking the text input' do
        page.find("input[data-datetimepicker='time']").click
      end

      and_it 'renders the time picker' do
        expect(page).to have_css "input[data-datetimepicker='time'] + .bootstrap-datetimepicker-widget.dropdown-menu.fs-ignore-rage-clicks"
      end
    end
  end
end