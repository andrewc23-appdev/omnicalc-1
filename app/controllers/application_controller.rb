class ApplicationController < ActionController::Base
  
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calc_square

    @num = params.fetch("number").to_f
    @square_num = @num ** 2

    render({ :template => "calculation_templates/square_results.html.erb"})
  end
  
  def blank_square_root_form
  render({ :template => "calculation_templates/square_root_form.html.erb"})
  end

  def calc_square_root
    @num = params.fetch("user_number").to_f
    @square_root_num = @num ** (1/2.0)
  render({ :template => "calculation_templates/square_root_results.html.erb"})
  end

  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb"})
  end
  
  def calc_payment
    @apr = params.fetch("user_apr").to_f
    @yrs = params.fetch("user_years").to_f
    @pv = params.fetch("user_pv").to_f

    @periods = @yrs * 12.0
    @monthly_apr = (@apr / 12.0) / 100.0

    @payment_value = ((@monthly_apr * @pv) / (1 - ((1 + @monthly_apr) ** -@periods) ))
    render({ :template => "calculation_templates/payment_results.html.erb"})
  end

  def blank_random_form
    render({ :template => "calculation_templates/random_form.html.erb"})
  end

  def calc_random

    @min = params.fetch("user_min").to_f
    @max = params.fetch("user_max").to_f

    @random_number = rand(@min...@max).to_f

    render({ :template => "calculation_templates/random_results.html.erb"})
  end

  # def ###
  # render({ :template => "calculation_templates/"})
  # end

  # def ###
  # render({ :template => "calculation_templates/"})
  # end


end
