class DatepickerInput < SimpleForm::Inputs::Base
  def input
    @builder.send(:datepicker, attribute_name, input_options)
  end

  def input_options
    { :dateFormat => "yy/mm/dd"}
  end
end